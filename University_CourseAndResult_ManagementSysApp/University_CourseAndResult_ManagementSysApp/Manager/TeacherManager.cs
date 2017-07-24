using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Gateway;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Manager
{
    public class TeacherManager
    {
        TeacherGateway teacherGateway = new TeacherGateway();
        DepartmentManager departmentManager = new DepartmentManager();
        CourseManager courseManager = new CourseManager();
        AssignCourseViewManager assignCourseViewManager = new AssignCourseViewManager();

        public List<Department> GetAllDepartments()
        {
            return departmentManager.GetAllDepartments();
        }

        public string SaveTeacher(Teacher teacher)
        {
            if (teacherGateway.FindDuplicateEmail(teacher.Email) == null)
            {
                if (teacherGateway.Save(teacher) > 0)
                {
                    return "Saved successfully";
                }
                else
                {
                    return "Saved failed";
                }
            }
            else
            {
                return teacherGateway.FindDuplicateEmail(teacher.Email);
            }
        }

        public List<Teacher> GetAllTeachers()
        {
            return teacherGateway.GetAllTeacher();
        }

        public List<Course> GetAllCourses()
        {
            return courseManager.GetAllCourses();
        }

        public decimal GetTakenCredit(int dId, int tId)
        {
            return assignCourseViewManager.GetTakenCredit(dId, tId);
        }
    }
}