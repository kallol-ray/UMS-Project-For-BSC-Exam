using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class CourseViewController : Controller
    {
        DepartmentManager aDepartmentManager=new DepartmentManager();
        CourseViewManager aCourseViewManager=new CourseViewManager();
        public ActionResult Index()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            return View();
        }
        [HttpPost]
        public ActionResult Index(string departmentCode)
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            return View();
        }
        public JsonResult GetCourseAssignListByDepartmentCode(string departmentCode)
        {
            var courseAssignList = aCourseViewManager.GetAllCourseAssignList(departmentCode);
            return Json(courseAssignList, JsonRequestBehavior.AllowGet);
        }
    }
}