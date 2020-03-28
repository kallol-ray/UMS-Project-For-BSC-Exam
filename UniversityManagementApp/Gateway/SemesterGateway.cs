using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class SemesterGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public List<SemesterModels> GetAllSemester()
        {
            string SelectQuery = @"Select * from t_Semester order by Id";
            SqlCommand aCommand=new SqlCommand(SelectQuery,aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            List<SemesterModels> aSemesterlist=new List<SemesterModels>();
            while (aReader.Read())
            {
                SemesterModels asemester = new SemesterModels();
                    asemester.Id = Convert.ToInt32(aReader["Id"].ToString());
                    asemester.Name = aReader["Name"].ToString();
                    aSemesterlist.Add(asemester);
            }
            aReader.Close();
            aConnection.Close();
            return aSemesterlist;
        }
    }
}