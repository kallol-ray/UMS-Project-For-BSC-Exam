using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class EnrollCourseManager
    {
        EnrollCourseGateway aEnrollCourseGateway = new EnrollCourseGateway();
        public List<RegisterStudentModel> GetStudentList()
        {
            return aEnrollCourseGateway.GetStudentList();
        }

        public List<RegisterStudentModel> GetStudentDetail(int studentId)
        {
            return aEnrollCourseGateway.GetStudentDetail(studentId);
        }
        public List<CourseModels> GetAllCoureByDeptCode(string deptCode)
        {
            return aEnrollCourseGateway.GetAllCoureByDeptCode(deptCode);
        }

        public string Save(EnrollCourseModels aEnrollCourseModels)
        {

            if (aEnrollCourseGateway.IsExistEnrollCourseByRegNo(aEnrollCourseModels.StudentId,aEnrollCourseModels.CourseId) == true)
            {
                return "Already enrolled this course to this student";
            }
            else
            {
                if (aEnrollCourseGateway.Save(aEnrollCourseModels)>0)
                {
                    return "Course Enrolled Success";
                }
                else
                {
                    return "Saved Failed";
                }
            }
        }

      
    }
}