   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  +    %DiscreteMathCourseApp.Pages.TestsPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:DiscreteMathCourseApp.Pages     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -      MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �   N� Title$ 
Тесты��.���  � RowDefinitions �� $
��auto ��� �� $
��auto �.+�� $��0��$��Stretch=�.+��� -    ��Name$ 
TBoxSearch��$	��275��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$. (Введите текст вопроса���� -    ��Name$ 	ComboSort��$	��275��$ Сортировать��$��10 0 0 0q�.@��� .���� 	 �� Orientation$	 
Horizontal=�.+��� $��Название��'  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 SortAscending=�$��5 0 0 0q��� .���� $	 
Horizontal=�.+��� $��Название��  $
 SortDescending=�$��5 0 0 0q�&   System.Windows.Controls.DataGrid  -     Name$ DataGridData��$��1��   AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=� � 	Resources  �� 
TargetType  WrapText �� Property �� Value��%X   &	       �� " ��.���  � ��$
 Wrap=���  �@��TextAlignment$ Justify=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$	 №��   Width5  /System.Windows.Controls.DataGridLengthConverter$ 60 1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# [    Binding �� *Id+  $ Название��$ 4* # [  �� *Title+  $ Описание��$ *  �� *Description+4	  .System.Windows.Controls.DataGridTemplateColumn	  $
 auto  	  CellTemplate �� .R���  ��Name$ BtnEdit��-   $��Center=�  MaterialDesignFlatButton#��[  � ToolTip$ Вниз��$��40����0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$
 Edit=� 
  Size$ 24X�	  $
 auto  �� .R��� $ 	BtnDelete��-   $��Center=�#��[ $ Вниз��$��40����
  $ Delete=�$ 24X��� -   $ BtnAdd��$��2��$	��100��$��Right=�$��3 0 10 0q�#��[ $��Добавить���� -    ��Name$ TextBlockCount��$��2��$	��300��$
��Left=�