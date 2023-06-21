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
using Excel = Microsoft.Office.Interop.Excel;

namespace DiscreteMathCourseApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для StudentProgressPage.xaml
    /// </summary>
    public partial class StudentProgressPage : Page
    {
        int _itemcount = 0;
        List<Topic> data;
        int totalTasks = 0;
        int totalCompleteTask = 0;
        User user;
        public StudentProgressPage(User u)
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

        private void PrintExcel()
        {
            string fileName = AppDomain.CurrentDomain.BaseDirectory + "\\" + "Data\\Result" + ".xltx";
            Excel.Application xlApp = new Excel.Application();
            Excel.Worksheet xlSheet = new Excel.Worksheet();
            try
            {
                //добавляем книгу
                xlApp.Workbooks.Open(fileName, Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                                          Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                                          Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                                          Type.Missing, Type.Missing);
                //делаем временно неактивным документ
                xlApp.Interactive = false;
                xlApp.EnableEvents = false;
                Excel.Range xlSheetRange;
                //выбираем лист на котором будем работать (Лист 1)
                xlSheet = (Excel.Worksheet)xlApp.Sheets[1];
                //Название листа
                xlSheet.Name = user.GetFio;

                xlSheet.Rows[1].VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                xlSheet.Rows[1].HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                xlSheet.Rows[2].VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                xlSheet.Rows[2].HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                xlSheet.Rows[3].VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                xlSheet.Rows[3].HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                int row = 3;
                int i = 0;
                int k = 2;
                int start = 0;
                int end = 0;
                data = DiscretMathBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
                //makeHeader
                int topicStartIndex = 0;
                foreach (Topic topic in data)
                {
                    List<TopicContent> topicContents = DiscretMathBDEntities.GetContext().TopicContents.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                    string name = user.UserName;

                    topicStartIndex = k;
                    xlSheet.Cells[row, 1] = "ФИО";
                    start = k;
                    foreach (TopicContent topicContent in topicContents)
                    {
                        //if (topicContent.TopicTitle == "Задачник")
                        //    continue;
                        xlSheet.Cells[row, k] = topicContent.TopicTitle;
                        xlSheet.Cells[row, k].Orientation = 90;
                        k++;
                    }
                    if (k == start)
                    {
                        end = k;
                        k++;
                    }
                    else
                    {
                        end = k - 1;
                        xlSheet.Range[xlSheet.Cells[2, start], xlSheet.Cells[2, end]].Merge();
                    }
                   
                    xlSheet.Cells[2, start] = "Материалы";

                    start = k;
                    var controlPoints = DiscretMathBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                    foreach (ControlPoint controlPoint in controlPoints)
                    {
                        xlSheet.Cells[row, k] = $"Задание № {controlPoint.IndexNumber}";
                        xlSheet.Cells[row, k].Orientation = 90;
                        k++;
                    }
                    if (k == start)
                    {
                        end = k;
                        k++;
                    }
                    else
                    {
                        end = k - 1;
                        xlSheet.Range[xlSheet.Cells[2, start], xlSheet.Cells[2, end]].Merge();
                    }
                    xlSheet.Cells[2, start] = "Задания";
                    start = k;
                    var tests = DiscretMathBDEntities.GetContext().Tests.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                    foreach (Test test in tests)
                    {
                        xlSheet.Cells[row, k] = $"Тест № {test.IndexNumber}";
                        xlSheet.Cells[row, k].Orientation = 90;
                        k++;
                    }
                    if (k == start)
                    {
                        end = k;
                        k++;
                    }
                    else
                    {
                        end = k - 1;
                        xlSheet.Range[xlSheet.Cells[2, start], xlSheet.Cells[2, end]].Merge();
                    }

                    xlSheet.Cells[2, start] = "Тесты";
                    xlSheet.Range[xlSheet.Cells[1, topicStartIndex], xlSheet.Cells[1, k-1]].Merge();
                    xlSheet.Cells[1, topicStartIndex] = topic.Title;

                }

                k = 2;
                row = 4;
                foreach (Topic topic in data)
                {
                    List<TopicContent> topicContents = DiscretMathBDEntities.GetContext().TopicContents.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                    string name = user.UserName;
                    topicStartIndex = k;

               
                    start = k;
                    xlSheet.Cells[row, 1] = user.GetFio;
                    foreach (TopicContent topicContent in topicContents)
                    {
                        //if (topicContent.TopicTitle == "Задачник")
                        //    continue;
                        UserTopicContent userTopicContent = DiscretMathBDEntities.GetContext().UserTopicContents.FirstOrDefault(p => p.TopicContentId == topicContent.Id && p.UserName == name);
                       
                        if (userTopicContent == null)
                        {
                            k++;
                            continue;
                        }
                        if (userTopicContent.IsStudied)
                            xlSheet.Cells[row, k] = "изучен";
                        k++;
                    }
                    if (k == start)
                    {
                        k++;
                    }
                   
                    start = k;
                    var controlPoints = DiscretMathBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                    foreach (ControlPoint controlPoint in controlPoints)
                    {

                        UserControlPoint userControlPoint = DiscretMathBDEntities.GetContext().UserControlPoints. FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);
                       
                        if (userControlPoint == null)
                        {
                            k++;
                            continue;
                        }

                        xlSheet.Cells[row, k] = userControlPoint.Result.ToString();
                        k++;
                    }
                    if (k == start)
                    {
                        k++;
                    }
                    start = k;
                    var tests = DiscretMathBDEntities.GetContext().Tests.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                    foreach (Test test in tests)
                    {
                        UserTestResult userTestResult = DiscretMathBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == name);
                        double count = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();
                        if (userTestResult == null)
                            continue;
                        int testResult = Convert.ToInt32(Math.Round(userTestResult.Result / count * 100));

                        xlSheet.Cells[row, k] = (testResult/100.0);
                        xlSheet.Cells[row, k].NumberFormat = "0%";

                        k++;
                    }
                    if (k == start)
                    {
                        k++;
                    }

                }

               
                    xlSheetRange = xlSheet.UsedRange;
                xlSheetRange.Borders.LineStyle = true;
                //выравниваем строки и колонки по их содержимому
                xlSheetRange.Columns.AutoFit();
                xlSheetRange.Rows.AutoFit();
                xlSheet.Rows[1].WrapText = true;
                xlSheet.Rows[1].RowHeight = 150;
                xlSheet.Rows[1].Font.Bold = true;
                xlSheet.Rows[2].Font.Bold = true;
                xlSheet.Rows[3].Font.Bold = true;
                xlSheet.Columns[1].Font.Bold = true;
               
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                //Показываем ексель
                xlApp.Visible = true;
                xlApp.Interactive = true;
                xlApp.ScreenUpdating = true;
                xlApp.UserControl = true;
            }
        }
        void LoadData()
        {
            totalTasks = 0;
            totalCompleteTask = 0;
            var chapters = DiscretMathBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();
            chapters.Insert(0, new Chapter
            {
                Title = "Все разделы"
            }
            );
            ComboChapter.ItemsSource = chapters;
            ComboChapter.SelectedIndex = 0;

            var topicTypes = DiscretMathBDEntities.GetContext().TopicTypes.OrderBy(p => p.Title).ToList();
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
                Title = "Все типы занятий"
            }
            );
            ComboTopicType.ItemsSource = topicTypes;
            ComboTopicType.SelectedIndex = 0;

            DataGridData.ItemsSource = null;
            //загрузка обновленных данных
            DiscretMathBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            data = DiscretMathBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();

            foreach (Topic topic in data)
            {

                int studiedTopicContents = 0;
                int passedControlPoints = 0;
                int passedTests = 0;

                int topicContentsCount = 0;
                int controlPointsCount = 0;
                int testCount = 0;

                List<TopicContent> topicContents = DiscretMathBDEntities.GetContext().TopicContents.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                //количсетво пройденных тем пользователем
                topicContentsCount = topicContents.Count;
                string name = user.UserName;
                foreach (TopicContent topicContent in topicContents)
                {
                    UserTopicContent userTopicContent = DiscretMathBDEntities.GetContext().UserTopicContents.FirstOrDefault(p => p.TopicContentId == topicContent.Id && p.UserName == name);
                    if (userTopicContent == null)
                        continue;
                    if (userTopicContent.IsStudied)
                        studiedTopicContents++;
                }
                var controlPoints = DiscretMathBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                foreach (ControlPoint controlPoint in controlPoints)
                {

                    UserControlPoint userControlPoint = DiscretMathBDEntities.GetContext().UserControlPoints.
                        FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);
                    if (userControlPoint == null)
                        continue;

                    if (userControlPoint.Result >= 3)
                    {
                        passedControlPoints++;
                    }
                }
                controlPointsCount = controlPoints.Count;
                var tests = DiscretMathBDEntities.GetContext().Tests.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                foreach (Test test in tests)
                {
                    UserTestResult userTestResult = DiscretMathBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == name);
                    double count = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();

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
                   $"Заданий выполнено {passedControlPoints} из {controlPointsCount}  \n" +
                   $"Тестов пройдено {passedTests} из {testCount}\n";


            }


            ICollectionView collectionView = CollectionViewSource.GetDefaultView(data);
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Chapter"));
            DataGridData.ItemsSource = collectionView;
            int total = Convert.ToInt32(Convert.ToDouble(totalCompleteTask) / totalTasks * 100);
            GaugeTotalStats.Value = total;
            _itemcount = data.Count;
            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
         

            if (user != null)
            {
                TextBlockUserName.Text = $"{user.GetFio}";
                if (user.StudentGroup != null)
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
            //var currentGoods = DiscretMathBDEntities.GetContext().Abonements.OrderBy(p => p.CategoryTrainer.Trainer.LastName).ToList();

            var currentData = DiscretMathBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
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

        private void BtnExcel_Click(object sender, RoutedEventArgs e)
        {
            PrintExcel();
        }

        private void BtnTasks_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new CheckTasksPage(user));
        }

        private void BtnTests_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new CheckTestPage(user));
        }
    }
}


