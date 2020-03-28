using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;

namespace UniversityManagementApp.Controllers
{
    public class ClassScheduleViewController : Controller
    {
        DepartmentManager aDepartmentManager=new DepartmentManager();
        ClassScheduleViewManager aClassScheduleViewManager=new ClassScheduleViewManager();

        public ActionResult Index()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            return View();
        }
        public JsonResult GetClassScheduleAndClassRoomAllocationListByDepartmentCode(string departmentCode)
        {
            var classScheduleList = aClassScheduleViewManager.GetClassScheduleAndClassRoomAllocationListByDepartmentCode(departmentCode);
            return Json(classScheduleList, JsonRequestBehavior.AllowGet);
        }



	}
}