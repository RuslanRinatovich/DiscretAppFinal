   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      /    )DiscreteMathCourseApp.Pages.QuestionsPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5	      $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Банк вопросов��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $
��auto �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$. (Введите текст вопроса��68   5      �� 5!      -   5         ��Name$ ComboChapter��5!   #   $	��275��6   $��14(�69   $��3q�6G   $# Выберите раздел��5"      	 �� DisplayMemberPath$	 Title��5#   F   �� 5%      -   5        $ 
ComboTopic��5%   #   $	��275��6   $��14(�67   $��3q�6E   $ Выберите тему��5&      $	 Title��5'   D   �� 5)      -   5        $ 	ComboSort��5*      $	��275��5)      $ Сортировать��6#   $��10 0 0 0q�5+   H   .@�5,      �� .��5-      �� 
 �� Orientation$
 
Horizontal=�6!   .+�5.      �� $��Название��6$   '  !MaterialDesignThemes.Wpf.PackIcon  5/         Kind$ SortAscending=�62   $��5 0 0 0q�6G   50      51      �� 52      .��53      �� $
 
Horizontal=�6!   .+�54      �� $��Название��6$     55      $ SortDescending=�62   $��5 0 0 0q�6H   56      57      59      5;      &   System.Windows.Controls.DataGrid  5=   
   -   5          Name$ DataGridData��5=      $��1��6)      AutoGenerateColumns .     
IsReadOnly . $��Stretch=�5A         SelectionMode$ Single=�5B      ��5@      ��  � 	Resources 5D       �� 
TargetType  WrapText �� Property �� Value 	 First��%  &	       &	 �     �� 5E      " ��6   .�5F      ��  � ��$
 Wrap=�65   �� 5G       �@��TextAlignment$ Justify=�66   5H      �� 5I      " ��6   .�5J      ��  � ��$
 Wrap=�65   �� 5K       �@��TextAlignment$
 Left=�66   5L      5M         Columns 5N      4  .System.Windows.Controls.DataGridTemplateColumn  5O      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6)      Header$ Изображение��65      CellTemplate 5P      �� 5Q      .R�5R      �� ��6$   ��  �� Path$ GetImage�5S      5U      0  *System.Windows.Controls.DataGridTextColumn  5V      $	 №��6<   $ 60 6G   1	  +System.Windows.Controls.DataGridBoundColumn 	  ElementStyle# [ 6R    	  Binding 6%   �� *Id+6R     5W      $ Вопрос��6?   $ 4* 6O   # [ 6Z    6%   �� *Title+6Z     5\      $
 auto 6)    5]      �� 5^      .R�5_      ��  ��Name$ BtnEdit��6@   -   5        $��Center=�5_   %     MaterialDesignFlatButton#��[ 6R    � ToolTip$ Изменить��5`   Z   $��40��6n   ��6!   0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$
 Edit=� 
  Size$ 24X�6z   5a      5c        5d      $
 auto 6)    5e      �� 5f      .R�5g      �� $ 	BtnDelete��6@   -   5        $��Center=�5g   %   #��[ 6T   $ Удалить��5h   \   $��40��6o   ��6!   
  $ Delete=�$ 24X�6{   5i      5k       �� 
GroupStyle 5n      (  "System.Windows.Controls.GroupStyle  5o          HeaderTemplate  5p      �� 5q      .R�5r      �� .+�5s   "   �� $
��Bold"�6S   ! �� Padding$! 3q�6e   ��6,   �� $ Topic.Chapter�6e   5t      5u      "   ContainerStyle" 5w      �� 5x      " ��6    .�5y      ��  � �� 5z   "   �� 5{   &   # �� 
TargetType"# ��66   .R�5|   *   � $��Stretch=�6/    5}   .   �� 5~   2   $
��auto �6@   �� 5   2   $��* �6@   �� 5�   2   $
��auto �6@   .+�5�   .   �� $��5q�68   $��0��6C   $��2��6P   ���	#FF9A67EA6[   9� 5�   .   $��1��67   $ 9� 
IsExpanded$ .  ��5�   2   �� 5�   6   .+�5�   :   �� $
 
Horizontal=�6E   .+�5�   >   ��  $  MaterialDesignHeadline6TextBlock#��[ 6i   ��6H   �� $ 
Name.Title�6i   �� 5�   >   $��10 0 0 0q�6�    $  MaterialDesignSubtitle2TextBlock#���  6�   ��6H   �� $ 	ItemCount�% �� StringFormat$% {0} вопросов��6�   5�   ;   5�   7   .��5�   2   �� 5�   /   �� 5�   .   $��5q�68   $��2��6C   $��2��6P   ���	#FF9A67EA6[   5�   +   5�   '   5�      5�      5�        5�      " 5�      �� 5�      " ��6    .�5�      ��  � �� 5�   "   �� 5�   &   "# ��66   .R�5�   *   � $��Stretch=�6/   .+�5�   .   9� $��1��67   $ .  ��5�   2   �� 5�   6   .+�5�   :   �� $
 
Horizontal=�6E   $��5 0 5 0q�6_   .+�5�   >   �� #��[ 6�   $
��Wrap=�6�   ��6H   �� $ 
Name.Title�$% Тема: {0}��6�   �� 5�   >   $��10 0 0 0q�6�   #���  6�   ��6H   �� $ 	ItemCount�$% {0} вопросов��6�   5�   ;   5�   7   .��5�   2   �� $��	 10 0 0 0q�6A   5�   /   5�   +   5�   '   5�      5�      5�      5�      �� 5�   
   -	   5        $ BtnAdd��5�      $��2��6!   $	��100��6.   #��[ 6:   $��Right=�6l   $��3 0 10 0q�6�   $��Добавить��5�      6$   �� 5�   
   -
   5        & ��Name$& TextBlockCount��5�   !   $��2��6   $	��300��69   $
��Left=�6F   5�      5�      