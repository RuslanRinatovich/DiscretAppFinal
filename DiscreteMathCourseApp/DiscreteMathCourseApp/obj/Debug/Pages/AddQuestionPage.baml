   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      1    +DiscreteMathCourseApp.Pages.AddQuestionPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      5local)clr-namespace:DiscreteMathCourseApp.Pages  5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	     N� Title$  Вопрос��5   	      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $	��200 �6   �� 5      $	��100 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      .+�5    
   �� -   5         ��Name$ BtnSave��5       $��5��6"   $��Сохранить��6/     MaterialDesignFlatButton#��[ 6E   $��Center=�5!      $	��Top=�6.   $	��120��6F   $��1��5"   '   $��213,3,222,0q�67   �� 5#   
   -   5        $ BtnDeleteImage��5#   C   #��[ 6[   $��Right=�5$   $    � ToolTip$ Удалить��6@   $	��Top=�5%      $��	0,128,0,0q�6+   $��40��5&   $   $��0q�6/   ��5#      0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Delete=�5&   ;   �� 5(   
   -   5        
 ��Name$
 
ImagePhoto��5(      $��0��5)      $��1��6   $��Stretch=�5*      $��Stretch=�6,   $��0 0 60 0q�6J   ��5(   $   �� *
GetImage+5*   J   �� 5-   
   -   5        $ BtnLoad��5/      #��[ 5-   B   $ Добавить��5/   $   $��0��68   $��0��6E   $��	120,5,0,0q�6U   $��40��6i   $��0q�6t   $��Right=�50      $��Bottom=�51      ��5-        $	 Image=�52      �� 53   
   -   5         ��Name$ TextBoxTitle��53      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Вопрос��6?     MaterialDesignTextBox#���  54      $
��10 0q�6B   $��1��56      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��53   (   �� *Title+56   =   �� 57   
   -   5        $ TextBoxProductDescription��57      $��Stretch=�6S   $
��10 0q�6p   $��Stretch=�58       �� TextWrapping$
 Wrap=�60   $ Описание��6F   $	��Top=�59      #���  62   $��Stretch=�5:      $��2��5;      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��57   5   �� *Description+5;   =   � 5>   
   $��3��6   $��0��6   $��2��6,    5?      �� 5@      $	��300 �6#   �� 5A      .+�5C      �� -   5         ��Name$ ComboChapter��5C      $��14(�6.   $��3q�6<   $��0��6H   $# Выберите раздел��5D      $��5q�6H    �� DisplayMemberPath$ Title��5E   F   �� 5G      -   5        $ 
ComboTopic��5G      $��14(�6,   $��3q�6:   $��1��6F   $��5q�6V   $ Выберите тему��5H      $ Title��5I       �� SelectedItem 5H   F   �� *Topic+5I      5J      �� 5L   
   -	   5         ��Name$ ListBoxAnswers��5L      $��Visible=�5M      $��4��5N      $��0��6      	good_item#���  5O      $��0 0 50 0q�6C   ��5Q      �� 5R      .R�5S      � $��Stretch=�6    � UseLayoutRounding .  5T      �� 5U      $��60 �6,    5W      �� 5X      $��60 �6/   �� 5Y      $��* �6/   �� 5Z      $��50 �6/   �� 5[      $��50 �6/   .+�5^      �� $��16(�6%   $��1��64   $��Center=�5_   E   $
��Auto��5`   (   $
��Left=�65   ��5_   (   ��  �� Path$ Title�5`   5   �� 5b      $��0��6#   -  'MaterialDesignThemes.Wpf.CheckBoxAssist   CheckBoxSize$ 30Q�5c   $     MaterialDesignDarkCheckBox#���  5e   #   $��	10 0 10 0q�6X    d� 	IsChecked 5d   #   ��  �� RelativeSource ��  �� AncestorType" ��$ 
IsSelected�5e   X   �� 5h      $ BtnEditItem��6Q   -
   5         # MaterialDesignFlatLightBgButton#���  5i   #   $��Right=�6]   $	��Top=�5j      $��2��6+   $ Изменить��6;   $��40��5k   $   $��0q�6/   ��5h   #     $
	 Edit=�5k   ;   �� 5l      $ BtnDeleteItem��6S   -   5        #���  5m   #   $��Right=�6]   $	��Top=�5n      $��3��6+   $ Удалить��6;   $��40��5o   $   $��0q�6/   ��5l   #     $	 Delete=�5o   ;   5q      5r      5u      �� 5w   
   $��4��6   .+�5x      �� -   5        $ BtnAddAnswer��5x   @   $ Добавить��6V   $��7��6i   $��1��6v   $��40��6�   $��0q�6�   $��Right=�5y      #��[ 60   $	��Top=�5z      ��5x        *Add+5z   +   5{      5|      5}      