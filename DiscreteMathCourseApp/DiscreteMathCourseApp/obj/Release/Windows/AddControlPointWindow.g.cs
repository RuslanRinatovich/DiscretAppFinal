﻿#pragma checksum "..\..\..\Windows\AddControlPointWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "D56739F36A837885E4E8B3EDD0E33CE55B5522363979DCD2D24BD1066BB74227"
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
using Xceed.Wpf.Toolkit;
using Xceed.Wpf.Toolkit.Chromes;
using Xceed.Wpf.Toolkit.Converters;
using Xceed.Wpf.Toolkit.Core;
using Xceed.Wpf.Toolkit.Core.Converters;
using Xceed.Wpf.Toolkit.Core.Input;
using Xceed.Wpf.Toolkit.Core.Media;
using Xceed.Wpf.Toolkit.Core.Utilities;
using Xceed.Wpf.Toolkit.Mag.Converters;
using Xceed.Wpf.Toolkit.Panels;
using Xceed.Wpf.Toolkit.Primitives;
using Xceed.Wpf.Toolkit.PropertyGrid;
using Xceed.Wpf.Toolkit.PropertyGrid.Attributes;
using Xceed.Wpf.Toolkit.PropertyGrid.Commands;
using Xceed.Wpf.Toolkit.PropertyGrid.Converters;
using Xceed.Wpf.Toolkit.PropertyGrid.Editors;
using Xceed.Wpf.Toolkit.Zoombox;


namespace DiscreteMathCourseApp.Windows {
    
    
    /// <summary>
    /// AddControlPointWindow
    /// </summary>
    public partial class AddControlPointWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 35 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnSave;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnCancel;
        
        #line default
        #line hidden
        
        
        #line 43 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBoxTaskLink;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxTaskTitle;
        
        #line default
        #line hidden
        
        
        #line 52 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnLoadTaskFile;
        
        #line default
        #line hidden
        
        
        #line 54 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnDeleteFile;
        
        #line default
        #line hidden
        
        
        #line 56 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnViewFile;
        
        #line default
        #line hidden
        
        
        #line 62 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnLoadAnswerFile;
        
        #line default
        #line hidden
        
        
        #line 64 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnDeleteAnswerFile;
        
        #line default
        #line hidden
        
        
        #line 66 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnViewAnswerFile;
        
        #line default
        #line hidden
        
        
        #line 70 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBoxAnswerLink;
        
        #line default
        #line hidden
        
        
        #line 72 "..\..\..\Windows\AddControlPointWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxAnswerTitle;
        
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
            System.Uri resourceLocater = new System.Uri("/DiscreteMathCourseApp;component/windows/addcontrolpointwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Windows\AddControlPointWindow.xaml"
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
            this.BtnSave = ((System.Windows.Controls.Button)(target));
            
            #line 37 "..\..\..\Windows\AddControlPointWindow.xaml"
            this.BtnSave.Click += new System.Windows.RoutedEventHandler(this.BtnSave_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.BtnCancel = ((System.Windows.Controls.Button)(target));
            return;
            case 3:
            this.TextBoxTaskLink = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.TextBoxTaskTitle = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.BtnLoadTaskFile = ((System.Windows.Controls.Button)(target));
            
            #line 53 "..\..\..\Windows\AddControlPointWindow.xaml"
            this.BtnLoadTaskFile.Click += new System.Windows.RoutedEventHandler(this.BtnLoadTaskFile_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.BtnDeleteFile = ((System.Windows.Controls.Button)(target));
            
            #line 55 "..\..\..\Windows\AddControlPointWindow.xaml"
            this.BtnDeleteFile.Click += new System.Windows.RoutedEventHandler(this.BtnDeleteFile_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.BtnViewFile = ((System.Windows.Controls.Button)(target));
            
            #line 57 "..\..\..\Windows\AddControlPointWindow.xaml"
            this.BtnViewFile.Click += new System.Windows.RoutedEventHandler(this.BtnViewFile_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.BtnLoadAnswerFile = ((System.Windows.Controls.Button)(target));
            
            #line 63 "..\..\..\Windows\AddControlPointWindow.xaml"
            this.BtnLoadAnswerFile.Click += new System.Windows.RoutedEventHandler(this.BtnLoadAnswerFile_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.BtnDeleteAnswerFile = ((System.Windows.Controls.Button)(target));
            
            #line 65 "..\..\..\Windows\AddControlPointWindow.xaml"
            this.BtnDeleteAnswerFile.Click += new System.Windows.RoutedEventHandler(this.BtnDeleteAnswerFile_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.BtnViewAnswerFile = ((System.Windows.Controls.Button)(target));
            
            #line 67 "..\..\..\Windows\AddControlPointWindow.xaml"
            this.BtnViewAnswerFile.Click += new System.Windows.RoutedEventHandler(this.BtnViewAnswerFile_Click);
            
            #line default
            #line hidden
            return;
            case 11:
            this.TextBoxAnswerLink = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 12:
            this.TextBoxAnswerTitle = ((System.Windows.Controls.TextBox)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

