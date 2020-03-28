using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class RoomGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        

        public List<RoomModels> GetAllRoom()
        {
            string SelectQuery = @"Select * from t_Room order by Id";
            SqlCommand aCommand = new SqlCommand(SelectQuery, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            List<RoomModels> aRoomlist = new List<RoomModels>();
            while (aReader.Read())
            {
                RoomModels aRoom = new RoomModels();
                aRoom.Id = Convert.ToInt32(aReader["Id"].ToString());
                aRoom.Name = aReader["Name"].ToString();
                aRoomlist.Add(aRoom);
            }
            aReader.Close();
            aConnection.Close();
            return aRoomlist;
        }
    }
}