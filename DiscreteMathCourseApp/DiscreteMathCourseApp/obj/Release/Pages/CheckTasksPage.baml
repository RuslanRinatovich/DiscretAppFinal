   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  0    *DiscreteMathCourseApp.Pages.CheckTasksPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:DiscreteMathCourseApp.Pages     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -      MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �   N� Title$% Проверка заданий��.���  � RowDefinitions �� $
��auto ��� $��* ��� $��30 �.+�� $��0��$��Stretch=�.+���  �� Orientation$ 
Horizontal=�.+��� $/��)Введите название темы:���� -    ��Name$ 
TBoxSearch��$	��275���� $ 
Horizontal=�.+��� $"��Выберите главу ��$��14(� �� Padding$ 3q��� -   	 ��Name$	 ComboChapter��$	��275��$��14(�$��3q�
 �� DisplayMemberPath$
 Title���� $ 
Horizontal=�$��3q�.+��� $!��Сортировать по��$��Center=�$
��Bold"��� -   $	 	ComboSort��$	��275��$��10 0 0 0q�.@��� .���� $ 
Horizontal=�.+��� $��№ темы��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ SortAscending=�$��5 0 0 0q��� .���� $ 
Horizontal=�.+��� $��№ темы��  $ SortDescending=�$��5 0 0 0q��� -    ��Name$ ListBoxData��$��Visible=� �� SelectedValuePath$ Id��$��1��$��0��$��Stretch=� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     HeaderTemplate �� .R��� $��1q�._��� $
��Bold"�$��14(� 
 akcent#��[   main#��[ ���� *Name+���� .R��  � ColumnDefinitions �� $��40 ��� $��* ��� $��60 ��� $��60 ��� $��60 �.+��� $��2q�$��16(�$��0��$
��Auto��$
��Left=�����  �� Path$ IndexNumber� �� StringFormat$ №: {0}���� $��2q�$��16(�$
��Bold"�$
��Auto��$��Stretch=�$
��Wrap=�$��1������ $ 	TaskTitle���  ��Name$ BtnCheck��-   $��Center=�$��2��  MaterialDesignFlatButton#��[  � ToolTip$ Проверить��$��40����0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ CheckboxMarked=�   Size$ 20X�y��� *GetVisibility+�� $ 	BtnDelete��-   $) #Удалить ответ из БД��$��3��$��40��$��0q�#��[ $��Right=�$��Center=���  *Delete+y��� *GetVisibility+�� $��2q�$��16(�$��4�� $  MaterialDesignSubtitle2TextBlock#���  $
��Auto��$��Right=�$��Center=�
��� � ����� $ Result��� -    ��Name$ TextBlockCount��$��2��$	��300��$
��Left=�