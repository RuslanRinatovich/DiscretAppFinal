using DiscreteMathCourseApp.Models;
using DiscreteMathCourseApp.Windows;
using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DiscreteMathCourseApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddTestPage.xaml
    /// </summary>
    public partial class AddTestPage : Page
    {
        List<Question> questions = new List<Question>();
        Test _currentTest;
        // путь к файлу

        public AddTestPage(Test test)
        {
            InitializeComponent();
            BtnAddQuestion.Visibility = Visibility.Hidden;
            LoadData(test);
        }

        void LoadData(Test test)
        {
            ComboChapter.ItemsSource = MyMoodleBDEntities.GetContext().Chapters.ToList();
            
            if (test != null)
            {
                _currentTest = test;
                BtnAddQuestion.Visibility = Visibility.Visible;
            }
            else
            {
                _currentTest = new Test();
            }
            // контекст данных текущий товар
            DataContext = _currentTest;
            List<TestQuestion> testQuestions = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).ToList();
            questions.Clear();

            foreach (TestQuestion test1 in testQuestions)
            {
                questions.Add(test1.Question);
            }

            ListBoxQuestions.ItemsSource = questions;

        }

        /// <summary>
        /// Проверка полей ввод на корректыне данные
        /// </summary>
        /// <returns>текст StringBuilder содержащий ошибки, если они есть</returns>
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            // проверка полей на содержимое
            if (string.IsNullOrWhiteSpace(_currentTest.Title))
                s.AppendLine("Поле вопроса пустое");
            if (ComboTopic.SelectedIndex ==-1)
                s.AppendLine("Выберите тему");
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
                _currentTest.TopicId = (ComboTopic.SelectedItem as Topic).Id;
                if (_currentTest.Id == 0)
                {
                    // добавление нового товара, 
                    
                    // добавляем товар в БД
                    MyMoodleBDEntities.GetContext().Tests.Add(_currentTest);
                }
                
                MyMoodleBDEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                MessageBox.Show("Данные сохранены");

               
                List<TestQuestion> testQuestions = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).ToList();
                questions.Clear();

                foreach (TestQuestion test1 in testQuestions)
                {
                    questions.Add(test1.Question);
                }

                ListBoxQuestions.ItemsSource = questions;
                BtnAddQuestion.Visibility = Visibility.Visible;
                DataContext = _currentTest;
                // Manager.MainFrame.GoBack();  // Возвращаемся на предыдущую форму
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }    // загрузка фото 
      
        private void BtnAddQuestion_Click(object sender, RoutedEventArgs e)
        {

            if (ListBoxQuestions.Items.Count == 5)
            {
                MessageBox.Show("Количество вариантов ответов не более 5", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                AddQuestionWindow window = new AddQuestionWindow(_currentTest);
                if (window.ShowDialog() == true)
                {
                    TestQuestion testQuestion = new TestQuestion();
                    testQuestion.QuestionId = window.currentItem.Id;
                    testQuestion.TestId = _currentTest.Id;
                    MyMoodleBDEntities.GetContext().TestQuestions.Add(testQuestion);
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    List<TestQuestion> testQuestions = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).ToList();
                    questions = new List<Question>();

                    foreach (TestQuestion test1 in testQuestions)
                    {
                        questions.Add(test1.Question);
                    }
                    ListBoxQuestions.ItemsSource = null;
                    ListBoxQuestions.ItemsSource = questions;
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
            var selected = (sender as Button).DataContext as Question;
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить  запись???", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент
                    TestQuestion testQuestion = MyMoodleBDEntities.GetContext().TestQuestions.FirstOrDefault(p => p.TestId == _currentTest.Id && p.QuestionId == selected.Id);
                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if (testQuestion is null)
                        return;
                    

                    MyMoodleBDEntities.GetContext().TestQuestions.Remove(testQuestion);
                    //сохраняем изменения
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<TestQuestion> testQuestions = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).ToList();
                    questions.Clear();

                    foreach (TestQuestion test1 in testQuestions)
                    {
                        questions.Add(test1.Question);
                    }

                    ListBoxQuestions.ItemsSource = null;
                    ListBoxQuestions.ItemsSource = questions;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void ComboChapter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboChapter.SelectedIndex == -1)
                return;
            Chapter chapter = ComboChapter.SelectedItem as Chapter;
            ComboTopic.ItemsSource = MyMoodleBDEntities.GetContext().Topics.Where(p=> p.ChapterId == chapter.Id).ToList();


        }

       
    }
}
