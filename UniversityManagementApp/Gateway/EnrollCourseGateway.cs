using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Microsoft.Ajax.Utilities;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class EnrollCourseGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public List<RegisterStudentModel> GetStudentList()
        {

            string selectQuery = "Select * from t_Student order by Id";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<RegisterStudentModel> aStudentList = new List<RegisterStudentModel>();
            while (reader.Read())
            {
                RegisterStudentModel student = new RegisterStudentModel();
                student.Id = Convert.ToInt32(reader["Id"].ToString());
                student.StudentRegNo =reader["RegNo"].ToString();
                aStudentList.Add(student);
            }
            reader.Close();
            aConnection.Close();
            return aStudentList;
        }

        public List<RegisterStudentModel> GetStudentDetail(int studentId)
        {
            string selectQuery = @"Select a.RegNo,a.Id,a.Name,a.Email,a.DepartmentCode,b.Name AS DepartmentName from t_Student a INNER JOIN t_Department b ON a.DepartmentCode=b.Code
                                 WHERE a.Id='" + studentId + "' ORDER BY a.Id";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<RegisterStudentModel> aStudentList = new List<RegisterStudentModel>();
            while (reader.Read())
            {
                RegisterStudentModel student = new RegisterStudentModel();
                student.Name = reader["Name"].ToString();
                student.Email = reader["Email"].ToString();
                student.DepartmentCode = reader["DepartmentCode"].ToString();
                student.DepartmentName = reader["DepartmentName"].ToString();
                student.StudentRegNo = reader["RegNo"].ToString();
                aStudentList.Add(student);
            }
            reader.Close();
            aConnection.Close();
            return aStudentList ;
        }


        public List<CourseModels> GetAllCoureByDeptCode(string deptCode)
        {
            string selectQuery = @"Select a.CourseId,a.DepartmentCode,b.Name From t_AssignCourse a INNER JOIN t_Course b ON a.CourseId=b.Id WHERE a.DepartmentCode='" + deptCode + "'  AND a.status=1 ORDER BY a.CourseId";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<CourseModels> aCourseList = new List<CourseModels>();
            while (reader.Read())
            {
                CourseModels aCourseModels = new CourseModels();
                aCourseModels.Id = Convert.ToInt32(reader["CourseId"].ToString());
                aCourseModels.Name = reader["Name"].ToString();
                aCourseList.Add(aCourseModels);
            }
            reader.Close();
            aConnection.Close();
            return aCourseList;
        }

        public bool IsExistEnrollCourseByRegNo(int studentId, int courseId)
        {
            bool isExist = false;
            string selectQuery = "Select * from t_EnrolledCourses Where CourseId=@CourseId AND StudentId=@StudentId  ";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.AddWithValue("@CourseId", courseId);
            aCommand.Parameters.AddWithValue("@StudentId", studentId);
            
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                isExist = true;
            }
            aConnection.Close();
            return isExist;
        }

        public int Save(EnrollCourseModels aEnrollCourseModels)
        {
            string InsertQuery = "INSERT INTO t_EnrolledCourses (StudentId, CourseId, Date)VALUES (@StudentId,@CourseId,@Date)";
            SqlCommand aCommand = new SqlCommand(InsertQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.Add("StudentId", SqlDbType.Int);
            aCommand.Parameters["StudentId"].Value = aEnrollCourseModels.StudentId;

            aCommand.Parameters.Add("CourseId", SqlDbType.Int);
            aCommand.Parameters["CourseId"].Value = aEnrollCourseModels.CourseId;

            aCommand.Parameters.Add("Date", SqlDbType.NVarChar);
            aCommand.Parameters["Date"].Value = aEnrollCourseModels.Date;

       

            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }
    }
}