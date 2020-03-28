using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class DepartmentGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public bool IsExistCode(string code)
        {
            bool IsExist = false;
            string SelectQuery = "Select * from t_Department Where Code='"+ code +"'";
            SqlCommand aCommand=new SqlCommand(SelectQuery,aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                IsExist = true;
            }
            aConnection.Close();
            return IsExist;
        }

        public bool IsExistName(string name)
        {
            bool IsExist = false;
            string SelectQuery = "Select * from t_Department Where Name='" + name + "'";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                IsExist = true;
            }
            aConnection.Close();
            return IsExist;
        }


        public int Save(DepartmentModels aDepartment)
        {
            string InsertQuery = "INSERT INTO t_Department (Code,Name)VALUES ('" + aDepartment.Code + "','" + aDepartment.Name + "')";
            SqlCommand aCommand=new SqlCommand(InsertQuery,aConnection);
            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }

       







        public List<DepartmentModels> GetAllDepartment()
        {
            string SelectQuery = "Select * from t_Department";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<DepartmentModels> aDepartmentList = new List<DepartmentModels>();

            while (reader.Read())
            {
                DepartmentModels department = new DepartmentModels();
                department.Code = reader["Code"].ToString();
                department.Name = reader["Name"].ToString();
                aDepartmentList.Add(department);
            }
            reader.Close();
            aConnection.Close();
            return aDepartmentList;
        }








    }
}