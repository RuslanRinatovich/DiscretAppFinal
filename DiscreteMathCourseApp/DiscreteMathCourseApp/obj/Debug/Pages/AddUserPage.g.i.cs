﻿#pragma checksum "..\..\..\Pages\AddUserPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "9D0037ED40B920004C7C0D392DA956D3E10611B9748C42BD31228943F96C5807"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using DiscreteMathCourseApp.Pages;
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


namespace DiscreteMathCourseApp.Pages {
    
    
    /// <summary>
    /// AddUserPage
    /// </summary>
    public partial class AddUserPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 25 "..\..\..\Pages\AddUserPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RowDefinition RowUserType;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\..\Pages\AddUserPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxUserName;
        
        #line default
        #line hidden
        
        
        #line 41 "..\..\..\Pages\AddUserPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ComboUserType;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\..\Pages\AddUserPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ComboGroup;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\..\Pages\AddUserPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox PasswordBoxPassword;
        
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
            System.Uri resourceLocater = new System.Uri("/DiscreteMathCourseApp;component/pages/adduserpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\AddUserPage.xaml"
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
            
            #line 17 "..\..\..\Pages\AddUserPage.xaml"
            ((DiscreteMathCourseApp.Pages.AddUserPage)(target)).IsVisibleChanged += new System.Windows.DependencyPropertyChangedEventHandler(this.Page_IsVisibleChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.RowUserType = ((System.Windows.Controls.RowDefinition)(target));
            return;
            case 3:
            this.TextBoxUserName = ((System.Windows.Controls.TextBox)(target));
            
            #line 36 "..\..\..\Pages\AddUserPage.xaml"
            this.TextBoxUserName.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TextBoxUserName_TextChanged);
            
            #line default
            #line hidden
            
            #line 36 "..\..\..\Pages\AddUserPage.xaml"
            this.TextBoxUserName.PreviewTextInput += new System.Windows.Input.TextCompositionEventHandler(this.TextBoxUserName_PreviewTextInput);
            
            #line default
            #line hidden
            return;
            case 4:
            this.ComboUserType = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 5:
            this.ComboGroup = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 6:
            this.PasswordBoxPassword = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            
            #line 57 "..\..\..\Pages\AddUserPage.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.BtnSaveClick);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

