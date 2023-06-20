using DiscreteMathCourseApp.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
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
    /// Логика взаимодействия для AddMarkTaskWindow.xaml
    /// </summary>
    public partial class AddMarkTaskWindow : Window
    {
        public UserControlPoint currentItem { get; private set; }

        public Topic currentTopic { get; private set; }
        public ControlPoint currentControlPoint { get; private set; }
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Data/TopicContents/";


        string taskLink = "";
        string answerLink = "";
        public AddMarkTaskWindow(UserControlPoint userControlPoint)
        {
            InitializeComponent();
            if (userControlPoint.ControlPoint.TaskLink == null)
                BtnViewFile.Visibility = Visibility.Collapsed;
            else
                BtnViewFile.Visibility = Visibility.Visible;

            if (userControlPoint.AnswerLink == null)
                BtnViewAnswerFile.Visibility = Visibility.Collapsed;
            else
                BtnViewAnswerFile.Visibility = Visibility.Visible;

            if (userControlPoint.ControlPoint.TaskLink != null)
                taskLink = userControlPoint.ControlPoint.TaskLink;



            if (userControlPoint.ControlPoint.TaskTitle != null)
                TextBlockTaskTitle.Text = userControlPoint.ControlPoint.TaskTitle;

            if (userControlPoint == null)
                userControlPoint = new UserControlPoint();

            if (userControlPoint.AnswerLink != null)
                answerLink = userControlPoint.AnswerLink;

            if (userControlPoint.Answer != null)
                TextBlockAnswerTitle.Text = userControlPoint.Answer;

            currentItem = userControlPoint;
            DataContext = currentItem;
        }

      
        private void BtnViewAnswerFile_Click(object sender, RoutedEventArgs e)
        {


            if (answerLink != "" && answerLink != null)
            {
                string filename = Directory.GetCurrentDirectory() + @"\Data\TopicContents\" + currentItem.AnswerLink;
                Process.Start(filename);
                //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(filename);
                //documentViewerWindow.Owner = this;
                //documentViewerWindow.ShowDialog();
            }

        }
  
        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
               

              
                    currentItem.Result = (int)IntegerUpDownResult.Value;

               

                DiscretMathBDEntities.GetContext().SaveChanges();
                // MessageBox.Show("Данные сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                this.DialogResult = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnViewFile_Click(object sender, RoutedEventArgs e)
        {
            if (currentItem.ControlPoint.TaskLink != null)
            {
                string filename = Directory.GetCurrentDirectory() + @"\Data\TopicContents\" + currentItem.ControlPoint.TaskLink;
                Process.Start(filename);
                //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(filename);
                //documentViewerWindow.Owner = this;
                //documentViewerWindow.ShowDialog();
            }
        }
    }
}