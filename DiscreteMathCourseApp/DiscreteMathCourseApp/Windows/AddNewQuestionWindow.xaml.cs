﻿using DiscreteMathCourseApp.Models;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DiscreteMathCourseApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddNewQuestionWindow.xaml
    /// </summary>
    public partial class AddNewQuestionWindow : Window
    {
        List<Answer> answers = new List<Answer>();
        Question _currentQuestion;
        // путь к файлу
        private string _filePath = null;
        // название текущей главной фотографии
        private string _photoName = null;
        // флаг меняется, если фото товара поменялось
        private bool _photoChanged = false;
        private bool _photoDeleted = false;
        // текущая папка приложения
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Data\Images\";


        public AddNewQuestionWindow(Question question)
        {
            InitializeComponent();
            BtnAddAnswer.Visibility = Visibility.Hidden;

            LoadData(question);

        }

        void LoadData(Question question)
        {
            if (question != null)
            {
                _currentQuestion = question;
                _filePath = null;
                _photoName = null;
                if (_currentQuestion.Image != null)
                {
                    _filePath = _currentDirectory + _currentQuestion.Image;
                    _photoName = _currentQuestion.Image;
                }
                BtnAddAnswer.Visibility = Visibility.Visible;
            }
            else
            {
                _currentQuestion = new Question();
            }
            // контекст данных текущий товар
            DataContext = _currentQuestion;

            answers = MyMoodleBDEntities.GetContext().Answers.Where(p => p.QuestionId == _currentQuestion.Id).ToList();
            ListBoxAnswers.ItemsSource = answers;

        }





        /// <summary>
        /// Проверка полей ввод на корректыне данные
        /// </summary>
        /// <returns>текст StringBuilder содержащий ошибки, если они есть</returns>
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            // проверка полей на содержимое
            if (string.IsNullOrWhiteSpace(_currentQuestion.Title))
                s.AppendLine("Поле вопроса пустое");

            if (ListBoxAnswers.SelectedItems.Count == 0 && _currentQuestion.Id != 0)
                s.AppendLine("Ошибка, не указан верный ответ на вопрос");
            return s;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }

            try
            {  // проверка полей прошла успешно
               // если товар новый, то его ID == 0
                if (_currentQuestion.Id == 0)
                {
                    // добавление нового товара, 
                    // формируем новое название файла картинки,
                    // так как в папке может быть файл с тем же именем
                    if (_filePath != null)
                    {
                        string photo = ChangePhotoName();
                        // путь куда нужно скопировать файл
                        string dest = _currentDirectory + photo;
                        File.Copy(_filePath, dest);
                        _currentQuestion.Image = photo;
                    }
                    // добавляем товар в БД
                    MyMoodleBDEntities.GetContext().Questions.Add(_currentQuestion);
                }
                // если изменилось изображение
                if (_photoChanged)
                {
                    string photo = ChangePhotoName();
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currentQuestion.Image = photo;
                }
                if (_photoDeleted)
                {

                    _currentQuestion.Image = null;

                }
                MyMoodleBDEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                MessageBox.Show("Данные сохранены");

                answers = MyMoodleBDEntities.GetContext().Answers.Where(p => p.QuestionId == _currentQuestion.Id).ToList();
                ListBoxAnswers.ItemsSource = answers;
                BtnAddAnswer.Visibility = Visibility.Visible;
                DataContext = _currentQuestion;
                // Manager.MainFrame.GoBack();  // Возвращаемся на предыдущую форму
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }    // загрузка фото 
        private void BtnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //Диалог открытия файла
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Select a picture";
                op.Filter = "JPEG Files (*.jpg)|*.jpg|PNG Files (*.png)|*.png|JPG Files (*.jpeg)|*.jpeg|GIF Files (*.gif)|*.gif";
                // диалог вернет true, если файл был открыт
                if (op.ShowDialog() == true)
                {
                    // проверка размера файла
                    // по условию файл дожен быть не более 2Мб.

                    ImagePhoto.Source = new BitmapImage(new Uri(op.FileName));
                    _photoName = op.SafeFileName;
                    _filePath = op.FileName;
                    _photoChanged = true;
                    _photoDeleted = false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                _filePath = null;
            }
        }
        //подбор имени файла
        string ChangePhotoName()
        {
            string x = _currentDirectory + _photoName;
            string photoname = _photoName;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + photoname;
                }
                photoname = i.ToString() + photoname;
            }
            return photoname;
        }
        private void BtnAddAnswer_Click(object sender, RoutedEventArgs e)
        {

            if (ListBoxAnswers.Items.Count == 5)
            {
                MessageBox.Show("Количество вариантов ответов не более 5", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                AddAnswerWindow window = new AddAnswerWindow(new Answer());
                if (window.ShowDialog() == true)
                {
                    window.currentItem.QuestionId = _currentQuestion.Id;
                    MyMoodleBDEntities.GetContext().Answers.Add(window.currentItem);
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    answers = MyMoodleBDEntities.GetContext().Answers.Where(p => p.QuestionId == _currentQuestion.Id).ToList();
                    ListBoxAnswers.ItemsSource = answers;
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        private void BtnDeleteItem_Click(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as Answer;
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить  запись???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент

                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if (selected.TestProgresses.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");

                    MyMoodleBDEntities.GetContext().Answers.Remove(selected);
                    //сохраняем изменения
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    answers = MyMoodleBDEntities.GetContext().Answers.Where(p => p.QuestionId == _currentQuestion.Id).ToList();

                    ListBoxAnswers.ItemsSource = answers;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnEditItem_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Answer selected = (sender as Button).DataContext as Answer;

                AddAnswerWindow window = new AddAnswerWindow(selected);
                if (window.ShowDialog() == true)
                {
                    MyMoodleBDEntities.GetContext().Entry(window.currentItem).State = EntityState.Modified;
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    answers = MyMoodleBDEntities.GetContext().Answers.Where(p => p.QuestionId == _currentQuestion.Id).ToList();
                    ListBoxAnswers.ItemsSource = answers;
                    MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnDeleteImage_Click(object sender, RoutedEventArgs e)
        {
            _photoDeleted = true;
            ImagePhoto.Source = null;
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            
            if (ListBoxAnswers.Items.Count > 0&& ListBoxAnswers.SelectedItems.Count == 0 && _currentQuestion.Id != 0)
            {
                MessageBox.Show("Не указан верный ответ на вопрос", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                e.Cancel = true;
            }

        }

        private void ListBoxAnswers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MyMoodleBDEntities.GetContext().SaveChanges();
        }

        private void BtnView_Click(object sender, RoutedEventArgs e)
        {
            if (ImagePhoto.Source != null)
            {
                ShowImageWindow imageWindow = new ShowImageWindow(ImagePhoto.Source);
                imageWindow.ShowDialog();
            }

        }
    }
}
