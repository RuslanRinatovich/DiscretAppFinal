   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      /    )DiscreteMathCourseApp.Pages.CheckTestPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5	      $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ 
Тесты��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $��40 �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$0 *Введите название теста��68   5      �� 5$      -   5         ��Name$ 	ComboSort��5%      $	��275��5$      $ Сортировать��6#   $��10 0 0 0q�5&   H   .@�5'      �� .��5(      �� 	 �� Orientation$	 
Horizontal=�6!   .+�5)      �� $��Названию тем��6$   '  !MaterialDesignThemes.Wpf.PackIcon  5*      
   Kind$
 SortAscending=�62   $��5 0 0 0q�6G   5+      5,      �� 5-      .��5.      �� $	 
Horizontal=�6!   .+�5/      �� $��Названию тем��6$     50      $
 SortDescending=�62   $��5 0 0 0q�6H   51      52      54      56      �� 59   
   -   5         ��Name$ ListBoxTests��59      $��Visible=�5:      $��Stretch=�6H   $��1��5;       �� 
GroupStyle 5=      (  "System.Windows.Controls.GroupStyle  5>         HeaderTemplate 5?      �� 5@      .R�5A      �� $��1q�6%   ._�5B   "   �� $
��Bold"�6,   $��14(�6>    
 akcent#��[ 6c     main#��[ 5C   ,   $
��Wrap=�6P   ��5B   L   �� *Name+5C   P   5D      5E      5G      ��5I      �� 5J       �� 
TargetType" ��6   .�5K      ��  �� Property � �� �� Value 63   �� *
GetColor+5L      ��5N      �� 5O      .R�5P      � $��Stretch=�6    � UseLayoutRounding .  � ColumnDefinitions 5Q      �� 5R      $��40 �6/   �� 5S      $��* �6/   �� 5T      $��40 �6/   �� 5U      $��40 �6/   �� 5V      $��40 �6/   .+�5X      �� $��2q�6$   $��16(�6/   $��0��6>   $
��Auto��5Z   (   $
��Left=�65   ��5Y   (   ��  �� Path$ IndexNumber� �� StringFormat$ №: {0}��5Z   5   �� 5\      $��2q�6$   $��1��6/   $��14(�6?   $
��Bold"�6M    $  MaterialDesignSubtitle2TextBlock#���  6_   $
��Auto��5^   (   $
��Left=�65   ��5]   (   �� $ Title�5^   5   �� 5_      $��2q�6$   $��16(�6/   $
��Bold"�6=   $��2��5`   X   $
��Auto��5a   (   $��Right=�65   $��Center=�6Q   ��5`   (   �� *	GetResult+$
 {0}%��5a   Q   �� 5b       ��Name$ 	BtnDelete��6O   -   5         � ToolTip$) #Удалить результаты��5b   b   $��3��5c   #   $��40��63   $��0q�6>   $��Right=�6[     MaterialDesignFlatButton#��[ 6w   $��Center=�5d      ��5b   #   0  *MaterialDesignThemes.Wpf.PackIconExtension  *Delete+5d   .   �� 5f      $ BtnShow��6Q   -   5        $' !Показать прогресс��5f   b   #��[ 6~   $��4��5g   #   $��40��63   $��0q�6>   $��Right=�6[   $��Center=�5h      ��5f   #        Kind$	 Eye=�5h   .   5j      5k      5n      �� 5p   
   -   5         ��Name$ TextBlockCount��5p   !   $��2��6   $	��300��69   $
��Left=�6F   5q      5r      