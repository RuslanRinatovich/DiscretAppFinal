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
using DiscreteMathCourseApp.Models;
using Excel = Microsoft.Office.Interop.Excel;

namespace DiscreteMathCourseApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для StudentsPage.xaml
    /// </summary>
    public partial class StudentsPage : Page
    {
        int _itemcount = 0;
        List<User> data;
        public StudentsPage()
        {
            InitializeComponent();
            LoadData();
        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddGoodPage

        }

        void LoadData()
        {


            DataGridData.ItemsSource = null;
            //загрузка обновленных данных
            MyMoodleBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            data = MyMoodleBDEntities.GetContext().Users.OrderBy(p => p.Surname).ThenBy(p => p.Name).ToList();
            DataGridData.ItemsSource = data;

            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";


            var roles = MyMoodleBDEntities.GetContext().Roles.OrderBy(p => p.Title).ToList();
            roles.Insert(0, new Role
            {
                Title = "Все типы пользователей"
            }
            );
            ComboUserType.ItemsSource = roles;
            ComboUserType.SelectedIndex = 0;
            _itemcount = data.Count;
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

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие  AddGoodPage для добавления новой записи
            Manager.MainFrame.Navigate(new AddUserPage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as User;
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
                    if (selected.TestProgresses.Count > 0 || selected.UserControlPoints.Count > 0 || selected.UserTestResults.Count > 0 || selected.UserTopicContents.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");
                   

                    MyMoodleBDEntities.GetContext().Users.Remove(selected);
                    //сохраняем изменения
                    MyMoodleBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // отображение номеров строк в DataGrid
        private void DataGridDataLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }
        private void TBoxSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }
        // Поиск товаров конкретного производителя
        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            // получаем текущие данные из бд
            //var currentGoods = MyMoodleBDEntities.GetContext().Abonements.OrderBy(p => p.CategoryTrainer.Trainer.LastName).ToList();

            var currentData = MyMoodleBDEntities.GetContext().Users.OrderBy(p => p.Surname).ThenBy(p => p.Name).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю
            if (ComboUserType.SelectedIndex > 0)
            {
                currentData = currentData.Where(p => p.RoleId == ((ComboUserType.SelectedItem) as Role).Id).ToList();
            }

           
            // выбор тех товаров, в названии которых есть поисковая строка
            currentData = currentData.Where(p => p.UserName.ToLower().Contains(TBoxSearch.Text.ToLower()) || 
            (p.Surname!= null && p.Surname.ToLower().Contains(TBoxSearch.Text.ToLower()))
            || (p.Name != null && p.Name.ToLower().Contains(TBoxSearch.Text.ToLower()))
            || (p.Patronymic != null && p.Patronymic.ToLower().Contains(TBoxSearch.Text.ToLower()))
            || (p.StudentGroup != null && p.StudentGroup.Title.ToLower().Contains(TBoxSearch.Text.ToLower()))
            ).ToList();


            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentData = currentData.OrderBy(p => p.Surname).ThenBy(p => p.Name).ThenBy(p => p.Patronymic).ToList();
                if (ComboSort.SelectedIndex == 1)
                    currentData = currentData.OrderByDescending(p => p.Surname).ThenByDescending(p => p.Name).ThenByDescending(p => p.Patronymic).ToList();
                if (ComboSort.SelectedIndex == 2)
                    currentData = currentData.OrderBy(p => p.StudentGroup).ToList();
                if (ComboSort.SelectedIndex == 3)
                    currentData = currentData.OrderByDescending(p => p.StudentGroup).ToList();
                // сортировка по убыванию цены
            }
            // В качестве источника данных присваиваем список данных
            DataGridData.ItemsSource = currentData;
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

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddUserPage((sender as Button).DataContext as User));
        }

        private void BtnExportExcel_Click(object sender, RoutedEventArgs e)
        {
            PrintExcel();
        }

        private void BtnExcel_Click(object sender, RoutedEventArgs e)
        {
            PrintExcel();

        }

        private void PrintExcel()
        {
            string fileName = AppDomain.CurrentDomain.BaseDirectory + "\\" + "Data\\Users" + ".xltx";
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
                xlSheet.Name = "Пользователи";
                int row = 2;
                int i = 0;


                if (DataGridData.Items.Count > 0)
                {
                    for (i = 0; i < DataGridData.Items.Count; i++)
                    {

                        User user = DataGridData.Items[i] as User;

                        xlSheet.Cells[row, 1] = (i + 1).ToString();
                        // DateTime y = Convert.ToDateTime(dtOrders.Rows[i].Cells[1].Value);
                        xlSheet.Cells[row, 2] = user.UserName;
                        xlSheet.Cells[row, 3] = user.Password;
                        xlSheet.Cells[row, 4] = user.Surname;
                        xlSheet.Cells[row, 5] = user.Name;
                        xlSheet.Cells[row, 6] = user.Patronymic;
                        xlSheet.Cells[row, 7] = user.DateOfRegs.ToShortDateString();
                        xlSheet.Cells[row, 8] = user.Role.Title.ToString();
                        if (user.StudentGroup !=  null) 
                             xlSheet.Cells[row, 9] = user.StudentGroup.Title;

                        row++;
                        Excel.Range r = xlSheet.get_Range("A" + row.ToString(), "I" + row.ToString());
                        r.Insert(Excel.XlInsertShiftDirection.xlShiftDown);
                    }
                }
                row--;
                xlSheetRange = xlSheet.get_Range("A2:I" + (row).ToString(), Type.Missing);
                xlSheetRange.Borders.LineStyle = true;
                
                row++;

                //выбираем всю область данных*/
                xlSheetRange = xlSheet.UsedRange;
                //выравниваем строки и колонки по их содержимому
                xlSheetRange.Columns.AutoFit();
                xlSheetRange.Rows.AutoFit();
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

        private void BtnTask_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new CheckTasksPage((sender as Button).DataContext as User));
        }

        private void ComboUserType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void BtnTests_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new CheckTestPage((sender as Button).DataContext as User));
        }

        private void BtnGroups_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new GroupsPage());
        }

        private void BtnTask_Click_1(object sender, RoutedEventArgs e)
        {

        }

        private void BtnStatistic_Click(object sender, RoutedEventArgs e)
        {

            Manager.MainFrame.Navigate(new StudentProgressPage((sender as Button).DataContext as User));
        }

        private void BtnExportResultsExcel_Click(object sender, RoutedEventArgs e)
        {
            PrintResultsExcel();
        }

        private void PrintResultsExcel()
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
                xlSheet.Rows[1].VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                xlSheet.Rows[1].HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                xlSheet.Rows[2].VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                xlSheet.Rows[2].HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                    xlSheet.Rows[3].VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                xlSheet.Rows[3].HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                //Название листа
                xlSheet.Name = "Результаты";
                xlSheet.Rows[1].WrapText = true;
                int row = 3;
                int i = 0;
                int k = 3;
                int start = 0;
                int end = 0;
                List<Topic> topics = MyMoodleBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
                //makeHeader
                int topicStartIndex = 0;
                foreach (Topic topic in topics)
                {
                    List<TopicContent> topicContents = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                    topicStartIndex = k;
                    xlSheet.Cells[row, 1] = "№";
                    xlSheet.Cells[row, 2] = "ФИО";
                    start = k;
                    foreach (TopicContent topicContent in topicContents)
                    {
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
                    var controlPoints = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
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
                    var tests = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
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
                    xlSheet.Range[xlSheet.Cells[1, topicStartIndex], xlSheet.Cells[1, k - 1]].Merge();
                    xlSheet.Cells[1, topicStartIndex] = topic.Title;

                }

               
                row = 4;
                int j = 1;
                if (DataGridData.Items.Count > 0)
                {
                    for (i = 0; i < DataGridData.Items.Count; i++)
                    {

                        User topicuser = DataGridData.Items[i] as User;
                        if (topicuser.RoleId == 2)
                            continue;
                        xlSheet.Cells[row, 1] = j.ToString();
                        j++;
                        k = 3;
                        foreach (Topic topic in topics)
                        {
                            List<TopicContent> topicContents = MyMoodleBDEntities.GetContext().TopicContents.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                            string name = topicuser.UserName;
                            topicStartIndex = k;


                            start = k;
                            xlSheet.Cells[row, 2] = topicuser.GetFio;
                            foreach (TopicContent topicContent in topicContents)
                            {
                                UserTopicContent userTopicContent = MyMoodleBDEntities.GetContext().UserTopicContents.FirstOrDefault(p => p.TopicContentId == topicContent.Id && p.UserName == name);

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
                            var controlPoints = MyMoodleBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                            foreach (ControlPoint controlPoint in controlPoints)
                            {

                                UserControlPoint userControlPoint = MyMoodleBDEntities.GetContext().UserControlPoints.FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);

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
                            var tests = MyMoodleBDEntities.GetContext().Tests.Where(p => p.TopicId == topic.Id).OrderBy(p => p.IndexNumber).ToList();
                            foreach (Test test in tests)
                            {
                                UserTestResult userTestResult = MyMoodleBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == name);
                                double count = MyMoodleBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();
                                if (userTestResult == null)
                                    continue;
                                int testResult = Convert.ToInt32(Math.Round(userTestResult.Result / count * 100));

                                xlSheet.Cells[row, k] = (testResult / 100.0);
                                xlSheet.Cells[row, k].NumberFormat = "0%";
                                k++;
                            }
                            if (k == start)
                            {
                                k++;
                            }
                        }
                        row++;
                    }
                }
                //выбираем всю область данных*/
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
    }
    }