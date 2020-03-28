using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class AllocateClassRoomModels
    {
        public string DepartmentCode { get; set; }
        public int CourseId { get; set; }
        public int RoomId { get; set; }
        public string DayName { get; set; }
        public string TimeFrom { get; set; }
        public string TimeTo { get; set; }
        public string TimeAMPMFROM { get; set; }
        public string TimeAMPMTO { get; set; }

    }
}