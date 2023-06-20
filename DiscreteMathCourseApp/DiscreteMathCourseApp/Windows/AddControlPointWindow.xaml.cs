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
    /// Логика взаимодействия для AddControlPointWindow.xaml
    /// </summary>
    public partial class AddControlPointWindow : Window
    {
        public ControlPoint currentItem { get; private set; }
        OpenFileDialog taskLink = null;
        OpenFileDialog answerLink = null;
        bool isNew = false;
        public Topic currentTopic { get; private set; }
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Data/TopicContents/";

        string deleteTaskLink = "";
        string deleteAnswerLink = "";
        public AddControlPointWindow(ControlPoint controlPoint, Topic topic)
        {
            InitializeComponent();
            currentItem = controlPoint;
            isNew = (controlPoint.Id == 0);

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
                    TextBoxAnswerLink.Text = op.SafeFileName;
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
            TextBoxAnswerLink.Text = "";
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

            if (string.IsNullOrWhiteSpace(TextBoxTaskLink.Text) && string.IsNullOrWhiteSpace(currentItem.TaskTitle))
                s.AppendLine("Задайте содержимое задания");

            if (string.IsNullOrWhiteSpace(TextBoxAnswerLink.Text) && string.IsNullOrWhiteSpace(currentItem.AnswerTitle))
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
                    ControlPoint controlPoint = new ControlPoint();

                    if (taskLink != null)
                    {
                        string taskFile = ChangeFileName(taskLink.SafeFileName);
                        // путь куда нужно скопировать файл
                        string destFile = _currentDirectory + taskFile;
                        File.Copy(taskLink.FileName, destFile);
                        controlPoint.TaskLink = taskFile;
                    }

                    if (answerLink != null)
                    {
                        string answerFile = ChangeFileName(answerLink.SafeFileName);
                        // путь куда нужно скопировать файл
                        string destFile = _currentDirectory + answerFile;
                        File.Copy(answerLink.FileName, destFile);
                        controlPoint.AnswerLink = answerFile;
                    }
                    // формируем новое название файла картинки,
                    // так как в папке может быть файл с тем же именем


                    int maxind = 0;
                    List<ControlPoint> controlPoints = DiscretMathBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == currentTopic.Id).ToList();
                    if (controlPoints.Count > 0)
                        maxind = DiscretMathBDEntities.GetContext().ControlPoints.Where(p => p.TopicId == currentTopic.Id).Max(p => p.IndexNumber);

                    controlPoint.IndexNumber = Convert.ToInt32(maxind) + 1;
                    controlPoint.TopicId = currentTopic.Id;
                    controlPoint.TaskTitle = TextBoxTaskTitle.Text;
                    controlPoint.AnswerTitle = TextBoxAnswerTitle.Text;
                    DiscretMathBDEntities.GetContext().ControlPoints.Add(controlPoint);
                }
                else
                {
                    if (taskLink != null)
                    {
                        string taskFile = ChangeFileName(taskLink.SafeFileName);
                        // путь куда нужно скопировать файл
                        string destFile = _currentDirectory + taskFile;
                        File.Copy(taskLink.FileName, destFile);
                        currentItem.TaskLink = taskFile;
                    }
                    else
                    {

                        if (File.Exists(_currentDirectory + deleteTaskLink))
                        {
                            File.Delete(_currentDirectory + deleteTaskLink);
                        }
                    }

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


                    currentItem.TopicId = currentTopic.Id;
                    currentItem.TaskTitle = TextBoxTaskTitle.Text;
                    currentItem.AnswerTitle = TextBoxAnswerTitle.Text;

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

        private void BtnLoadTaskFile_Click(object sender, RoutedEventArgs e)
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
                    taskLink = op;
                    TextBoxTaskLink.Text = op.SafeFileName;
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnDeleteFile_Click(object sender, RoutedEventArgs e)
        {
            if (currentItem.TaskLink != null)
                deleteTaskLink = currentItem.TaskLink.ToString();
            taskLink = null;
            TextBoxTaskLink.Text = "";
            currentItem.TaskLink = null;
        }

        private void BtnViewFile_Click(object sender, RoutedEventArgs e)
        {
            if (isNew)
            {
               
                if (taskLink != null)
                {

                    //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(taskLink.FileName);
                    //documentViewerWindow.Owner = this;
                    //documentViewerWindow.ShowDialog();
                    Process.Start(taskLink.FileName);
                }
            }
            else
            {
                if (taskLink != null)
                {
                    //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(taskLink.FileName);
                    //documentViewerWindow.Owner = this;
                    //documentViewerWindow.ShowDialog();
                    Process.Start(taskLink.FileName);
                }

                if (currentItem.TaskLink != null)
                {

                    string filename = Directory.GetCurrentDirectory() + @"\Data\TopicContents\" + currentItem.TaskLink;
                    Process.Start(filename);
                    //DocumentViewerWindow documentViewerWindow = new DocumentViewerWindow(filename);
                    //documentViewerWindow.Owner = this;
                    //documentViewerWindow.ShowDialog();
                }
               

            }

        }

        
    }
}
