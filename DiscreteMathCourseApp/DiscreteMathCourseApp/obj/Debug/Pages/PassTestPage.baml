   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      .    (DiscreteMathCourseApp.Pages.PassTestPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	        N� Title$'  !Прохождение теста��5
   	      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $	��100 �6   �� 5      $��80 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      .+�5   
   �� ���	#FF9A67EA$��0��6&   �� 5   
   $��0��6   $��Тест��6!    $  MaterialDesignSubtitle2TextBlock#���  6-   
�������$��Center=�6{   �� 5!   
   -   5         ��Name$ 
ImagePhoto��5!      $	��200��6$   $��1��5"      $��1��6   $��Stretch=�5#      $��Right=�6,   �� 5%   
   -   5         ��Name$ BtnView��5'        MaterialDesignFlatButton#��[ 5%   @   	 � ToolTip$	 Просмотр��5'   $   $��1��68   $��40��6F   $��0q�6Q   $��Right=�5(      $��Bottom=�5)      ��5%      0  *MaterialDesignThemes.Wpf.PackIconExtension  
   Kind$	
 Eye=�5*      �� 5,   
   -   5         ��Name$ TextBoxTitle��5,       $  MaterialDesignHeadline6TextBlock#���  5-      $
��Wrap=�5.      $��1��5/       �� Padding$	 0,2q�6   $
��Auto��6-   $��	0 0 210 0q�6;   �� 50   
   -   5        $ TextBoxProductDescription��50      $��Stretch=�69   $
��10 0q�6V   $��Stretch=�51      $
��Wrap=�60   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Описание��6F    $  MaterialDesignSubtitle1TextBlock#���  52      $��2��54      $��1��6   $	 0,2q�6/   $
��Auto��6=   �� 56   
   -   5         ��Name$ ListBoxAnswers��56      $��Visible=�57      $��3��58      $��0��6"     	good_item#���  59      ��5;      �� 5<      .R�5=      � $��Stretch=�6    � UseLayoutRounding .  5>      �� 5?      $��60 �6,    5A      �� 5B      $��60 �6/   �� 5C      $��* �6/   �� 5D      $��50 �6/   �� 5E      $��50 �6/   .+�5H      �� $��16(�6%   $��1��64   $��Center=�5I   E   $ 20 0 0 0q�6`   $
��Auto��5J   (   $
��Left=�65   ��5I   (   ��  �� Path$ Title�5J   5   �� 5K      $��0��6#   -  'MaterialDesignThemes.Wpf.CheckBoxAssist   CheckBoxSize$ 30Q�5L   $     MaterialDesignDarkCheckBox#���  5N   #   $��	10 0 10 0q�6X    d� 	IsChecked 5M   #   ��  �� RelativeSource ��  �� AncestorType" ��$ 
IsSelected�5N   X   5T      5U      5X      �� 5Z   
   $��4��6    �� Orientation$ 
Horizontal=�6"   $��Center=�6;   $��Center=�6X   .+�5[      �� -   5        $ BtnFirst��5[   R   $	 Первый вопрос��6d   $��60��6}   $��0q�6�   $��Right=�5\      #��[ 6/   $	��Top=�5]      ��5[        *SkipPrevious+   Size$ 30X�5]   +   �� 5^      -   5        $ BtnArrowLeftBold��5^   �   #��[ 6R   $'	 !Предыдущий вопрос��6�   $��60��6�   $��0q�6�   $��Right=�5_      $	��Top=�5`      ��5^        *ArrowLeftBold+$ 30X�5`   +   �� 5a      -   5        $ BtnArrowRightBold��5a   �   #��[ 6S   $%	 Следующий вопрос��6�   $��60��6�   $��0q�6�   $��Right=�5b      $	��Top=�5c      ��5a        *ArrowRightBold+$ 30X�5c   +   �� 5d      -	   5        $ BtnLast��5d      #��[ 6M   $%	 Последний вопрос��6�   $��60��6�   $��0q�6�   $��Right=�5e      $	��Top=�5f      ��5d        *
SkipNext+$ 30X�5f   +   �� 5h      -
   5        $ BtnFinishTest��5h   �   #��[ 6N   $!	 Завершить тест��6�   $��60��6�   $��0q�6�   $��	100 0 0 0q�6�   $��Right=�5i      $	��Top=�5j      ��5h        *	CheckBold+$ 30X�5j   +   5l      �� 5m   
   -   5        $ TextBlockQuestionNumber��5m      $��4��65   $
��Left=�6B   $	��200��6]   $��16(�6i   $
��Bold"�6w   5n      5o      