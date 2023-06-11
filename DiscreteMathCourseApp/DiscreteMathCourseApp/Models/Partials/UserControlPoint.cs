using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiscreteMathCourseApp.Models
{
    public partial class UserControlPoint
    {
        public string GetColor
        {
            get
            {
                if (Result == 5)
                    return "#FF76E383";
                if (Result == 4)
                    return "FF0000";
                if (Result == 4)
                    return "0000FF";
                return "fff";
            }
        }
    }
}
