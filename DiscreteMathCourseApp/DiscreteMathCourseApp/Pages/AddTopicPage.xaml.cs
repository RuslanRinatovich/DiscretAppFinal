using DiscreteMathCourseApp.Models;
using DiscreteMathCourseApp.Windows;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Excel = Microsoft.Office.Interop.Excel;

namespace DiscreteMathCourseApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddTopicPage.xaml
    /// </summary>
    public partial class AddTopicPage : Page
    {
        static string currentDirectory = System.IO.Directory.GetCurrentDirectory();
        private string _filePath = null;
        // название текущей главной фотографии
        private string _fileName = null;
        // текущая папка приложения
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Data/TopicContents/";



        // текущий товар
        private Topic _currentItem = new Topic();
        int _currentIndex;
        List<Topic> topics = new List<Topic>();
        public AddTopicPage(Topic selected)
        {

            InitializeComponent();
            LoadAndInitData(selected);
        }

        void LoadAndInitData(Topic selected)
        {     // если передано null, то мы добавляем новый товар

            topics = MyMoodleBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();

            ComboChapter.ItemsSource = MyMoodleBDEntities.GetContext().Chapters.ToList();
            ComboTopicType.ItemsSource = MyMoodleBDEntities.GetContext().TopicTypes.ToList();

            if (selected != null)
            {
                UpDownIndexNumber.Maximum = topics.Count;
                _currentItem = selected;
                _currentIndex = _currentItem.IndexNumber;
                ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == selected.Id).OrderBy(p =>p.IndexNumber).ToList();
                ListBoxControlPoints.ItemsSource = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == selected.Id).OrderBy(p => p.IndexNumber).ToList();
                ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == selected.Id).OrderBy(p => p.IndexNumber).ToList();
            }
            else
            {
                UpDownIndexNumber.Maximum = topics.Count + 1;
                BtnAddControlPoint.Visibility = Visibility.Hidden;
                BtnAddTopicContent.Visibility = Visibility.Hidden;
                BtnAddTest.Visibility = Visibility.Hidden;
                _currentIndex = topics.Count + 1;
                _currentItem.IndexNumber = _currentIndex;
            }
            // контекст данных текущий товар

            DataContext = _currentItem;



        }

        

        /// <summary>
        /// Проверка полей ввод на корректыне данные
        /// </summary>
        /// <returns>текст StringBuilder содержащий ошибки, если они есть</returns>
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            // проверка полей на содержимое
            if (string.IsNullOrWhiteSpace(_currentItem.Title))
                s.AppendLine("Поле название темы пустое");
            if (string.IsNullOrWhiteSpace(_currentItem.Description))
                s.AppendLine("Введите описание темы");
            if (ComboChapter.SelectedIndex == -1)
                s.AppendLine("Выберите раздел");
            if (ComboTopicType.SelectedIndex == -1)
                s.AppendLine("Выберите тип занятия");
            return s;
        }

        private void BtnSaveClick(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            // проверка полей прошла успешно
            // если товар новый, то его ID == 0
            if (_currentItem.Id == 0)
            {
                // добавление нового товара, 
                // формируем новое название файла картинки,
                // так как в папке может быть файл с тем же именем
                if (_currentItem.IndexNumber != topics.Count + 1)
                {
                    for (int i = _currentItem.IndexNumber - 1; i < topics.Count; i++)
                    {
                        topics[i].IndexNumber += 1;
                    }
                }

                MyMoodleBDEntities.GetContext().Topics.Add(_currentItem);
            }
            else
            {
                if (_currentIndex < _currentItem.IndexNumber)
                    for (int i = _currentIndex; i < _currentItem.IndexNumber; i++)
                        topics[i].IndexNumber -= 1;
                if (_currentIndex > _currentItem.IndexNumber)
                    for (int i = _currentItem.IndexNumber - 1; i < _currentIndex - 1; i++)
                        topics[i].IndexNumber += 1;
            }
            try
            {


                MyMoodleBDEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                MessageBox.Show("Данные сохранены");
                //Manager.MainFrame.GoBack();  // Возвращаемся на предыдущую форму
               // MessageBox.Show(_currentItem.Id.ToString());
                BtnAddControlPoint.Visibility = Visibility.Visible;
                BtnAddTopicContent.Visibility = Visibility.Visible;
                BtnAddTest.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }    // загрузка фото 

        private void BtnAddTopicContent_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //Диалог открытия файла
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Select a picture";
                op.Filter = "Документ (*.doc)|*.doc|Документ(*.docx) | *.docx| PDF-файлы (*.pdf)|*.pdf|xps-файлы (*.xps)|*.xps|Презентация (*.pptx)|*.pptx|Презентация (*.ppt)|*.ppt|Видео (*.mp4)|*.mp4";
                //op.Filter = "PDF-файлы (*.pdf)|*.pdf";
                // диалог вернет true, если файл был открыт
                if (op.ShowDialog() == true)
                {
                    // проверка размера файла
                    FileInfo fileInfo = new FileInfo(op.FileName);
                    _fileName = op.SafeFileName;
                    _filePath = op.FileName;
                    // формируем новое название файла картинки,
                    // так как в папке может быть файл с тем же именем
                    string photo = ChangeFileName(_fileName);
                    // путь куда нужно скопировать файл
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    int maxind = 0;
                    List <TopicContent> topicContents = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).ToList();
                    if (topicContents.Count > 0)
                        maxind = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).Max(p => p.IndexNumber);
                    
                    TopicContent topicContent = new TopicContent();
                    topicContent.IndexNumber = Convert.ToInt32(maxind) + 1;
                    topicContent.TopicLink = _fileName;
                    topicContent.TopicId = _currentItem.Id;
                    topicContent.TopicTitle = _fileName;
                    MyMoodleBDEntities.GetContext().TopicContents.Add(topicContent);
                    MyMoodleBDEntities.GetContext().SaveChanges();


                    ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
                }
        }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                _filePath = null;
            }
}


string ChangeFileName(string name)
        {
            string x = _currentDirectory + name;
            string filename = name;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + filename;
                }
                filename = i.ToString() + filename;
            }
            return filename;

        }

        private void BtnDeleteTopicContent_Click(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as TopicContent;
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
                    File.Delete(_currentDirectory + selected.TopicLink);
                    if (selected.UserTopicContents.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");

                    var data = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();

                    int k = selected.IndexNumber;

                    for (int i = k; i < data.Count; i++)
                        data[i].IndexNumber -= 1;

                    MyMoodleBDEntities.GetContext().TopicContents.Remove(selected);
                    //сохраняем изменения
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

        }

        private void BtnEye_Click(object sender, RoutedEventArgs e)
        {
            TopicContent tc = (sender as Button).DataContext as TopicContent;
            string filename = Directory.GetCurrentDirectory() + @"\Data\TopicContents\" + tc.TopicLink;
            Process.Start(filename);
            //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(filename);
            //documentViewerWindow.Owner = Application.Current.MainWindow;
            //documentViewerWindow.ShowDialog();

        }

        private void BtnUp_Click(object sender, RoutedEventArgs e)
        {
            TopicContent item = (sender as Button).DataContext as TopicContent;
            if (item.IndexNumber == 1)
                return;
            int k = item.IndexNumber - 1;
            
            TopicContent itemPrev = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p =>p.IndexNumber).ToList();
        }

        private void BtnDown_Click(object sender, RoutedEventArgs e)
        {
            TopicContent item = (sender as Button).DataContext as TopicContent;
            if (item.IndexNumber == ListBoxTopicContents.Items.Count)
                return;
            int k = item.IndexNumber + 1;
            TopicContent itemPrev = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
        }

        private void BtnUpControlPoint_Click(object sender, RoutedEventArgs e)
        {
            ControlPoint item = (sender as Button).DataContext as ControlPoint;
            if (item.IndexNumber == 1)
                return;
            int k = item.IndexNumber - 1;

            ControlPoint itemPrev = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            ListBoxControlPoints.ItemsSource = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
        }

        private void BtnDownControlPoint_Click(object sender, RoutedEventArgs e)
        {
            ControlPoint item = (sender as Button).DataContext as ControlPoint;
            if (item.IndexNumber == ListBoxControlPoints.Items.Count)
                return;
            int k = item.IndexNumber + 1;
            ControlPoint itemPrev = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            ListBoxControlPoints.ItemsSource = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
        }

        private void BtnEyeControlPoint_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ControlPoint controlPoint = (sender as Button).DataContext as ControlPoint;
                AddControlPointWindow window = new AddControlPointWindow(controlPoint, _currentItem);
                if (window.ShowDialog() == true)
                {

                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    ListBoxControlPoints.ItemsSource = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();

                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnDeleteControlPoint_Click(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as ControlPoint;
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
                    if (selected.UserControlPoints.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");

                    if (selected.AnswerLink != null)
                        File.Delete(_currentDirectory + selected.AnswerLink);

                    if (selected.TaskLink != null)
                        File.Delete(_currentDirectory + selected.TaskLink);

                    var data = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();

                    int k = selected.IndexNumber;

                    for (int i = k; i < data.Count; i++)
                        data[i].IndexNumber -= 1;

                    MyMoodleBDEntities.GetContext().ControlPoints.Remove(selected);
                    //сохраняем изменения
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    ListBoxControlPoints.ItemsSource = null;
                    ListBoxControlPoints.ItemsSource = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnAddControlPoint_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                AddControlPointWindow window = new AddControlPointWindow(new ControlPoint(), _currentItem);
                if (window.ShowDialog() == true)
                {
                  
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    ListBoxControlPoints.ItemsSource = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();

                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnAddTest_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                AddTestWindow window = new AddTestWindow(null, _currentItem);
                if (window.ShowDialog() == true)
                {

                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    ListBoxTests.ItemsSource = null;
                    ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();

                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                ListBoxTests.ItemsSource = null;
                ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
            }
        }

        private void BtnEyeTest_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Test test = (sender as Button).DataContext as Test;
                AddTestWindow window = new AddTestWindow(test, _currentItem);
                if (window.ShowDialog() == true)
                {

                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    ListBoxTests.ItemsSource = null;
                    ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();

                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnDeleteTest_Click(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as Test;
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить  запись???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    if (selected.UserTestResults.Count > 0 || selected.TestQuestions.Count > 0 || selected.TestProgresses.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");


                    var data = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();

                    int k = selected.IndexNumber;

                    for (int i = k; i < data.Count; i++)
                        data[i].IndexNumber -= 1;

                    MyMoodleBDEntities.GetContext().Tests.Remove(selected);
                    //сохраняем изменения
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    ListBoxTests.ItemsSource = null;
                    ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnUpTest_Click(object sender, RoutedEventArgs e)
        {
            Test item = (sender as Button).DataContext as Test;
            if (item.IndexNumber == 1)
                return;
            int k = item.IndexNumber - 1;

            Test itemPrev = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            ListBoxTests.ItemsSource = null;
            ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
        }

        private void BtnDownTest_Click(object sender, RoutedEventArgs e)
        {
            Test item = (sender as Button).DataContext as Test;
            if (item.IndexNumber == ListBoxControlPoints.Items.Count)
                return;
            int k = item.IndexNumber + 1;
            Test itemPrev = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            ListBoxTests.ItemsSource = null;
            ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
        }
    }
}

