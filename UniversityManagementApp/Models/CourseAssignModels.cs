using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class CourseAssignModels
    {
        public string DepartmentCode { get; set; }
        public int Id { get; set; }
        public decimal CredittobeTaken { get; set; }
        public int CourseId { get; set; }
        public decimal Credit { get; set; }
    }
}