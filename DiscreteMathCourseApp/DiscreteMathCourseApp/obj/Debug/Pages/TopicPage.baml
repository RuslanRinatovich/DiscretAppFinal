   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      +    %DiscreteMathCourseApp.Pages.TopicPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5	      $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Темы��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $��40 �6   �� 5      $
��auto �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$> 8Введите название темы, раздела��68   5      �� 5       -   5         ��Name$ ComboChapter��5    #   $	��275��6   $��14(�69   $��3q�6G   $# Выберите раздел��5!      	 �� DisplayMemberPath$	 Title��5"   B   �� 5$      -   5        $ ComboTopicType��5$   #   $	��275��6   $��14(�6;   $��3q�6I   $, &Выберите тип занятия��5%      $	 Title��5&   B   �� 5)      -   5        $ 	ComboSort��5*      $	��275��5)      $ Сортировать��6#   $��10 0 0 0q�5+   H   .@�5,      �� .��5-      �� 
 �� Orientation$
 
Horizontal=�6!   .+�5.      �� $��Название��6$   '  !MaterialDesignThemes.Wpf.PackIcon  5/         Kind$ SortAscending=�62   $��5 0 0 0q�6G   50      51      �� 52      .��53      �� $
 
Horizontal=�6!   .+�54      �� $��Название��6$     55      $ SortDescending=�62   $��5 0 0 0q�6H   56      57      59      5;      &   System.Windows.Controls.DataGrid  5=   
   -   5          Name$ DataGridData��5=      $��1��6)      AutoGenerateColumns .     
IsReadOnly . $��Stretch=�5@   -      SelectionMode$ Single=�5A      ��5@      ��  � 	Resources 5C       �� 
TargetType  WrapText �� Property �� Value 	 First��%  &	       &	 �     �� 5D      " ��6   .�5E      ��  � ��$
 Wrap=�65   �� 5F       �@��TextAlignment$ Justify=�66   5G      �� 5H      " ��6   .�5I      ��  � ��$
 Wrap=�65   �� 5J       �@��TextAlignment$
 Left=�66   5K      5L         Columns 5M      0  *System.Windows.Controls.DataGridTextColumn  5O      ,  &System.Windows.Controls.DataGridColumn   Header$	 №��6E      Width5  /System.Windows.Controls.DataGridLengthConverter$ 60 6P   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *IndexNumber+6P     5P      $ Название��6?   $ * 6Q      ElementStyle# [ 6[    6%   �� *Title+6[     5Q      $% Количество часов��6D   # [ 6_   $
 auto 6�    6%   �� *
TotalHours+6�     5R      $ Тип занятия��6I   $
 auto 6^    6%   �� *TopicType.Title+6^   4	  .System.Windows.Controls.DataGridTemplateColumn	  5S      $
 auto 6)    	  CellTemplate 5T      �� 5U      .R�5V      ��  ��Name$ BtnUp��6@   -   5        $��Center=�5V   %     MaterialDesignFlatButton#��[ 6P    � ToolTip$ 
Вверх��5W   `   $��40��6q   ��6!   0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$ ArrowUpBold=� 
  Size$ 20X�6}   5X      5Z      	  5[      $
 auto 6)    5\      �� 5]      .R�5^      �� $ BtnDown��6@   -   5        $��Center=�5^   %   #��[ 6R   $ Вниз��5_   c   $��40��6s   ��6!   
  $ ArrowDownBold=�$ 20X�6   5`      5b      	  5c      $
 auto 6)    5d      �� 5e      .R�5f      �� $ BtnEdit��6@   -	   5        $��Center=�5f   %   #��[ 6R   $ Изменить��5g   Z   $��40��6n   ��6!   
  $
 Edit=�$ 20X�6z   5h      5j      	  5k      $
 auto 6)    5l      �� 5m      .R�5n      �� $ 	BtnDelete��6@   -
   5        $��Center=�5n   %   #��[ 6T   $ Удалить��5o   \   $��40��6o   ��6!   
  $ Delete=�$ 20X�6{   5p      5r       �� 
GroupStyle 5u      (  "System.Windows.Controls.GroupStyle  5v         HeaderTemplate 5w      �� 5x      .R�5y      �� .+�5z   "   �� $
��Bold"�6M     �� Padding$  3q�6_   ��6,   �� ! �� Path$! Chapter�6_   5{      5|      "   ContainerStyle" 5~      �� 5      " ��6    .�5�      ��  � �� 5�   "   �� 5�   &   # �� 
TargetType"# ��66   .R�5�   *   � $��Stretch=�6/    5�   .   �� 5�   2   $
��auto �6@   �� 5�   2   $��* �6@   �� 5�   2   $
��auto �6@   .+�5�   .   �� $��5q�68   $��0��6C   $��2��6P   ���	#FF9A67EA6[   9� 5�   .   $��1��67   $ 9� 
IsExpanded$ . ��5�   2   �� 5�   6   .+�5�   :   �� $
 
Horizontal=�6E   .+�5�   >   ��  $  MaterialDesignHeadline6TextBlock#��[ 6i   ��6H   �� $! 
Name.Title�6i   �� 5�   >   $��10 0 0 0q�6�    $  MaterialDesignSubtitle2TextBlock#���  6�   ��6H   �� $! 	ItemCount�% �� StringFormat$% 
{0} тем��6�   5�   ;   �� 5�   :   #���  5�   A   ��5�   D   �� $! Name.GetTotalHours�5�   A   5�   7   .��5�   2   �� 5�   /   �� 5�   .   $��5q�68   $��2��6C   $��2��6P   ���	#FF9A67EA6[   5�   +   5�   '   5�      5�      5�      5�      �� 5�   
   $��3��6   $��Right=�6"   $
 
Horizontal=�6>   .+�5�      �� -   5        $ BtnTopicType��5�      $��3��6+   $
��auto��68   $��5q�6F   #��[ 6Q   $��Типы занятий��5�      6(   �� 5�      -   5        $ BtnChapters��5�      $��3��6*   $
��auto��67   $��5q�6E   #��[ 6P   $��Разделы��5�      6#   �� 5�      -   5        $ BtnAdd��5�      $	��100��6&   $��5q�62   #��[ 6=   $��Добавить��5�      6$   5�      �� 5�   
   -   5        & ��Name$& TextBlockCount��5�   !   $��3��6   $	��300��69   $
��Left=�6F   �� 5�   
   -   5        ' ��Name$' StatusBarStatistics��5�      $��2��61   .@�5�      �� .��5�      �� -   5        $��TextBoxStats��5�         MaterialDesignBody1TextBlock#���  60   $��	 10 0 0 0q�6g   5�      5�      5�      5�      