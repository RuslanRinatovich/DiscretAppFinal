   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      0    *DiscreteMathCourseApp.Pages.CheckTasksPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5	      $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$% Проверка заданий��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5       �� $/��)Введите название темы:��6   �� 5"      -   5         ��Name$ 
TBoxSearch��5"   &   $	��275��6   5#      5$      �� 5&      $ 
Horizontal=�6   .+�5'      �� $"��Выберите главу ��6   $��14(�63    �� Padding$ 3q�6A   �� 5(      -   5        	 ��Name$	 ComboChapter��5(   '   $	��275��6   $��14(�6=   $��3q�6K   
 �� DisplayMemberPath$
 Title��5)   F   5+      �� 5.      $ 
Horizontal=�6   $��3q�62   .+�5/      �� $!��Сортировать по��6   $��Center=�63   $
��Bold"�6N   �� 51      -   5        $	 	ComboSort��52      $	��275��51      $��10 0 0 0q�53   H   .@�54      �� .��55      �� $ 
Horizontal=�6%   .+�56      �� $��№ темы��6(   '  !MaterialDesignThemes.Wpf.PackIcon  57         Kind$ SortAscending=�66   $��5 0 0 0q�6K   58      59      �� 5:      .��5;      �� $ 
Horizontal=�6%   .+�5<      �� $��№ темы��6(     5=      $ SortDescending=�66   $��5 0 0 0q�6L   5>      5?      5A      5B      5C      �� 5E   
   -   5         ��Name$ ListBoxData��5E      $��Visible=�5F       �� SelectedValuePath$ Id��5G      $��1��6,   $��0��69   $��Stretch=�6I    �� 
GroupStyle 5I      (  "System.Windows.Controls.GroupStyle  5J         HeaderTemplate 5K      �� 5L      .R�5M      �� $��1q�6%   ._�5N   "   �� $
��Bold"�6,   $��14(�6>    
 akcent#��[ 6c     main#��[ 5O   ,   ��5N   L   �� *Name+5O   ,   5P      5Q      5S      ��5U      �� 5W      .R�5X      �  � ColumnDefinitions 5Y      �� 5Z      $��40 �6/   �� 5[      $��* �6/   �� 5\      $��60 �6/   �� 5]      $��60 �6/   �� 5^      $��60 �6/   .+�5`      �� $��2q�6$   $��16(�6/   $��0��6=   $
��Auto��5b   (   $
��Left=�65   ��5a   (   ��  �� Path$ IndexNumber� �� StringFormat$ №: {0}��5b   5   �� 5c      $��2q�6#   $��16(�6.   $
��Bold"�6<   $
��Auto��5e   (   $��Stretch=�65   $
��Wrap=�6S   $��1��6g   ��5d   (   �� $ 	TaskTitle�5e   g   �� 5g       ��Name$ BtnCheck��6<   -   5        $��Center=�5g   !   $��2��6N     MaterialDesignFlatButton#��[ 6_    � ToolTip$ Проверить��5h   d   $��40��6�   ��6!   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ CheckboxMarked=�   Size$ 20X�y�6x   �� *GetVisibility+6�   �� 5i      $ 	BtnDelete��6O   -   5        $) #Удалить ответ из БД��5i   b   $��3��5j   #   $��40��63   $��0q�6>   #��[ 6K   $��Right=�6�   $��Center=�5k      ��5i   #     *Delete+y�6�   �� *GetVisibility+5k   .   �� 5l      $��2q�6$   $��16(�6/   $��4��6=    $  MaterialDesignSubtitle2TextBlock#���  6M   $
��Auto��5n   ,   $��Right=�69   $��Center=�6V   
��� � ���5m   ,   �� $ Result�5n   q   5o      5p      5s      �� 5t   
   -   5         ��Name$ TextBlockCount��5t   !   $��2��6   $	��300��69   $
��Left=�6E   5v      5w      