   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      +    %DiscreteMathCourseApp.Pages.TestsPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5	      $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ 
Тесты��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $
��auto �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$. (Введите текст вопроса��68   5      �� 5$      -   5         ��Name$ 	ComboSort��5%      $	��275��5$      $ Сортировать��6#   $��10 0 0 0q�5&   H   .@�5'      �� .��5(      �� 	 �� Orientation$	 
Horizontal=�6!   .+�5)      �� $��Название��6$   '  !MaterialDesignThemes.Wpf.PackIcon  5*      
   Kind$
 SortAscending=�62   $��5 0 0 0q�6G   5+      5,      �� 5-      .��5.      �� $	 
Horizontal=�6!   .+�5/      �� $��Название��6$     50      $
 SortDescending=�62   $��5 0 0 0q�6H   51      52      54      56      &   System.Windows.Controls.DataGrid  58   
   -   5          Name$ DataGridData��58      $��1��6)      AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�5<       � 	Resources 5>       �� 
TargetType  WrapText �� Property �� Value��%�   &	       �� 5?      " ��6   .�5@      ��  � ��$
 Wrap=�65   �� 5A       �@��TextAlignment$ Justify=�66   5B      5C         Columns 5D      0  *System.Windows.Controls.DataGridTextColumn  5F      ,  &System.Windows.Controls.DataGridColumn   Header$	 №��6<      Width5  /System.Windows.Controls.DataGridLengthConverter$ 60 6G   1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# [ 6R      Binding 6%   �� *Id+6R     5G      $ Название��6?   $ 4* 6Q   # [ 6\    6%   �� *Title+6\     5H      $ Описание��6E   $ * 6W    6%   �� *Description+6W   4	  .System.Windows.Controls.DataGridTemplateColumn	  5J      $
 auto 6)    	  CellTemplate 5K      �� 5L      .R�5M      ��  ��Name$ BtnEdit��6@   -   5        $��Center=�5M   %     MaterialDesignFlatButton#��[ 6R    � ToolTip$ Вниз��5N   Z   $��40��6j   ��6!   0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$
 Edit=� 
  Size$ 24X�6v   5O      5Q      	  5R      $
 auto 6)    5S      �� 5T      .R�5U      �� $ 	BtnDelete��6@   -   5        $��Center=�5U   %   #��[ 6T   $ Вниз��5V   \   $��40��6l   ��6!   
  $ Delete=�$ 24X�6x   5W      5Y      5[      �� 5\   
   -   5        $ BtnAdd��5\      $��2��6!   $	��100��6.   $��Right=�6:   $��3 0 10 0q�6V   #��[ 6h   $��Добавить��5]      6$   �� 5_   
   -   5         ��Name$ TextBlockCount��5_   !   $��2��6   $	��300��69   $
��Left=�6F   5`      5a      