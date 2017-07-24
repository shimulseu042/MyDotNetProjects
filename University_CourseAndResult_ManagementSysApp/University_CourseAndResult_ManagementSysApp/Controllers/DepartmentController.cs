using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using University_CourseAndResult_ManagementSysApp.Manager;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Controllers
{
    
    public class DepartmentController : Controller
    {
        DepartmentManager departmentManager = new DepartmentManager();
        // GET: Department
        public ActionResult Save()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Save(Department department)
        {
            ViewBag.message = departmentManager.SaveDepartment(department);
            ModelState.Clear();
            return View();
        }

        public ActionResult ViewAllDepartment()
        {
            ViewBag.DepartmentList = departmentManager.GetAllDepartments();
            return View();
        }
    }
}