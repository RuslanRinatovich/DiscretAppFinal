   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  /    )DiscreteMathCourseApp.Pages.CheckTestPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:DiscreteMathCourseApp.Pages     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -      MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �   N� Title$ 
Тесты��.���  � RowDefinitions �� $
��auto ��� �� $��40 �.+�� $��0��$��Stretch=�.+��� -    ��Name$ 
TBoxSearch��$	��275��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$0 *Введите название теста���� -    ��Name$ 	ComboSort��$	��275��$ Сортировать��$��10 0 0 0q�.@��� .���� 	 �� Orientation$	 
Horizontal=�.+��� $��Названию тем��'  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 SortAscending=�$��5 0 0 0q��� .���� $	 
Horizontal=�.+��� $��Названию тем��  $
 SortDescending=�$��5 0 0 0q��� -    ��Name$ ListBoxTests��$��Visible=�$��Stretch=�$��1�� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     HeaderTemplate �� .R��� $��1q�._��� $
��Bold"�$��14(� 
 akcent#��[   main#��[ $
��Wrap=����� *Name+����  �� 
TargetType" ��.���  �� Property � �� �� Value �� *
GetColor+���� .R�� $��Stretch=� � UseLayoutRounding .  � ColumnDefinitions �� $��40 ��� $��* ��� $��40 ��� $��40 ��� $��40 �.+��� $��2q�$��16(�$��0��$
��Auto��$
��Left=�����  �� Path$ IndexNumber� �� StringFormat$ №: {0}���� $��2q�$��1��$��14(�$
��Bold"� $  MaterialDesignSubtitle2TextBlock#���  $
��Auto��$
��Left=����� $ Title��� $��2q�$��16(�$
��Bold"�$��2��$
��Auto��$��Right=�$��Center=����� *	GetResult+$
 {0}%����  ��Name$ 	BtnDelete��-    � ToolTip$) #Удалить результаты��$��3��$��40��$��0q�$��Right=�  MaterialDesignFlatButton#��[ $��Center=���0  *MaterialDesignThemes.Wpf.PackIconExtension  *Delete+�� $ BtnShow��-   $' !Показать прогресс��#��[ $��4��$��40��$��0q�$��Right=�$��Center=���     Kind$	 Eye=��� -    ��Name$ TextBlockCount��$��2��$	��300��$
��Left=�