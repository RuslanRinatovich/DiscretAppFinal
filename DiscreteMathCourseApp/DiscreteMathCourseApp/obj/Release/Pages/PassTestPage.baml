   M S B A M L   `   `   `  ���� P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  .    (DiscreteMathCourseApp.Pages.PassTestPage   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:DiscreteMathCourseApp.Pages     _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes    N� Title$'  !Прохождение теста��   MaterialDesignBody#���   $��Regular"�$��14(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper N� 
Background# �    MaterialDesignFont N� 
FontFamily# �  .���  � RowDefinitions �� $��30 ��� $	��100 ��� $��80 ��� �� $��40 � � ColumnDefinitions �� .+��� ���	#FF9A67EA$��0���� $��0��$��Тест�� $  MaterialDesignSubtitle2TextBlock#���  
�������$��Center=��� -    ��Name$ 
ImagePhoto��$	��200��$��1��$��1��$��Stretch=�$��Right=��� -    ��Name$ BtnView��  MaterialDesignFlatButton#��[ 	 � ToolTip$	 Просмотр��$��1��$��40��$��0q�$��Right=�$��Bottom=���0  *MaterialDesignThemes.Wpf.PackIconExtension  
   Kind$	
 Eye=��� -    ��Name$ TextBoxTitle�� $  MaterialDesignHeadline6TextBlock#���  $
��Wrap=�$��1�� �� Padding$	 0,2q�$
��Auto��$��	0 0 210 0q��� -   $ TextBoxProductDescription��$��Stretch=�$
��10 0q�$��Stretch=�$
��Wrap=�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Описание�� $  MaterialDesignSubtitle1TextBlock#���  $��2��$��1��$	 0,2q�$
��Auto���� -    ��Name$ ListBoxAnswers��$��Visible=�$��3��$��0��  	good_item#���  ���� .R�� $��Stretch=� � UseLayoutRounding .  �� $��60 � �� $��60 ��� $��* ��� $��50 ��� $��50 �.+��� $��16(�$��1��$��Center=�$ 20 0 0 0q�$
��Auto��$
��Left=�����  �� Path$ Title��� $��0��-  'MaterialDesignThemes.Wpf.CheckBoxAssist   CheckBoxSize$ 30Q�  MaterialDesignDarkCheckBox#���  $��	10 0 10 0q� d� 	IsChecked ��  �� RelativeSource ��  �� AncestorType" ��$ 
IsSelected��� $��4�� �� Orientation$ 
Horizontal=�$��Center=�$��Center=�.+��� -   $ BtnFirst��$	 Первый вопрос��$��60��$��0q�$��Right=�#��[ $	��Top=���  *SkipPrevious+   Size$ 30X��� -   $ BtnArrowLeftBold��#��[ $'	 !Предыдущий вопрос��$��60��$��0q�$��Right=�$	��Top=���  *ArrowLeftBold+$ 30X��� -   $ BtnArrowRightBold��#��[ $%	 Следующий вопрос��$��60��$��0q�$��Right=�$	��Top=���  *ArrowRightBold+$ 30X��� -	   $ BtnLast��#��[ $%	 Последний вопрос��$��60��$��0q�$��Right=�$	��Top=���  *
SkipNext+$ 30X��� -
   $ BtnFinishTest��#��[ $!	 Завершить тест��$��60��$��0q�$��	100 0 0 0q�$��Right=�$	��Top=���  *	CheckBold+$ 30X��� -   $ TextBlockQuestionNumber��$��4��$
��Left=�$	��200��$��16(�