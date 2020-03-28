using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class CourseViewManager
    {
        CourseViewGateway aCourseViewGateway=new CourseViewGateway();
        public List<CourseViewModels> GetAllCourseAssignList(string departmentCode)
        {
            return aCourseViewGateway.GetAllCourse(departmentCode);
        }
    }
}