   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  9    3DiscreteMathCourseApp.Windows.AddControlPointWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  7local+clr-namespace:DiscreteMathCourseApp.Windows    � Title$:  4Добавление и редактирование��   MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=� � WindowStartupLocation$ CenterScreen=�$	��600��$	��800��  MaterialDesignPaper#���    MaterialDesignFont#���  .���  � RowDefinitions �� $��40 ��� �� $��10 ��� $��40 ��� �� $��40 � � ColumnDefinitions �� $	��200 ��� .+��� $��5�� �� Orientation$ 
Horizontal=�$��2��$��Center=�.+��� -    ��Name$ BtnSave��$��5��$��Сохранить��  MaterialDesignFlatButton#��[  �� 	IsDefault . $��Center=�$	��Top=�$	��120��$��2���� -   $ 	BtnCancel��$��5��$��Отменить��#��[ $��Center=�$	��Top=�$	��120��	 �� IsCancel	 . $��2���� $��0��$��0��$0��*Загрузить файл задания��$
��20 0q��� -   
 ��Name$
 TextBoxTaskLink��$��0��$��1�� �� Padding$	 0,2q�$
��Auto��$��	0 0 130 0q����� *
TaskLink+�� -    ��Name$ TextBoxTaskTitle��$��Stretch=�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Задание��$��Stretch=� �� TextWrapping$
 Wrap=�$
��10 0q�$	��Top=�$��Stretch=�$��1��$��0��$��2��$	��0,2q�$
��Auto������ *	TaskTitle+�� $ 
Horizontal=�$��0��$��1��$��Right=�$��Center=�.+��� -   $ BtnLoadTaskFile��#��[  � ToolTip$ Загрузить��$��40��$��0q���0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Upload=��� -   $ BtnDeleteFile��#��[ $ Удалить��$��40��$��0q���  $ Delete=��� -   $ BtnViewFile��#��[ $ Посмотреть��$��40��$��0q���  $	 Eye=��� $ 
Horizontal=�$��3��$��1��$��Right=�$��Center=�.+��� -   $ BtnLoadAnswerFile��#��[ $ Загрузить��$��40��$��0q���  $ Upload=��� -	   $ BtnDeleteAnswerFile��#��[ $ Удалить��$��40��$��0q���  $ Delete=��� -
   $ BtnViewAnswerFile��#��[ $ Посмотреть��$��40��$��0q���  $	 Eye=��� $��3��$��0��$.��(Загрузить файл ответа��$
��20 0q��� -   $
 TextBoxAnswerLink��$��3��$��1��$	 0,2q�$
��Auto��$��	0 0 130 0q����� *
AnswerLink+�� -   $ TextBoxAnswerTitle��$��Stretch=�$��Stretch=�$
 Wrap=�$	��Top=�$ 
Ответ��$��Stretch=�$��4��$��0��$��2��$
��10 0q�$	��0,2q�$
��Auto������ *AnswerTitle+�� ���	#FF673AB7$��10��$��2��$��2��