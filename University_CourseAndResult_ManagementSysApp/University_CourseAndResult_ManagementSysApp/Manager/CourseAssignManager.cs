using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Gateway;

namespace University_CourseAndResult_ManagementSysApp.Manager
{
    public class CourseAssignManager
    {
        CourseAssignGateway courseAssignGateway = new CourseAssignGateway();
        AssignCourseViewGateway assignCourseViewGateway = new AssignCourseViewGateway();

        public string Save(int did, int tid, int cid)
        {
            if (!courseAssignGateway.OverlapCourse(tid,cid))
            {
                if (!courseAssignGateway.AssignCourse(cid))
                {
                    if (courseAssignGateway.Save(did,tid,cid)>0)
                    {
                        return "Saved Successfully";
                    }
                    else
                    {
                        return "Saved Failed";
                    }
                }
                return "Course Already asigned!!";
            }
            return "Course Overlapped";
        }
    }
}