   M S B A M L   `   `   `  ����P  LDiscreteMathCourseApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:DiscreteMathCourseApp.PagesDiscreteMathCourseApp.Pages  5      0    *DiscreteMathCourseApp.Pages.AddChapterPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      5local)clr-namespace:DiscreteMathCourseApp.Pages  5        N� Title$  Раздел��5
   
      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��14(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $$��40                             �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      $	��245 �6   �� 5      .+�5   
   �� -   5         ��Name$ BtnSave��5      $��3��6"   $��Сохранить��6/     MaterialDesignFlatButton#��[ 6C   $��Center=�5      $	��Top=�6.   $	��120��6F   $��2��5    &   �� 5!   
   $��0��6   $��0��6!   $)��#Порядковый номер №��61   $
��20 0q�6L   �� 5"   
   $��1��6   $��0��6!   $%��Название раздела��61   $
��20 0q�6J   �� 5#   
   $��2��6   $��0��6!   $��Описание��61   $
��20 0q�6B   �� 5$   
   -   5         ��Name$ TextBoxTitle��5$      $��1��5%      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5$   (   �� *Title+5%   =   �� 5&   
   -   5        $ TextBoxProductDescription��5&      $��Stretch=�6R   $��Stretch=�5'      	 �� TextWrapping$
	 Wrap=�60   $	��Top=�5(      $��Stretch=�5)      $��2��5*      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5&   5   �� *Description+5*   =   %  Xceed.Wpf.Toolkit.IntegerUpDown  5+   
   -   5        
  Name$
 UpDownIndexNumber��5+      $�� 0��68   $��1��6F   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 1X�6V      Value 6b   �� *IndexNumber+5,      5-      