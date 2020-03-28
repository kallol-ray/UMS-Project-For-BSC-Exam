using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Manager;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class DepartmentController : Controller
    {
        DepartmentManager aDepartmentManager=new DepartmentManager();
        public ActionResult Save()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Save(DepartmentModels aDepartment)
        {
            ViewBag.Message = aDepartmentManager.SaveDepartment(aDepartment);
            return View();
        }
        public ActionResult ViewDepartment()
        {
            var aDepartments = aDepartmentManager.GetAllDepartment();
            ViewBag.DepartmentList = aDepartments;
            return View();
        }

    }
}