using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class CourseModels
    {
        public string Code{ get; set; }
        public string Name{ get; set; }
        public decimal Credit { get; set; }
        public string Description{ get; set; }
        public string DepartmentCode { get; set; }
        public int Id{ get; set; }
    }
}