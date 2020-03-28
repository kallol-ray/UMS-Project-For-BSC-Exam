using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class TeacherManager
    {
        TeacherGateway aTeacherGateway=new TeacherGateway();
        public string SaveCourse(TeacherModel aTeacherModel)
        {
            if (aTeacherGateway.IsExistEmail(aTeacherModel.Email)==true)
            {
                return "This email already exist try another email";
            }
            else
            {
                if (aTeacherGateway.SaveTeacher(aTeacherModel) > 0)
                {
                    return "Successfully saved record";
                }
                else
                {
                    return "Saved failed";
                }
            }
        }

        public List<TeacherModel> GetAllTeacher(string departmentCode)
        {
            return aTeacherGateway.GetAllteacher(departmentCode);
        }

      

        public decimal GetTeacherCredit(int? id)
        {
            return aTeacherGateway.GetCreditTobeTaken(id);
        }

        public decimal GetteacherRemainingCredit(int? id)
        {
            return aTeacherGateway.GetteacherRemainingCredit(id);
        }
    }
}