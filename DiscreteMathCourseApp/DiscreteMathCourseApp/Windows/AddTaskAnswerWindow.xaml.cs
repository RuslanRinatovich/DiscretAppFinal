using DiscreteMathCourseApp.Models;
using Microsoft.Win32;
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
    /// Логика взаимодействия для AddTaskAnswerWindow.xaml
    /// </summary>
    public partial class AddTaskAnswerWindow : Window
    {
        public UserControlPoint currentItem { get; private set; }
       
        OpenFileDialog answerLink = null;
        bool isNew = false;
        public Topic currentTopic { get; private set; }
        public ControlPoint currentControlPoint { get; private set; }
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Data/TopicContents/";


        string taskLink = "";
        string deleteAnswerLink = "";
        public AddTaskAnswerWindow(UserControlPoint userControlPoint, Topic topic, ControlPoint controlPoint)
        {
            InitializeComponent();
            
            currentControlPoint = controlPoint;
            if (controlPoint.TaskLink != null)
                taskLink = controlPoint.TaskLink;
            if (controlPoint.TaskTitle != null)
                TextBlockTaskTitle.Text = controlPoint.TaskTitle;

            if (userControlPoint == null)
                userControlPoint = new UserControlPoint();

            if (userControlPoint.Result != null)
            {
                TextBlockResult.Text = $"Оценка {userControlPoint.Result}";

            }
            else
            {
                TextBlockResult.Text = $"на проверке";
            }
            BtnViewFile.Visibility = Visibility.Collapsed;

            if (currentControlPoint.TaskLink != null)
                BtnViewFile.Visibility = Visibility.Visible;

            isNew = (userControlPoint.Id == 0);
            currentItem = userControlPoint;
            currentTopic = topic;
            DataContext = currentItem;
        }

        private void BtnLoadAnswerFile_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                //Диалог открытия файла
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Select a picture";
                op.Filter = "PDF-файлы (*.pdf)|*.pdf";
                // диалог вернет true, если файл был открыт
                if (op.ShowDialog() == true)
                {
                    //string _fileName = op.SafeFileName;
                    //string _filePath = op.FileName;
                    answerLink = op;
                    TextBlockAnswerLink.Text = op.SafeFileName;
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        string ChangeFileName(string name)
        {
            string x = _currentDirectory + name;
            string filename = name;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + filename;
                }
                filename = i.ToString() + filename;
            }
            return filename;

        }
        private void BtnDeleteAnswerFile_Click(object sender, RoutedEventArgs e)
        {
            if (currentItem.AnswerLink != null)
                deleteAnswerLink = currentItem.AnswerLink.ToString();
            answerLink = null;
            TextBlockAnswerLink.Text = "";
            currentItem.AnswerLink = null;
        }

        private void BtnViewAnswerFile_Click(object sender, RoutedEventArgs e)
        {
            if (isNew)
            {
                if (answerLink != null)
                {
                    Process.Start(answerLink.FileName);
                    //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(answerLink.FileName);
                    //documentViewerWindow.Owner = this;
                    //documentViewerWindow.ShowDialog();
                }
            }
            else
            {

                if (answerLink != null)
                {
                    Process.Start(answerLink.FileName);
                    //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(answerLink.FileName);
                    //documentViewerWindow.Owner = this;
                    //documentViewerWindow.ShowDialog();
                }
                if (currentItem.AnswerLink != null)
                {

                    string filename = Directory.GetCurrentDirectory() + @"\Data\TopicContents\" + currentItem.AnswerLink;
                    Process.Start(filename);
                    //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(filename);
                    //documentViewerWindow.Owner = this;
                    //documentViewerWindow.ShowDialog();
                }
            }

        }
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();


            if (string.IsNullOrWhiteSpace(TextBlockAnswerLink.Text) && string.IsNullOrWhiteSpace(currentItem.Answer))
                s.AppendLine("Задайте содержимое ответа");

            return s;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            try
            {
                if (isNew)
                {
                    UserControlPoint userControlPoint = new UserControlPoint();

                   

                    if (answerLink != null)
                    {
                        string answerFile = ChangeFileName(answerLink.SafeFileName);
                        // путь куда нужно скопировать файл
                        string destFile = _currentDirectory + answerFile;
                        File.Copy(answerLink.FileName, destFile);
                        userControlPoint.AnswerLink = answerFile;
                    }
                // формируем новое название файла картинки,
                // так как в папке может быть файл с тем же именем
                userControlPoint.ControlPointId = currentControlPoint.Id;
                    userControlPoint.UserName =Manager.CurrentUser.UserName;
                    userControlPoint.Answer = TextBoxAnswerTitle.Text;
                    DiscretMathBDEntities.GetContext().UserControlPoints.Add(userControlPoint);
                }
                else
                {
                 

                    if (answerLink != null)
                    {
                        string answerFile = ChangeFileName(answerLink.SafeFileName);
                        // путь куда нужно скопировать файл
                        string destFile = _currentDirectory + answerFile;
                        File.Copy(answerLink.FileName, destFile);
                        currentItem.AnswerLink = answerFile;
                    }
                    else
                    {
                        if (File.Exists(_currentDirectory + deleteAnswerLink))
                        {
                            File.Delete(_currentDirectory + deleteAnswerLink);
                        }
                    }

                  //  currentItem.UserName = Manager.CurrentUser.UserName;
                    currentItem.Answer = TextBoxAnswerTitle.Text;

                }

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
            if (currentControlPoint.TaskLink != null)
            {
                string filename = Directory.GetCurrentDirectory() + @"\Data\TopicContents\" + currentControlPoint.TaskLink;
                Process.Start(filename);
                //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(filename);
                //documentViewerWindow.Owner = this;
                //documentViewerWindow.ShowDialog();
            }
        }
    }
}

