using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiscreteMathCourseApp.Models
{
    public partial class Topic
    {
        public string GetAllInformation
        {
            get
            {
                return $"Тема №{IndexNumber}\n" +
                     $"Раздел: {Chapter.Title}\n" +
                     $"Тип занятия: {TopicType.Title}\n" +
                     $"Название: {Title}\n" +
                     $"Описание: {Description}";

            }
        }

        public int GetProgress { get; set; }
        public string GetData { get; set; }
        public string GetColor { get; set; }
    }
}
