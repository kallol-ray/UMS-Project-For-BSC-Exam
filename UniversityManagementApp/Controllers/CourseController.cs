using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class CourseController : Controller
    {
        DepartmentManager aDepartmentManager=new DepartmentManager();
        SemesterManager aSemesterManager=new SemesterManager();
        CourseManager aCourseManager=new CourseManager();

        public ActionResult Save()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            var aSemesterList = aSemesterManager.GetAllSemester();
            ViewBag.Semesterist = aSemesterList;
            return View();
        }
        [HttpPost]
        public ActionResult Save(CourseModels aCourseModels)
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            var aSemesterList = aSemesterManager.GetAllSemester();
            ViewBag.Semesterist = aSemesterList;
            ViewBag.Message = aCourseManager.SaveCourse(aCourseModels);
            return View();
        }

        
	}
}