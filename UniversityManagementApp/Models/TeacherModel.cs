using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class TeacherModel//:CourseModels
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address{ get; set; }
        public string Email { get; set; }
        public string ContactNo { get; set; }
        public int DesignationId { get; set; }
        public string DepartmentCode { get; set; }
        public decimal CredittobeTaken { get; set; }
       // public CourseModels CousrModels { get; set; }
    }
}