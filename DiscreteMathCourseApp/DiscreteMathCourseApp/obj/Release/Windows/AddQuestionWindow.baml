   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  5    /DiscreteMathCourseApp.Windows.AddQuestionWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     =local+clr-namespace:DiscreteMathCourseApp.Windows     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper#���    MaterialDesignFont#���   � Title$ Вопросы�� � WindowStartupLocation$ CenterScreen=�$	��600��$	��800��.���  � RowDefinitions �� $
��auto ��� �� $
��auto �.+�� $��0��$��Stretch=�.+��� -    ��Name$ 
TBoxSearch��$	��275��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$. (Введите текст вопроса���� -    ��Name$ ComboChapter��$	��275��$��14(�$��3q�$# Выберите раздел�� �� DisplayMemberPath$ Title���� -   $ 
ComboTopic��$	��275��$��14(�$��3q�$ Выберите тему��$ Title���� -   $ 	ComboSort��$	��275��$ Сортировать��$��10 0 0 0q�.@��� .���� 	 �� Orientation$	 
Horizontal=�.+��� $��Название��'  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 SortAscending=�$��5 0 0 0q��� .���� $	 
Horizontal=�.+��� $��Название��  $
 SortDescending=�$��5 0 0 0q�&   System.Windows.Controls.DataGrid  -     Name$ DataGridData��$��1��   AutoGenerateColumns .     
IsReadOnly . $��Stretch=�   SelectionMode$ Single=� � 	Resources  �� 
TargetType  WrapText �� Property �� Value��%X   &	       �� " ��.���  � ��$
 Wrap=���  �@��TextAlignment$ Justify=�   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100    Header$ Изображение��   CellTemplate �� .R��� ����  �� Path$ GetImage�0  *System.Windows.Controls.DataGridTextColumn  $	 №��$ 60 1	  +System.Windows.Controls.DataGridBoundColumn 	  ElementStyle# [  	  Binding �� *Id+  $ Название��$ 4* # [  �� *Title+  $
 auto  �� .R���  ��Name$ 
BtnGetItem��-   $��Center=�  MaterialDesignFlatButton#��[  � ToolTip$ Выбрать��$��40����0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$
 Plus=� 
  Size$ 24X� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     HeaderTemplate �� .R��� .+��� $
��Bold"�  �� Padding$  3q����� $ Topic.Chapter�!   ContainerStyle! �� " ��.���  � �� �� " �� 
TargetType"" ��.R�� $��Stretch=� �� $
��auto ��� $��* ��� $
��auto �.+��� $��5q�$��0��$��2�����	#FF9A67EA9� $��1��# 9� 
IsExpanded# .  $��Stretch=����� .+��� $	 
Horizontal=�.+���  $  MaterialDesignHeadline6TextBlock#��[ $
��Wrap=����� $ 
Name.Title��� $��10 0 0 0q� $  MaterialDesignSubtitle2TextBlock#���  ���� $ 	ItemCount�$ �� StringFormat$$ {0} вопросов��.���� �� $��5q�$��2��$��2�����	#FF9A67EA  ! �� " ��.���  � �� �� "" ��.R�� $��Stretch=�.+�9� $��1��# .  $��Stretch=����� .+��� $	 
Horizontal=�$��5 0 5 0q�$��Stretch=�.+��� #��[ $��Stretch=����� $ 
Name.Title�$$ Тема: {0}���� $��10 0 0 0q�#���  $��Stretch=����� $ 	ItemCount�$$ {0} вопросов��.���� $��	 10 0 0 0q��� -   % ��Name$% TextBlockCount��$��2��$	��300��$
��Left=�