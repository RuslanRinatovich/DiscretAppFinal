   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  0    *DiscreteMathCourseApp.Pages.TopicLearnPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5local)clr-namespace:DiscreteMathCourseApp.Pages  -     N� Title$  Тема��   MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �  .���  � RowDefinitions �� $��40 ��� $	��160 ��� $��40 ��� �� $��40 �.+�� -    �Name$ TopicProgress��$��20��
�������
��� � �$��5 0 5 0q��� -    ��Name$ TextBlockPercent��$y�Hidden=��� -   $ TextBlockTopic��$��1��$��0��$
��10 0q� $  MaterialDesignSubtitle1TextBlock#��[ $
��Wrap=����� *GetAllInformation+�� $��3��$��2��$��Disabled=�$
��Auto=�.���  �� $��20 ��� �� $��20 ��� $��34 ��� �� $��20 ��� .+��� ���	#FF9A67EA$��0���� $��0��$%��Материал занятия�� $  MaterialDesignSubtitle2TextBlock#���  
�������$��Center=��� -    ��Name$ ListBoxTopicContents��$��Visible=�$��Stretch=�$��1������ 	 �� 
TargetType"	 ��.��� 
 �� Property
 � �� �� Value �� *
GetColor+���� .R�� $��Stretch=� � UseLayoutRounding .  � ColumnDefinitions �� $��60 ��� $��* ��� $��40 ��� $��60 �.+��� $��0��$��60��$��40��$��Uniform=�$��5 0 5 0q�����  �� Path$ GetIcon��� $��1��.+��� $��2q�$��16(�$
��Auto��$
��Left=����� $ 
TopicTitle��� $��2q�$��16(�$
��Auto��$
��Left=����� $ IndexNumber� �� StringFormat$ №: {0}����  ��Name$ BtnEye��-    � ToolTip$ Просмотр��$��2��$��40��$��0q�  MaterialDesignFlatButton#��[ $��Right=�$��Center=���0  *MaterialDesignThemes.Wpf.PackIconExtension  *Eye+d� -   $��3��$��NO�� $  MaterialDesignActionToggleButton#��[ $ Изучил�� d� 	IsChecked �� *	IsStudied+ �� Mode$ OneWay=��� ���	#FF9A67EA$��2���� $��2��$��Задания��#���  
�������$��Center=��� -   $��3��$����Гаврилов Г.П., Сапоженко А.А. - Задачи и упражнения по дискретной математике ��$��1q�
���   ����	#FF9A67EA�� -	   $ ListBoxControlPoints��$��Visible=�$��Stretch=�$��4������ "	 ��.��� 
 � �� �� *
GetColor+���� .R�� $��Stretch=� .  �� $��* ��� $��40 ��� $��60 �.+��� $��0��.+��� $��2q�$��16(�$
��Auto��$
��Left=����� $ IndexNumber�$ Задание №: {0}���� $��2q�$��16(�$
��Bold"�$
��Auto��$
��Left=����� $ 	TaskTitle��� $��2q�$��16(�$
��Auto��$
��Left=����� $ AnswerTitle��� $ BtnEyeControlPoint��-
   $ Просмотр��$��1��$��40��$��0q�$��Right=�$��Center=���  *Eye+�� $��2q�$��16(�$
��Bold"�$��2��$
��Auto��$��Center=�$��Center=����� *	GetBall+�� ���	#FF9A67EA$��5���� $��5��$��
Тесты��#���  
�������$��Center=��� -   $ ListBoxTests��$��Visible=�$��Stretch=�$��6������ "	 ��.��� 
 � �� �� *
GetColor+���� .R�� $��Stretch=� .  �� $��* ��� $��40 ��� $��60 �.+��� $��0��.+��� $��2q�$��16(�$
��Auto��$
��Left=����� $ IndexNumber�$ Тест №: {0}���� $��2q�$��16(�$
��Bold"�$
��Auto��$
��Left=����� $ Title��� $ 
BtnEyeTest��-   $ Просмотр��$��1��$��40��$��0q�$��Right=�$��Center=���  *Eye+�� $��2q�$��16(�$
��Bold"�$��2��$
��Auto��$��Center=�$��Center=����� *	GetResult+$
 {0}%��