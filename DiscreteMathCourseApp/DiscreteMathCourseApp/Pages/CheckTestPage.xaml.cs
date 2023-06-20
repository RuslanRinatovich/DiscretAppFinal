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
    /// Логика взаимодействия для CheckTestPage.xaml
    /// </summary>
    public partial class CheckTestPage : Page
    {
        User user;
        int _itemcount = 0;
        public CheckTestPage( User u)
        {
            InitializeComponent();
            user = u;
            LoadData();
        }

        void LoadData()
        {
            
            var tests = DiscretMathBDEntities.GetContext().Tests.OrderBy(p => p.Topic.IndexNumber).ToList();
            int passedTests = 0;
            foreach (Test test in tests)
            {
                string name = user.UserName;
                UserTestResult userTestResult = DiscretMathBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == name);
                double count = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();

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

            ICollectionView view = CollectionViewSource.GetDefaultView(tests);
            view.GroupDescriptions.Add(new PropertyGroupDescription("Topic.Title"));
            view.SortDescriptions.Add(new SortDescription("IndexNumber", ListSortDirection.Ascending));
            ListBoxTests.ItemsSource = null;
            ListBoxTests.ItemsSource = view;
            int testCount = ListBoxTests.Items.Count;
            _itemcount = ListBoxTests.Items.Count;
            TextBlockCount.Text = $" Результат запроса: {tests.Count} записей из {_itemcount}";
        }

        private void UpdateData()
        {
            var tests = DiscretMathBDEntities.GetContext().Tests.OrderBy(p => p.Topic.IndexNumber).ToList();
            int passedTests = 0;
            foreach (Test test in tests)
            {
                string name = user.UserName;
                UserTestResult userTestResult = DiscretMathBDEntities.GetContext().UserTestResults.FirstOrDefault(p => p.TestId == test.Id && p.UserName == name);
                double count = DiscretMathBDEntities.GetContext().TestQuestions.Where(p => p.TestId == test.Id).Count();

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
            // выбор только тех товаров, которые принадлежат данному производителю

            // выбор тех товаров, в названии которых есть поисковая строка
            tests = tests.Where(p => p.Title.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();


            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    tests = tests.OrderBy(p => p.Topic.Title).ToList();
                if (ComboSort.SelectedIndex == 1)
                    tests = tests.OrderByDescending(p => p.Topic.Title).ToList();
                // сортировка по убыванию цены
            }
            // В качестве источника данных присваиваем список данных
            ICollectionView view = CollectionViewSource.GetDefaultView(tests);
            view.GroupDescriptions.Add(new PropertyGroupDescription("Topic.Title"));
            view.SortDescriptions.Add(new SortDescription("IndexNumber", ListSortDirection.Ascending));


            ListBoxTests.ItemsSource = null;
            ListBoxTests.ItemsSource = view;
            _itemcount = ListBoxTests.Items.Count;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {tests.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
        private void TBoxSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
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

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as Test;
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить результаты прохождения теста???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                   


                    var deleted = DiscretMathBDEntities.GetContext().TestProgresses.Where(p => p.UserName == user.UserName && p.TestId == selected.Id).ToList();

                  

                    DiscretMathBDEntities.GetContext().TestProgresses.RemoveRange(deleted);

                    var userTestResult = DiscretMathBDEntities.GetContext().UserTestResults.Where(p => p.UserName == user.UserName && p.TestId == selected.Id).ToList();
                    DiscretMathBDEntities.GetContext().UserTestResults.RemoveRange(userTestResult);
                    //сохраняем изменения
                    DiscretMathBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Результаты теста очищены");
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnShow_Click(object sender, RoutedEventArgs e)
        {
            Test testx = (sender as Button).DataContext as Test;
            Manager.MainFrame.Navigate(new UsersTestPassPage(testx, user));
        }
    }
}
