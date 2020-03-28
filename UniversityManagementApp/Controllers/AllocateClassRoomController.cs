using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class AllocateClassRoomController : Controller
    {
        DepartmentManager aDepartmentManager=new DepartmentManager();
        CourseManager aCourseManager=new CourseManager();
        RoomManager aRoomManager=new RoomManager();
        AllocateClassRoomManager allocateClassRoomManager=new AllocateClassRoomManager();

        public ActionResult Index()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            ViewBag.RoomList = aRoomManager.GetAllRoom();
            return View();
        }
        [HttpPost]
        public ActionResult Index(AllocateClassRoomModels allocateClassRoomModels)
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            ViewBag.RoomList = aRoomManager.GetAllRoom();
            ViewBag.Message = allocateClassRoomManager.Save(allocateClassRoomModels);
            return View();
        }

        public JsonResult GetCourseByDepartmentCode(string departmentCode)
        {
            var courses = aCourseManager.GetAllCourse(departmentCode);
            return Json(courses, JsonRequestBehavior.AllowGet);
        }
        public ViewResult UnallocateAllClassRomm()
        {
            return View();
        }


        public JsonResult UnallcateAllClass(string departmentCode)
        {
            var courses = allocateClassRoomManager.UnAllocatedAllClassRoom(departmentCode);
          
            return Json(courses, JsonRequestBehavior.AllowGet);
        }




	}
}