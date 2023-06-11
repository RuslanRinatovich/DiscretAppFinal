using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DiscreteMathCourseApp.Models
{
    public partial class User
    {
        public string GetFio
        {
            get
            {
                return $"{Surname} {Name} ";
            }
        }

        public string GetTestPassCountString
        {
            get
            {
                int tests = MyMoodleBDEntities.GetContext().Tests.Count();

                return $"{GetTestPassCount} из {tests}";
            }
        }


        public int GetTestPassCount
        {
            get
            {
                int k = 0;
                foreach (UserTestResult userTestResult in UserTestResults)
                    if (Convert.ToDouble(userTestResult.Result)/userTestResult.Test.TestQuestions.Count > 0.50)
                        k++;

                return k;
            }
        }

        public int GetPassedControlPointCount
        {
            get
            {
                int k = 0;
                foreach (UserControlPoint userControlPoint in UserControlPoints)
                    if (userControlPoint.Result > 2)
                        k++;

                return k;
            }
        }

        public string GetPassedControlPointCountString
        {
            get
            {
                int controlPoints = MyMoodleBDEntities.GetContext().ControlPoints.Count(); // 4

                return $"{GetPassedControlPointCount} из {controlPoints}";
            }
        }

        public int GetPassedTopicContent
        {
            get
            {
                int k = 0;
                foreach (UserTopicContent userTopicContent in UserTopicContents)
                    if (userTopicContent.IsStudied)
                        k++;

                return k;
            }
        }

        public string GetPassedTopicContentString
        {
            get
            {
                int topicContents = MyMoodleBDEntities.GetContext().TopicContents.Count(); // 5

                return $"{GetPassedTopicContent} из {topicContents}";
            }
        }

        public int GetProgress
        {
            get
            {
                int controlPoints = MyMoodleBDEntities.GetContext().ControlPoints.Count(); // 4
                int topicContents = MyMoodleBDEntities.GetContext().TopicContents.Count(); // 5
                int tests = MyMoodleBDEntities.GetContext().Tests.Count(); // 3

                double total = controlPoints + topicContents + tests;
                // 2 + 3 + 3
                return Convert.ToInt32((GetPassedTopicContent + GetTestPassCount + GetPassedControlPointCount)/ total * 100);
            }
        }
        public Visibility GetVisibility
        {
            get
            {
                if (RoleId == 1)
                    return Visibility.Visible;
                return Visibility.Hidden;
            }
        }
    }
}

