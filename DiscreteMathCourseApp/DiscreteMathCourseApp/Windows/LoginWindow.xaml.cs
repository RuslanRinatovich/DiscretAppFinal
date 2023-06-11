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
using System.Windows.Shapes;

namespace DiscreteMathCourseApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        private void BtnOkClick(object sender, RoutedEventArgs e)
        {
            try
            {  //загрузка всех пользователей из БД в список
                List<User> users = MyMoodleBDEntities.GetContext().Users.ToList();
                //попытка найти пользователя с указанным паролем и логином
                //если такого пользователя не будет обнаружено то переменная u будет равна null
                User u = users.FirstOrDefault(p => p.Password == TbPass.Password && p.UserName == TbLogin.Text);

                if (u != null)
                {
                    // логин и пароль корректные запускаем главную форму приложения
                    MainWindow mainWindow = new MainWindow(u);
                    Manager.CurrentUser = u;
                    mainWindow.Owner = this;
                    this.Hide();
                    mainWindow.Show();
                    
                   // this.DialogResult = true;
                }
                else
                {
                    MessageBox.Show("Не верный логин или пароль");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
        //код кнопки Cancel
        private void BtnCancelClick(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult x = MessageBox.Show("Вы действительно хотите закрыть приложение?",
          "Выйти", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (x == MessageBoxResult.Cancel)
                e.Cancel = true;
        }

        private void BtnRegs_Click(object sender, RoutedEventArgs e)
        {
            RegsWindow regsWindow = new RegsWindow();
            regsWindow.ShowDialog();
        }
    }
}

