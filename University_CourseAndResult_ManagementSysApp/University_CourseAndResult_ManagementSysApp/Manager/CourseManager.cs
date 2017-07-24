using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Gateway;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Manager
{
    public class CourseManager
    {
        CourseGateway courseGateway = new CourseGateway();
        DepartmentManager departmentManager = new DepartmentManager();
        AssignCourseViewManager assignCourseViewManager = new AssignCourseViewManager();

        public List<Department> GetAllDepartments()
        {
            return departmentManager.GetAllDepartments();
        }

        public string SaveCourse(Course course)
        {
            if (courseGateway.FindDuplicateCode(course) == null)
            {
                if (courseGateway.FindDuplicateName(course) == null)
                {

                    if (courseGateway.SaveCourse(course) > 0)
                    {
                        return "Course Save Successfully";
                    }
                    else
                    {
                        return "Sorry! Course Save Fail";
                    }
                }

                else
                {
                    return courseGateway.FindDuplicateName(course);
                }

            }
            else
            {
                return courseGateway.FindDuplicateCode(course);
            }

        }

        public List<Course> GetAllCourses()
        {
            return courseGateway.GetAllCourses();
        }

        public List<CourseAssign> CourseInformation(int departmentId)
        {
            return assignCourseViewManager.CourseInformation(departmentId);
        }
    }
}