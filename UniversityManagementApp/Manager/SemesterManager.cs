using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class SemesterManager
    {
        SemesterGateway aSemesterGateway=new SemesterGateway();
        public List<SemesterModels> GetAllSemester()
        {
            return aSemesterGateway.GetAllSemester();
        }
    }
}