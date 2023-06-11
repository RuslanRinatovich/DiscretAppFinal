using System;
using System.Collections.Generic;
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
using System.Diagnostics;
using System.Windows.Xps.Packaging;

//////////////



namespace DiscreteMathCourseApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для DocumentViewerWindow.xaml
    /// </summary>
    public partial class DocumentViewerWindow : Window
    {
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Data/TopicContents/";
        public DocumentViewerWindow(string filename)
        {
            InitializeComponent();
            //Process.Start(_currentDirectory + filename);

            WebBrowserDocs.Navigate(new System.Uri(filename));
            
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            WebBrowserDocs.Dispose();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            WebBrowserDocs.Navigate("about:blank");
        }
    }
}
