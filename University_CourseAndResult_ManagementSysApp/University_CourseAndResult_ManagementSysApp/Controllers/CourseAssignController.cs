using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using University_CourseAndResult_ManagementSysApp.Manager;

namespace University_CourseAndResult_ManagementSysApp.Controllers
{
    public class CourseAssignController : Controller
    {
        CourseAssignManager courseAssignManager = new CourseAssignManager();
        TeacherManager teacherManager = new TeacherManager();
        // GET: CourseAssign
        public ActionResult CourseAssignToTeacher()
        {
            ViewBag.listOfDepartments = teacherManager.GetAllDepartments();
            return View();
        }
        [HttpPost]
        public ActionResult CourseAssignToTeacher(int departmentId, int teacherId, int courseId)
        {
            ViewBag.msg = courseAssignManager.Save(departmentId, teacherId, courseId);
            ViewBag.listOfDepartments = teacherManager.GetAllDepartments();
            return View();
        }

        public JsonResult GetTeacherByDepartmentId(int deptId)
        {
            var teacher = teacherManager.GetAllTeachers();
            var studentList = teacher.Where(x => x.DepartmentId == deptId).ToList();
            return Json(studentList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCourseCodeByDepartmentId(int deptId)
        {
            var courses = teacherManager.GetAllCourses();
            var studentList = courses.Where(x => x.DepartmentId == deptId).ToList();
            return Json(studentList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCourseNameAndCreditByCourseId(int courseId)
        {
            var teacher = teacherManager.GetAllCourses();
            var studentList = teacher.Where(x => x.Id == courseId).ToList();
            return Json(studentList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetTeacherCreditByTeacherId(int teacherId)
        {
            var teacher = teacherManager.GetAllTeachers();
            var studentList = teacher.Where(x => x.Id == teacherId).ToList();
            return Json(studentList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetTeacherTakenCreditByDepartmentIdAndTeacherId(int deptId, int teacherId)
        {
            var remainingCredit = teacherManager.GetTakenCredit(deptId, teacherId);
            return Json(remainingCredit, JsonRequestBehavior.AllowGet);
        }
    }
}