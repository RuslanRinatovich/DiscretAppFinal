   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      -    'DiscreteMathCourseApp.Pages.ChapterPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      5local)clr-namespace:DiscreteMathCourseApp.Pages  5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5	      $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Разделы��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $
��auto �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$4 .Введите название раздела��68   5      �� 5#      -   5         ��Name$ 	ComboSort��5$      $	��275��5#      $ Сортировать��6#   $��10 0 0 0q�5%   H   .@�5&      �� .��5'      �� 	 �� Orientation$	 
Horizontal=�6!   .+�5(      �� $��Название��6$   '  !MaterialDesignThemes.Wpf.PackIcon  5)      
   Kind$
 SortAscending=�62   $��5 0 0 0q�6G   5*      5+      �� 5,      .��5-      �� $	 
Horizontal=�6!   .+�5.      �� $��Название��6$     5/      $
 SortDescending=�62   $��5 0 0 0q�6H   50      51      53      55      &   System.Windows.Controls.DataGrid  57   
   -   5          Name$ DataGridData��57      $��1��6)      AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�5;       � 	Resources 5=       �� 
TargetType  WrapText �� Property �� Value��%�   &	       �� 5>      " ��6   .�5?      ��  � ��$
 Wrap=�65   �� 5@       �@��TextAlignment$ Justify=�66   5A      5B         Columns 5C      0  *System.Windows.Controls.DataGridTextColumn  5D      ,  &System.Windows.Controls.DataGridColumn   Header$	 №��6E      Width5  /System.Windows.Controls.DataGridLengthConverter$ 60 6P   1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# [ 6[      Binding 6%   �� *IndexNumber+6[     5E      $ Название��6?   $ * 6Q   # [ 6[    6%   �� *Title+6[     5F      $ Описание��6E   $ 4* 6W    6%   �� *Description+6W   4	  .System.Windows.Controls.DataGridTemplateColumn	  5G      $
 auto 6)    	  CellTemplate 5H      �� 5I      .R�5J      ��  ��Name$ BtnUp��6@   -   5        $��Center=�5J   %     MaterialDesignFlatButton#��[ 6P    � ToolTip$ 
Вверх��5K   e   $��40��6v   ��6!   0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$ ArrowUpBold=� 
  Size$ 24X�6�   5L      5N      	  5O      $
 auto 6)    5P      �� 5Q      .R�5R      �� $ BtnDown��6@   -   5        $��Center=�5R   %   #��[ 6R   $ Вниз��5S   c   $��40��6s   ��6!   
  $ ArrowDownBold=�$ 24X�6   5T      5V      	  5W      $
 auto 6)    5X      �� 5Y      .R�5Z      �� $ BtnEdit��6@   -   5        $��Center=�5Z   %   #��[ 6R   $ Изменить��5[   Z   $��40��6n   ��6!   
  $
 Edit=�$ 24X�6z   5\      5^      	  5_      $
 auto 6)    5`      �� 5a      .R�5b      �� $ 	BtnDelete��6@   -   5        $��Center=�5b   %   #��[ 6T   $ Удалить��5c   \   $��40��6o   ��6!   
  $ Delete=�$ 24X�6{   5d      5f      5h      �� 5i   
   -	   5        $ BtnAdd��5i      $��2��6!   $	��100��6.   $��Right=�6:   $��3 0 10 0q�6V   #��[ 6h   $��Добавить��5j      6$   �� 5l   
   -
   5         ��Name$ TextBlockCount��5l   !   $��2��6   $	��300��69   $
��Left=�6F   5m      5n      