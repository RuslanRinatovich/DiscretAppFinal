   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  5   	   1    +DiscreteMathCourseApp.Windows.AddTestWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   =local+clr-namespace:DiscreteMathCourseApp.Windows     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   !   $	��450��6   $	��800��6     � Title$%  Добавление теста��5	   	      MaterialDesignBody#���   5
   	   $��Regular"�5   	   $��14(�5   	    � WindowStartupLocation$ CenterScreen=�5      $	��450��5   	   $	��800��5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��50 �6   �� 5      $��20 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      .+�5    
   �� -   5         ��Name$ BtnSave��5       $��4��6"   $��Сохранить��6/   $��Center=�5!      $	��Top=�6.   $	��120��6F   $��1��5"   '     MaterialDesignFlatButton#��[ 68   $��213,3,222,0q�6j   �� 5#   
   -   5         ��Name$ TextBoxTitle��5#      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$# Заголовок теста��6?     MaterialDesignTextBox#���  5$      $��0��5&      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5#   (   �� *Title+5&   =   �� 5'   
   -   5        $ TextBoxProductDescription��5'      $��Stretch=�6S   $��Stretch=�5(      	 �� TextWrapping$
	 Wrap=�60   $ Описание��6F   $	��Top=�5)      #���  62   $��Stretch=�5*      $��1��5+      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5'   5   �� *Description+5+   =   �� 5-   
   ���	#FF9A67EA$��2��6&   �� 5.   
   $��2��6   $��Вопросы��6"    $  MaterialDesignSubtitle2TextBlock#���  61   
�������$��Center=�6   �� 5/   
   -   5        
 ��Name$
 ListBoxQuestions��5/      $��Visible=�50      $��3��51      $��0��6#     	good_item#���  52      $��0 0 50 0q�6C   ��54      �� 55      .R�56      � $��Stretch=�6    � UseLayoutRounding .  57      �� 58      $��50 �6/   �� 59      $��* �6/   �� 5:      $��50 �6/   �� 5;      $��50 �6/   �� 5<      $��50 �6/   .+�5@      �� $��16(�6%   $
��Bold"�63   $��0��6E   $
��Wrap=�5A   a   $
��Auto��5B   (   $
��Left=�65   $��Center=�6P   ��5A   (   ��  �� Path$ IndexNumber� �� StringFormat$ №: {0}��5B   P   �� 5C      $��16(�6%   $
��Bold"�63   $��1��6E   $
��Wrap=�5D   M   $
��Auto��5E   (   $
��Left=�65   $��Center=�6P   ��5D   (   �� $ Question.Title�5E   P   �� 5G      $ BtnUpQuestion��6T   -   5         � ToolTip$ 
Вверх��5G   k   $��2��5H   #   $��40��63   $��0q�6>   $��Center=�6[   $��Center=�5I      ��5G   #   0  *MaterialDesignThemes.Wpf.PackIconExtension  *ArrowUpBold+5I   .   �� 5K      $ BtnDownQuestion��6V   -   5        $ Вниз��5K   o   $��3��5L   #   $��40��63   $��0q�6>   $��Center=�5M      $��Center=�5N      ��5K   #     *ArrowDownBold+5N   .   �� 5P      $ BtnDeleteItem��6S   -   5         # MaterialDesignFlatLightBgButton#���  5Q   #   $��Right=�6]   $��Center=�5R      $��4��6.   $ Удалить��6>   $��40��5S   $   $��0q�6/   ��5P   #        Kind$ Delete=�5S   ;   5U      5V      5Y      �� 5[   
   $��3��6   .+�5\      �� -   5        $ BtnAddQuestion��5\   @   $ Добавить��6X   $��7��6k   $��1��6x   $��40��6�   $��0q�6�   $��Right=�5]      #��[ 60   $	��Top=�5^      ��5\        *Add+5^   +   5_      5`      5a      