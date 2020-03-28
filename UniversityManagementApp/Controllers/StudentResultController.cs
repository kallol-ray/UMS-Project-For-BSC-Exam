using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class StudentResultController : Controller
    {
        StudentResultManager aStudentResultManager = new StudentResultManager();
        EnrollCourseManager aEnrollCourseManager=new EnrollCourseManager();
        public ActionResult Index()
        {
            ViewBag.StudentList = aEnrollCourseManager.GetStudentList();
            return View();
        }

        public JsonResult GetDetailsByStudentId(int studentId)
        {
            var studentDetails = aEnrollCourseManager.GetStudentDetail(studentId);
            var courseOfDepartment = aStudentResultManager.GetAllCourseByStudentId(studentId);
            var studentAndCourses = new { studentDetails = studentDetails, courseOfDepartment = courseOfDepartment };
            return Json(studentAndCourses, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult Index(StudentResultModels asrStudentResultModels)
        {
            ViewBag.StudentList = aEnrollCourseManager.GetStudentList();
            ViewBag.Message = aStudentResultManager.Save(asrStudentResultModels);
            return View();
        }
	}
}