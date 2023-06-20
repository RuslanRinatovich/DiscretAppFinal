using DiscreteMathCourseApp.Models;
using DiscreteMathCourseApp.Windows;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
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
    /// Логика взаимодействия для CheckTasksPage.xaml
    /// </summary>
    public partial class CheckTasksPage : Page
    {
        public User currentUser { get; private set; }
        int _itemcount = 0;
        public CheckTasksPage(User user)
        {
            InitializeComponent();
            currentUser = user;


        LoadAndInitData();
    }


        void LoadControlPoints()
        {
            string name = currentUser.UserName;

            var controlPoints = DiscretMathBDEntities.GetContext().ControlPoints.OrderBy(p => p.Topic.IndexNumber).ToList();

            foreach (ControlPoint controlPoint in controlPoints)
            {

                UserControlPoint userControlPoint = DiscretMathBDEntities.GetContext().UserControlPoints.FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);
                if (userControlPoint is null)
                {
                    controlPoint.GetVisibility = Visibility.Hidden;
                    controlPoint.Result = null;
                }
                else
                {
                    controlPoint.Result = userControlPoint.Result;
                    controlPoint.GetVisibility = Visibility.Visible;
                    controlPoint.GetUserControlPoint = userControlPoint;
                }
            }

            //  var tasks = DiscretMathBDEntities.GetContext().UserControlPoints.Where(p => p.UserName == currentUser.UserName).OrderBy(p => p.ControlPoint.Topic.IndexNumber).ToList();
            // В качестве источника данных присваиваем список данных
            ICollectionView view = CollectionViewSource.GetDefaultView(controlPoints);
            view.GroupDescriptions.Add(new PropertyGroupDescription("Topic.Title"));
            view.SortDescriptions.Add(new SortDescription("IndexNumber", ListSortDirection.Ascending));

            // загрузка данных в listview сортируем по названию
            ListBoxData.ItemsSource = view;
            _itemcount = ListBoxData.Items.Count;
            // скрываем кнопки корзины
            // отображение количества записей


            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
        }

        void LoadAndInitData()
    {

            var chapters = DiscretMathBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();
            chapters.Insert(0, new Chapter
            {
                Title = "Все разделы"
            }
            );
            ComboChapter.ItemsSource = chapters;
            ComboChapter.SelectedIndex = 0;
            LoadControlPoints();


    }
    private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
    {
        //обновление данных после каждой активации окна
        if (Visibility == Visibility.Visible)
        {
                LoadAndInitData();
            }
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
        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            string name = currentUser.UserName;
            // получаем текущие данные из бд
            //var currentGoods = DiscretMathBDEntities.GetContext().Abonements.OrderBy(p => p.CategoryTrainer.Trainer.LastName).ToList();
            var controlPoints = DiscretMathBDEntities.GetContext().ControlPoints.OrderBy(p => p.Topic.IndexNumber).ToList();

            foreach (ControlPoint controlPoint in controlPoints)
            {

                UserControlPoint userControlPoint = DiscretMathBDEntities.GetContext().UserControlPoints.FirstOrDefault(p => p.ControlPointId == controlPoint.Id && p.UserName == name);
                if (userControlPoint is null)
                {
                    controlPoint.GetVisibility = Visibility.Hidden;
                    controlPoint.Result = null;
                }
                else
                {
                    controlPoint.Result = userControlPoint.Result;
                    controlPoint.GetVisibility = Visibility.Visible;
                    controlPoint.GetUserControlPoint = userControlPoint;
                }
            }
          

            if (ComboChapter.SelectedIndex > 0)
            {
                controlPoints = controlPoints.Where(p => p.Topic.ChapterId == ((ComboChapter.SelectedItem) as Chapter).Id).ToList();
            }


            controlPoints = controlPoints.Where(p => p.Topic.Title.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();


            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    controlPoints = controlPoints.OrderBy(p => p.Topic.IndexNumber).ToList();
                if (ComboSort.SelectedIndex == 1)
                    controlPoints = controlPoints.OrderByDescending(p => p.Topic.IndexNumber).ToList();
                // сортировка по убыванию цены
            }

            ICollectionView view = CollectionViewSource.GetDefaultView(controlPoints);
            view.GroupDescriptions.Add(new PropertyGroupDescription("Topic.Title"));
            view.SortDescriptions.Add(new SortDescription("IndexNumber", ListSortDirection.Ascending));

            // В качестве источника данных присваиваем список данных
            ListBoxData.ItemsSource = view;
            // DataGridData.ItemsSource = currentData;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {controlPoints.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
    {
        UpdateData();
    }

   

    private void ComboChapter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void ListBoxData_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void BtnCheck_Click(object sender, RoutedEventArgs e)
        {
         

            try
            {
                ControlPoint selected = (sender as Button).DataContext as ControlPoint;

            

                AddMarkTaskWindow window = new AddMarkTaskWindow(selected.GetUserControlPoint);
                if (window.ShowDialog() == true)
                {
                    DiscretMathBDEntities.GetContext().Entry(window.currentItem).State = EntityState.Modified;
                    DiscretMathBDEntities.GetContext().SaveChanges();
                    LoadControlPoints();
                    MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as ControlPoint;
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить ответ на задание???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {

                    UserControlPoint deleted = selected.GetUserControlPoint;

                    DiscretMathBDEntities.GetContext().UserControlPoints.Remove(deleted);

                  
                    //сохраняем изменения
                    DiscretMathBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Ответ на задание удален");
                    LoadControlPoints();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
