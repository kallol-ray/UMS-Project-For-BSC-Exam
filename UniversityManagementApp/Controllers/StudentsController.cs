using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.Models;


namespace UniversityManagementApp.Controllers
{
    public class StudentsController : Controller
    {
        //
        // GET: /Students/
        public ActionResult Index()
        {
            List<Customer> customers = new List<Customer>();

            for (int i = 1; i <= 10; i++)
            {
                Customer customer = new Customer
                {
                    CustomerID = i,
                    FirstName = string.Format("FirstName{0}", i.ToString()),
                    LastName = string.Format("LastName{0}", i.ToString())
                };
                customers.Add(customer);
            }
            return View(customers);
        }
        public ActionResult PDF()
        {
            List<Customer> customers = new List<Customer>();

            for (int i = 1; i <= 10; i++)
            {
                Customer customer = new Customer
                {
                    CustomerID = i,
                    FirstName = string.Format("FirstName{0}", i.ToString()),
                    LastName = string.Format("LastName{0}", i.ToString())
                };
                customers.Add(customer);
            }

            return new RazorPDF.PdfResult(customers, "PDF");
        }
	}
}