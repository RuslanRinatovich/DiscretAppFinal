using DiscreteMathCourseApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DiscreteMathCourseApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для RegsWindow.xaml
    /// </summary>
    public partial class RegsWindow : Window
    {
        public User _currentItem { get; private set; }
        List<User> users = new List<User>();
        bool isNew = false;
        bool badName = false;
        string msg = "Изменения сохранены";
        public RegsWindow()
        {
            InitializeComponent();
            LoadAndInitData();
        }


        void LoadAndInitData()
        {     // если передано null, то мы добавляем новый товар

            users = MyMoodleBDEntities.GetContext().Users.OrderBy(p => p.UserName).ToList();

            ComboGroup.ItemsSource = MyMoodleBDEntities.GetContext().StudentGroups.ToList();

           
                _currentItem = new User();
                isNew = true;
                msg = "Запись добавлена";
            

            DataContext = _currentItem;

        }

        /// <summary>
        /// Проверка полей ввод на корректыне данные
        /// </summary>
        /// <returns>текст StringBuilder содержащий ошибки, если они есть</returns>
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();



            if (string.IsNullOrWhiteSpace(_currentItem.UserName))
                s.AppendLine("Задайте имя пользователя");
            if (badName)
                s.AppendLine("Выберите другое имя пользователя");
            
            if (PasswordBoxPassword.Password == "")
                s.AppendLine("Задайте пароль");
            if (PasswordBoxPassword.Password != PasswordBoxSecondPassword.Password)
                s.AppendLine("Пароли разные");
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
            try
            {
                // добавление нового товара, 
                _currentItem.RoleId = 1;
                _currentItem.DateOfRegs = DateTime.Now;
                _currentItem.Password = PasswordBoxPassword.Password;
                MyMoodleBDEntities.GetContext().Users.Add(_currentItem);
                 MyMoodleBDEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                MessageBox.Show("Вы успешно зарегистрировались в системе", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                this.DialogResult = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

     

        private void TextBoxUserName_TextChanged(object sender, TextChangedEventArgs e)
        {
            string username = TextBoxUserName.Text.ToLower();
            User user = MyMoodleBDEntities.GetContext().Users.Where(p => p.UserName.ToLower() == username).FirstOrDefault();
            if (user == _currentItem)
                return;
            if (user != null)
            {
                TextBoxUserName.Foreground = new SolidColorBrush(Colors.Red);
                badName = true;
            }
            else
            {
                TextBoxUserName.Foreground = new SolidColorBrush(Colors.Green);
                badName = false;
            }
        }

        private void TextBoxUserName_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^a-zA-Z\s]");
            e.Handled = regex.IsMatch(e.Text);
        }
    }
}