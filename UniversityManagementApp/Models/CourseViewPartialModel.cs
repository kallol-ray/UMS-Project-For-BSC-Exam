using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class CourseViewPartialModel
    {
        public string RegNo { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Department { get; set; }
        public string DateTime { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public string Grade { get; set; }
        public virtual ICollection<CourseModels> Courses { get; set; }



    }
}