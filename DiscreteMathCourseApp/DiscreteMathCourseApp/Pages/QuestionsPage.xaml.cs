using DiscreteMathCourseApp.Models;
using DiscreteMathCourseApp.Windows;
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
    /// Логика взаимодействия для QuestionsPage.xaml
    /// </summary>
    public partial class QuestionsPage : Page
    {
        int _itemcount = 0;
        List<Question> data;
        public QuestionsPage()
        {
            InitializeComponent();
           // LoadData();
        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddGoodPage

        }

        void LoadData()
        {

            var chapters = DiscretMathBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();
            chapters.Insert(0, new Chapter
            {
                Title = "Все разделы"
            }
            );
            ComboChapter.ItemsSource = chapters;
            ComboChapter.SelectedIndex = 0;

            var topics = DiscretMathBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
            topics.Insert(0, new Topic
            {
                Title = "Все темы"
            }
            );
            ComboTopic.ItemsSource = topics;
            ComboTopic.SelectedIndex = 0;
            DataGridData.ItemsSource = null;
            //загрузка обновленных данных
            DiscretMathBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            data = DiscretMathBDEntities.GetContext().Questions.OrderBy(p => p.Topic.Chapter.IndexNumber).ThenBy(p => p.Topic.IndexNumber).ToList();
            ICollectionView collectionView = CollectionViewSource.GetDefaultView(data);
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Topic.Chapter"));
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Topic"));
            DataGridData.ItemsSource = collectionView;

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
            //   Manager.MainFrame.Navigate(new AddQuestionPage(null));

            try

            {
                Question question = (sender as Button).DataContext as Question;
                AddNewQuestionWindow window = new AddNewQuestionWindow(null);
                if (window.ShowDialog() == true)
                {

                    // MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);

                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                LoadData();
            }
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = (sender as Button).DataContext as Question;
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
                    if (selected.Answers.Count > 0 || selected.TestQuestions.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");

                    DiscretMathBDEntities.GetContext().Questions.Remove(selected);
                    //сохраняем изменения
                    DiscretMathBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                finally
                {
                    LoadData();
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
            //var currentGoods = DiscretMathBDEntities.GetContext().Abonements.OrderBy(p => p.CategoryTrainer.Trainer.LastName).ToList();
            var currentData = DiscretMathBDEntities.GetContext().Questions.OrderBy(p => p.Topic.Chapter.IndexNumber).ThenBy(p => p.Topic.IndexNumber).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю

            if (ComboChapter.SelectedIndex > 0)
            {
                if (ComboTopic.SelectedIndex > 0)
                {
                    currentData = currentData.Where(p => p.Topic.ChapterId == ((ComboChapter.SelectedItem) as Chapter).Id
                    && p.TopicId == ((ComboTopic.SelectedItem) as Topic).Id).ToList();
                }
                else
                {
                    currentData = currentData.Where(p => p.Topic.ChapterId == ((ComboChapter.SelectedItem) as Chapter).Id).ToList();
                }
            }
            else
            {
                if (ComboTopic.SelectedIndex > 0)
                {
                    currentData = currentData.Where(p => p.TopicId == ((ComboTopic.SelectedItem) as Topic).Id).ToList();
                }
            }


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

            ICollectionView collectionView = CollectionViewSource.GetDefaultView(currentData);
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Topic.Chapter"));
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("Topic"));
            DataGridData.ItemsSource = collectionView;
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
            //  Manager.MainFrame.Navigate(new AddQuestionPage((sender as Button).DataContext as Question));


            try

            {
                Question question = (sender as Button).DataContext as Question;
                AddNewQuestionWindow window = new AddNewQuestionWindow(question);
                if (window.ShowDialog() == true)
                {

                    // MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadData();
                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                LoadData();
            }

        }

        private void ComboChapter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboChapter.SelectedIndex > 0)
            {
                Chapter chapter = ComboChapter.SelectedItem as Chapter;

                var topics = DiscretMathBDEntities.GetContext().Topics.Where(p => p.ChapterId == chapter.Id).OrderBy(p => p.IndexNumber).ToList();
                topics.Insert(0, new Topic
                {
                    Title = "Все темы " + chapter.Title
                }
                );
                ComboTopic.ItemsSource = topics;
                ComboTopic.SelectedIndex = 0;
            }
            else
            {
                var topics = DiscretMathBDEntities.GetContext().Topics.OrderBy(p => p.IndexNumber).ToList();
                topics.Insert(0, new Topic
                {
                    Title = "Все темы"
                }
                );
                ComboTopic.ItemsSource = topics;
                ComboTopic.SelectedIndex = 0;
            }
            UpdateData();
        }

        private void ComboTopic_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
    }
}