using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Rotativa;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class ViewResultController : Controller
    {
       // StudentResultManager aStudentResultManager = new StudentResultManager();
        EnrollCourseManager aEnrollCourseManager = new EnrollCourseManager();
        StudentResultManager aStudentResultManager=new StudentResultManager();
       
        public ActionResult Index()
        {
            ViewBag.StudentList = aEnrollCourseManager.GetStudentList();
            return View();
        }
        public JsonResult GetDetailsByStudentId(int studentId)
        {
            var studentDetails = aEnrollCourseManager.GetStudentDetail(studentId);
            var result = aStudentResultManager.GetAllResultByStudentId(studentId);
            var studentAndResult = new { studentDetails = studentDetails, result = result };
            return Json(studentAndResult, JsonRequestBehavior.AllowGet);
        }
       
        public ActionResult MakePdf(int studentId)
        {
            ViewBag.studentDetails = aEnrollCourseManager.GetStudentDetail(studentId);
            ViewBag.result = aStudentResultManager.GetAllResultByStudentId(studentId);
            //var studentAndResult = new { studentDetails = studentDetails, result = result };
            return View(aEnrollCourseManager.GetStudentDetail(studentId));
        }

        public ActionResult GenteratePdf(int studentId)
        {
            
            return new Rotativa.ActionAsPdf("MakePdf", new { studentId = studentId });
        }
       }
}