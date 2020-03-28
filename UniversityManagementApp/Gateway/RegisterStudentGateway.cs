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
    public class RegisterStudentGateway
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public bool IsExistsEmail(string email)
        {
            bool isExist = false;
            string sqlQuery = "SELECT Email from t_Student WHERE Email='" + email + "'";
            SqlCommand command = new SqlCommand(sqlQuery, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                isExist = true;
            }
            connection.Close();
            return isExist;
        }

        public string GenerateRegNum(RegisterStudentModel aRegisterStudentModel)
        {
            string registrationNo = "";
            string selectQuery = @"SELECT '" + aRegisterStudentModel.DepartmentCode + "'+'-'+ RIGHT(Convert(varchar,YEAR(GETDATE())), 4) +'-'+RIGHT('000'+ Convert(varchar,ISNULL(Max(Convert(integer, RIGHT(RegNo, 3))),0)+ 1), 3) AS REGNO FROM t_student WHERE  LEFT(RegNo, CHARINDEX('-', RegNo) - 1)='"+ aRegisterStudentModel.DepartmentCode +"'";
            SqlCommand command = new SqlCommand(selectQuery, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                registrationNo = reader["REGNO"].ToString();
            }
            reader.Close();
            connection.Close();
            return registrationNo;
        }
        public int Save_Student(RegisterStudentModel aRegisterStudentModel)
        {

            string insertQuery = "INSERT INTO t_Student (RegNo, Name, Email, ContactNo, Date, Address, DepartmentCode) " +
                              "VALUES(@StdRegNo,@StdName,@StdEmail,@StdContactNo,@StdDate,@StdAddress,@DepartmentId)";
            SqlCommand command = new SqlCommand(insertQuery, connection);
            command.Parameters.Clear();
            command.Parameters.Add("StdName", SqlDbType.NVarChar);
            command.Parameters["StdName"].Value = aRegisterStudentModel.Name;
            command.Parameters.Add("StdEmail", SqlDbType.NVarChar);
            command.Parameters["StdEmail"].Value = aRegisterStudentModel.Email;
            command.Parameters.Add("StdContactNo", SqlDbType.VarChar);
            command.Parameters["StdContactNo"].Value = aRegisterStudentModel.ContactNo;
            command.Parameters.Add("StdDate", SqlDbType.VarChar);
            command.Parameters["StdDate"].Value = aRegisterStudentModel.DateTime;
            command.Parameters.Add("StdAddress", SqlDbType.NVarChar);
            command.Parameters["StdAddress"].Value = aRegisterStudentModel.Address;
            command.Parameters.Add("DepartmentId", SqlDbType.NVarChar);
            command.Parameters["DepartmentId"].Value = aRegisterStudentModel.DepartmentCode;
            command.Parameters.Add("StdRegNo", SqlDbType.VarChar);
            command.Parameters["StdRegNo"].Value = aRegisterStudentModel.StudentRegNo;
            connection.Open();
            int isInserted = command.ExecuteNonQuery();
            connection.Close();
            return isInserted;
        }
    }
}