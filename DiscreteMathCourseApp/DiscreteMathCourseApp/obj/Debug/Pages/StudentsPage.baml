   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf 5      .    (DiscreteMathCourseApp.Pages.StudentsPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      >lvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf  5      -   5           MaterialDesignBody#���   5      $��Regular"�5	   	   $��14(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Пользователи��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $��40 �6   �� 5      $��50 �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$; 5Введите логин, ФИО или группу��68   5      �� 5!      -   5         ��Name$ ComboUserType��5!   #   $	��275��6   $��14(�6:   $��3q�6H   $6 0Выберите тип пользователя��5"      	 �� DisplayMemberPath$	 Title��5#      6/   �� 5&      -   5        $ 	ComboSort��5'      $	��275��5&      $ Сортировать��6#   $��10 0 0 0q�5(   H   .@�5)      �� .��5*      �� 
 �� Orientation$
 
Horizontal=�6!   .+�5+      �� $��ФИО��6$   '  !MaterialDesignThemes.Wpf.PackIcon  5,         Kind$ SortAscending=�62   $��5 0 0 0q�6G   5-      5.      �� 5/      .��50      �� $
 
Horizontal=�6!   .+�51      �� $��ФИО��6$     52      $ SortDescending=�62   $��5 0 0 0q�6H   53      54      �� 55      .��56      �� $
 
Horizontal=�6!   .+�57      �� $��Группа��6$     58      $ SortAscending=�62   $��5 0 0 0q�6G   59      5:      �� 5;      .��5<      �� $
 
Horizontal=�6!   .+�5=      �� $��Группа��6$     5>      $ SortDescending=�62   $��5 0 0 0q�6H   5?      5@      5A      5C      &   System.Windows.Controls.DataGrid  5E   
   -   5          Name$ DataGridData��5E      $��1��6)      AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�5I      ��5H      ��    Columns 5K      0  *System.Windows.Controls.DataGridTextColumn  5M      ,  &System.Windows.Controls.DataGridColumn   Header$ 
Логин��6B      Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6Q   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *
UserName+6Q   4	  .System.Windows.Controls.DataGridTemplateColumn	  5N      $	 100 6)   $ Изучено %��65    	  CellTemplate 5O      �� 5P      .R�5Q      
  LiveCharts.Wpf.Gauge
   
  Uses360Mode .  
  From$ 0Q�6?   	 
  To$	 100Q�6H    
  HighFontSize$ 12X�5R       
  GaugeBackground �	#FFDDC9FF 
  	FromColor$ 	#FF673AB7��6C    
  ToColor$ 	#FF673AB7��6Y    
  Value 5Q   Q   �� *GetProgress+y�6o   �� *GetVisibility+5R   Y   5T      5V      	  5Y      $	 100 6)   $) #Материалов
изучено��65    5Z      �� 5[      .R�5\      �� ��6(   �� *GetPassedTopicContentString+y�6U   �� *GetVisibility+5^      5`      	  5b      $	 100 6)   $' !Заданий
выполнено��65    5c      �� 5d      .R�5e      �� ��6(   �� *" GetPassedControlPointCountString+y�6Z   �� *GetVisibility+5g      5i      	  5j      $	 100 6)   $# Тестов
пройдено��65    5k      �� 5l      .R�5m      �� ��6(   �� *GetTestPassCountString+y�6P   �� *GetVisibility+5o      5q        5s      $ Фамилия��6A   $ * 6R    6%   �� *	Surname+6R     5t      $ Имя��6>   $ * 6K    6%   �� *Name+6K     5u      $ Отчество��6D   $ * 6V    6%   �� *
Patronymic+6V     5v      $% Дата
регистрации��6p   $ * 6�    6%   �� *
DateOfRegs+ �� StringFormat$ d�� �� ConverterCulture$ ru-RU��6�     5w      $% Тип пользователя��6D   $ * 6^    6%   �� *
Role.Title+6^     5x      $ Группа��6L   $ * 6\    6%   �� *StudentGroup.Title+6\   	  5�      $
 auto 6)    5�      �� 5�      .R�5�      ��  ��Name$ BtnStatistic��6@   -   5        $��Center=�5�   %     MaterialDesignFlatButton#��[ 6W     � ToolTip$  Статистика��5�   _   $��40��6u   y�5�   �   �� *GetVisibility+��5�   !   0  *MaterialDesignThemes.Wpf.PackIconExtension  !   Kind$! 	ChartLine=�"   Size$" 24X�6�   5�      5�      	  5�      $
 auto 6)    5�      �� 5�      .R�5�      �� $ BtnEdit��6@   -   5        $��Center=�5�   %   #��[ 6R   $  Изменить��5�   Z   $��40��6n   ��6!     $
! Edit=�$" 24X�6z   5�      5�      	  5�      $
 auto 6)    5�      �� 5�      .R�5�      �� $ 	BtnDelete��6@   -   5        $��Center=�5�   %   #��[ 6T   $  Удалить��5�   \   $��40��6o   ��6!     $! Delete=�$" 24X�6{   5�      5�      5�      �� 5�   
   -	   5        $ BtnAdd��5�      $��3��6!   $��60��6.   $��Right=�69   $��3 0 10 0q�6U   #��[ 5�   _   ��6     $! AddBold=�$" 24X�6_   �� 5�   
   -
   5        $ BtnExportExcel��5�   ,   $��Center=�6   $��3��6E   #��[ 5�   b   $��Right=�5�      $��	0 0 120 0q�6-   $  Экспорт в Excel��6@   $��60��6Z   ��5�   !     $! MicrosoftExcel=�$" 24X�5�      �� 5�   
   -   5        $ BtnExportResultsExcel��5�   ,   $��Center=�6   $��3��6L   #��[ 6Y   $��Right=�5�      $��	0 0 200 0q�6-   $  Успеваемость��6@   $��60��6W   ��5�   !     $! Numbers=�$" 24X�5�      �� 5�   
   -   5        $ 	BtnGroups��5�   ,   $��Center=�6   $��3��6@   #��[ 6N   $��Right=�5�      $��	0 0 280 0q�6-   $  Группы��6@   $��60��6Q   ��5�   !     $! PeopleGroup=�$" 24X�5�      �� 5�   
   -   5        # ��Name$# TextBlockCount��5�   !   $��3��6   $	��300��69   $
��Left=�6F   5�      5�      