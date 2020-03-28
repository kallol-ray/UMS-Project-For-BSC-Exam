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
    public class CourseAssignGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
       
        public bool IsExistAssignCourse(int courseId)
        {
            bool IsExist = false;
            string SelectQuery = "Select * from t_AssignCourse Where CourseId=@CourseId AND Status=1";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.AddWithValue("@CourseId", courseId);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                IsExist = true;
            }
            aConnection.Close();
            return IsExist;
        }

        public int Save(CourseAssignModels aCousAssignModel)
        {
            string InsertQuery = "INSERT INTO t_AssignCourse (DepartmentCode, TeacherId, AllowcateCredit, CourseId,Status)VALUES (@DepartmentCode,@TeacherId,@AllowcateCredit,@CourseId,1)";
            SqlCommand aCommand = new SqlCommand(InsertQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.Add("DepartmentCode", SqlDbType.NVarChar);
            aCommand.Parameters["DepartmentCode"].Value = aCousAssignModel.DepartmentCode;
            aCommand.Parameters.Add("TeacherId", SqlDbType.Int);
            aCommand.Parameters["TeacherId"].Value = aCousAssignModel.Id;
            aCommand.Parameters.Add("AllowcateCredit", SqlDbType.Decimal);
            aCommand.Parameters["AllowcateCredit"].Value = aCousAssignModel.Credit;
            aCommand.Parameters.Add("CourseId", SqlDbType.Int);
            aCommand.Parameters["CourseId"].Value = aCousAssignModel.CourseId;

            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }

        public int Update()
        {
            string updateQuery = "Update t_AssignCourse SET Status=0";
            SqlCommand aCommand = new SqlCommand(updateQuery, aConnection);
            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }
    }
}