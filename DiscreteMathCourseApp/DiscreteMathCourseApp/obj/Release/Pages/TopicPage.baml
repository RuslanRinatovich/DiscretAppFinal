   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  +    %DiscreteMathCourseApp.Pages.TopicPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:DiscreteMathCourseApp.Pages     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -      MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �   N� Title$ Темы��.���  � RowDefinitions �� $
��auto ��� �� $��40 ��� $
��auto �.+�� $��0��$��Stretch=�.+��� -    ��Name$ 
TBoxSearch��$	��275��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$> 8Введите название темы, раздела���� -    ��Name$ ComboChapter��$	��275��$��14(�$��3q�$# Выберите раздел��	 �� DisplayMemberPath$	 Title���� -   $ ComboTopicType��$	��275��$��14(�$��3q�$, &Выберите тип занятия��$	 Title���� -   $ 	ComboSort��$	��275��$ Сортировать��$��10 0 0 0q�.@��� .���� 
 �� Orientation$
 
Horizontal=�.+��� $��Название��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ SortAscending=�$��5 0 0 0q��� .���� $
 
Horizontal=�.+��� $��Название��  $ SortDescending=�$��5 0 0 0q�&   System.Windows.Controls.DataGrid  -     Name$ DataGridData��$��1��   AutoGenerateColumns .     
IsReadOnly . $��Stretch=�   SelectionMode$ Single=�����  � 	Resources  �� 
TargetType  WrapText �� Property �� Value 	 First��%�   &	       &	 N     �� " ��.���  � ��$
 Wrap=���  �@��TextAlignment$ Justify=��� " ��.���  � ��$
 Wrap=���  �@��TextAlignment$
 Left=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$	 №��   Width5  /System.Windows.Controls.DataGridLengthConverter$ 60 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *IndexNumber+  $ Название��$ *    ElementStyle# [  �� *Title+  $% Количество часов��# [ $
 auto  �� *
TotalHours+  $ Тип занятия��$
 auto  �� *TopicType.Title+4	  .System.Windows.Controls.DataGridTemplateColumn	  $
 auto  	  CellTemplate �� .R���  ��Name$ BtnUp��-   $��Center=�  MaterialDesignFlatButton#��[  � ToolTip$ 
Вверх��$��40����0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$ ArrowUpBold=� 
  Size$ 20X�	  $
 auto  �� .R��� $ BtnDown��-   $��Center=�#��[ $ Вниз��$��40����
  $ ArrowDownBold=�$ 20X�	  $
 auto  �� .R��� $ BtnEdit��-	   $��Center=�#��[ $ Изменить��$��40����
  $
 Edit=�$ 20X�	  $
 auto  �� .R��� $ 	BtnDelete��-
   $��Center=�#��[ $ Удалить��$��40����
  $ Delete=�$ 20X� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     HeaderTemplate �� .R��� .+��� $
��Bold"�  �� Padding$  3q����� ! �� Path$! Chapter�"   ContainerStyle" �� " ��.���  � �� �� # �� 
TargetType"# ��.R�� $��Stretch=� �� $
��auto ��� $��* ��� $
��auto �.+��� $��5q�$��0��$��2�����	#FF9A67EA9� $��1��$ 9� 
IsExpanded$ . ���� .+��� $
 
Horizontal=�.+���  $  MaterialDesignHeadline6TextBlock#��[ ���� $! 
Name.Title��� $��10 0 0 0q� $  MaterialDesignSubtitle2TextBlock#���  ���� $! 	ItemCount�% �� StringFormat$% 
{0} тем���� #���  ���� $! Name.GetTotalHours�.���� �� $��5q�$��2��$��2�����	#FF9A67EA�� $��3��$��Right=�$
 
Horizontal=�.+��� -   $ BtnTopicType��$��3��$
��auto��$��5q�#��[ $��Типы занятий���� -   $ BtnChapters��$��3��$
��auto��$��5q�#��[ $��Разделы���� -   $ BtnAdd��$	��100��$��5q�#��[ $��Добавить���� -   & ��Name$& TextBlockCount��$��3��$	��300��$
��Left=��� -   ' ��Name$' StatusBarStatistics��$��2��.@��� .���� -   $��TextBoxStats��   MaterialDesignBody1TextBlock#���  $��	 10 0 0 0q�