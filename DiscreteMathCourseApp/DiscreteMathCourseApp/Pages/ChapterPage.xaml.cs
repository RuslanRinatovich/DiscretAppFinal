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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DiscreteMathCourseApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для ChapterPage.xaml
    /// </summary>
    public partial class ChapterPage : Page
    {
        int _itemcount = 0;
        List<Chapter> data;
        public ChapterPage()
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
            data = MyMoodleBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();
            DataGridData.ItemsSource = data;

            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
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
            Manager.MainFrame.Navigate(new AddChapterPage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as Chapter;
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
                    if (selected.Topics.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");
                    data = MyMoodleBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();

                    int k = selected.IndexNumber;

                    for (int i = k; i < _itemcount; i++)
                        data[i].IndexNumber -= 1; 

                    MyMoodleBDEntities.GetContext().Chapters.Remove(selected);
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

            var currentData = MyMoodleBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю

            // выбор тех товаров, в названии которых есть поисковая строка
            currentData = currentData.Where(p => p.Title.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();


            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentData = currentData.OrderBy(p => p.Title).ToList();
                if (ComboSort.SelectedIndex == 1)
                    currentData = currentData.OrderByDescending(p => p.Title).ToList();
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
            Manager.MainFrame.Navigate(new AddChapterPage((sender as Button).DataContext as Chapter));
        }

        private void BtnUp_Click(object sender, RoutedEventArgs e)
        {
            Chapter chapter = (sender as Button).DataContext as Chapter;
            if (chapter.IndexNumber == 1)
                return;
            int k = chapter.IndexNumber - 1;
            Chapter chapterPrev = MyMoodleBDEntities.GetContext().Chapters.FirstOrDefault(p => p.IndexNumber == k);
            if (chapterPrev is null)
                return;

            chapterPrev.IndexNumber = chapter.IndexNumber;
            chapter.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            LoadData();
        }

        private void BtnDown_Click(object sender, RoutedEventArgs e)
        {
            Chapter chapter = (sender as Button).DataContext as Chapter;
            if (chapter.IndexNumber == DataGridData.Items.Count)
                return;
            int k = chapter.IndexNumber + 1;
            Chapter chapterPrev = MyMoodleBDEntities.GetContext().Chapters.FirstOrDefault(p => p.IndexNumber == k);
            if (chapterPrev is null)
                return;

            chapterPrev.IndexNumber = chapter.IndexNumber;
            chapter.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            LoadData();
        }
    }
}