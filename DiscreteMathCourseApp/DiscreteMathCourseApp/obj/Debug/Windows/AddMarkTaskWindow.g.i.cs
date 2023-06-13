﻿#pragma checksum "..\..\..\Windows\AddMarkTaskWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "D46ADECE24691388BA6B852C336ECD7DC47DA326"
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
    /// AddMarkTaskWindow
    /// </summary>
    public partial class AddMarkTaskWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 35 "..\..\..\Windows\AddMarkTaskWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnSave;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\Windows\AddMarkTaskWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnCancel;
        
        #line default
        #line hidden
        
        
        #line 44 "..\..\..\Windows\AddMarkTaskWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockTaskTitle;
        
        #line default
        #line hidden
        
        
        #line 48 "..\..\..\Windows\AddMarkTaskWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnViewFile;
        
        #line default
        #line hidden
        
        
        #line 50 "..\..\..\Windows\AddMarkTaskWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnViewAnswerFile;
        
        #line default
        #line hidden
        
        
        #line 55 "..\..\..\Windows\AddMarkTaskWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockAnswerTitle;
        
        #line default
        #line hidden
        
        
        #line 60 "..\..\..\Windows\AddMarkTaskWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal Xceed.Wpf.Toolkit.IntegerUpDown IntegerUpDownResult;
        
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
            System.Uri resourceLocater = new System.Uri("/DiscreteMathCourseApp;component/windows/addmarktaskwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Windows\AddMarkTaskWindow.xaml"
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
            
            #line 37 "..\..\..\Windows\AddMarkTaskWindow.xaml"
            this.BtnSave.Click += new System.Windows.RoutedEventHandler(this.BtnSave_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.BtnCancel = ((System.Windows.Controls.Button)(target));
            return;
            case 3:
            this.TextBlockTaskTitle = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.BtnViewFile = ((System.Windows.Controls.Button)(target));
            
            #line 49 "..\..\..\Windows\AddMarkTaskWindow.xaml"
            this.BtnViewFile.Click += new System.Windows.RoutedEventHandler(this.BtnViewFile_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.BtnViewAnswerFile = ((System.Windows.Controls.Button)(target));
            
            #line 51 "..\..\..\Windows\AddMarkTaskWindow.xaml"
            this.BtnViewAnswerFile.Click += new System.Windows.RoutedEventHandler(this.BtnViewAnswerFile_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.TextBlockAnswerTitle = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 7:
            this.IntegerUpDownResult = ((Xceed.Wpf.Toolkit.IntegerUpDown)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

