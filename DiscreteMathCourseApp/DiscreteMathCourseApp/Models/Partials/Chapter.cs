using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiscreteMathCourseApp.Models
{
    public partial class Chapter
    {
        public string GetChapter
        {
            get
            {
                return $"{IndexNumber}. {Title} ";
            }
        }

        public string GetTotalHours
        {
            get
            {
                List<TopicType> topicTypes = DiscretMathBDEntities.GetContext().TopicTypes.OrderBy(p => p.Title).ToList();
                Dictionary<string, int> data = new Dictionary<string, int>();
                foreach (TopicType x in topicTypes)
                {
                    data.Add(x.Title, 0);
                }
                foreach (Topic topic in Topics)
                {
                    data[topic.TopicType.Title] += topic.TotalHours;
                }

                string answer = "";
                foreach (var x in data)
                {
                    answer += $"{x.Key}: {x.Value}ч.\t";
                   
                }
                return answer;
            }
        }
    }
}
