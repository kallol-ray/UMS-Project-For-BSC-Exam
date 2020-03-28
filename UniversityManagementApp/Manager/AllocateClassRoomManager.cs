using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.SqlServer.Server;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class AllocateClassRoomManager
    {
        AllocateClassRoomGateway allocateClassRoomGateway=new AllocateClassRoomGateway();
        public string Save(AllocateClassRoomModels allocateClassRoomModels)
        {

            DateTime dt1 =
                Convert.ToDateTime(allocateClassRoomModels.TimeFrom + " " + allocateClassRoomModels.TimeAMPMFROM);
            DateTime dt2 =
                Convert.ToDateTime(allocateClassRoomModels.TimeTo + " " + allocateClassRoomModels.TimeAMPMTO);
            if (dt1 > dt2)
            {
                return "Time to must be less than time from";
            }
            else
            {
                if (allocateClassRoomGateway.IsExistSameDaySameTimeSameRoom(allocateClassRoomModels) == true)
                {
                    return "Already exist this schedule try another time or day";
                }
                else
                {
                    if (allocateClassRoomGateway.Save(allocateClassRoomModels) > 0)
                    {
                        return "Saved Success";
                    }
                    else
                    {
                        return "Saved Failed";
                    }
                }
            }
        }

        public string UnAllocatedAllClassRoom(string departmentCode)
        {
            if (allocateClassRoomGateway.Update() > 0)
            {
                return "Unallocated All ClassRoom Success";
            }
            else
            {
                return "Unallocated All ClassRoom Failed";
            }
        }
    }
}