   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      -    'DiscreteMathCourseApp.Pages.AddUserPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:DiscreteMathCourseApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5      $��Regular"�5	   	   $��14(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Пользователь��5      .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      -   5         ��Name$ RowUserType��5   (   $��40 �6   6(   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5       .+�5"   
   �� -   5         ��Name$ TextBoxUserName��5"      $��0��5#   ,   $��Center=�6<   $��0��6W   $��30��6d   $	��0,7q�6p   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$%	 Имя пользователя��5$      $��20 5 0 0q�6C   ��5#      �� *
UserName+5$   �   �� 5&   
   $	 Фамилия��6+   $��20 5 0 0q�6U   $��0��6h   $��Center=�6x   $��1��6�   $��30��6�   $	��0,7q�6�   ��6   �� *	Surname+6�   �� 5'   
   $	 Имя��6(   $��20 5 0 0q�6N   $��0��6a   $��Center=�6q   $��2��6�   $��30��6�   $	��0,7q�6�   ��6   �� *Name+6�   �� 5(   
   $	 Отчество��6.   $��20 5 0 0q�6Y   $��0��6l   $��Center=�6|   $��3��6�   $��30��6�   $	��0,7q�6�   ��6   �� *
Patronymic+6�   �� 5)   
   -   5        
 ��Name$
 ComboUserType��5)      $%	 Тип пользователя��6*   $��20 5 0 0q�6\   $��4��5+       �� DisplayMemberPath$ Title��5,      $��Stretch=�6-   $��Center=�6I    �� SelectedValuePath$ Id��5-       �� SelectedItem 5*      �� *Role+5-      �� 5/   
   -   5        $
 
ComboGroup��5/      $	 Группа��6'   $��20 5 0 0q�6O   $��5��51      $ Title��52      $��Stretch=�6-   $��Center=�6I   $ Id��53       50      �� *StudentGroup+53      �� 54   
   -   5        $ PasswordBoxPassword��55   $   $��0��54   ,   $��20,0,0,2q�55      $��Center=�6B   $	 Пароль��56      $��6��6:   $��30��6G   ��54      �� *
Password+56   G   �� 59   
   -   5         �� 	IsDefault . $	��120��59   7   $��7��6C   $��5q�6P     MaterialDesignFlatButton#��[ 6[   .��6�   Сохранить6�   5=      5>      