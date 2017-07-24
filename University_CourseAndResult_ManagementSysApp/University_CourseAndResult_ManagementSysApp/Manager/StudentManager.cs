using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Gateway;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Manager
{
    public class StudentManager
    {
        DepartmentManager departmentManager = new DepartmentManager();
        StudentGateway studentGateway = new StudentGateway();

        public List<Department> GetAllDepartments()
        {
            return departmentManager.GetAllDepartments();
        }

        public string GetLastAddedStudentRegistration(string searchkey)
        {
            return studentGateway.GetLastAddedStudentRegistration(searchkey);
        }

        public IEnumerable<Student> GetAllStudents
        {
            get { return studentGateway.GetAllStudents(); }
        }


        public string SaveStudent(Student aStudent)
        {
            int counter;
            Department department = departmentManager.GetAllDepartments().Single(depid => depid.Id == aStudent.DepartmentId);
            string searchKey = department.Code + "-" + aStudent.Date.Year + "-";
            string lastAddedRegistrationNo = GetLastAddedStudentRegistration(searchKey);
            if (lastAddedRegistrationNo == null)
            {
                aStudent.RegNo = searchKey + "001";

            }

            if (lastAddedRegistrationNo != null)
            {
                string tempId = lastAddedRegistrationNo.Substring((lastAddedRegistrationNo.Length - 3), 3);
                counter = Convert.ToInt32(tempId);
                string studentSl = (counter + 1).ToString("000");


                if (studentSl.Length == 1)
                {

                    aStudent.RegNo = searchKey + "00" + studentSl;

                }
                else if (studentSl.Count() == 2)
                {

                    aStudent.RegNo = searchKey + "0" + studentSl;
                }
                else
                {

                    aStudent.RegNo = searchKey + studentSl;
                }

            }
            var listOfEmailAddress = from student in GetAllStudents
                                     select student.Email;
            string tempEmail = listOfEmailAddress.ToList().Find(email => email.Contains(aStudent.Email));

            if (tempEmail != null)
            {
                return "Email address must be unique";
            }

            if (studentGateway.SaveStudent(aStudent) > 0)
            {
                return "Student Information Saved Successfully!";
            }

            return "Failed to save";


        }
    }
}