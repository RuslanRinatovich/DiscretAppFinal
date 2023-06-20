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
    /// Логика взаимодействия для AddChapterPage.xaml
    /// </summary>
    public partial class AddChapterPage : Page
    {
        // текущий товар
        private Chapter _currentItem = new Chapter();
        int _currentIndex;
        List<Chapter> chapters = new List<Chapter>();
        public AddChapterPage(Chapter selected)
        {

            InitializeComponent();
            LoadAndInitData(selected);
        }

        void LoadAndInitData(Chapter selected)
        {     // если передано null, то мы добавляем новый товар
            
            chapters = DiscretMathBDEntities.GetContext().Chapters.OrderBy(p => p.IndexNumber).ToList();
            if (selected != null)
            {
                UpDownIndexNumber.Maximum = chapters.Count;
                _currentItem = selected;
                _currentIndex = _currentItem.IndexNumber;
            }
            else
            {
                UpDownIndexNumber.Maximum = chapters.Count + 1;
               
                _currentIndex = chapters.Count + 1;
                _currentItem.IndexNumber = _currentIndex;
            }
            // контекст данных текущий товар
            
            DataContext = _currentItem;



        }

        /// <summary>
        /// Проверка полей ввод на корректыне данные
        /// </summary>
        /// <returns>текст StringBuilder содержащий ошибки, если они есть</returns>
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            // проверка полей на содержимое
            if (string.IsNullOrWhiteSpace(_currentItem.Title))
                s.AppendLine("Поле название раздела пустое");
            if (string.IsNullOrWhiteSpace(_currentItem.Description))
                s.AppendLine("Поле информация пустое");

            return s;
        }

        private void BtnSaveClick(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            // проверка полей прошла успешно
            // если товар новый, то его ID == 0
            if (_currentItem.Id == 0)
            {
                // добавление нового товара, 
                // формируем новое название файла картинки,
                // так как в папке может быть файл с тем же именем
                if (_currentItem.IndexNumber != chapters.Count + 1)
                {
                    for (int i = _currentItem.IndexNumber - 1; i < chapters.Count; i++)
                    {
                        chapters[i].IndexNumber += 1;
                    }
                }

                DiscretMathBDEntities.GetContext().Chapters.Add(_currentItem);
            }
            else
            {
                if (_currentIndex < _currentItem.IndexNumber)
                    for (int i = _currentIndex; i < _currentItem.IndexNumber; i++)
                        chapters[i].IndexNumber -= 1;
                if (_currentIndex > _currentItem.IndexNumber)
                    for (int i = _currentItem.IndexNumber - 1; i < _currentIndex - 1; i++)
                        chapters[i].IndexNumber += 1;
            }
            try
            {
                

                DiscretMathBDEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                MessageBox.Show("Данные сохранены");
                Manager.MainFrame.GoBack();  // Возвращаемся на предыдущую форму
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }    // загрузка фото 
    
    }
}



