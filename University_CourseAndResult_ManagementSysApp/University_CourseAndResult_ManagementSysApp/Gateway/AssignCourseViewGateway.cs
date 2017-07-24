using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Gateway
{
    public class AssignCourseViewGateway : Gateway
    {
        public decimal GetTakenCredit(int dId, int tId)
        {
            decimal takenCredit = 0;
            Query = "SELECT * FROM CourseAssignView WHERE DepartmentId=" + dId + " AND TeacherId=" + tId + "";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                takenCredit += Convert.ToDecimal(Reader["CourseCredit"]);
            }
            Connection.Close();
            Reader.Close();
            return takenCredit;
        }

        public List<CourseAssign> CourseInformation(int departmentId)
        {

            List<CourseAssign> remainingCredits = new List<CourseAssign>();
            Query = "SELECT * FROM CourseAssignView WHERE DepartmentId=" + departmentId + "";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                CourseAssign courseAssingModel = new CourseAssign();
                courseAssingModel.CourseCode = Reader["CourseCode"].ToString();
                courseAssingModel.CourseName = Reader["CourseName"].ToString();
                courseAssingModel.CourseSemester = Reader["CourseSemester"].ToString();
                courseAssingModel.TeacherName = Reader["TeacherName"].ToString();

                remainingCredits.Add(courseAssingModel);
            }
            Reader.Close();
            Connection.Close();
            return remainingCredits;
        }
    }
}