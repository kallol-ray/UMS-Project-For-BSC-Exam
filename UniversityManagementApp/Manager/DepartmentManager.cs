using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class DepartmentManager
    {
        DepartmentGateway aDepartmentGateway=new DepartmentGateway();
        public string SaveDepartment(DepartmentModels aDepartment)
        {
            if (aDepartmentGateway.IsExistCode(aDepartment.Code) == true)
            {
                return "Code already exist !!!";
            }
            else if (aDepartmentGateway.IsExistName(aDepartment.Name) == true)
            {
                return "Name already exist !!!";
            }
            else
            {
                if (aDepartmentGateway.Save(aDepartment) > 0)
                {
                    return "Saved succesfull !!!";
                }
                else
                {
                    return "Saved failed !!!";
                }
            }

        }

        public List<DepartmentModels> GetAllDepartment()
        {
            return aDepartmentGateway.GetAllDepartment();
        }
    }
}