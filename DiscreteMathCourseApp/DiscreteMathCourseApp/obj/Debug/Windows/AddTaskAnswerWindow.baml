   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  5   	   7    1DiscreteMathCourseApp.Windows.AddTaskAnswerWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   =local+clr-namespace:DiscreteMathCourseApp.Windows     5   	   X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	     � WindowStartupLocation$  CenterScreen=�5
      $	��600��5   	   $	��800��5   	    � Title$* $Ответить на задание��5         MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      �� 5      $
��auto �6   �� 5      $
��Auto �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5       .+�5"   
   �� $��5��6    �� Orientation$ 
Horizontal=�6#   $��2��6<   $��Center=�6P   .+�5#      �� -   5         ��Name$ BtnSave��5#      $��5��6&   $��Сохранить��63     MaterialDesignFlatButton#��[ 6G    �� 	IsDefault . $��Center=�5$      $	��Top=�6.   $	��120��6F   $��2��5%   '   �� 5&      -   5        $ 	BtnCancel��5&      $��5��6(   $��Отменить��65   #��[ 6J   $��Center=�5'      $	��Top=�6.   $	��120��6F   	 �� IsCancel	 . $��2��5(   !   5)      �� 5*   
   $��0��6   $��0��6!   $��файл задания��61   $��	20,0,67,0q�6F   $��Center=�6Y   �� 5+   
   -   5        
 ��Name$
 TextBlockResult��5+   1   $��0��6   $��1��6!   $��Right=�6J   $��Stretch=�6f      MaterialDesignBody2TextBlock#���  6�   $
��20 0q�6�   �� 5-   
   -   5        $
 TextBlockTaskTitle��5-      $��Stretch=�61   $��Stretch=�5.      $
��Wrap=�60   $��1��5/      $��0��6   $��2��6/    �� Padding$	 0,2q�6C   $
��Auto��6Q   �� 51   
   -   5        $ BtnViewFile��51   �   #��[ 6@   $��0��6s   $��0��6�   $��Right=�6�    � ToolTip$ Посмотреть��6�   $��40��6�   $��0q�6�   ��6   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$	 Eye=�52      �� 54   
   $ 
Horizontal=�6   $��3��6.   $��1��6;   $��Right=�6K   $	��Top=�6g   .+�55      �� -   5        $ BtnLoadAnswerFile��55   y   #��[ 6G   $ Загрузить��6�   $��40��6�   $��0q�6�   ��6     $ Upload=�56      �� 57      -   5        $ BtnDeleteAnswerFile��57   y   #��[ 6G   $ Удалить��6�   $��40��6�   $��0q�6�   ��6     $ Delete=�58      �� 59      -   5        $ BtnViewAnswerFile��59   w   #��[ 6E   $ Посмотреть��6�   $��40��6�   $��0q�6�   ��6     $	 Eye=�5:      5;      �� 5<   
   $��3��6   $��0��6!   $.��(Загрузить файл ответа��61   $
��20 0q�6O   $��Center=�6]   �� 5=   
   -	   5        $
 TextBlockAnswerLink��5=      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Файл ответа��6M   $��3��5>      $��1��6   $	 0,2q�6/   $
��Auto��6=   $��	0 0 130 0q�6K   ��5=   1   �� *
AnswerLink+5>   K   �� 5?   
   -
   5         ��Name$ TextBoxAnswerTitle��5?      $��Stretch=�6F   $ 
Ответ��6b   $��Stretch=�5@       �� TextWrapping$
 Wrap=�60   $
��10 0q�6E   $	��Top=�5A      $��Stretch=�5B      $��4��5C      $��0��6   $��2��6/   $	��0,2q�6C   ��5?   .   �� *Answer+5C   C   �� 5E   
   ���	#FF673AB7$��10��6%   $��2��62   $��2��6@   5F      5G      