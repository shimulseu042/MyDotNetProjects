using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Gateway;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Manager
{
    public class AssignCourseViewManager
    {
        AssignCourseViewGateway assignCourseViewGateway = new AssignCourseViewGateway();

        public decimal GetTakenCredit(int dId, int tId)
        {
            return assignCourseViewGateway.GetTakenCredit(dId, tId);
        }

        public List<CourseAssign> CourseInformation(int departmentId)
        {
            return assignCourseViewGateway.CourseInformation(departmentId);
        }
    }
}