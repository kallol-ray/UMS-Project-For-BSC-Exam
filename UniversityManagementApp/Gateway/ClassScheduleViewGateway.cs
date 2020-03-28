using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class ClassScheduleViewGateway
    {
        SqlConnection aConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["UniversityManagementAppConnection"].ConnectionString.ToString());


        public List<ClassScheduleViewModels> GetClassScheduleAndClassRoomAllocationListByDepartmentCode(string departmentCode)
        {
            //string selectQuery = @"Select * from VW_ClassScheduleFinal WHERE DepartmentCode='" + departmentCode + "' ORDER BY DepartmentCode";

            string selectQuery = @"SELECT IsNull(a.ScheduleInfo,'Not Schedule Yet')AS ScheduleInfo, b.Code,b.Name from VW_ClassScheduleFinal a 
RIGHT JOIN t_Course b ON a.CourseId=b.Id WHERE b.DepartmentCode='" + departmentCode + "'";
           
            SqlCommand aCommand = new SqlCommand(selectQuery, aConnection);
            aConnection.Open();
            SqlDataReader reader = aCommand.ExecuteReader();
            List<ClassScheduleViewModels> aLists = new List<ClassScheduleViewModels>();
            while (reader.Read())
            {
                ClassScheduleViewModels aList = new ClassScheduleViewModels();
                aList.CourseCode = reader["Code"].ToString();
                aList.CourseName = reader["Name"].ToString();
                aList.ScheduleInfo = reader["ScheduleInfo"].ToString();
                aLists.Add(aList);
            }
            reader.Close();
            aConnection.Close();
            return aLists;
        }






        


        
    }
}