   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:DiscreteMathCourseAppDiscreteMathCourseApp  5   	   &     DiscreteMathCourseApp.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   /local#clr-namespace:DiscreteMathCourseApp  5   	   -   5           MaterialDesignBody#���   5
   	   $	��600��5   	   $	��800��6   $��Regular"�5   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � WindowStartupLocation$ CenterScreen=�5      $��1q�5   	    � WindowStyle$
 None=�6   .��5      �  � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $��60 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5    
   �� $��0��6   $��0��6!   
�������61   �� 5$   
    �� Orientation$ 
Horizontal=�6   $��1��6.   $��0��6>   $��Right=�6K   .+�5+      �� -   5         ��Name$ BtnMinimize��5+        MaterialDesignFlatButton#��[ 5,      ��5+   *   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ WindowMinimize=�5,   B   �� 5-      -   5        $ BtnMaximizeMin��5-      #��[ 5.      .��5/      '  !MaterialDesignThemes.Wpf.PackIcon  -   5          Name$ IconMaximize��5/   *   	   Kind$	 WindowMaximize=�6@   50      �� 51      -   5        $ BtnClose��51      #��[ 52      ��51   '     $ Close=�52   B   53      (  "MaterialDesignThemes.Wpf.ColorZone  54   
   $��1��6#   $��1��63   $��Stretch=�6@   
   Mode$
 
PrimaryMid=�55      
�������$��0q�56      .��57      �� $ 
Horizontal=�6   $��Center=�62   .+�58      �� $ 
Horizontal=�6   $
��Left=�66   .+�59      �� -   5         ��Name$ ImgUserPhoto��59   3   $��30��6   $��30��6(   $��UniformToFill=�6I   $��	10 0 10 0q�6a   �� 5:      $��0��6     $  MaterialDesignHeadline6TextBlock#��[ 5;       $��Center=�5<       $��Center=�6;   $	��300��6X   ��5:   -   ��  �� ElementName$ 	MainFrame�� �� Path$ Content.Title�5<   X   �� 5?      -   5        $ BtnTopicPage��5?      
������� � ToolTip$ Темы��6�   #��[ 5@      $y�	Collapsed=�6^   ��5?   3     $ 	AlphaPBox=�   Size$ 24X�5@   ^   �� 5A      -   5        $ BtnUserPage��5A      
�������$ Пользователи��6~   #��[ 5B      $y�	Collapsed=�6]   ��5A   2     $ People=�$ 24X�5B   ]   �� 5C      -	   5        $ BtnQuestionPage��5C      
�������$y�	Collapsed=�6�   $ Банк вопросов��6�   #��[ 5D      ��5C   6     $ QuestionMarkBox=�$ 24X�5D   C   �� 5E      -
   5        $ BtnUserLearningPage��5E      
�������$ Обучение��6�   #��[ 5F      $y�	Collapsed=�6e   ��5E   :     $ 	AlphaLBox=�$ 24X�5F   e   5G      �� 5H      -   5        $ BtnMyAccount��5H      
�������$ Мой профиль��6x   #��[ 5I      $y�	Collapsed=�6^   ��5H   /     $	 Man=�$ 24X�5I   ^   �� 5J      -   5        $ BtnBack��5J      
�������$��Right=�6|   $��5 0 10 0q�6�   #��[ 5K      $y�	Collapsed=�6C   ��5J   *     $ 	ArrowBack=�$ 24X�5K   Z   �� 5L      -   5         ��Name$ 
TbUserInfo��5L   4   $��30��6   $	��200��6(   $��	10 0 10 0q�6I   $��Center=�6\   $��Right=�6w    �� Padding$ 3q�6�   $
��Bold"�6�   #���  5M      5O      5R       � 5V   
   -   5          �Name$ 	MainFrame��5V      $��2��6#     � NavigationUIVisibility$ Hidden=�5W      #��[ 6!   $��2q�5X      6   �� 5Z   
   -   5        $��0��5Z      $��0��6!   $��2��61   $T��NЭлектронный курс по Дискретной математике��6E    $  MaterialDesignHeadline1TextBlock#��[ 5[      $��16(�5\      $��Center=�6"   $
��Bold"�6=   $
 30 0q�6O   $��	0 0 300 0q�6^   5]      �� 5b   
   $��0��6   $��20��6   $��5 0 0 0q�6(   $
��Left=�69   $N��H/DiscreteMathCourseApp;component/Resources/9110106_intersection_icon.png��6T   �� 5d      -   5        $ TextBlockCount��5d   5   $��3��6   $��0��6%   
�������  PrimaryHueDarkBrush#��[ 6a   5j      5k      