﻿#pragma checksum "..\..\..\Windows\AddNewQuestionWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7437E05E1A1E59F487700E9E903806597398DD13"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using DiscreteMathCourseApp.Windows;
using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace DiscreteMathCourseApp.Windows {
    
    
    /// <summary>
    /// AddNewQuestionWindow
    /// </summary>
    public partial class AddNewQuestionWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 31 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnSave;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image ImagePhoto;
        
        #line default
        #line hidden
        
        
        #line 43 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnLoad;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnDeleteImage;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnView;
        
        #line default
        #line hidden
        
        
        #line 62 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxTitle;
        
        #line default
        #line hidden
        
        
        #line 66 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxProductDescription;
        
        #line default
        #line hidden
        
        
        #line 72 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox ListBoxAnswers;
        
        #line default
        #line hidden
        
        
        #line 117 "..\..\..\Windows\AddNewQuestionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnAddAnswer;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/DiscreteMathCourseApp;component/windows/addnewquestionwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 19 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            ((DiscreteMathCourseApp.Windows.AddNewQuestionWindow)(target)).Closing += new System.ComponentModel.CancelEventHandler(this.Window_Closing);
            
            #line default
            #line hidden
            return;
            case 2:
            this.BtnSave = ((System.Windows.Controls.Button)(target));
            
            #line 33 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            this.BtnSave.Click += new System.Windows.RoutedEventHandler(this.BtnSave_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.ImagePhoto = ((System.Windows.Controls.Image)(target));
            return;
            case 4:
            this.BtnLoad = ((System.Windows.Controls.Button)(target));
            
            #line 46 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            this.BtnLoad.Click += new System.Windows.RoutedEventHandler(this.BtnLoad_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.BtnDeleteImage = ((System.Windows.Controls.Button)(target));
            
            #line 50 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            this.BtnDeleteImage.Click += new System.Windows.RoutedEventHandler(this.BtnDeleteImage_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.BtnView = ((System.Windows.Controls.Button)(target));
            
            #line 56 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            this.BtnView.Click += new System.Windows.RoutedEventHandler(this.BtnView_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.TextBoxTitle = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            this.TextBoxProductDescription = ((System.Windows.Controls.TextBox)(target));
            return;
            case 9:
            this.ListBoxAnswers = ((System.Windows.Controls.ListBox)(target));
            
            #line 75 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            this.ListBoxAnswers.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.ListBoxAnswers_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 12:
            this.BtnAddAnswer = ((System.Windows.Controls.Button)(target));
            
            #line 119 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            this.BtnAddAnswer.Click += new System.Windows.RoutedEventHandler(this.BtnAddAnswer_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 10:
            
            #line 104 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.BtnEditItem_Click);
            
            #line default
            #line hidden
            break;
            case 11:
            
            #line 108 "..\..\..\Windows\AddNewQuestionWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.BtnDeleteItem_Click);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}

