   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  5   	   5    /DiscreteMathCourseApp.Windows.AddQuestionWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   =local+clr-namespace:DiscreteMathCourseApp.Windows     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5   
   $��Regular"�5	   	   $��14(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � Title$ Вопросы��5       � WindowStartupLocation$ CenterScreen=�5      $	��600��5   	   $	��800��5   	   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $
��auto �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5!      �� -   5         ��Name$ 
TBoxSearch��5!   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$. (Введите текст вопроса��68   5"      �� 5%      -   5         ��Name$ ComboChapter��5%   #   $	��275��6   $��14(�69   $��3q�6G   $# Выберите раздел��5&       �� DisplayMemberPath$ Title��5'   F   �� 5)      -   5        $ 
ComboTopic��5)   #   $	��275��6   $��14(�67   $��3q�6E   $ Выберите тему��5*      $ Title��5+   D   �� 5.      -   5        $ 	ComboSort��5/      $	��275��5.      $ Сортировать��6#   $��10 0 0 0q�50   H   .@�51      �� .��52      �� 	 �� Orientation$	 
Horizontal=�6!   .+�53      �� $��Название��6$   '  !MaterialDesignThemes.Wpf.PackIcon  54      
   Kind$
 SortAscending=�62   $��5 0 0 0q�6G   55      56      �� 57      .��58      �� $	 
Horizontal=�6!   .+�59      �� $��Название��6$     5:      $
 SortDescending=�62   $��5 0 0 0q�6H   5;      5<      5>      5@      &   System.Windows.Controls.DataGrid  5B   
   -   5          Name$ DataGridData��5B      $��1��6)      AutoGenerateColumns .     
IsReadOnly . $��Stretch=�5E         SelectionMode$ Single=�5F       � 	Resources 5H       �� 
TargetType  WrapText �� Property �� Value��%�   &	       �� 5I      " ��6   .�5J      ��  � ��$
 Wrap=�65   �� 5K       �@��TextAlignment$ Justify=�66   5L      5M         Columns 5N      4  .System.Windows.Controls.DataGridTemplateColumn  5O      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6)      Header$ Изображение��65      CellTemplate 5P      �� 5Q      .R�5R      �� ��6$   ��  �� Path$ GetImage�5S      5U      0  *System.Windows.Controls.DataGridTextColumn  5V      $	 №��6<   $ 60 6G   1	  +System.Windows.Controls.DataGridBoundColumn 	  ElementStyle# [ 6R    	  Binding 6%   �� *Id+6R     5W      $ Название��6?   $ 4* 6Q   # [ 6\    6%   �� *Title+6\     5X      $
 auto 6)    5Y      �� 5Z      .R�5[      ��  ��Name$ 
BtnGetItem��6@   -   5        $��Center=�5[   %     MaterialDesignFlatButton#��[ 6U    � ToolTip$ Выбрать��5\   Z   $��40��6m   ��6!   0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$
 Plus=� 
  Size$ 24X�6y   5]      5_       �� 
GroupStyle 5a      (  "System.Windows.Controls.GroupStyle  5b         HeaderTemplate 5c      �� 5d      .R�5e      �� .+�5f   "   �� $
��Bold"�6S     �� Padding$  3q�6e   ��6,   �� $ Topic.Chapter�6e   5g      5h      !   ContainerStyle! 5j      �� 5k      " ��6    .�5l      ��  � �� 5m   "   �� 5n   &   " �� 
TargetType"" ��66   .R�5o   *   � $��Stretch=�6/    5p   .   �� 5q   2   $
��auto �6@   �� 5r   2   $��* �6@   �� 5s   2   $
��auto �6@   .+�5u   .   �� $��5q�68   $��0��6C   $��2��6P   ���	#FF9A67EA6[   9� 5v   .   $��1��67   # 9� 
IsExpanded# .  $��Stretch=�6W   ��5w   2   �� 5x   6   .+�5y   :   �� $	 
Horizontal=�6E   .+�5z   >   ��  $  MaterialDesignHeadline6TextBlock#��[ 6i   $
��Wrap=�6�   ��6H   �� $ 
Name.Title�6�   �� 5{   >   $��10 0 0 0q�6�    $  MaterialDesignSubtitle2TextBlock#���  6�   ��6H   �� $ 	ItemCount�$ �� StringFormat$$ {0} вопросов��6�   5|   ;   5}   7   .��5   2   �� 5�   /   �� 5�   .   $��5q�68   $��2��6C   $��2��6P   ���	#FF9A67EA6[   5�   +   5�   '   5�      5�      5�        5�      ! 5�      �� 5�      " ��6    .�5�      ��  � �� 5�   "   �� 5�   &   "" ��66   .R�5�   *   � $��Stretch=�6/   .+�5�   .   9� $��1��67   # .  $��Stretch=�6W   ��5�   2   �� 5�   6   .+�5�   :   �� $	 
Horizontal=�6E   $��5 0 5 0q�6_   $��Stretch=�6p   .+�5�   >   �� #��[ 6�   $��Stretch=�6�   ��6H   �� $ 
Name.Title�$$ Тема: {0}��6�   �� 5�   >   $��10 0 0 0q�6�   #���  6�   $��Stretch=�6�   ��6H   �� $ 	ItemCount�$$ {0} вопросов��6�   5�   ;   5�   7   .��5�   2   �� $��	 10 0 0 0q�6A   5�   /   5�   +   5�   '   5�      5�      5�      5�      �� 5�   
   -   5        % ��Name$% TextBlockCount��5�   !   $��2��6   $	��300��69   $
��Left=�6F   5�      5�      