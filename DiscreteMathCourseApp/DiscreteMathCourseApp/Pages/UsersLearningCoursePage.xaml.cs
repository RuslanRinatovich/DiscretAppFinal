using DiscreteMathCourseApp.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    /// Логика взаимодействия для UsersLearningCoursePage.xaml
    /// </summary>
    public partial class UsersLearningCoursePage : Page
    {
        int _itemcount = 0;
        List<Topic> data;
        User user;
        int totalTasks = 0;
        int totalCompleteTask = 0;
        public UsersLearningCoursePage(User u)
        {
            InitializeComponent();
            user = u;

            //LoadData();

        }


        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

        void LoadData()
        {

            totalTasks = 0;
            totalCompleteTask = 0;
            var chapters = MyMoodleBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();
            chapters.Insert(0, new Chapter
            {
                Title = "Все разделы"
            }
            );
            ComboChapter.ItemsSource = chapters;
            ComboChapter.SelectedIndex = 0;

            var topicTypes = MyMoodleBDEntities.GetContext().TopicTypes.OrderBy(p => p.Title).ToList();
            TextBoxStats.Text = "";
            string answer = "";
            int sum = 0;
            foreach (TopicType topicType in topicTypes)
            {
                string title = topicType.Title;
                int k = topicType.Topics.Sum(p => p.TotalHours);
                answer += $"\t{title}: {k}ч. ";
                sum += k;
            }

            TextBoxStats.Text = answer + $"ИТОГО: {sum} ч.";
            topicTypes.Insert(0, new TopicType
            {
                Title = "Все типы"
            }
            );
            ComboTopicType.ItemsSource = topicTypes;
            ComboTopicType.SelectedIndex = 0;

            DataGridData.ItemsSource = null;
            //загрузка обновленных данных
            MyMoodleBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            data = MyMoodleBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
            
            foreach (Topic topic in data)
            {

                int studiedTopicContents = 0;
                int passedControlPoints = 0;
                int passedTests = 0;

                int topicContentsCount = 0;
                int controlPointsCount = 0;
                int testCount = 0;

                List<TopicContent> topicContents = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                //количсетво пройденных тем пользователем
                topicContentsCount = topicContents.Count;
                string name = user.UserName;
                foreach (TopicContent topicContent in topicContents)
                {
                    UserTopicContent userTopicContent = MyMoodleBDEntities.GetContext().UserTopicContents.FirstOrDefault(p => p.TopicContentId == topicContent.Id && p.UserName == name);
                    if (userTopicContent == null)
                        continue;
                    if (userTopicContent.IsStudied)
                        studiedTopicContents++;
                }
                var controlPoints = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                foreach (ControlPoint controlPoint in controlPoints)
                {

                    UserControlPoint userControlPoint = MyMoodleBDEntities.GetContext().UserControlPoints.
                        FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);
                    if (userControlPoint == null)
                        continue;

                    if (userControlPoint.Result >= 3)
                    {
                        passedControlPoints++;
                    }
                }
                controlPointsCount = controlPoints.Count;
                var tests = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                foreach (Test test in tests)
                {
                    UserTestResult userTestResult = MyMoodleBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == name);
                    double count = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();

                    if (userTestResult == null)
                        continue;
                    int testResult = Convert.ToInt32(Math.Round(userTestResult.Result / count * 100));
                    if (testResult > 50)
                        {
                            passedTests++;
                        }

                   
                }
                testCount = tests.Count;



                int k = passedTests + passedControlPoints + studiedTopicContents;
                int m = controlPointsCount + testCount + topicContentsCount;
                totalTasks += m;
                totalCompleteTask += k;
                //MessageBox.Show($"{k}  / {m}");
                if (m == 0)
                {
                    topic.GetProgress = 0;
                    topic.GetColor = "#FFF";
                }
                else
                {
                    int percent = Convert.ToInt32(Convert.ToDouble(k) / m * 100);
                    topic.GetProgress = Convert.ToInt32(Convert.ToDouble(k) / m * 100);
                    if (percent >= 90)
                        topic.GetColor = "#FF76E383";
                    else
                        topic.GetColor = "#FFF";

                }



                topic.GetData = $"Материалов изучено {studiedTopicContents} из {topicContentsCount}\n" +
                   $"Заданий выполнено {passedControlPoints} из {controlPointsCount}  \n"+
                   $"Тестов пройдено {passedTests} из {testCount}\n";


            }


            ICollectionView collectionView = CollectionViewSource.GetDefaultView(data);
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Chapter"));
            DataGridData.ItemsSource = collectionView;
            int total = Convert.ToInt32(Convert.ToDouble(totalCompleteTask) / totalTasks * 100);
            GaugeTotalStats.Value = total;
            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
            _itemcount = data.Count;
            if (user != null)
            {
                TextBlockUserName.Text = $"{user.GetFio}";
                TextBlockGroup.Text = $"группа:{user.StudentGroup.Title}";
                TextBlockMaterials.Text = $"Материалов изучено {user.GetPassedTopicContentString}";
                TextBlockTasks.Text = $"Заданий выполнено {user.GetPassedControlPointCountString}";
                TextBlockTests.Text = $"Тестов пройдено {user.GetTestPassCountString}";
            }


        }

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие  AddGoodPage для добавления новой записи
           // Manager.MainFrame.Navigate(new AddTopicPage(null));
        }

     

        // отображение номеров строк в DataGrid
        private void DataGridDataLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        // Поиск товаров, которые содержат данную поисковую строку
        private void TBoxSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }
        // Поиск товаров конкретного производителя
        private void ComboTypeSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }





        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            // получаем текущие данные из бд
            //var currentGoods = MyMoodleBDEntities.GetContext().Abonements.OrderBy(p => p.CategoryTrainer.Trainer.LastName).ToList();

            var currentData = MyMoodleBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю

            if (ComboChapter.SelectedIndex > 0)
            {
                currentData = currentData.Where(p => p.ChapterId == ((ComboChapter.SelectedItem) as Chapter).Id).ToList();
            }

            if (ComboTopicType.SelectedIndex > 0)
            {
                currentData = currentData.Where(p => p.TopicTypeId == ((ComboTopicType.SelectedItem) as TopicType).Id).ToList();
            }
            //// выбор тех товаров, в названии которых есть поисковая строка
            currentData = currentData.Where(p => p.Title.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();


            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentData = currentData.OrderBy(p => p.IndexNumber).ToList();
                if (ComboSort.SelectedIndex == 1)
                    currentData = currentData.OrderByDescending(p => p.IndexNumber).ToList();
                // сортировка по убыванию цены
            }

            // В качестве источника данных присваиваем список данных
            ICollectionView collectionView = CollectionViewSource.GetDefaultView(currentData);
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Chapter"));
            DataGridData.ItemsSource = collectionView;
            // DataGridData.ItemsSource = currentData;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentData.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void DataGridData_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        private void BtnEye_Click(object sender, RoutedEventArgs e)
        {
            Topic topic = (sender as Button).DataContext as Topic;
            Manager.MainFrame.Navigate(new TopicLearnPage(topic));
        }
    }
}


