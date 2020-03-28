using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class EnrollCourseController : Controller
    {
        EnrollCourseManager aEnrollCourseManager = new EnrollCourseManager();
        public ActionResult Index()
        {
            ViewBag.StudentList = aEnrollCourseManager.GetStudentList();
            return View();
        }

        public JsonResult GetDetailsByStudentId(int studentId)
        {
            var studentDetails = aEnrollCourseManager.GetStudentDetail(studentId);
            var courseOfDepartment = aEnrollCourseManager.GetAllCoureByDeptCode(studentDetails[0].DepartmentCode);
            var studentAndCourses = new {studentDetails = studentDetails, courseOfDepartment = courseOfDepartment};
            return Json(studentAndCourses, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult Index(EnrollCourseModels aEnrollCourseModels)
        {
            ViewBag.StudentList = aEnrollCourseManager.GetStudentList();
            ViewBag.Message = aEnrollCourseManager.Save(aEnrollCourseModels);
            return View();
        }

	}
}