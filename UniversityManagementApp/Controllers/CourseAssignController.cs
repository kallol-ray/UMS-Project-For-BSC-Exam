using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class CourseAssignController : Controller
    {
        DepartmentManager aDepartmentManager=new DepartmentManager();
        TeacherManager aTeacherManager=new TeacherManager();
        CourseManager aCourseManager=new CourseManager();
        CourseAssignManager aCourseAssignManager=new CourseAssignManager();
        
        public ActionResult Index()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            return View();
        }
        [HttpPost]
        public ActionResult Index(CourseAssignModels aCousAssignModels)
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            ViewBag.Message = aCourseAssignManager.Save(aCousAssignModels);
            return View();
        }
        public JsonResult GetTeacherByDepartmentCode(string departmentCode)
        {
            var teachers = aTeacherManager.GetAllTeacher(departmentCode);
            var courses = aCourseManager.GetAllCourse(departmentCode);
            var teacherCourses = new { courses = courses, teachers = teachers };
            return Json(teacherCourses, JsonRequestBehavior.AllowGet);
            
        }
        public JsonResult GetCourseByDepartmentCode(string departmentCode)
        {
            var courses = aCourseManager.GetAllCourse(departmentCode);
            return Json(courses, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCourseNameByCourseId(string courseId)
        {
            var courses = aCourseManager.GetAllCourseUsingId(courseId);
            return Json(courses, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetTeacherCredit(int?id)
        {
            var teachers = aTeacherManager.GetTeacherCredit(id);
            var teacherTotalCredit = aTeacherManager.GetteacherRemainingCredit(id);
            var remainingCredit = teachers - teacherTotalCredit;
            var getTeacherCreditAndRemainingCredit = new { teachers = teachers, remainingCredit = remainingCredit, teacherTotalCredit = teacherTotalCredit };
            return Json(getTeacherCreditAndRemainingCredit, JsonRequestBehavior.AllowGet);
        }
        public ViewResult UnAssignAllCourses()
        {
            return View();
        }
        public JsonResult UnAssignCourses(string code)
         {
             var message= aCourseAssignManager.UnAssignAllCourses();
             return Json(message, JsonRequestBehavior.AllowGet);
        }


	}
}