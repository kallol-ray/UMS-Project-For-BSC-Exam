using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class RoomManager
    {
        
        RoomGateway aRoomGateway=new RoomGateway();
        public List<RoomModels> GetAllRoom()
        {
            return aRoomGateway.GetAllRoom();
        }
    }
}