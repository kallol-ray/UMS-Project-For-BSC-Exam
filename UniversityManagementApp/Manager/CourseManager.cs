using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class CourseManager
    {
        CourseGateway aCourseGateway=new CourseGateway();
        public string SaveCourse(CourseModels aCourseModels)
        {
            if (aCourseGateway.IsExistCode(aCourseModels.Code) == true)
            {
                return "Code  already exist";
            }
            else if (aCourseGateway.IsExistName(aCourseModels.Name) == true)
            {
                return "Name already exist";
            }
            else
            {
                if (aCourseGateway.Save(aCourseModels) > 0)
                {
                    return "Successfully saved record";
                }
                else
                {
                    return "Saved failed";
                }

            }

        }

        public List<CourseModels> GetAllCourse(string departmentCode)
        {
            return aCourseGateway.GetAllCourse(departmentCode);
        }

        public object GetAllCourseUsingId(string courseId)
        {
            return aCourseGateway.GetAllCourseUsingId(courseId);
        }
    }
}