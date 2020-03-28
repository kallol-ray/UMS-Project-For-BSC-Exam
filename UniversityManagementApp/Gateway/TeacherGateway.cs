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
    public class TeacherGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public bool IsExistEmail(string email)
        {
            bool IsExist = false;
            string SelectQuery = "Select * from t_Teacher Where Email=@Email ";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.AddWithValue("@Email", email);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                IsExist = true;
            }
            aConnection.Close();
            return IsExist;
        }

        public int SaveTeacher(TeacherModel aTeacherModel)
        {
            string InsertQuery = "INSERT INTO t_Teacher (Name, Address, Email, ContactNo, DesignationId, DepartmentCode, CreditToBeTaken)VALUES (@Name,@Address,@Enail,@ContactNo,@DesignationId,@DepartmentCode,@CreditToBeTaken)";
            SqlCommand aCommand = new SqlCommand(InsertQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.Add("Name", SqlDbType.NVarChar);
            aCommand.Parameters["Name"].Value = aTeacherModel.Name;

            aCommand.Parameters.Add("Address", SqlDbType.NVarChar);
            aCommand.Parameters["Address"].Value = aTeacherModel.Address ?? (object)DBNull.Value;
            aCommand.Parameters.Add("Enail", SqlDbType.NVarChar);
            aCommand.Parameters["Enail"].Value = aTeacherModel.Email;
            aCommand.Parameters.Add("ContactNo", SqlDbType.NVarChar);
            aCommand.Parameters["ContactNo"].Value = aTeacherModel.ContactNo ?? (object)DBNull.Value;

            
            
            aCommand.Parameters.Add("DepartmentCode", SqlDbType.NVarChar);
            aCommand.Parameters["DepartmentCode"].Value = aTeacherModel.DepartmentCode;
            aCommand.Parameters.Add("DesignationId", SqlDbType.Int);
            aCommand.Parameters["DesignationId"].Value = aTeacherModel.DesignationId;
            aCommand.Parameters.Add("CreditToBeTaken", SqlDbType.Decimal);
            aCommand.Parameters["CreditToBeTaken"].Value = aTeacherModel.CredittobeTaken;
            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }

        public List<TeacherModel> GetAllteacher( string departmentCode)
        {
            string SelectQuery ="";
            if (departmentCode != "")
            {
                SelectQuery = "Select * from t_Teacher Where DepartmentCode='" + departmentCode + "'";
            }
            else
            {
                SelectQuery = "Select * from t_Teacher";
            }

            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<TeacherModel> aTeacherList = new List<TeacherModel>();

            while (reader.Read())
            {
                TeacherModel aTeacherModel = new TeacherModel();
                aTeacherModel.Id = int.Parse(reader["Id"].ToString());
                aTeacherModel.Name = reader["Name"].ToString();
                aTeacherList.Add(aTeacherModel);
            }
            reader.Close();
            aConnection.Close();
            return aTeacherList;
        }

        public decimal GetCreditTobeTaken(int? id)
        {
            decimal credit = 0;
            string SelectQuery = "Select * from t_Teacher Where Id='"+  id +"' ";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            //aCommand.Parameters.Clear();
            //aCommand.Parameters.AddWithValue("@Id", id);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();

            while (aReader.Read())
            {
                 credit = Convert.ToDecimal(aReader["CreditToBeTaken"].ToString());
            }
            aReader.Close();
            aConnection.Close();
            return credit;
        }


        public decimal GetteacherRemainingCredit(int? id)
        {
            decimal remainingCredit = 0;
            string SelectQuery = "Select TotCredit from VW_GetSumOfCredit Where TeacherId='" + id + "' ";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();

            while (aReader.Read())
            {
                remainingCredit = Convert.ToDecimal(aReader["TotCredit"].ToString());
            }
            aReader.Close();
            aConnection.Close();
            return remainingCredit;
        }
    }
}