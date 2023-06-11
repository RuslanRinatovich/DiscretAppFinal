using DiscreteMathCourseApp.Models;
using DiscreteMathCourseApp.Pages;
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

using Word = Microsoft.Office.Interop.Word;

namespace DiscreteMathCourseApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        bool _login = false;
        int _itemcount = 0;


        public MainWindow(User user)
        {
            InitializeComponent();
            Manager.MainFrame = MainFrame;

            if (user.RoleId == 1)
            {
                MainFrame.Navigate(new UsersLearningCoursePage(user));
            }
            else
            {
                MainFrame.Navigate(new TopicPage());
            }
            TbUserInfo.Text = user.GetFio;
        }




        private void BtnCloseClick(object sender, RoutedEventArgs e)
        {
            Close();
         
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            // на экране отображается форма с двумя кнопками
            MessageBoxResult x = MessageBox.Show("Вы действительно хотите выйти из системы?",
            "Выйти", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (x == MessageBoxResult.Cancel)
                e.Cancel = true;
        }


        private void MainFrameContentRendered(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
               
                BtnBack.Visibility = Visibility.Visible;
                //вошли как пользователь
             //   BtnTopicPage.Visibility = Visibility.Collapsed;
                BtnQuestionPage.Visibility = Visibility.Collapsed;
                BtnUserPage.Visibility = Visibility.Collapsed;
                BtnMyAccount.Visibility = Visibility.Collapsed;
                // BtnUserLearningPage.Visibility = Visibility.Collapsed;


            }
            else
            {
                if (Manager.CurrentUser.RoleId == 1)
                {
                  //  BtnTopicPage.Visibility = Visibility.Collapsed;
                    BtnQuestionPage.Visibility = Visibility.Collapsed;
                    BtnUserPage.Visibility = Visibility.Collapsed;
                    BtnMyAccount.Visibility = Visibility.Visible;
                    // BtnUserLearningPage.Visibility = Visibility.Visible;
                }
                else
                {
                   // BtnTopicPage.Visibility = Visibility.Visible;
                    BtnQuestionPage.Visibility = Visibility.Visible;
                    BtnUserPage.Visibility = Visibility.Visible;
                    BtnMyAccount.Visibility = Visibility.Collapsed;
                    // BtnUserLearningPage.Visibility = Visibility.Collapsed;
                }

                BtnBack.Visibility = Visibility.Collapsed;
                    
            }
        }

 

        private void BtnMaximizeMin_Click(object sender, RoutedEventArgs e)
        {
            if (this.WindowState == WindowState.Normal)
            {
                this.WindowState = WindowState.Maximized;
                IconMaximize.Kind = MaterialDesignThemes.Wpf.PackIconKind.WindowRestore;
            }

            else
            {
                this.WindowState = WindowState.Normal;
                IconMaximize.Kind = MaterialDesignThemes.Wpf.PackIconKind.WindowMaximize;
            }

        }



        private void BtnMinimize_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }



        private void TextBlock_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
                this.DragMove();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
           

            Manager.MainFrame.GoBack();

        }

      

     
        private void BtnChapters_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ChapterPage());
        }

        private void BtnTopicType_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new TopicTypePage());
        }

        private void BtnTopicPage_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new TopicPage());
        }

        private void BtnUserPage_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new StudentsPage());
        }

        private void BtnQuestionPage_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new QuestionsPage());
        }

        private void BtnTestPage_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new TestsPage());
        }

        private void BtnUserLearningPage_Click(object sender, RoutedEventArgs e)
        {
           // MainFrame.Navigate(new UsersLearningCoursePage(user));
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            Owner.Show();
        }

        private void BtnMyAccount_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddUserPage(Manager.CurrentUser));
        }
    }
}
