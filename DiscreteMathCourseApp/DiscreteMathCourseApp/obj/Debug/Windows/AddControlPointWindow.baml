   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  5   	   9    3DiscreteMathCourseApp.Windows.AddControlPointWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   7local+clr-namespace:DiscreteMathCourseApp.Windows  5   	     � Title$:  4Добавление и редактирование��5
         MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	    � WindowStartupLocation$ CenterScreen=�5   	   $	��600��5   	   $	��800��5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      �� 5      $��10 �6   �� 5      $��40 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5       .+�5"   
   �� $��5��6    �� Orientation$ 
Horizontal=�6#   $��2��6<   $��Center=�6P   .+�5#      �� -   5         ��Name$ BtnSave��5#      $��5��6&   $��Сохранить��63     MaterialDesignFlatButton#��[ 6G    �� 	IsDefault . $��Center=�5$      $	��Top=�6.   $	��120��6F   $��2��5%   '   �� 5&      -   5        $ 	BtnCancel��5&      $��5��6(   $��Отменить��65   #��[ 6I   $��Center=�5'      $	��Top=�6.   $	��120��6F   	 �� IsCancel	 . $��2��5(   !   5)      �� 5*   
   $��0��6   $��0��6!   $0��*Загрузить файл задания��61   $
��20 0q�6P   �� 5+   
   -   5        
 ��Name$
 TextBoxTaskLink��5+      $��0��5,      $��1��6    �� Padding$	 0,2q�6/   $
��Auto��6=   $��	0 0 130 0q�6K   ��5+   -   �� *
TaskLink+5,   K   �� 5-   
   -   5         ��Name$ TextBoxTaskTitle��5-      $��Stretch=�6G   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Задание��6c   $��Stretch=�5.       �� TextWrapping$
 Wrap=�60   $
��10 0q�6D   $	��Top=�5/      $��Stretch=�50      $��1��51      $��0��6   $��2��6/   $	��0,2q�6C   $
��Auto��6Q   ��5-   ,   �� *	TaskTitle+51   Q   �� 53   
   $ 
Horizontal=�6   $��0��6.   $��1��6;   $��Right=�6K   $��Center=�6g   .+�54      �� -   5        $ BtnLoadTaskFile��54   y   #��[ 6G    � ToolTip$ Загрузить��6�   $��40��6�   $��0q�6�   ��6   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Upload=�55      �� 56      -   5        $ BtnDeleteFile��56   y   #��[ 6G   $ Удалить��6�   $��40��6�   $��0q�6�   ��6     $ Delete=�57      �� 58      -   5        $ BtnViewFile��58   v   #��[ 6D   $ Посмотреть��6�   $��40��6�   $��0q�6�   ��6     $	 Eye=�59      5:      �� 5=   
   $ 
Horizontal=�6   $��3��6.   $��1��6;   $��Right=�6K   $��Center=�6g   .+�5>      �� -   5        $ BtnLoadAnswerFile��5>   z   #��[ 6H   $ Загрузить��6�   $��40��6�   $��0q�6�   ��6     $ Upload=�5?      �� 5@      -	   5        $ BtnDeleteAnswerFile��5@   y   #��[ 6G   $ Удалить��6�   $��40��6�   $��0q�6�   ��6     $ Delete=�5A      �� 5B      -
   5        $ BtnViewAnswerFile��5B   v   #��[ 6D   $ Посмотреть��6�   $��40��6�   $��0q�6�   ��6     $	 Eye=�5C      5D      �� 5E   
   $��3��6   $��0��6!   $.��(Загрузить файл ответа��61   $
��20 0q�6O   �� 5F   
   -   5        $
 TextBoxAnswerLink��5F      $��3��5G      $��1��6   $	 0,2q�6/   $
��Auto��6=   $��	0 0 130 0q�6K   ��5F   /   �� *
AnswerLink+5G   K   �� 5H   
   -   5        $ TextBoxAnswerTitle��5H      $��Stretch=�6K   $��Stretch=�5I      $
 Wrap=�60   $	��Top=�5J      $ 
Ответ��62   $��Stretch=�5K      $��4��5L      $��0��6   $��2��6/   $
��10 0q�6C   $	��0,2q�6Q   $
��Auto��6_   ��5H   .   �� *AnswerTitle+5L   _   �� 5M   
   ���	#FF673AB7$��10��6%   $��2��62   $��2��6@   5N      5O      