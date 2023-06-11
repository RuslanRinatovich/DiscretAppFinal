using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiscreteMathCourseApp.Models
{
    public partial class Question
    {
        public string GetImage
        {
            get
            {
                if (Image is null)
                    return System.IO.Directory.GetCurrentDirectory() + @"\Data\Images\picture.png";
                return System.IO.Directory.GetCurrentDirectory() + @"\Data\Images\" + Image.Trim();
            }
        }
    }
}
