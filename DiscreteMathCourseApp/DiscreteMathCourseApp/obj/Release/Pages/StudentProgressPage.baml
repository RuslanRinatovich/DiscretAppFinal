   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf 5    /DiscreteMathCourseApp.Pages.StudentProgressPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:DiscreteMathCourseApp.Pages     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  >lvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf  -      MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �   N� Title$ Темы��.���  � RowDefinitions �� $
��auto ��� �� $��40 ��� $
��auto �.+�(  "MaterialDesignThemes.Wpf.ColorZone  $��5q�   Mode$ Light=�.��� $��Stretch=� � ColumnDefinitions �� $
��auto ��� $
��auto ��� $	��300 ��� $��* ��� $��* � �� $��40 ��� $��40 ��� $��40 �.+��� -    ��Name$ BtnExcel��$��0��$��2��	 � ToolTip$*	 $Вывести данные в Excel��   MaterialDesignFlatDarkButton#���  ��0  *MaterialDesignThemes.Wpf.PackIconExtension  
   Kind$
 MicrosoftExcel=��� -   $ BtnTasks��$��0��$��0��$	 Задaния��#���  ��  $
 TaskAdd=��� -   $ BtnTests��$��0��$��1��$	 
Тесты��#���  ��  $
 FormatListChecks=��� -    ��Name$ TextBlockMaterials��$��0��$��2�� $  MaterialDesignSubtitle1TextBlock#���  $��10 0 q�$��Center=��� -   $ TextBlockTasks��$��1��$��2��#���  $��10 0 q�$��Center=��� -   $ TextBlockTests��$��2��$��2��#���  $��10 0 q�$��Center=��� -   $ TextBlockUserName��$��0��$��3�� $  MaterialDesignHeadline6TextBlock#���  $��10 0 q�$��Center=��� -	   $ TextBlockGroup��$��1��$��3��#���  $��10 0 q�$��Center=�  LiveCharts.Wpf.Gauge  -
     Name$ GaugeTotalStats��$��0��$��1��$��3��   Uses360Mode .    From$ 0Q�	   To$	 100Q�   Value$ 99Q�$	��120��$	��120��$��Right=�   GaugeActiveFill �� .���  � Color$ 	#FFDDC9FF�� � Offset$	 0.0Q�� $ 	#FFC19EFF��$	 0.5Q�� $ 	#FF604395��$	 1.0Q��� $��4��$��3��$��Stretch=�$��Right=� �� Orientation$ Vertical=�.+��� -    ��Name$ 
TBoxSearch��$	��275��$��0��$��0��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$> 8Введите название темы, раздела���� -    ��Name$ ComboChapter��$	��275��$��14(�$��3q�$��1��$��0��$# Выберите раздел�� �� DisplayMemberPath$ Title���� -   $ ComboTopicType��$	��275��$��14(�$��3q�$��2��$��0��$, &Выберите тип занятия��$ Title���� -   $ 	ComboSort��$	��275��$ Сортировать��$��3��$��0��$��3 0 0 0q�.@��� .���� $ 
Horizontal=�.+��� $��Название��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ SortAscending=�$��5 0 0 0q��� .���� $ 
Horizontal=�.+��� $��Название��  $ SortDescending=�$��5 0 0 0q�&   System.Windows.Controls.DataGrid  -     Name$ DataGridData��$��1��   AutoGenerateColumns .     
IsReadOnly . $��Stretch=�   SelectionMode$ Single=�����  � 	Resources )  #System.Windows.Controls.DataGridRow �� 
TargetType  �� Property! �� Value  WrapText 	 First 	 Align��%&  '        &	 0     &	 ~     &	 �     �� "  .���   � ��! �� *
GetColor+�� " ��.���   � ��$
! Wrap=���   �@��TextAlignment$! Justify=��� " ��.���   � ��$
! Wrap=���   �@��TextAlignment$
! Left=��� " ��.���   �@��TextAlignment$! Center=�"   Columns" 0	  *System.Windows.Controls.DataGridTextColumn	  ,
  &System.Windows.Controls.DataGridColumn# 
  Header$	# №��$ 
  Width5  /System.Windows.Controls.DataGridLengthConverter$$ 60 1  +System.Windows.Controls.DataGridBoundColumn%   Binding% �� *IndexNumber+	  $# Название��$$ * &   ElementStyle#& [ % �� *Title+	  $%# Количество часов��$
$ auto #& [ % �� *
TotalHours+	  $# Тип занятия��$
$ auto % �� *TopicType.Title+	  $# Изучено��$	$ 200 #& [ % �� *	GetData+4  .System.Windows.Controls.DataGridTemplateColumn  $	$ 100 $# Изучено %��'   CellTemplate' �� .R�   . $ 0Q�$	 100Q�(   HighFontSize$( 12X�
���   �)   InnerRadius$) 20X�*   GaugeBackground* �	#FFDDC9FF+   	FromColor$+ 	#FF673AB7��,   ToColor$, 	#FF673AB7�� �� *GetProgress+- �� 
GroupStyle- (  "System.Windows.Controls.GroupStyle  .   HeaderTemplate. �� .R��� .+��� $
��Bold"�/ �� Padding$/ 3q����� 0 �� Path$0 Chapter�1   ContainerStyle1 �� " ��.���   � ��! �� 2 �� 
TargetType"2 ��.R�� $��Stretch=� �� $
��auto ��� $��* ��� $
��auto �.+��� $��5q�$��0��$��2�����	#FF9A67EA9� $��1��3 9� 
IsExpanded3 . ���� .+��� $ 
Horizontal=�.+��� #��[ ���� $0 
Name.Title��� $��10 0 0 0q� $	  MaterialDesignSubtitle2TextBlock#��� 	 ���� $0 	ItemCount�4 �� StringFormat$4 
{0} тем���� #��� 	 ���� $0 Name.GetTotalHours�.���� �� $��5q�$��2��$��2�����	#FF9A67EA�� -   $ TextBlockCount��$��3��$	��300��$
��Left=��� -   5 ��Name$5 StatusBarStatistics��$��2��.@��� .���� -   $��TextBoxStats��  
 MaterialDesignBody1TextBlock#��� 
 $��	 10 0 0 0q�