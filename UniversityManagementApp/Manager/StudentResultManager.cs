using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class StudentResultManager
    {
        StudentResultGateway aStudentResultGateway=new StudentResultGateway();
        public List<CourseModels> GetAllCourseByStudentId(int studentId)
        {
            return aStudentResultGateway.GetAllCourseByStudentId(studentId);
        }
        public string Save(StudentResultModels asStudentResultModels)
        {
            if (aStudentResultGateway.IsExistResult(asStudentResultModels.StudentId, asStudentResultModels.CourseId)==true)
            {
                return "Already exist result";
            }
            else
            {
                if (aStudentResultGateway.Save(asStudentResultModels) > 0)
                {
                    return "Saved Success";
                }
                else
                {
                    return "Saved Failed";
                }
            }
        }

        public List<CourseModels> GetAllResultByStudentId(int studentId)
        {
            return aStudentResultGateway.GetAllResultByStudentId(studentId);
        }
    }
}