   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf .    (DiscreteMathCourseApp.Pages.StudentsPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:DiscreteMathCourseApp.Pages     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  >lvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf  -      MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �   N� Title$ Пользователи��.���  � RowDefinitions �� $
��auto ��� �� $��40 ��� $��50 �.+�� $��0��$��Stretch=�.+��� -    ��Name$ 
TBoxSearch��$	��275��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$; 5Введите логин, ФИО или группу���� -    ��Name$ ComboUserType��$	��275��$��14(�$��3q�$6 0Выберите тип пользователя��	 �� DisplayMemberPath$	 Title���� -   $ 	ComboSort��$	��275��$ Сортировать��$��10 0 0 0q�.@��� .���� 
 �� Orientation$
 
Horizontal=�.+��� $��ФИО��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ SortAscending=�$��5 0 0 0q��� .���� $
 
Horizontal=�.+��� $��ФИО��  $ SortDescending=�$��5 0 0 0q��� .���� $
 
Horizontal=�.+��� $��Группа��  $ SortAscending=�$��5 0 0 0q��� .���� $
 
Horizontal=�.+��� $��Группа��  $ SortDescending=�$��5 0 0 0q�&   System.Windows.Controls.DataGrid  -     Name$ DataGridData��$��1��   AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�����    Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ 
Логин��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
UserName+4	  .System.Windows.Controls.DataGridTemplateColumn	  $	 100 $ Изучено %�� 	  CellTemplate �� .R�
  LiveCharts.Wpf.Gauge
   
  Uses360Mode .  
  From$ 0Q�	 
  To$	 100Q� 
  HighFontSize$ 12X� 
  GaugeBackground �	#FFDDC9FF 
  	FromColor$ 	#FF673AB7�� 
  ToColor$ 	#FF673AB7�� 
  Value �� *GetProgress+y��� *GetVisibility+	  $	 100 $) #Материалов
изучено�� �� .R��� ���� *GetPassedTopicContentString+y��� *GetVisibility+	  $	 100 $' !Заданий
выполнено�� �� .R��� ���� *" GetPassedControlPointCountString+y��� *GetVisibility+	  $	 100 $# Тестов
пройдено�� �� .R��� ���� *GetTestPassCountString+y��� *GetVisibility+  $ Фамилия��$ *  �� *	Surname+  $ Имя��$ *  �� *Name+  $ Отчество��$ *  �� *
Patronymic+  $% Дата
регистрации��$ *  �� *
DateOfRegs+ �� StringFormat$ d�� �� ConverterCulture$ ru-RU��  $% Тип пользователя��$ *  �� *
Role.Title+  $ Группа��$ *  �� *StudentGroup.Title+	  $
 auto  �� .R���  ��Name$ BtnStatistic��-   $��Center=�  MaterialDesignFlatButton#��[   � ToolTip$  Статистика��$��40��y��� *GetVisibility+��0  *MaterialDesignThemes.Wpf.PackIconExtension  !   Kind$! 	ChartLine=�"   Size$" 24X�	  $
 auto  �� .R��� $ BtnEdit��-   $��Center=�#��[ $  Изменить��$��40����  $
! Edit=�$" 24X�	  $
 auto  �� .R��� $ 	BtnDelete��-   $��Center=�#��[ $  Удалить��$��40����  $! Delete=�$" 24X��� -	   $ BtnAdd��$��3��$��60��$��Right=�$��3 0 10 0q�#��[ ��  $! AddBold=�$" 24X��� -
   $ BtnExportExcel��$��Center=�$��3��#��[ $��Right=�$��	0 0 120 0q�$  Экспорт в Excel��$��60����  $! MicrosoftExcel=�$" 24X��� -   $ BtnExportResultsExcel��$��Center=�$��3��#��[ $��Right=�$��	0 0 200 0q�$  Успеваемость��$��60����  $! Numbers=�$" 24X��� -   $ 	BtnGroups��$��Center=�$��3��#��[ $��Right=�$��	0 0 280 0q�$  Группы��$��60����  $! PeopleGroup=�$" 24X��� -   # ��Name$# TextBlockCount��$��3��$	��300��$
��Left=�