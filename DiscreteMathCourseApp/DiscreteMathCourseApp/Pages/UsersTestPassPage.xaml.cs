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
    /// Логика взаимодействия для UsersTestPassPage.xaml
    /// </summary>
    public partial class UsersTestPassPage : Page
    {
        List<TestQuestion> testQuestions = new List<TestQuestion>();
        Dictionary<Question, int> rightAnswers = new Dictionary<Question, int>();
        User currentUser { get; set; }
        int result;
        int answers;
        int index;
        int testId;

        Dictionary<Question, List<Answer>> userProgress = new Dictionary<Question, List<Answer>>();
        public UsersTestPassPage(Test test, User user )
        {
            InitializeComponent();
            result = 0;
            testId = test.Id;
            currentUser = user;
            LoadData();
        }

        void LoadData()
        {
            testQuestions = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == testId).OrderBy(p => p.IndexNumber).ToList();
            string name = currentUser.UserName;
            UserTestResult userTestResult = MyMoodleBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == testId && p.UserName == name);
            // ListBoxAnswers.IsEnabled = false;
            ListBoxAnswers.SelectionMode = SelectionMode.Single;
            for (int i = 0; i < testQuestions.Count; i++)
                AddQuestionToDictionary(i);

            index = 0;
          
            LoadQuestion(index);

        }

        void AddQuestionToDictionary(int ind)
        {
            TestQuestion x = testQuestions[ind];
            string name = currentUser.UserName;
            // выбрать варианты ответов из таблицы Answers
            List<Answer> answers = x.Question.Answers.ToList();
            TestProgress testProgress = MyMoodleBDEntities.GetContext().TestProgresses.FirstOrDefault(p => p.TestId == testId && p.QuestionId == x.QuestionId && p.UserName == name);
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
                    {
                        newAnswer.IsRight = true;
                    }

                    if (answer.IsRight)
                    {
                        if (answer.Id == testProgress.AnswerId)
                            newAnswer.GetColor1 = "#0F0";
                        else
                            newAnswer.GetColor1 = "#0F0";
                    }
                    else
                    {
                        if (answer.Id == testProgress.AnswerId)
                            newAnswer.GetColor1 = "#F00";
                    }

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

        
        private void BtnArrowRightBold_Click(object sender, RoutedEventArgs e)
        {
            if (testQuestions.Count == 0)
                return;
            if (index == testQuestions.Count - 1)
                return;
            index += 1;
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

