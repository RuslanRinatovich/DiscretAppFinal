   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf 5      9    3DiscreteMathCourseApp.Pages.UsersLearningCoursePage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      >lvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf  5      -   5           MaterialDesignBody#���   5      $��Regular"�5	   	   $��14(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Темы��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      �� 5      $��40 �6   �� 5      $
��auto �6   .+�5   
   �  � ColumnDefinitions 5      �� 5      $
��auto �6#   �� 5       $	��300 �6#   �� 5!      $��* �6#   �� 5"      $��* �6#    5$      �� 5&      $��40 �6!   �� 5'      $��40 �6!   �� 5(      $��40 �6!   .+�5,      �� -   5         ��Name$ TextBlockMaterials��5,      $��0��65   $��1��6B    $  MaterialDesignSubtitle1TextBlock#���  6R   $��10 0 q�5-      $��Center=�5.      �� 5/      -   5        $ TextBlockTasks��5/      $��1��61   $��1��6>   #���  6N   $��10 0 q�6�   $��Center=�6�   �� 50      -   5        $ TextBlockTests��50      $��2��61   $��1��6>   #���  6N   $��10 0 q�6�   $��Center=�6�   �� 52      -   5        $ TextBlockUserName��52      $��0��64   $��2��6A    $  MaterialDesignHeadline6TextBlock#���  6Q   $��10 0 q�6�   $��Center=�6�   �� 53      -   5        $ TextBlockGroup��53      $��1��61   $��2��6>   #���  6N   $��10 0 q�6�   $��Center=�6�   �� 55      $��3��6   $��Stretch=�6*   $��3��6F   $��Right=�56      .+�59      �� -   5         ��Name$ 
TBoxSearch��59   &   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$>	 8Введите название темы, раздела��6<   5:      �� 5;      -   5        
 ��Name$
 ComboChapter��5;   '   $	��275��6   $��14(�6=   $��3q�6K   $#	 Выберите раздел��5<       �� DisplayMemberPath$ Title��5=   B   �� 5?      -	   5        $
 ComboTopicType��5?   '   $	��275��6   $��14(�6?   $��3q�6M   $,	 &Выберите тип занятия��5@      $ Title��5A   B   �� 5D      -
   5        $
 	ComboSort��5E      $	��275��5D      $	 Сортировать��6'   $��3 0 0 0q�5F   H   .@�5G      �� .��5H      ��  �� Orientation$ 
Horizontal=�6%   .+�5I      �� $��Название��6(   '  !MaterialDesignThemes.Wpf.PackIcon  5J         Kind$ SortAscending=�66   $��5 0 0 0q�6K   5K      5L      �� 5M      .��5N      �� $ 
Horizontal=�6%   .+�5O      �� $��Название��6(     5P      $ SortDescending=�66   $��5 0 0 0q�6L   5Q      5R      5T      5V        LiveCharts.Wpf.Gauge  5W      -   5          Name$ GaugeTotalStats��5X   J   $��0��5W         Uses360Mode . $��3��6=      From$ 0Q�5X      	   To$	 100Q�6      Value$ 99Q�6&   $	��120��61   $	��120��6=   $
��Left=�6c      GaugeActiveFill 5Z      �� 5[      .��5\      �  � Color$ 	#FFDDC9FF��6'    � Offset$	 0.0Q�69   � 5]      $ 	#FFC19EFF��6'   $	 0.5Q�69   � 5^      $ 	#FF604395��6'   $	 1.0Q�69   5_      5a      5t      &   System.Windows.Controls.DataGrid  5y   
   -   5          Name$ DataGridData��5y      $��2��6)      AutoGenerateColumns .     
IsReadOnly . $��Stretch=�5|   -      SelectionMode$ Single=�5}      ��5|      ��  � 	Resources 5      )  #System.Windows.Controls.DataGridRow �� 
TargetType �� Property �� Value  WrapText 	 First 	 Align��%�  '        &	 U     &	 �     &	 T    �� 5�      "  6   .�5�      ��  � �� 63   �� *
GetColor+5�      �� 5�      " ��6   .�5�      ��  � ��$
 Wrap=�65   �� 5�       �@��TextAlignment$ Justify=�66   5�      �� 5�      " ��6   .�5�      ��  � ��$
 Wrap=�65   �� 5�       �@��TextAlignment$
 Left=�66   5�      �� 5�      " ��6   .�5�      ��  �@��TextAlignment$ Center=�66   5�      5�         Columns 5�      0  *System.Windows.Controls.DataGridTextColumn  5�      ,  &System.Windows.Controls.DataGridColumn   Header$	 №��6E       Width5	  /System.Windows.Controls.DataGridLengthConverter$  60	 6P   1
  +System.Windows.Controls.DataGridBoundColumn! 
  Binding! 6%   �� *IndexNumber+6P     5�      $ Название��6?   $  *	 6Q   " 
  ElementStyle#" [ 6[   ! 6%   �� *Title+6[     5�      $% Количество часов��6D   $
  auto	 6^   #" [ 6k   ! 6%   �� *
TotalHours+6k     5�      $ Тип занятия��6I   $
  auto	 6^   ! 6%   �� *TopicType.Title+6^     5�      $ Изучено��6A   $	  200	 6R   #" [ 6^   ! 6%   �� *	GetData+6^   4  .System.Windows.Controls.DataGridTemplateColumn  5�      $	  100	 6)   $ Изучено %��65   #   CellTemplate# 5�      �� 5�      .R�5�         . $ 0Q�6?   $	 100Q�6H   $   HighFontSize$$ 12X�5�      
���   �%   InnerRadius$% 20X�6:   &   GaugeBackground& �	#FFDDC9FF'   	FromColor$' 	#FF673AB7��6g   (   ToColor$( 	#FF673AB7��6}    5�   Q   �� *GetProgress+5�   }   5�      5�        5�      $
  auto	 6)   # 5�      �� 5�      .R�5�      �� ) ��Name$) BtnEye��6@   -   5        $��Center=�5�   %     MaterialDesignFlatButton#��[ 6Q   * � ToolTip$* Просмотр��5�   Y   $��40��6m   ��6!   0  *MaterialDesignThemes.Wpf.PackIconExtension  +   Kind$	+ Eye=�,   Size$, 20X�6y   5�      5�      - �� 
GroupStyle- 5�      (  "System.Windows.Controls.GroupStyle  5�      .   HeaderTemplate. 5�      �� 5�      .R�5�      �� .+�5�   "   �� $
��Bold"�6M   / �� Padding$/ 3q�6_   ��6,   �� 0 �� Path$0 Chapter�6_   5�      5�      1   ContainerStyle1 5�      �� 5�      " ��6    .�5�      ��  � �� 5�   "   �� 5�   &   2 �� 
TargetType"2 ��66   .R�5�   *   � $��Stretch=�6/    5�   .   �� 5�   2   $
��auto �6@   �� 5�   2   $��* �6@   �� 5�   2   $
��auto �6@   .+�5�   .   �� $��5q�68   $��0��6C   $��2��6P   ���	#FF9A67EA6[   9� 5�   .   $��1��67   3 9� 
IsExpanded3 . ��5�   2   �� 5�   6   .+�5�   :   �� $ 
Horizontal=�6E   .+�5�   >   �� #��[ 6i   ��6H   �� $0 
Name.Title�6i   �� 5�   >   $��10 0 0 0q�6�    $	  MaterialDesignSubtitle2TextBlock#��� 	 6�   ��6H   �� $0 	ItemCount�4 �� StringFormat$4 
{0} тем��6�   5�   ;   �� 5�   :   #��� 	 5�   A   ��5�   D   �� $0 Name.GetTotalHours�5�   A   5�   7   .��5�   2   �� 5�   /   �� 5�   .   $��5q�68   $��2��6C   $��2��6P   ���	#FF9A67EA6[   5�   +   5�   '   5�      5�      5�      5�      �� 5�   
   -   5        $ TextBlockCount��5�   !   $��4��6   $	��300��69   $
��Left=�6F   �� 5�   
   -   5        5 ��Name$5 StatusBarStatistics��5�      $��3��61   .@�5�      �� .��5�      �� -   5        $��TextBoxStats��5�        
 MaterialDesignBody1TextBlock#��� 
 60   $��	 10 0 0 0q�6g   5�      5�      5�      5�      