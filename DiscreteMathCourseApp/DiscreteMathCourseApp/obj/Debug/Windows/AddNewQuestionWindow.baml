   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  5   	   8    2DiscreteMathCourseApp.Windows.AddNewQuestionWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   =local+clr-namespace:DiscreteMathCourseApp.Windows     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5          � WindowStartupLocation$  CenterScreen=�5	   
   $	��600��5
   	   $	��800��5   	    � Title$ Вопрос��5   	      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $	��200 �6   �� 5      $	��100 �6   �� 5      $��40 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      .+�5    
   �� -   5         ��Name$ BtnSave��5       $��4��6"   $��Сохранить��6/     MaterialDesignFlatButton#��[ 6F   $��Center=�5!      $	��Top=�6.   $	��120��6F   $��1��5"   '   $��213,3,222,0q�67   �� 5#   
   -   5         ��Name$ 
ImagePhoto��5#      $��0��5$      $��1��6   $	��200��6-   $��Stretch=�5%      $��Right=�6,   $��0 0 0 40q�6H   ��5#   $   �� *
GetImage+5%   H   � 5'   
   $��2��6   $��0��6   $��2��6,    5(      �� 5)      $	��300 �6#   �� 5*      .+�5,      �� -   5         ��Name$ ComboChapter��5,      $��14(�6.   $��3q�6<   $��0��6H   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$#	 Выберите раздел��5-      $��5q�6H   
 �� DisplayMemberPath$
 Title��5.   F   �� 50      -   5        $ 
ComboTopic��50      $��14(�6,   $��3q�6:   $��1��6F   $��5q�6V   $	 Выберите тему��51      $
 Title��52       �� SelectedItem 51   F   �� *Topic+52      53      �� 55   
    �� Orientation$ 
Horizontal=�6   $��Right=�6/   .+�56      �� -   5        $ BtnLoad��58      #��[ 56   I    � ToolTip$ Загрузить��58   $   $��0��69   $��0��6F   $��40��6X   $��0q�6c   $��Right=�59      $��Bottom=�5:      ��56      0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Upload=�5;      �� 5<      -   5        $ BtnDeleteImage��5<   G   $��Right=�5=   $   #��[ 6A   $��Bottom=�5>      $ Удалить��6.   $��40��5?   $   $��0q�6/   ��5<        $ Delete=�5?   ;   �� 5@      -   5        $ BtnView��5B      #��[ 5A      $ Просмотр��5B   $   $��0��68   $��0��6E   $��40��6V   $��0q�6a   $��Right=�5C      $��Bottom=�5D      ��5@        $	 Eye=�5E      5I      �� 5K   
   -	   5         ��Name$ TextBoxTitle��5K      $	 Вопрос��6?     MaterialDesignTextBox#���  5L       �� TextWrapping$
 Wrap=�5M      $��0��5N      $	��0,2q�6    $
��Auto��6.   $��	0 0 210 0q�6<   ��5K   (   �� *Title+5N   <   �� 5O   
   -
   5        $ TextBoxProductDescription��5O      $��Stretch=�6S   $
��10 0q�6p   $��Stretch=�5P      $
 Wrap=�60   $	 Описание��6F   $	��Top=�5Q      #���  62   $��Stretch=�5R      $��1��5S      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5O   5   �� *Description+5S   =   �� 5U   
   -   5         ��Name$ ListBoxAnswers��5U      $��Visible=�5V      $��3��5W      $��0��6!     	good_item#���  5X      $��0 0 50 0q�6C   ��5Z      �� 5[      .R�5\      � $��Stretch=�6    � UseLayoutRounding .  5]      �� 5^      $��40 �6,    5`      �� 5a      $��60 �6/   �� 5b      $��* �6/   �� 5c      $��50 �6/   �� 5d      $��50 �6/   .+�5g      �� $��16(�6%   $��1��64   $��Center=�5h   D   $
��Auto��5i   (   $
��Left=�65   ��5h   (   ��  �� Path$ Title�5i   5   �� 5j      $��0��6#   -  'MaterialDesignThemes.Wpf.CheckBoxAssist   CheckBoxSize$ 24Q�5k   +     MaterialDesignDarkCheckBox#���  5m   #   $��	10 0 10 0q�6X    d� 	IsChecked 5l   #   ��  �� RelativeSource ��  �� AncestorType" ��$ 
IsSelected�5m   X   �� 5u      $ BtnEditItem��6Q   -   5         # MaterialDesignFlatLightBgButton#���  5v   #   $ Изменить��6]   $��Right=�6p   $��2��5w      $��Center=�6$   $��40��5x   $   $��0q�6/   ��5u   #     $
 Edit=�5x   ;   �� 5y      $ BtnDeleteItem��6S   -   5        $ Удалить��5y   j   #���  5z   #   $��Right=�6]   $��Center=�5{      $��3��6.   $��40��5|   $   $��0q�6/   ��5y   #     $ Delete=�5|   ;   5~      5      5�      �� 5�   
   $��3��6   .+�5�      �� -   5        $ BtnAddAnswer��5�   @   $ Добавить��6V   $��7��6i   $��1��6v   $��40��6�   $��0q�6�   $��Right=�5�      #��[ 60   $	��Top=�5�      ��5�        *Add+5�   +   5�      5�      5�      