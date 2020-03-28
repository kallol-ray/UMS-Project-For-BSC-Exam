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
    public class AllocateClassRoomGateway
    {


        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());
        public bool IsExistSameDaySameTimeSameRoom(AllocateClassRoomModels allocateClassRoomModels)
        {
            bool isExist = false;



           // DateTime timeFrom = Convert.ToDateTime(GetTimeFromByDay(allocateClassRoomModels.DayName, allocateClassRoomModels.RoomId));
           // DateTime timeTo = Convert.ToDateTime(GetTimeToByDay(allocateClassRoomModels.DayName, allocateClassRoomModels.RoomId));
            DateTime timeFromNow = Convert.ToDateTime(allocateClassRoomModels.TimeFrom + " " + allocateClassRoomModels.TimeAMPMFROM);
            DateTime timeToNow = Convert.ToDateTime(allocateClassRoomModels.TimeTo + " " + allocateClassRoomModels.TimeAMPMTO);

            string selectQuery = @"Select * from t_AllocateClassrooms WHERE DayName='" + allocateClassRoomModels.DayName + "' AND RoomId='" + allocateClassRoomModels.RoomId + "' AND Status=1";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            List<AllocateClassRoomModels> aAllocateClassRoomsList = new List<AllocateClassRoomModels>();
            while (aReader.Read())
            {
                AllocateClassRoomModels allocateClassRoom = new AllocateClassRoomModels();
                    allocateClassRoom.DayName = aReader["DayName"].ToString();
                    allocateClassRoom.RoomId = int.Parse(aReader["RoomId"].ToString());
                    allocateClassRoom.TimeFrom = aReader["TimeFrom"].ToString();
                    allocateClassRoom.TimeTo= aReader["TimeTo"].ToString();
                    aAllocateClassRoomsList.Add(allocateClassRoom);
            }


            foreach (var x in aAllocateClassRoomsList)
            { 
                DateTime timeFrom=Convert.ToDateTime(x.TimeFrom) ;
                DateTime timeTo = Convert.ToDateTime(x.TimeTo);
               
                if ((timeFromNow >= timeFrom) && (timeFromNow <= timeTo))
                {
                    aConnection.Close();
                    return true;
                }
                if ((timeToNow >= timeFrom) && (timeToNow<= timeTo))
                {
                    aConnection.Close();
                    return true;
                }





            }
            aConnection.Close();
            return false;







            

            //if (IsExist != false)
            //{
            //    if ((timeFromNow < timeFrom) || (timeFromNow > timeTo))
            //    {
            //        IsExist = false;
            //    }
            //    else
            //    {
            //        IsExist = true;
            //    }
            //}
            //return IsExist;
        }

        private string GetTimeToByDay(string dayName, int roomId)
        {
            string timeTo = "00:00:00";
            string selectQuery = @"Select TOP (1) * from t_AllocateClassrooms WHERE DayName='" + dayName + "' AND RoomId='" + roomId + "'  order by  id desc";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            while (aReader.Read())
            {
                timeTo = aReader["TimeTo"].ToString();
            }
            aReader.Close();
            aConnection.Close();
            return timeTo;
        }

        private string GetTimeFromByDay(string dayName, int roomId)
        {
            string timeFrom = "00:00:00";
            string selectQuery = @"Select  * from t_AllocateClassrooms WHERE DayName='" + dayName + "' AND RoomId='" + roomId + "'  order by  id ";
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            while (aReader.Read())
            {
                timeFrom = aReader["timeFrom"].ToString();
            }
            aReader.Close();
            aConnection.Close();
            return timeFrom;
        }

        public int Save(AllocateClassRoomModels allocateClassRoomModels)
        {
            string InsertQuery = "INSERT INTO t_AllocateClassrooms (DepartmentCode, CourseId, RoomId, DayName, TimeFrom, TimeTo,Status)VALUES (@DepartmentCode,@CourseId,@RoomId,@DayName,@TimeFrom,@TimeTo,1)";
            SqlCommand aCommand = new SqlCommand(InsertQuery, aConnection);
            aCommand.Parameters.Clear();
            aCommand.Parameters.Add("DepartmentCode", SqlDbType.NVarChar);
            aCommand.Parameters["DepartmentCode"].Value = allocateClassRoomModels.DepartmentCode;

            aCommand.Parameters.Add("CourseId", SqlDbType.Int);
            aCommand.Parameters["CourseId"].Value = allocateClassRoomModels.CourseId;

            aCommand.Parameters.Add("RoomId", SqlDbType.Int);
            aCommand.Parameters["RoomId"].Value = allocateClassRoomModels.RoomId;

            aCommand.Parameters.Add("DayName", SqlDbType.NVarChar);
            aCommand.Parameters["DayName"].Value = allocateClassRoomModels.DayName;

            aCommand.Parameters.Add("TimeFrom", SqlDbType.NVarChar);
            aCommand.Parameters["TimeFrom"].Value = allocateClassRoomModels.TimeFrom + " " + allocateClassRoomModels.TimeAMPMFROM;

            aCommand.Parameters.Add("TimeTo", SqlDbType.NVarChar);
            aCommand.Parameters["TimeTo"].Value = allocateClassRoomModels.TimeTo + " " + allocateClassRoomModels.TimeAMPMTO;


            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }

        public int Update()
        {
            string updateQuery = "Update t_AllocateClassrooms SET Status=0";
            SqlCommand aCommand = new SqlCommand(updateQuery, aConnection);
            aConnection.Open();
            int rowAffected = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowAffected;
        }
    }
}