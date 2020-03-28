using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class CourseViewGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public List<CourseViewModels> GetAllCourse(string departmentCode)
        {
            string selectQuery = @"Select b.Code,b.Name,c.Name As Semester,ISNULL(d.Name,'Not Assign Yet') AS AssignTo 
                                from t_AssignCourse a RIGHT JOIN t_Course b ON a.CourseId=b.Id 
                                LEFT JOIN t_Semester c ON b.SemesterId=c.Id
                                LEFT JOIN t_Teacher d ON a.TeacherId=d.Id
                                AND a.Status=1 WHERE b.DepartmentCode='" + departmentCode + "'";

            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<CourseViewModels> aCoursesViewList = new List<CourseViewModels>();

            while (reader.Read())
            {
                CourseViewModels aCourse = new CourseViewModels();
                aCourse.Code = reader["Code"].ToString();
                aCourse.Name = reader["Name"].ToString();
                aCourse.Semester = reader["Semester"].ToString();
                aCourse.AssignTo = reader["AssignTo"].ToString();
                aCoursesViewList.Add(aCourse);
            }
            reader.Close();
            aConnection.Close();
            return aCoursesViewList;
        }
    }
}