using DiscreteMathCourseApp.Models;
using DiscreteMathCourseApp.Windows;
using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для TopicTypePage.xaml
    /// </summary>
    public partial class TopicTypePage : Page
    {
        List<TopicType> topicTypes;
        public TopicTypePage()
        {
            InitializeComponent();
        }


        void LoadData()
        {
            try
            {
                DtData.ItemsSource = null;
                //загрузка обновленных данных
                DiscretMathBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                topicTypes = DiscretMathBDEntities.GetContext().TopicTypes.OrderBy(p => p.Title).ToList();
                DtData.ItemsSource = topicTypes;
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                TopicTypeWindow window = new TopicTypeWindow(new TopicType());
                if (window.ShowDialog() == true)
                {
                    DiscretMathBDEntities.GetContext().TopicTypes.Add(window.currentItem);
                    DiscretMathBDEntities.GetContext().SaveChanges();
                    LoadData();
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                TopicType selected = (sender as Button).DataContext as TopicType;

                TopicTypeWindow window = new TopicTypeWindow(selected);


                if (window.ShowDialog() == true)
                {
                    if (window.currentItem != null)
                    {
                        DiscretMathBDEntities.GetContext().Entry(window.currentItem).State = EntityState.Modified;
                        DiscretMathBDEntities.GetContext().SaveChanges();
                        LoadData();
                        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
                else
                {
                    DiscretMathBDEntities.GetContext().Entry(window.currentItem).Reload();
                    LoadData();
                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Внимание", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {

             try
            {
                TopicType deletedItem = (sender as Button).DataContext as TopicType;

                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    
                    if (deletedItem.Topics.Count > 0)
                    {
                        throw new Exception("Ошибка удаления, есть связанные записи");
                    }
                    DiscretMathBDEntities.GetContext().TopicTypes.Remove(deletedItem);
                    DiscretMathBDEntities.GetContext().SaveChanges();
                    LoadData();
                    MessageBox.Show("Запись удалена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error",
                            MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                LoadData();
            }
        }
    }
}
