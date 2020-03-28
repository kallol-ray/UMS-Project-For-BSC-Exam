using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class RegisterStudentModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string ContactNo { get; set; }
        public string DateTime { get; set; }
        public string Address { get; set; }
        public string DepartmentCode { get; set; }
        public string DepartmentName { get; set; }
        public string StudentRegNo { get; set; }
    }
}