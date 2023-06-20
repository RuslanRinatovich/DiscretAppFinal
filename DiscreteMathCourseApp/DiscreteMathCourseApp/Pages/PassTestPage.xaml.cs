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
    /// Логика взаимодействия для PassTestPage.xaml
    /// </summary>
    public partial class PassTestPage : Page
    {
        List<TestQuestion> testQuestions = new List<TestQuestion>();
        Dictionary<Question, int> rightAnswers = new Dictionary<Question, int>();
        int result;
        int answers;
        int index;
        int testId;
       
        Dictionary<Question, List<Answer>> userProgress = new Dictionary<Question, List<Answer>>();
        public PassTestPage(Test test)
        {
            InitializeComponent();
            result = 0;
            testId = test.Id;
            
            LoadData();
        }

        void LoadData()
        {
            testQuestions = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == testId).OrderBy(p=> p.IndexNumber).ToList();
            string name = Manager.CurrentUser.UserName;
            UserTestResult userTestResult = DiscretMathBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == testId && p.UserName == name);
            if (userTestResult != null)
            {
                ListBoxAnswers.IsEnabled = false;
                BtnFinishTest.Visibility = Visibility.Hidden;
            }
            for (int i = 0; i < testQuestions.Count; i++)
                AddQuestionToDictionary(i);

            index = 0;
            if (testQuestions.Count == 0)
            {
                BtnFinishTest.Visibility = Visibility.Hidden;
                return;
              
            }
            LoadQuestion(index);

        }

        void AddQuestionToDictionary(int ind)
        {
            TestQuestion x = testQuestions[ind];
            string name = Manager.CurrentUser.UserName;
            // выбрать варианты ответов из таблицы Answers
            List<Answer> answers = x.Question.Answers.ToList();
            TestProgress testProgress = DiscretMathBDEntities.GetContext().TestProgresses.FirstOrDefault(p => p.TestId == testId && p.QuestionId == x.QuestionId && p.UserName == name);
            List<Answer> userAnswers = new List<Answer>();

            foreach (Answer answer in answers)
            {
                Answer newAnswer = new Answer();
                newAnswer.Id = answer.Id;
                newAnswer.Title = answer.Title;
                newAnswer.QuestionId = answer.QuestionId;
                newAnswer.IsRight = false;
                if (answer.IsRight)
                {
                    rightAnswers.Add(x.Question, answer.Id);
                }
                if (testProgress != null)
                {
                    if (answer.Id == testProgress.AnswerId)
                        newAnswer.IsRight = true;
                }
                userAnswers.Add(newAnswer);
            }
            userProgress.Add(x.Question, userAnswers);
        }

        void LoadQuestion(int ind)
        { 

            TestQuestion x = testQuestions[ind];
            TextBoxTitle.Text = x.Question.Title;
            TextBoxProductDescription.Text = x.Question.Description;
            ImagePhoto.Source = new BitmapImage(new Uri(x.Question.GetImage, UriKind.Absolute));

            if (x.Question.Image == null)
            {
                BtnView.Visibility = Visibility.Collapsed;
                ImagePhoto.Visibility = Visibility.Collapsed;
            }
            else
            {
                BtnView.Visibility = Visibility.Visible;
                ImagePhoto.Visibility = Visibility.Visible;
            }
            ListBoxAnswers.ItemsSource = userProgress[x.Question];
            TextBlockQuestionNumber.Text = $"Вопрос №{ind + 1} из {testQuestions.Count}";
        }

        private void BtnFirst_Click(object sender, RoutedEventArgs e)
        {
            if (testQuestions.Count == 0)
                return;
            if (index == 0)
                return;
            index = 0;
            LoadQuestion(index);

        }

        private void BtnArrowLeftBold_Click(object sender, RoutedEventArgs e)
        {
            if (testQuestions.Count == 0)
                return;
            if (index == 0)
                return;
            index -= 1;
            LoadQuestion(index);
        }

        /// <summary>
        /// Проверка полей ввод на корректыне данные
        /// </summary>
        /// <returns>текст StringBuilder содержащий ошибки, если они есть</returns>
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            // проверка полей на содержимое
            foreach (var item in userProgress)
            {
                bool questionHasAnswer = false;
                foreach (Answer a in item.Value)
                {

                    if (a.IsRight)
                    {
                        questionHasAnswer = true;

                    }
                }
                if (!questionHasAnswer)
                {
                    s.Append("Вы ответили не на все вопросы");
                    break;
                }
            }

            return s;
        }


        private void BtnFinishTest_Click(object sender, RoutedEventArgs e)
        {

            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error );
                return;
            }
            if (testQuestions.Count == 0)
                return;
            MessageBoxResult messageBoxResult = MessageBox.Show($"Завершить прохождение теста??? ", "Завершить", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                result = 0;
                List<TestProgress> testProgresses = new List<TestProgress>();
                foreach (var item in userProgress)
                {
                    TestProgress testProgress = new TestProgress();
                    testProgress.UserName = Manager.CurrentUser.UserName;
                    testProgress.QuestionId = item.Key.Id;
                    testProgress.TestId = testId;

                    int id = -1;
                    foreach (Answer a in item.Value)
                    {
                        if (a.IsRight)
                        {
                            id = a.Id;
                            testProgress.AnswerId = id;
                        }
                    }

                    testProgresses.Add(testProgress);
                    if (rightAnswers[item.Key] == id)
                        result += 1;
                }
                DiscretMathBDEntities.GetContext().TestProgresses.AddRange(testProgresses);
                DiscretMathBDEntities.GetContext().SaveChanges();
                UserTestResult userTestResult = new UserTestResult();
                userTestResult.TestId = testId;
                userTestResult.UserName = Manager.CurrentUser.UserName;
                userTestResult.Result = result;
                DiscretMathBDEntities.GetContext().UserTestResults.Add(userTestResult);
                DiscretMathBDEntities.GetContext().SaveChanges();
                double count = testQuestions.Count;
                int percent = 0;
                if (count !=0)
                    percent = Convert.ToInt32(Math.Round(result / count * 100));
                

                MessageBox.Show($"Результаты сохранены\nВы набрали {percent}%", "Результаты теста", MessageBoxButton.OK, MessageBoxImage.Information);
                ListBoxAnswers.IsEnabled = false;
                BtnFinishTest.Visibility = Visibility.Hidden;

            }
        }

        private void BtnArrowRightBold_Click(object sender, RoutedEventArgs e)
        {
            if (testQuestions.Count == 0)
                return;
            if (index == testQuestions.Count - 1)
                return;
            index  += 1;
            LoadQuestion(index);
        }

        private void BtnLast_Click(object sender, RoutedEventArgs e)
        {
            if (testQuestions.Count == 0)
                return;
            if (index == testQuestions.Count - 1)
                return;
            index = testQuestions.Count - 1;
            LoadQuestion(index);
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
