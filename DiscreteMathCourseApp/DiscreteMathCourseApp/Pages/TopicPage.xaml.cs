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
using DiscreteMathCourseApp.Models;

namespace DiscreteMathCourseApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для TopicPage.xaml
    /// </summary>
    public partial class TopicPage : Page
    {
        int _itemcount = 0;
        List<Topic> data;
        public TopicPage()
        {
            InitializeComponent();
            LoadData();

        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddGoodPage
          //  Manager.MainFrame.Navigate(new AddServicePage((sender as Button).DataContext as Service));
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

            ICollectionView collectionView = CollectionViewSource.GetDefaultView(data);
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Chapter"));
            DataGridData.ItemsSource = collectionView;

            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
            _itemcount = data.Count;
            
            
        }

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие  AddGoodPage для добавления новой записи
            Manager.MainFrame.Navigate(new AddTopicPage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as Topic;
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент
                   
                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if (selected.TopicContents.Count > 0 || selected.ControlPoints.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");

                    int k = selected.IndexNumber;

                    data = MyMoodleBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();

                    for (int i = k; i < _itemcount; i++)
                        data[i].IndexNumber -= 1;

                    MyMoodleBDEntities.GetContext().Topics.Remove(selected);
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

        private void BtnUp_Click(object sender, RoutedEventArgs e)
        {
            Topic topic = (sender as Button).DataContext as Topic;
            if (topic.IndexNumber == 1)
                return;
            int k = topic.IndexNumber - 1;
            Topic topicPrev = MyMoodleBDEntities.GetContext().Topics.FirstOrDefault(p => p.IndexNumber == k);
            if (topicPrev is null)
                return;

            topicPrev.IndexNumber = topic.IndexNumber;
            topic.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            LoadData();
        }

        private void BtnDown_Click(object sender, RoutedEventArgs e)
        {
            Topic topic = (sender as Button).DataContext as Topic;
            if (topic.IndexNumber == DataGridData.Items.Count)
                return;
            int k = topic.IndexNumber + 1;
            Topic topicPrev = MyMoodleBDEntities.GetContext().Topics.FirstOrDefault(p => p.IndexNumber == k);
            if (topicPrev is null)
                return;

            topicPrev.IndexNumber = topic.IndexNumber;
            topic.IndexNumber = k;
            MyMoodleBDEntities.GetContext().SaveChanges();
            LoadData();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddTopicPage((sender as Button).DataContext as Topic));
        }

        private void BtnTopicType_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new TopicTypePage());
        }

        private void BtnChapters_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ChapterPage());
        }
    }
}


