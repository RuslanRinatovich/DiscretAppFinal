using DiscreteMathCourseApp.Models;
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
using System.Windows.Shapes;

namespace DiscreteMathCourseApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddTestWindow.xaml
    /// </summary>
    public partial class AddTestWindow : Window
    {
        Topic _currentTopic = new Topic();
        List<Question> questions = new List<Question>();
        Test _currentTest;
        // путь к файлу
        public AddTestWindow(Test test, Topic topic)
        {
            InitializeComponent();
            BtnAddQuestion.Visibility = Visibility.Hidden;
            LoadData(test, topic);
        }

        void LoadData(Test test, Topic topic)
        {
            _currentTopic = topic;
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
            List<TestQuestion> testQuestions = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).OrderBy(p => p.IndexNumber).ToList();
            //questions.Clear();

            //foreach (TestQuestion test1 in testQuestions)
            //{
            //    questions.Add(test1.Question);
            //}

            ListBoxQuestions.ItemsSource = testQuestions;

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
                _currentTest.TopicId = _currentTopic.Id;
                if (_currentTest.Id == 0)
                {
                    int maxind = 0;
                    List<Test> tests = DiscretMathBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentTopic.Id).ToList();
                    if (tests.Count > 0)
                        maxind = DiscretMathBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentTopic.Id).Max(p => p.IndexNumber);
                    // добавление нового товара, 
                    _currentTest.IndexNumber = maxind + 1;
                    // добавляем товар в БД
                    DiscretMathBDEntities.GetContext().Tests.Add(_currentTest);
                }

                DiscretMathBDEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                MessageBox.Show("Данные сохранены");


                List<TestQuestion> testQuestions = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).OrderBy(p => p.IndexNumber).ToList();
                //questions.Clear();

                //foreach (TestQuestion test1 in testQuestions)
                //{
                //    questions.Add(test1.Question);
                //}

                ListBoxQuestions.ItemsSource = testQuestions;
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

                    int maxind = 0;
                    List<TestQuestion> testQuestions1 = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).ToList();
                    if (testQuestions1.Count > 0)
                        maxind = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).Max(p => p.IndexNumber);
                    // добавление нового товара, 
                    testQuestion.IndexNumber = maxind + 1;


                    DiscretMathBDEntities.GetContext().TestQuestions.Add(testQuestion);
                    DiscretMathBDEntities.GetContext().SaveChanges();

                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    List<TestQuestion> testQuestions = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).OrderBy(p => p.IndexNumber).ToList();
                    //questions = new List<Question>();

                    //foreach (TestQuestion test1 in testQuestions)
                    //{
                    //    questions.Add(test1.Question);
                    //}
                    ListBoxQuestions.ItemsSource = null;
                    ListBoxQuestions.ItemsSource = testQuestions;
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
            var selected = (sender as Button).DataContext as TestQuestion;
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить  запись???", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    //// берем из списка удаляемых товаров один элемент
                    //TestQuestion testQuestion = DiscretMathBDEntities.GetContext().TestQuestions.FirstOrDefault(p => p.TestId == _currentTest.Id && p.QuestionId == selected.Id);
                    //// проверка, есть ли у товара в таблице о продажах связанные записи
                    //// если да, то выбрасывается исключение и удаление прерывается
                    //if (testQuestion is null)
                    //    return;
                    var testProgress = DiscretMathBDEntities.GetContext().TestProgresses.Where(p => p.QuestionId == selected.QuestionId && p.TestId == selected.TestId).ToList();
                    
                    if (testProgress.Count > 0 )
                        throw new Exception("Ошибка удаления, есть связанные записи");



                    DiscretMathBDEntities.GetContext().TestQuestions.Remove(selected);
                    //сохраняем изменения
                    DiscretMathBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<TestQuestion> testQuestions = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).OrderBy(p => p.IndexNumber).ToList();
                    //questions.Clear();

                    //foreach (TestQuestion test1 in testQuestions)
                    //{
                    //    questions.Add(test1.Question);
                    //}

                    //ListBoxQuestions.ItemsSource = null;
                    ListBoxQuestions.ItemsSource = testQuestions;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnUpQuestion_Click(object sender, RoutedEventArgs e)
        {
            TestQuestion item = (sender as Button).DataContext as TestQuestion;
            if (item.IndexNumber == 1)
                return;
            int k = item.IndexNumber - 1;

            TestQuestion itemPrev = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            DiscretMathBDEntities.GetContext().SaveChanges();
            ListBoxQuestions.ItemsSource = null;
            List<TestQuestion> testQuestions = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).OrderBy(p => p.IndexNumber).ToList();
            ListBoxQuestions.ItemsSource = testQuestions;
        }

        private void BtnDownQuestion_Click(object sender, RoutedEventArgs e)
        {
            TestQuestion item = (sender as Button).DataContext as TestQuestion;
            if (item.IndexNumber == ListBoxQuestions.Items.Count)
                return;
            int k = item.IndexNumber + 1;
            TestQuestion itemPrev = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).FirstOrDefault(p => p.IndexNumber == k);
            if (itemPrev is null)
                return;

            itemPrev.IndexNumber = item.IndexNumber;
            item.IndexNumber = k;
            DiscretMathBDEntities.GetContext().SaveChanges();
            ListBoxQuestions.ItemsSource = null;
            List<TestQuestion> testQuestions = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == _currentTest.Id).OrderBy(p => p.IndexNumber).ToList();
            ListBoxQuestions.ItemsSource = testQuestions;
        }
    }
}