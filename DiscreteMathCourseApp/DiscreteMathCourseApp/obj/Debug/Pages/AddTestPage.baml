   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      -    'DiscreteMathCourseApp.Pages.AddTestPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	        N� Title$:  4Добавление и редактирование��5
   	      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��50 �6   �� 5      $��50 �6   �� 5      $��50 �6   �� 5      $��20 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      .+�5    
   �� $��0��6   $��Раздел��6!   $
��20 0q�60   �� 5!   
   -   5         ��Name$ ComboChapter��5!      $��0��5#       �� DisplayMemberPath$ Title��5$      $��Bottom=�6-   	 �� SelectedValuePath$	 Id��5%      
 �� SelectedItem
 5"      �� *Topic.Chapter+5%   *   �� 5'   
   $��1��6   $��Тема��6!   $
��20 0q�6.   �� 5(   
   -   5        $ 
ComboTopic��5(      $��1��5*      $ Title��5+      $��Bottom=�6-   $	 Id��5,      
 5)      �� *Topic+5,      �� 5-   
   -   5         ��Name$ BtnSave��5-      $��6��6"   $��Сохранить��6/   $��Center=�5.      $	��Top=�6.   $	��120��6F     MaterialDesignFlatButton#��[ 6R   $��1��5/   '   $��213,3,222,0q�67   �� 50   
   -   5         ��Name$ TextBoxTitle��50      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$# Заголовок теста��6?     MaterialDesignTextBox#���  51      $��2��53      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��50   (   �� *Title+53   =   �� 54   
   -   5        $ TextBoxProductDescription��54      $��Stretch=�6S   $��Stretch=�55       �� TextWrapping$
 Wrap=�60   $ Описание��6F   $	��Top=�56      #���  62   $��Stretch=�57      $��3��58      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��54   5   �� *Description+58   =   �� 5:   
   ���	#FF9A67EA$��4��6&   �� 5;   
   $��4��6   $��Вопросы��6"    $  MaterialDesignSubtitle2TextBlock#���  61   
�������$��Center=�6   �� 5<   
   -   5         ��Name$ ListBoxQuestions��5<      $��Visible=�5=      $	 AgentId��5>      $��5��61   $��0��6>     	good_item#���  5?      $��0 0 50 0q�6C   ��5A      �� 5B      .R�5C      � $��Stretch=�6    � UseLayoutRounding .  5D      �� 5F      $��* �6/   �� 5G      $��50 �6/   �� 5H      $��50 �6/   .+�5K      �� $��16(�6%   $
��Bold"�63   $��1��6E   $
��Auto��5M   (   $
��Left=�65   ��5L   (   ��  �� Path$ Title�5M   5   �� 5Q      $ BtnDeleteItem��6S   -   5         # MaterialDesignFlatLightBgButton#���  5R   #   $��Right=�6]   $	��Top=�5S      $��3��6+   $��40��5T   $   $��0q�6/   ��5Q   #   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Delete=�5T   ;   5Y      5Z      5]      �� 5_   
   $��5��6   .+�5`      �� -   5        $ BtnAddQuestion��5`   @    � ToolTip$ Добавить��6X   $��7��6k   $��1��6x   $��40��6�   $��0q�6�   $��Right=�5a      #��[ 6/   $	��Top=�5b      ��5`        *Add+5b   +   5c      5d      5e      