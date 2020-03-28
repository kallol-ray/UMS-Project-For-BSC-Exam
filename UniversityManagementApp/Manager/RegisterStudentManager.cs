using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class RegisterStudentManager
    {

        RegisterStudentGateway aRegisterStudentGateway = new RegisterStudentGateway();

        public string GeneratedRegNumber(RegisterStudentModel aRegisterStudentModel)
        {
            return aRegisterStudentGateway.GenerateRegNum(aRegisterStudentModel);
        }
        public string Save_Student(RegisterStudentModel aRegisterStudentModel)
        {
            if (!aRegisterStudentGateway.IsExistsEmail(aRegisterStudentModel.Email))
            {
                if (aRegisterStudentGateway.Save_Student(aRegisterStudentModel) > 0)
                {
                    return "Registration Completed for : " + aRegisterStudentModel.Name + " Registration Number : " + aRegisterStudentModel.StudentRegNo;

                }
                else
                {
                    return "Registration are Failed !!!";
                }
            }
            else
            {
                return aRegisterStudentModel.Email + " Is Duplicate Email Address";
            }
        }
    }
}