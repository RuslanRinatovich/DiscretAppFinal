   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:DiscreteMathCourseAppDiscreteMathCourseApp  &     DiscreteMathCourseApp.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  /local#clr-namespace:DiscreteMathCourseApp  -      MaterialDesignBody#���   $	��600��$	��800��$��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper#���    MaterialDesignFont#���   � WindowStartupLocation$ CenterScreen=�$��1q� � WindowStyle$
 None=�.���  � RowDefinitions �� $��30 ��� $��60 ��� $��* ��� $��30 �.+��� $��0��$��0��
���������  �� Orientation$ 
Horizontal=�$��1��$��0��$��Right=�.+��� -    ��Name$ BtnMinimize��  MaterialDesignFlatButton#��[ ��0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ WindowMinimize=��� -   $ BtnMaximizeMin��#��[ .��'  !MaterialDesignThemes.Wpf.PackIcon  -     Name$ IconMaximize��	   Kind$	 WindowMaximize=��� -   $ BtnClose��#��[ ��  $ Close=�(  "MaterialDesignThemes.Wpf.ColorZone  $��1��$��1��$��Stretch=�
   Mode$
 
PrimaryMid=�
�������$��0q�.���� $ 
Horizontal=�$��Center=�.+��� $ 
Horizontal=�$
��Left=�.+��� -    ��Name$ ImgUserPhoto��$��30��$��30��$��UniformToFill=�$��	10 0 10 0q��� $��0�� $  MaterialDesignHeadline6TextBlock#��[ $��Center=�$��Center=�$	��300������  �� ElementName$ 	MainFrame�� �� Path$ Content.Title��� -   $ BtnTopicPage��
������� � ToolTip$ Темы��#��[ $y�	Collapsed=���  $ 	AlphaPBox=�   Size$ 24X��� -   $ BtnUserPage��
�������$ Пользователи��#��[ $y�	Collapsed=���  $ People=�$ 24X��� -	   $ BtnQuestionPage��
�������$y�	Collapsed=�$ Банк вопросов��#��[ ��  $ QuestionMarkBox=�$ 24X��� -
   $ BtnUserLearningPage��
�������$ Обучение��#��[ $y�	Collapsed=���  $ 	AlphaLBox=�$ 24X��� -   $ BtnMyAccount��
�������$ Мой профиль��#��[ $y�	Collapsed=���  $	 Man=�$ 24X��� -   $ BtnBack��
�������$��Right=�$��5 0 10 0q�#��[ $y�	Collapsed=���  $ 	ArrowBack=�$ 24X��� -    ��Name$ 
TbUserInfo��$��30��$	��200��$��	10 0 10 0q�$��Center=�$��Right=� �� Padding$ 3q�$
��Bold"�#���   � -     �Name$ 	MainFrame��$��2��  � NavigationUIVisibility$ Hidden=�#��[ $��2q��� -   $��0��$��0��$��2��$T��NЭлектронный курс по Дискретной математике�� $  MaterialDesignHeadline1TextBlock#��[ $��16(�$��Center=�$
��Bold"�$
 30 0q�$��	0 0 300 0q��� $��0��$��20��$��5 0 0 0q�$
��Left=�$N��H/DiscreteMathCourseApp;component/Resources/9110106_intersection_icon.png���� -   $ TextBlockCount��$��3��$��0��
�������  PrimaryHueDarkBrush#��[ 