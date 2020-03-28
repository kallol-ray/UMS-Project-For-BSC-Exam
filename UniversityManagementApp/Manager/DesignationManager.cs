using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class DesignationManager
    {
        DesignationGateway aDesignationGateway=new DesignationGateway();
        public List<DesignationModels> GetAllDesignation()
        {
            return aDesignationGateway.GetAllDesignation();
        }
    }
}