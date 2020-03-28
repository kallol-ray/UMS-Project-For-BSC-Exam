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
    public class CourseGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
       
        public int Save(CourseModels aCourseModels)
        {
            string insertQuery = "INSERT INTO t_Course (Code, Name, Credit, Description, DepartmentCode, SemesterId,Status)VALUES (@Code,@Name,@Credit,@Description,@DepartmentCode,@SemesterId,@Status)";
            SqlCommand aCommand = new SqlCommand(insertQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.Add("Code", SqlDbType.NVarChar);
            aCommand.Parameters["Code"].Value = aCourseModels.Code;
            aCommand.Parameters.Add("Name", SqlDbType.NVarChar);
            aCommand.Parameters["Name"].Value = aCourseModels.Name;
            aCommand.Parameters.Add("Credit", SqlDbType.Decimal);
            aCommand.Parameters["Credit"].Value = aCourseModels.Credit;
            aCommand.Parameters.Add("Description", SqlDbType.NVarChar);
            aCommand.Parameters["Description"].Value = aCourseModels.Description ?? (object)DBNull.Value;
            aCommand.Parameters.Add("DepartmentCode", SqlDbType.NVarChar);
            aCommand.Parameters["DepartmentCode"].Value = aCourseModels.DepartmentCode;
            aCommand.Parameters.Add("SemesterId", SqlDbType.Int);
            aCommand.Parameters["SemesterId"].Value = aCourseModels.Id;

            aCommand.Parameters.Add("Status", SqlDbType.Int);
            aCommand.Parameters["Status"].Value = 1;



            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }

        public bool IsExistCode(string code)
        {
            bool isExist = false;
            string selectQuery = "Select * from t_Course Where Code=@Code ";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.AddWithValue("@Code", code);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                isExist = true;
            }
            aConnection.Close();
            return isExist;
        }
        public bool IsExistName(string name)
        {
            bool isExist = false;
            string selectQuery = "Select * from t_Course Where Name=@Name";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.AddWithValue("@Name", name);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                isExist = true;
            }
            aConnection.Close();
            return isExist;
        }

        public List<CourseModels> GetAllCourse(string departmentCode)
        {
            string selectQuery = "";
            if (departmentCode != "")
            {
                selectQuery = "Select * from t_Course Where DepartmentCode='" + departmentCode + "'";
            }
            else
            {
                selectQuery = "Select * from t_Course";
            }

            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<CourseModels> aCoursesList = new List<CourseModels>();

            while (reader.Read())
            {
                CourseModels aCourse = new CourseModels();
                aCourse.Id = int.Parse(reader["Id"].ToString());
                aCourse.Code = reader["Code"].ToString();
                aCoursesList.Add(aCourse);
            }
            reader.Close();
            aConnection.Close();
            return aCoursesList;
        }
      
        public List<CourseModels> GetAllCourseUsingId(string courseId)
        {
            string selectQuery = "";
            if (courseId != "")
            {
                selectQuery = "Select * from t_Course Where Id='" + courseId + "'";
            }
            else
            {
                selectQuery = "Select * from t_Course";
            }

            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<CourseModels> aCoursesList = new List<CourseModels>();

            while (reader.Read())
            {
                CourseModels aCourse = new CourseModels();
                aCourse.Name = reader["Name"].ToString();
                aCourse.Credit= Convert.ToDecimal(reader["Credit"].ToString());
                aCoursesList.Add(aCourse);
            }
            reader.Close();
            aConnection.Close();
            return aCoursesList;
        }


    }
}