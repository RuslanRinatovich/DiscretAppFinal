using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiscreteMathCourseApp.Models
{
    public partial class TopicContent
    {
        public string GetColor
        {
            get
            {
                UserTopicContent userTopicContent = UserTopicContents.FirstOrDefault(p => p.User == Manager.CurrentUser);

                if (userTopicContent == null) return "#FFF";
                if (userTopicContent.IsStudied == false) return "#FFF";
                return "#FF76E383";
               
            }
        }

        public Boolean IsStudied
        {
            get
            {
                UserTopicContent userTopicContent = UserTopicContents.FirstOrDefault(p => p.User == Manager.CurrentUser);

                if (userTopicContent == null)
                    return false;
          
                return userTopicContent.IsStudied;

            }
        }



        public string GetIcon
        {
            get
            {
                string currentDirectory = System.IO.Directory.GetCurrentDirectory();
                Dictionary<string, string> extentions = new Dictionary<string, string>()
                {
                    ["doc"] = currentDirectory + @"\Data\Icons\doc.png",
                    ["docx"] = currentDirectory + @"\Data\Icons\docx.png",
                    ["pptx"] = currentDirectory + @"\Data\Icons\pptx.png",
                    ["pdf"] = currentDirectory + @"\Data\Icons\pdf.png",
                    ["xps"] = currentDirectory + @"\Data\Icons\docx.png",
                  ["mp4"] = currentDirectory + @"\Data\Icons\mp4.png"
                };
                int k = TopicLink.LastIndexOf('.');
                string ext = TopicLink.Substring(k+1);
                return extentions[ext];

            }
        }
    }
}
