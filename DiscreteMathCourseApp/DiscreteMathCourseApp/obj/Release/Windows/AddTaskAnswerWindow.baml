   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  7    1DiscreteMathCourseApp.Windows.AddTaskAnswerWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     =local+clr-namespace:DiscreteMathCourseApp.Windows     X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes    � WindowStartupLocation$  CenterScreen=�$	��600��$	��800�� � Title$* $Ответить на задание��   MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper#���    MaterialDesignFont#���  .���  � RowDefinitions �� $��40 ��� �� $
��auto ��� $
��Auto ��� �� $��40 � � ColumnDefinitions �� $	��200 ��� .+��� $��5�� �� Orientation$ 
Horizontal=�$��2��$��Center=�.+��� -    ��Name$ BtnSave��$��5��$��Сохранить��  MaterialDesignFlatButton#��[  �� 	IsDefault . $��Center=�$	��Top=�$	��120��$��2���� -   $ 	BtnCancel��$��5��$��Отменить��#��[ $��Center=�$	��Top=�$	��120��	 �� IsCancel	 . $��2���� $��0��$��0��$��файл задания��$��	20,0,67,0q�$��Center=��� -   
 ��Name$
 TextBlockResult��$��0��$��1��$��Right=�$��Stretch=�   MaterialDesignBody2TextBlock#���  $
��20 0q��� -   $
 TextBlockTaskTitle��$��Stretch=�$��Stretch=�$
��Wrap=�$��1��$��0��$��2�� �� Padding$	 0,2q�$
��Auto���� -   $ BtnViewFile��#��[ $��0��$��0��$��Right=� � ToolTip$ Посмотреть��$��40��$��0q���0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$	 Eye=��� $ 
Horizontal=�$��3��$��1��$��Right=�$	��Top=�.+��� -   $ BtnLoadAnswerFile��#��[ $ Загрузить��$��40��$��0q���  $ Upload=��� -   $ BtnDeleteAnswerFile��#��[ $ Удалить��$��40��$��0q���  $ Delete=��� -   $ BtnViewAnswerFile��#��[ $ Посмотреть��$��40��$��0q���  $	 Eye=��� $��3��$��0��$.��(Загрузить файл ответа��$
��20 0q�$��Center=��� -	   $
 TextBlockAnswerLink��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Файл ответа��$��3��$��1��$	 0,2q�$
��Auto��$��	0 0 130 0q����� *
AnswerLink+�� -
    ��Name$ TextBoxAnswerTitle��$��Stretch=�$ 
Ответ��$��Stretch=� �� TextWrapping$
 Wrap=�$
��10 0q�$	��Top=�$��Stretch=�$��4��$��0��$��2��$	��0,2q����� *Answer+�� ���	#FF673AB7$��10��$��2��$��2��