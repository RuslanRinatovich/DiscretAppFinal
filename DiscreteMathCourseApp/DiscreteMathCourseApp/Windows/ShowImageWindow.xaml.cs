﻿using System;
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
    /// Логика взаимодействия для ShowImageWindow.xaml
    /// </summary>
    public partial class ShowImageWindow : Window
    {
        public ShowImageWindow(ImageSource ImageName)
        {
            InitializeComponent();
            ImagePicture.Source = ImageName;
        }
    }
}
