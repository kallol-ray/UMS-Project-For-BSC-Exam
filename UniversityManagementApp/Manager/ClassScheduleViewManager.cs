using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Manager
{
    public class ClassScheduleViewManager
    {
        ClassScheduleViewGateway aClassScheduleViewGateway=new ClassScheduleViewGateway();
        public List<ClassScheduleViewModels> GetClassScheduleAndClassRoomAllocationListByDepartmentCode(string departmentCode)
        {
            return aClassScheduleViewGateway.GetClassScheduleAndClassRoomAllocationListByDepartmentCode(departmentCode);
        }
    }
}