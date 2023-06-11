using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DiscreteMathCourseApp.Models
{
    public partial class Answer
    {
        //public string GetColor
        //{
        //    get
        //    {
        //        if (IsRight) return "#0F0";
        //        return "#F00";
        //    }
        //}


        public string GetColor1 { set; get; }
        
         
        public Visibility GetVisibility
        {
            get
            {
                if (IsRight) return Visibility.Visible;
                return Visibility.Hidden;
            }
        }


    }
}
