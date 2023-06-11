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
    /// Логика взаимодействия для AddAnswerWindow.xaml
    /// </summary>
    public partial class AddAnswerWindow : Window
    {
        public Answer currentItem { get; private set; }


        public AddAnswerWindow(Answer p)
        {
            InitializeComponent();
            currentItem = p;
            DataContext = currentItem;
        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();

            if (TbTitle.Text == "")
                s.AppendLine("Укажите ответ");

            return s;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            currentItem.IsRight = false;
            currentItem.Title = TbTitle.Text;
            this.DialogResult = true;
        }


    }
}

