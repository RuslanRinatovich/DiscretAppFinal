   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      3    -DiscreteMathCourseApp.Pages.UsersTestPassPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
        N� Title$'  !Прохождение теста��5   	      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $	��100 �6   �� 5      $��40 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      .+�5   
   �� ���	#FF9A67EA$��0��6&   �� 5    
   $��0��6   $��Тест��6!    $  MaterialDesignSubtitle2TextBlock#���  6-   
�������$��Center=�6{   �� 5"   
   -   5         ��Name$ 
ImagePhoto��5"      $	��200��6$   $��1��5#      $��1��6   $��Stretch=�5$      $��Right=�6,   �� 5&   
   -   5         ��Name$ BtnView��5(        MaterialDesignFlatButton#��[ 5&   @   	 � ToolTip$	 Просмотр��5(   $   $��1��68   $��40��6F   $��0q�6Q   $��Right=�5)      $��Bottom=�5*      ��5&      0  *MaterialDesignThemes.Wpf.PackIconExtension  
   Kind$	
 Eye=�5+      �� 5-   
   -   5         ��Name$ TextBoxTitle��5-       $  MaterialDesignHeadline6TextBlock#���  5.      $
��Wrap=�5/      $��1��50       �� Padding$	 0,2q�6   $
��Auto��6-   $��	0 0 210 0q�6;   �� 51   
   -   5        $ TextBoxProductDescription��51      $��Stretch=�69   $
��10 0q�6V   $��Stretch=�52      $
��Wrap=�60   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Описание��6F    $  MaterialDesignSubtitle1TextBlock#���  53      $��2��55      $��1��6   $	 0,2q�6/   $
��Auto��6=   �� 57   
   -   5         ��Name$ ListBoxAnswers��57      $��Visible=�58      $��3��59      $��0��6"     show_user_answer#���  5:      ��5<      �� 5=      .R�5>      � $��Stretch=�6    � UseLayoutRounding .  5?      �� 5@      $��60 �6,    5B      �� 5C      $��60 �6/   �� 5D      $��* �6/   �� 5E      $��50 �6/   �� 5F      $��50 �6/   .+�5I      �� $��16(�6%   $��1��63   $��Center=�5J   D   $
��Auto��5K   (   $
��Left=�65   ��5J   (   ��  �� Path$ Title�5K   5   �� 5L      $��0��6#   -  'MaterialDesignThemes.Wpf.CheckBoxAssist   CheckBoxSize$ 30Q�65    J� IsHitTestVisible .  |�.    MaterialDesignDarkCheckBox#���  5O   #   $��	10 0 10 0q�6X    d� 	IsChecked 5N   #   �� *	IsRight+5O   X   5W      5X      5[      �� 5]   
   $��4��6    �� Orientation$ 
Horizontal=�6"   $��Center=�6;   $��Center=�6X   .+�5^      �� -   5        $ BtnFirst��5^   R   $	 Первый вопрос��6d   $��60��6}   $��0q�6�   $��Right=�5_      #��[ 6/   $	��Top=�5`      ��5^        *SkipPrevious+   Size$ 30X�5`   +   �� 5a      -   5        $ BtnArrowLeftBold��5a   �   #��[ 6R   $'	 !Предыдущий вопрос��6�   $��60��6�   $��0q�6�   $��Right=�5b      $	��Top=�5c      ��5a        *ArrowLeftBold+$ 30X�5c   +   �� 5d      -   5        $ BtnArrowRightBold��5d   �   #��[ 6S   $%	 Следующий вопрос��6�   $��60��6�   $��0q�6�   $��Right=�5e      $	��Top=�5f      ��5d        *ArrowRightBold+$ 30X�5f   +   �� 5g      -	   5        $ BtnLast��5g      #��[ 6M   $%	 Последний вопрос��6�   $��60��6�   $��0q�6�   $��Right=�5h      $	��Top=�5i      ��5g        *
SkipNext+$ 30X�5i   +   5m      �� 5n   
   -
   5        $ TextBlockQuestionNumber��5n      $��4��66   $
��Left=�6C   $��16(�6^   $
��Bold"�6l   $	��200��6~   5o      5p      