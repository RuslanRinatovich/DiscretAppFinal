using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DiscreteMathCourseApp.Models
{
    public partial class ControlPoint
    {
        public string GetColor { set; get; }
        public string GetBall { set; get; }

        public int? Result { set; get; }

        public Visibility GetVisibility { set; get; }
        public UserControlPoint GetUserControlPoint { set; get; }
    }
}
