using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class ClassScheduleViewModels
    {
        public string DepartmentCode { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public string ScheduleInfo { get; set; }
    }
}