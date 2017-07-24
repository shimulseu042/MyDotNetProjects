using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using University_CourseAndResult_ManagementSysApp.Manager;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Controllers
{
    public class TeacherController : Controller
    {
        TeacherManager teacherManager = new TeacherManager();
        // GET: Teacher
        public ActionResult Save()
        {
            ViewBag.getAllDesignation = GetAllDesignation();
            ViewBag.listOfDepartments = teacherManager.GetAllDepartments();
            return View();
        }
        [HttpPost]
        public ActionResult Save(Teacher teacher)
        {
            ViewBag.message = teacherManager.SaveTeacher(teacher);
            ViewBag.getAllDesignation = GetAllDesignation();
            ViewBag.listOfDepartments = teacherManager.GetAllDepartments();
            ModelState.Clear();
            return View();
        }

        private List<SelectListItem> GetAllDesignation()
        {
            List<SelectListItem> designation = new List<SelectListItem>()
            {
                new SelectListItem() {Value = "P", Text = "Professor"},
                new SelectListItem() {Value = "AP", Text = "Assistant Professor"},
                new SelectListItem() {Value = "SL", Text = "Senior Lecturer"},
                new SelectListItem() {Value = "L", Text = "Lecturer"}
                
            };
            return designation;
        }
    }
}