using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class DesignationGateway
    {
        private SqlConnection aConnection =
            new SqlConnection(
                WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString
                    ());

        public List<DesignationModels> GetAllDesignation()
        {
            string SelectQuery = @"Select * from t_Designation order by Id";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            List<DesignationModels> aDesignationlist = new List<DesignationModels>();
            while (aReader.Read())
            {
                DesignationModels aDesignation = new DesignationModels();
                aDesignation.Id = Convert.ToInt32(aReader["Id"].ToString());
                aDesignation.Name = aReader["Name"].ToString();
                aDesignationlist.Add(aDesignation);
            }
            aReader.Close();
            aConnection.Close();
            return aDesignationlist;
        }
    }
}