   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  .    (DiscreteMathCourseApp.Pages.AddTopicPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5local)clr-namespace:DiscreteMathCourseApp.Pages    N� Title$  Тема��   MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �  .���  � RowDefinitions �� $��30 ��� $
��Auto ��� $
��auto ��� $��80 ��� $��80 ��� $��20 ��� �� $��40 � � ColumnDefinitions �� $	��245 ��� .+��� -    ��Name$ BtnSave��$��13��$��Сохранить��  MaterialDesignFlatButton#��[ $��Center=�$	��Top=�$	��120��$��2���� $��0��$��0��$)��#Порядковый номер №��$
��20 0q��� $��3��$��0��$��Название темы��$
��20 0q��� $��4��$��0��$��Описание��$
��20 0q��� -    ��Name$ TextBoxTitle��$��3��$��1��$	��0,2q�$
��Auto������ *Title+�� -   $ TextBoxProductDescription��$��Stretch=�$��Stretch=�	 �� TextWrapping$
	 Wrap=�$	��Top=�$��Stretch=�$��4��$��1��$	��0,2q�$
��Auto������ *Description+%  Xceed.Wpf.Toolkit.IntegerUpDown  -   
  Name$
 UpDownIndexNumber��$�� 0��$��1���  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 1X�   Value �� *IndexNumber+�� $��5��$��0��$%��Количество часов��$
��20 0q�  -   $
 UpDownTotalHours��$��5��$��1��$ 1X� �� *
TotalHours+�� $��1��$��0��$��Раздел��$
��20 0q��� -    ��Name$ ComboChapter��$��1��$��1�� �� DisplayMemberPath$ Title�� �� SelectedValuePath$ Id�� �� SelectedItem �� *	Chapter+�� $��2��$��0��$��Тип занятия��$
��20 0q��� -   $ ComboTopicType��$��2��$��1��$ Title��$ Id�� �� *	TopicType+�� $��6��$��2��$��Disabled=�$
��Auto=�.���  �� $��20 ��� �� $��20 ��� �� $��20 ��� .+��� ���	#FF9A67EA$��0���� $��0��$%��Материал занятия�� $  MaterialDesignSubtitle2TextBlock#���  
�������$��Center=��� -    ��Name$ ListBoxTopicContents��$��Visible=�$��Stretch=�$��1��$��0 0 40 0q����� .R�� $��Stretch=� � UseLayoutRounding .  �� $��60 ��� $��* ��� $��40 ��� $��40 ��� $��40 ��� $��40 �.+��� $��0��$��60��$��40��$��Uniform=�$��5 0 5 0q�����  �� Path$ GetIcon��� $��1��.+��� $��2q�$��16(�$
��Auto��$
��Left=����� $ 
TopicTitle��� $��2q�$��16(�$
��Auto��$
��Left=����� $ IndexNumber� �� StringFormat$ №: {0}���� $ BtnUp��-	    � ToolTip$ 
Вверх��$��3��$��40��$��0q�$��Right=�$��Center=���0  *MaterialDesignThemes.Wpf.PackIconExtension  *ArrowUpBold+�� $ BtnDown��-
   $ Вниз��$��2��$��40��$��0q�$��Right=�$��Center=���  *ArrowDownBold+�� $ BtnEye��-   $ Просмотр��$��4��$��40��$��0q�$��Right=�$��Center=���  *Eye+�� $ BtnDeleteTopicContent��-   $ Удалить��$��5��$��40��$��0q�$��Right=�$��Center=���  *Delete+�� -   $ BtnAddTopicContent��#��[ $ Добавить��$��1��$��40��$��0q�$��Right=�$	��Top=���  *Add+�� ���	#FF9A67EA$��2���� $��2��$��Задания��#���  
�������$��Center=��� -   $ ListBoxControlPoints��$��Visible=�$��Stretch=�$ AgentId��$��3��$��0 0 40 0q����� .R�� $��Stretch=� .  �� $��* ��� $��40 ��� $��40 ��� $��40 ��� $��40 �.+��� $��0��.+��� $��2q�$��16(�$
��Auto��$
��Left=����� $ IndexNumber�$ Задание №: {0}���� $��2q�$��16(�$
��Bold"�$
��Auto��$
��Left=����� $ 	TaskTitle��� $��2q�$��16(�$
��Auto��$
��Left=����� $ AnswerTitle��� $ BtnUpControlPoint��-   $ 
Вверх��$��2��$��40��$��0q�$��Right=�$��Center=���  *ArrowUpBold+�� $ BtnDownControlPoint��-   $ Вниз��$��1��$��40��$��0q�$��Right=�$��Center=���  *ArrowDownBold+�� $ BtnEyeControlPoint��-   $ Изменить��$��3��$��40��$��0q�$��Right=�$��Center=���  *Edit+�� $ BtnDeleteControlPoint��-   $ Удалить��$��4��$��40��$��0q�$��Right=�$��Center=���  *Delete+�� -   $ BtnAddControlPoint��#��[ $ Добавить��$��3��$��40��$��0q�$��Right=�$	��Top=���  *Add+�� ���	#FF9A67EA$��4���� $��4��$��
Тесты��#���  
�������$��Center=��� -   $ ListBoxTests��$��Visible=�$��Stretch=�$ AgentId��$��5��$��0 0 40 0q����� .R�� $��Stretch=� .  �� $��* ��� $��40 ��� $��40 ��� $��40 ��� $��40 �.+��� $��0��.+��� $��2q�$��16(�$
��Auto��$
��Left=����� $ IndexNumber�$ Тест №: {0}���� $��2q�$��16(�$
��Bold"�$
��Auto��$
��Left=����� $ Title��� $ 	BtnUpTest��-   $ 
Вверх��$��2��$��40��$��0q�$��Right=�$��Center=���  *ArrowUpBold+�� $ BtnDownTest��-   $ Вниз��$��1��$��40��$��0q�$��Right=�$��Center=���  *ArrowDownBold+�� $ 
BtnEyeTest��-   $ Изменить��$��3��$��40��$��0q�$��Right=�$��Center=���  *Edit+�� $ BtnDeleteTest��-   $ Удалить��$��4��$��40��$��0q�$��Right=�$��Center=���  *Delete+�� -   $ 
BtnAddTest��#��[ $ Добавить��$��5��$��40��$��0q�$��Right=�$	��Top=���  *Add+