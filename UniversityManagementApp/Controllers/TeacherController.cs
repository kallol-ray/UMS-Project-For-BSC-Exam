using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class TeacherController : Controller
    {
        DepartmentManager aDepartmentManager = new DepartmentManager();
        TeacherManager aTeacherManager=new TeacherManager();
        DesignationManager aDesignationManager=new DesignationManager();

        public ActionResult Save()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            var aDesignationList = aDesignationManager.GetAllDesignation();
            ViewBag.DesignationList = aDesignationList;
            return View();
        }
        [HttpPost]
        public ActionResult Save(TeacherModel aTeacherModel)
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            var aDesignationList = aDesignationManager.GetAllDesignation();
            ViewBag.DesignationList = aDesignationList;
            ViewBag.Message = aTeacherManager.SaveCourse(aTeacherModel);
            return View();
        }




	}
}