using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.Expressions;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class CourseAssignManager
    {
        CourseAssignGateway assignGateway=new CourseAssignGateway();
        public string Save(CourseAssignModels aCousAssignModel)
        {
            if (assignGateway.IsExistAssignCourse(aCousAssignModel.CourseId) == false)
            {
                if (assignGateway.Save(aCousAssignModel)>0 )
                {
                    return "Course assign success";
                }
                else
                {
                    return "Course assign failed";
                }
            }
            else
            {
                return "This course has already assign";
            }
        }

        public string UnAssignAllCourses()
        {
            if (assignGateway.Update() > 0)
            {
                return "All courses unassign success";
            }
            else
            {
                return "Courses unassign failed";
            }
        }
    }
}