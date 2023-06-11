using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiscreteMathCourseApp.Models
{
    public partial class MyMoodleBDEntities: DbContext
    {
        private static MyMoodleBDEntities _context;


        public static MyMoodleBDEntities GetContext()
        {
            if (_context == null)
            {
                _context = new MyMoodleBDEntities();
            }
            return _context;
        }
    }
}
