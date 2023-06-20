using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiscreteMathCourseApp.Models
{
    public partial class DiscretMathBDEntities: DbContext
    {
        private static DiscretMathBDEntities _context;


        public static DiscretMathBDEntities GetContext()
        {
            if (_context == null)
            {
                _context = new DiscretMathBDEntities();
            }
            return _context;
        }
    }
}
