   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:DiscreteMathCourseApp.WindowsDiscreteMathCourseApp.Windows  5   	   /    )DiscreteMathCourseApp.Windows.LoginWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   
   7local+clr-namespace:DiscreteMathCourseApp.Windows  5   	   -   5           MaterialDesignBody#���   5	   	   $��Regular"�5
   	   $��14(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � Title$ Вход��5      $	��250��6   $	��400��5   	   $	��250��6   $	��400��6%    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      �  � ColumnDefinitions 5   
   �� 5       � RowDefinitions 5   
   �� 5      $��75 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      �� 5      $��20 �6   .+�5    
   � '  !MaterialDesignThemes.Wpf.PackIcon  5!   
      Kind$	 Key=�6"     PrimaryHueMidBrush#��[ 6-   $��	10,10,0,0q�5"      $
��Left=�5#      $��25��6+   $��62��67   �� 5$   
   $��0��6   $T��NЭлектронный курс по Дискретной математике��6!   $��Center=�5%      $��Center=�5&      $��16(�5'      $
��Wrap=�6"    �� TextAlignment$ Center=�66   $
��Bold"�5(      $��60��6&   $	��242��63   �� 5+   
   -   5        	 ��Name$	 TbLogin��5+      $��1��6$   $��1��5,      )  #MaterialDesignThemes.Wpf.HintAssist
   Hint$
 
Логин��6&   $	��300��5-      $��admin��6"   G� 5/   
   -   5         G�Name$ TbPass��5/      $��30��6&   $	��300��62   $
 Пароль��6>    G� Password$ 1��6f   $��2��6s   �� 50   
    �� Orientation$ 
Horizontal=�6   $��3��6.   $��Center=�6;   .+�51      �� -   5         ��Name$ BtnOk��53      $	��100��51      $��30��6!   $��OK��52        MaterialDesignFlatButton#��[ 6$    �� 	IsDefault . 54   (   �� 55      -   5        $ 	BtnCancel��58      $	��100��55      $��30��56      $��Cancel��57      #��[ 58   *    �� IsCancel . 59   ,   5:      �� 5;   
   -   5        $ BtnRegs��5=      $��4��5;      $��20��6    #��[ 6-   $��Регистрация��5<      $��0q�6+   $��8(�67   $��Center=�6D   $��Center=�6f   5>      5?      5@      