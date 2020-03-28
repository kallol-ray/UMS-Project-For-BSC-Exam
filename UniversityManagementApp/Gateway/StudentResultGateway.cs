using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class StudentResultGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public List<CourseModels> GetAllCourseByStudentId(int studentId)
        {
            string selectQuery = "Select a.CourseId,b.Name from t_EnrolledCourses a INNER JOIN t_Course b ON a.CourseId=b.Id AND a.StudentId='"+ studentId +"'";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<CourseModels> aCoursesList = new List<CourseModels>();

            while (reader.Read())
            {
                CourseModels aCourse = new CourseModels();
                aCourse.Id = int.Parse(reader["CourseId"].ToString());
                aCourse.Code = reader["Name"].ToString();
                aCoursesList.Add(aCourse);
            }
            reader.Close();
            aConnection.Close();
            return aCoursesList;
        }

        public bool IsExistResult(int studentId, int courseId)
        {
            bool isExist=false;
            string selectQuery = "Select * from t_Result WHERE StudentId='" + studentId + "' AND CourseId='"+ courseId +"'";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            if (reader.HasRows)
            {
                isExist = true;
            }
           
            reader.Close();
            aConnection.Close();
            return isExist;
        }

        public int Save(StudentResultModels asStudentResultModels)
        {

            string InsertQuery = "INSERT INTO t_Result (StudentId, CourseId, Grade)VALUES (@StudentId,@CourseId,@Grade)";
            SqlCommand aCommand = new SqlCommand(InsertQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.Add("StudentId", SqlDbType.Int);
            aCommand.Parameters["StudentId"].Value = asStudentResultModels.StudentId;
            aCommand.Parameters.Add("CourseId", SqlDbType.Int);
            aCommand.Parameters["CourseId"].Value = asStudentResultModels.CourseId;

            aCommand.Parameters.Add("Grade", SqlDbType.NVarChar);
            aCommand.Parameters["Grade"].Value = asStudentResultModels.GradeLetter;
            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }

        public List<CourseModels> GetAllResultByStudentId(int studentId)
        {
            string selectQuery = @"Select a.StudentId,b.Code,b.Name,Isnull(c.Grade,'Not Graded Yet')AS Grade from (t_EnrolledCourses a INNER JOIN t_Course b ON a.CourseId=b.Id)
                                LEFT JOIN t_Result c
                                ON a.CourseId=c.courseId AND a.StudentId=c.StudentId
                                WHERE a.StudentId='" + studentId + "'";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<CourseModels> aList = new List<CourseModels>();

            while (reader.Read())
            {
                CourseModels aCourse = new CourseModels();
                aCourse.Code = reader["Code"].ToString();
                aCourse.Name = reader["Name"].ToString();
                aCourse.Description = reader["Grade"].ToString();
                aList.Add(aCourse);
            }
            reader.Close();
            aConnection.Close();
            return aList;

        }
    }
}