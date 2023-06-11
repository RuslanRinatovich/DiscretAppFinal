using DiscreteMathCourseApp.Models;
using DiscreteMathCourseApp.Windows;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
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
    /// Логика взаимодействия для TopicLearnPage.xaml
    /// </summary>
    public partial class TopicLearnPage : Page
    {
        static string currentDirectory = System.IO.Directory.GetCurrentDirectory();
        private string _filePath = null;
        // название текущей главной фотографии
        private string _fileName = null;
        // текущая папка приложения
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Data/TopicContents/";
        int controlPointsCount = 0;
        int testCount = 0;
        int topicCount = 0;
        int studiedTopicContents = 0;
        int passedControlPoints = 0;
        int passedTests = 0;


        // текущий товар
        private Topic _currentItem = new Topic();
        int _currentIndex;
        List<Topic> topics = new List<Topic>();
        public TopicLearnPage(Topic selected)
        {

            InitializeComponent();
            LoadAndInitData(selected);
        }


        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //обновление данных после каждой активации окна
            if (Visibility == Visibility.Visible)
            {
                MyMoodleBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                LoadAndInitData(_currentItem);
            }
        }

        void LoadAndInitData(Topic selected)
        {     // если передано null, то мы добавляем новый товар

            topics = MyMoodleBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
            studiedTopicContents = 0;
            passedControlPoints = 0;
            passedTests = 0;

            if (selected != null)
            {
                _currentItem = selected;
                _currentIndex = _currentItem.IndexNumber;
                List<TopicContent> topicContents = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == selected.Id).OrderBy(p => p.IndexNumber).ToList();
                //количсетво пройденных тем пользователем
                
                foreach (TopicContent topicContent in topicContents)
                {
                    UserTopicContent userTopicContent = MyMoodleBDEntities.GetContext().UserTopicContents.FirstOrDefault(p => p.TopicContentId == topicContent.Id && p.UserName == Manager.CurrentUser.UserName);
                    if (userTopicContent == null)
                        continue;
                    if (userTopicContent.IsStudied)
                        studiedTopicContents++;
                }

                ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == selected.Id).OrderBy(p => p.IndexNumber).ToList();
                
                
                
                var controlPoints = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == selected.Id).
                    OrderBy(p => p.IndexNumber).ToList();
                foreach (ControlPoint controlPoint in controlPoints)
                {
                    string name = Manager.CurrentUser.UserName;
                    UserControlPoint userControlPoint = MyMoodleBDEntities.GetContext().UserControlPoints.
                        FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);
                    if (userControlPoint == null)
                    {
                        controlPoint.GetColor = "#fff";
                        controlPoint.GetBall = "";
                        continue;
                    }
                    if (userControlPoint.Result == 5)
                    {
                        controlPoint.GetColor = "#FF76E383";
                        controlPoint.GetBall = "5";
                    }
                    if (userControlPoint.Result == 4)
                    {
                        controlPoint.GetColor = "#FFD9E376";
                        controlPoint.GetBall = "4";
                    }
                    if (userControlPoint.Result == 3)
                    {
                        controlPoint.GetColor = "#FFE3C076";
                        controlPoint.GetBall = "3";
                    }
                    if (userControlPoint.Result <= 2)
                    { 
                        controlPoint.GetColor = "#fff";
                        controlPoint.GetBall = "неуд.";
                    }
                    if (userControlPoint.Result >= 3)
                    {
                        passedControlPoints++;
                    }
                 }

                ListBoxControlPoints.ItemsSource = controlPoints;

                var tests = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == selected.Id).OrderBy(p => p.IndexNumber).ToList();
                foreach (Test test in tests)
                {
                    string name = Manager.CurrentUser.UserName;
                    UserTestResult userTestResult = MyMoodleBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == name);
                    double count = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();

                    if (userTestResult != null)
                    {
                        test.GetResult = Convert.ToInt32(Math.Round(userTestResult.Result / count * 100));


                        if (test.GetResult >= 85)
                        {
                            test.GetColor = "#FF76E383";

                        }
                        if (test.GetResult >= 70 && test.GetResult < 85)
                        {
                            test.GetColor = "#FFD9E376";
                        }
                        if (test.GetResult >= 50 && test.GetResult < 70)
                        {
                            test.GetColor = "#FFE3C076";
                        }
                        if (test.GetResult < 50)
                        {
                            test.GetColor = "#fff";
                        }
                        if (test.GetResult > 50)
                        {
                            passedTests++;
                        }

                    }
                    else
                    {
                        test.GetResult = 0;
                        test.GetColor = "#fff";
                    }
                }
                ListBoxTests.ItemsSource = tests;
               // ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == selected.Id).OrderBy(p => p.IndexNumber).ToList();
            }
            else
            {
                _currentIndex = topics.Count + 1;
                _currentItem.IndexNumber = _currentIndex;
            }
            // контекст данных текущий товар

            DataContext = _currentItem;
            controlPointsCount = ListBoxControlPoints.Items.Count;
            testCount = ListBoxTests.Items.Count;
            topicCount = ListBoxTopicContents.Items.Count;

            int k = passedTests + passedControlPoints + studiedTopicContents;
            int m = controlPointsCount + testCount + topicCount;
            //MessageBox.Show($"{k}  / {m}");
            if (m == 0)
                TopicProgress.Value = 0;
            else
                TopicProgress.Value = Convert.ToInt32(Convert.ToDouble(k) / m * 100);
            TextBlockPercent.Text = TopicProgress.Value.ToString();
        }

     

        private void BtnEye_Click(object sender, RoutedEventArgs e)
        {
            TopicContent tc = (sender as Button).DataContext as TopicContent;
            string filename = Directory.GetCurrentDirectory() + @"\Data\TopicContents\" + tc.TopicLink;
            //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(filename);
            //documentViewerWindow.Owner = Application.Current.MainWindow;
            //documentViewerWindow.ShowDialog();
            Process.Start(filename);
           


        }

   

        private void BtnEyeControlPoint_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string name = Manager.CurrentUser.UserName;
                ControlPoint controlPoint = (sender as Button).DataContext as ControlPoint;
                UserControlPoint userControlPoint = MyMoodleBDEntities.GetContext().UserControlPoints.FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);
                

                AddTaskAnswerWindow window = new AddTaskAnswerWindow(userControlPoint, _currentItem, controlPoint);
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

   
        private void BtnEyeTest_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Test testx = (sender as Button).DataContext as Test;
                Manager.MainFrame.Navigate(new PassTestPage(testx));
                var tests = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
                //foreach (Test test in tests)
                //{
                //    UserTestResult userTestResult = MyMoodleBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == Manager.CurrentUser.UserName);
                //    double count = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();

                //    if (userTestResult != null)
                //    {
                //        test.GetResult = Convert.ToInt32(Math.Round(userTestResult.Result / count * 100));


                //        if (test.GetResult >= 85)
                //        {
                //            test.GetColor = "#FF76E383";

                //        }
                //        if (test.GetResult >= 70 && test.GetResult < 85)
                //        {
                //            test.GetColor = "#FFD9E376";
                //        }
                //        if (test.GetResult >= 50 && test.GetResult < 70)
                //        {
                //            test.GetColor = "#FFE3C076";
                //        }
                //        if (test.GetResult < 50)
                //        {
                //            test.GetColor = "#fff";
                //        }

                //    }
                //}
                //ListBoxTests.ItemsSource = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            //TopicContent tc = (sender as CheckBox).DataContext as TopicContent;
            //UserTopicContent userTopicContent =
            //   tc.UserTopicContents.
            //   FirstOrDefault(p => p.User == Manager.CurrentUser && p.TopicContent.Id == tc.Id);

            //if (userTopicContent == null)
            //{
            //    userTopicContent = new UserTopicContent();
            //    userTopicContent.TopicContentId = tc.Id;
            //    userTopicContent.UserName = Manager.CurrentUser.UserName;

            //    MyMoodleBDEntities.GetContext().UserTopicContents.Add(userTopicContent);
            //}
            //userTopicContent.IsStudied = true;
            //MyMoodleBDEntities.GetContext().SaveChanges();
            //ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
        }

        private void CheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            //TopicContent tc = (sender as CheckBox).DataContext as TopicContent;
            //UserTopicContent userTopicContent =
            //   tc.UserTopicContents.
            //   FirstOrDefault(p => p.User == Manager.CurrentUser && p.TopicContent.Id == tc.Id);

            //if (userTopicContent == null)
            //{
            //    userTopicContent = new UserTopicContent();
            //    userTopicContent.TopicContentId = tc.Id;
            //    userTopicContent.UserName = Manager.CurrentUser.UserName;

            //    MyMoodleBDEntities.GetContext().UserTopicContents.Add(userTopicContent);
            //}
            //userTopicContent.IsStudied = false;
            //MyMoodleBDEntities.GetContext().SaveChanges();
            //ListBoxTopicContents.ItemsSource = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
        }

        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            TopicContent tc = (sender as CheckBox).DataContext as TopicContent;
            UserTopicContent userTopicContent =
               tc.UserTopicContents.
               FirstOrDefault(p => p.User == Manager.CurrentUser && p.TopicContent.Id == tc.Id);

            if (userTopicContent == null)
            {
                userTopicContent = new UserTopicContent();
                userTopicContent.TopicContentId = tc.Id;
                userTopicContent.UserName = Manager.CurrentUser.UserName;

                MyMoodleBDEntities.GetContext().UserTopicContents.Add(userTopicContent);
            }
            bool status = Convert.ToBoolean((sender as CheckBox).IsChecked);
            userTopicContent.IsStudied = status;
            if (!status && userTopicContent != null)
            {
                MyMoodleBDEntities.GetContext().UserTopicContents.Remove(userTopicContent);
            }
            MyMoodleBDEntities.GetContext().SaveChanges();


            controlPointsCount = ListBoxControlPoints.Items.Count;
            testCount = ListBoxTests.Items.Count;
            topicCount = ListBoxTopicContents.Items.Count;
            studiedTopicContents = 0;
            List<TopicContent> topicContents = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
            //количсетво пройденных тем пользователем

            foreach (TopicContent topicContent in topicContents)
            {
                userTopicContent = MyMoodleBDEntities.GetContext().UserTopicContents.FirstOrDefault(p => p.TopicContentId == topicContent.Id && p.UserName == Manager.CurrentUser.UserName);
                if (userTopicContent == null)
                    continue;
                if (userTopicContent.IsStudied)
                    studiedTopicContents++;
            }

            ListBoxTopicContents.ItemsSource = topicContents;

            int k = passedTests + passedControlPoints + studiedTopicContents;
            int m = controlPointsCount + testCount + topicCount;
            //MessageBox.Show($"{k}  / {m}");
            if (m == 0)
                TopicProgress.Value = 0;
            else
                TopicProgress.Value = Convert.ToInt32(Convert.ToDouble(k) / m * 100);
            TextBlockPercent.Text = TopicProgress.Value.ToString();

        }

        private void ToggleButton_Click(object sender, RoutedEventArgs e)
        {
            TopicContent tc = (sender as ToggleButton).DataContext as TopicContent;
            UserTopicContent userTopicContent =
               tc.UserTopicContents.
               FirstOrDefault(p => p.User == Manager.CurrentUser && p.TopicContent.Id == tc.Id);

            if (userTopicContent == null)
            {
                userTopicContent = new UserTopicContent();
                userTopicContent.TopicContentId = tc.Id;
                userTopicContent.UserName = Manager.CurrentUser.UserName;

                MyMoodleBDEntities.GetContext().UserTopicContents.Add(userTopicContent);
            }
            bool status = Convert.ToBoolean((sender as ToggleButton).IsChecked);
            userTopicContent.IsStudied = status;
            if (!status && userTopicContent != null)
            {
                MyMoodleBDEntities.GetContext().UserTopicContents.Remove(userTopicContent);
            }
            MyMoodleBDEntities.GetContext().SaveChanges();


            controlPointsCount = ListBoxControlPoints.Items.Count;
            testCount = ListBoxTests.Items.Count;
            topicCount = ListBoxTopicContents.Items.Count;
            studiedTopicContents = 0;
            List<TopicContent> topicContents = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == _currentItem.Id).OrderBy(p => p.IndexNumber).ToList();
            //количсетво пройденных тем пользователем

            foreach (TopicContent topicContent in topicContents)
            {
                userTopicContent = MyMoodleBDEntities.GetContext().UserTopicContents.FirstOrDefault(p => p.TopicContentId == topicContent.Id && p.UserName == Manager.CurrentUser.UserName);
                if (userTopicContent == null)
                    continue;
                if (userTopicContent.IsStudied)
                    studiedTopicContents++;
            }

            ListBoxTopicContents.ItemsSource = topicContents;

            int k = passedTests + passedControlPoints + studiedTopicContents;
            int m = controlPointsCount + testCount + topicCount;
            //MessageBox.Show($"{k}  / {m}");
            if (m == 0)
                TopicProgress.Value = 0;
            else
                TopicProgress.Value = Convert.ToInt32(Convert.ToDouble(k) / m * 100);
            TextBlockPercent.Text = TopicProgress.Value.ToString();
        }
    }
}

