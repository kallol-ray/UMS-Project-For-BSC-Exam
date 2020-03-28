using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class StudentController : Controller
    {

       DepartmentManager aDepartmentManager = new DepartmentManager();
        RegisterStudentManager aRegisterStudentManager = new RegisterStudentManager();
        public ActionResult Index()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            return View();
        }
        [HttpPost]
        public ActionResult Index(RegisterStudentModel aRegisterStudentModel)
        {
            aRegisterStudentModel.StudentRegNo = aRegisterStudentManager.GeneratedRegNumber(aRegisterStudentModel);
            ViewBag.Message = aRegisterStudentManager.Save_Student(aRegisterStudentModel);
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            return View();
        }
	}
	
}