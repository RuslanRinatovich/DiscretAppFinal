   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf 5      5    /DiscreteMathCourseApp.Pages.StudentProgressPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      >lvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf  5      -   5           MaterialDesignBody#���   5	      $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Темы��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $��40 �6   �� 5      $
��auto �6   .+�5   
   (  "MaterialDesignThemes.Wpf.ColorZone  $��5q�5         Mode$ Light=�5      .��5      � $��Stretch=�6    � ColumnDefinitions 5       �� 5!      $
��auto �6'   �� 5"      $
��auto �6'   �� 5#      $	��300 �6'   �� 5$      $��* �6'   �� 5%      $��* �6'    5'      �� 5)      $��40 �6%   �� 5*      $��40 �6%   �� 5+      $��40 �6%   .+�5-      �� -   5         ��Name$ BtnExcel��5-   6   $��0��6   $��2��6)   	 � ToolTip$*	 $Вывести данные в Excel��6_      MaterialDesignFlatDarkButton#���  6�   ��6�   0  *MaterialDesignThemes.Wpf.PackIconExtension  
   Kind$
 MicrosoftExcel=�6�   �� 5/      -   5        $ BtnTasks��5/   6   $��0��6   $��0��6)   $	 Задaния��6_   #���  6�   ��6q     $
 TaskAdd=�6�   �� 50      -   5        $ BtnTests��50   6   $��0��6   $��1��6)   $	 
Тесты��6_   #���  6�   ��6o     $
 FormatListChecks=�6�   �� 52      -   5         ��Name$ TextBlockMaterials��52      $��0��69   $��2��6F    $  MaterialDesignSubtitle1TextBlock#���  6V   $��10 0 q�53      $��Center=�54      �� 55      -   5        $ TextBlockTasks��55      $��1��65   $��2��6B   #���  6R   $��10 0 q�6�   $��Center=�6�   �� 56      -   5        $ TextBlockTests��56      $��2��65   $��2��6B   #���  6R   $��10 0 q�6�   $��Center=�6�   �� 58      -   5        $ TextBlockUserName��58      $��0��68   $��3��6E    $  MaterialDesignHeadline6TextBlock#���  6U   $��10 0 q�6�   $��Center=�6�   �� 59      -	   5        $ TextBlockGroup��59      $��1��65   $��3��6B   #���  6R   $��10 0 q�6�   $��Center=�6�     LiveCharts.Wpf.Gauge  5F      -
   5          Name$ GaugeTotalStats��5G   J   $��0��5F      $��1��6*   $��3��6:      Uses360Mode .    From$ 0Q�5G      	   To$	 100Q�6      Value$ 99Q�6&   $	��120��61   $	��120��6=   $��Right=�6c      GaugeActiveFill 5I      �� 5J      .��5K      �  � Color$ 	#FFDDC9FF��6+    � Offset$	 0.0Q�6=   � 5L      $ 	#FFC19EFF��6+   $	 0.5Q�6=   � 5M      $ 	#FF604395��6+   $	 1.0Q�6=   5N      5P      �� 5R      $��4��6   $��3��6-   $��Stretch=�6>   $��Right=�5S       �� Orientation$ Vertical=�60   .+�5V      �� -   5         ��Name$ 
TBoxSearch��5V   *   $	��275��6   $��0��6?   $��0��6L   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$> 8Введите название темы, раздела��6]   5W      �� 5X      -   5         ��Name$ ComboChapter��5X   +   $	��275��6   $��14(�6A   $��3q�6O   $��1��6[   $��0��6h   $# Выберите раздел��5Y       �� DisplayMemberPath$ Title��5Z   B   �� 5\      -   5        $ ComboTopicType��5\   +   $	��275��6   $��14(�6C   $��3q�6Q   $��2��6]   $��0��6j   $, &Выберите тип занятия��5]      $ Title��5^   B   �� 5a      -   5        $ 	ComboSort��5b      $	��275��5a      $ Сортировать��6+   $��3��6X   $��0��6e   $��3 0 0 0q�5b   .   .@�5d      �� .��5e      �� $ 
Horizontal=�6)   .+�5f   "   �� $��Название��6,   '  !MaterialDesignThemes.Wpf.PackIcon  5g   "      Kind$ SortAscending=�6:   $��5 0 0 0q�6O   5h      5i      �� 5j      .��5k      �� $ 
Horizontal=�6)   .+�5l   "   �� $��Название��6,     5m   "   $ SortDescending=�6:   $��5 0 0 0q�6P   5n      5o      5q      5s      5t      5u      &   System.Windows.Controls.DataGrid  5x   
   -   5          Name$ DataGridData��5x      $��1��6)      AutoGenerateColumns .     
IsReadOnly . $��Stretch=�5{   -      SelectionMode$ Single=�5|      ��5{      ��  � 	Resources 5~      )  #System.Windows.Controls.DataGridRow �� 
TargetType  �� Property! �� Value  WrapText 	 First 	 Align��%�  '        &	 U     &	 �     &	 T    �� 5�      "  6   .�5�      ��   � ��! 63   �� *
GetColor+5�      �� 5�      " ��6   .�5�      ��   � ��$
! Wrap=�65   �� 5�        �@��TextAlignment$! Justify=�66   5�      �� 5�      " ��6   .�5�      ��   � ��$
! Wrap=�65   �� 5�        �@��TextAlignment$
! Left=�66   5�      �� 5�      " ��6   .�5�      ��   �@��TextAlignment$! Center=�66   5�      5�      "   Columns" 5�      0	  *System.Windows.Controls.DataGridTextColumn	  5�      ,
  &System.Windows.Controls.DataGridColumn# 
  Header$	# №��6E   $ 
  Width5  /System.Windows.Controls.DataGridLengthConverter$$ 60 6P   1  +System.Windows.Controls.DataGridBoundColumn%   Binding% 6%   �� *IndexNumber+6P   	  5�      $# Название��6?   $$ * 6Q   &   ElementStyle#& [ 6[   % 6%   �� *Title+6[   	  5�      $%# Количество часов��6D   $
$ auto 6^   #& [ 6k   % 6%   �� *
TotalHours+6k   	  5�      $# Тип занятия��6I   $
$ auto 6^   % 6%   �� *TopicType.Title+6^   	  5�      $# Изучено��6A   $	$ 200 6R   #& [ 6^   % 6%   �� *	GetData+6^   4  .System.Windows.Controls.DataGridTemplateColumn  5�      $	$ 100 6)   $# Изучено %��65   '   CellTemplate' 5�      �� 5�      .R�5�         . $ 0Q�6?   $	 100Q�6H   (   HighFontSize$( 12X�5�      
���   �)   InnerRadius$) 20X�6:   *   GaugeBackground* �	#FFDDC9FF+   	FromColor$+ 	#FF673AB7��6g   ,   ToColor$, 	#FF673AB7��6}    5�   Q   �� *GetProgress+5�   }   5�      5�      - �� 
GroupStyle- 5�      (  "System.Windows.Controls.GroupStyle  5�      .   HeaderTemplate. 5�      �� 5�      .R�5�      �� .+�5�   "   �� $
��Bold"�6M   / �� Padding$/ 3q�6_   ��6,   �� 0 �� Path$0 Chapter�6_   5�      5�      1   ContainerStyle1 5�      �� 5�      " ��6    .�5�      ��   � ��! 5�   "   �� 5�   &   2 �� 
TargetType"2 ��66   .R�5�   *   � $��Stretch=�6/    5�   .   �� 5�   2   $
��auto �6@   �� 5�   2   $��* �6@   �� 5�   2   $
��auto �6@   .+�5�   .   �� $��5q�68   $��0��6C   $��2��6P   ���	#FF9A67EA6[   9� 5�   .   $��1��67   3 9� 
IsExpanded3 . ��5�   2   �� 5�   6   .+�5�   :   �� $ 
Horizontal=�6E   .+�5�   >   �� #��[ 6i   ��6H   �� $0 
Name.Title�6i   �� 5�   >   $��10 0 0 0q�6�    $	  MaterialDesignSubtitle2TextBlock#��� 	 6�   ��6H   �� $0 	ItemCount�4 �� StringFormat$4 
{0} тем��6�   5�   ;   �� 5�   :   #��� 	 5�   A   ��5�   D   �� $0 Name.GetTotalHours�5�   A   5�   7   .��5�   2   �� 5�   /   �� 5�   .   $��5q�68   $��2��6C   $��2��6P   ���	#FF9A67EA6[   5�   +   5�   '   5�      5�      5�      5�      �� 5�   
   -   5        $ TextBlockCount��5�   !   $��3��6   $	��300��69   $
��Left=�6F   �� 5�   
   -   5        5 ��Name$5 StatusBarStatistics��5�      $��2��61   .@�5�      �� .��5�      �� -   5        $��TextBoxStats��5�        
 MaterialDesignBody1TextBlock#��� 
 60   $��	 10 0 0 0q�6g   5�      5�      5�      5�      