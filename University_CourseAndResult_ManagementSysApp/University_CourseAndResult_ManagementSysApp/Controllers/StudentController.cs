using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using University_CourseAndResult_ManagementSysApp.Manager;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Controllers
{
    public class StudentController : Controller
    {
        StudentManager studentManager = new StudentManager();
        // GET: Student
        public ActionResult Register()
        {
            ViewBag.listOfDepartments = studentManager.GetAllDepartments();
            return View();
        }
        [HttpPost]
        public ActionResult Register(Student aStudent)
        {
            ViewBag.Message = studentManager.SaveStudent(aStudent);
            ViewBag.listOfDepartments = studentManager.GetAllDepartments();
            ModelState.Clear();
            return View();
        }
    }
}