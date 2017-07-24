using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Gateway
{
    public class TeacherGateway:Gateway
    {
        public int Save(Teacher teacher)
        {
            Query = "INSERT INTO Teacher VALUES('"+teacher.Name+"','"+teacher.Address+"','"+teacher.Email+
                "','"+teacher.ContactNo+"','"+teacher.Designation+"','"+teacher.DepartmentId+"','"+teacher.CreditToBeTaken+"') ";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public string FindDuplicateEmail(string email)
        {
            Query = "SELECT * FROM Teacher WHERE Email = '"+email+"' ";
            Command.CommandText = Query;
            string message = null;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                message = "Email already exist";
            }
            Reader.Close();
            Connection.Close();
            return message;
        }

        public List<Teacher> GetAllTeacher()
        {
            List<Teacher> teachers = new List<Teacher>();
            Query = "SELECT * FROM Teacher";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Teacher teacher = new Teacher();
                teacher.Id = Convert.ToInt32(Reader["Id"]);
                teacher.DepartmentId = Convert.ToInt32(Reader["DepartmentId"]);
                teacher.Name = Reader["Name"].ToString();
                teacher.CreditToBeTaken = Convert.ToDecimal(Reader["CreditToBeTaken"]);
                teachers.Add(teacher);
            }

            Reader.Close();
            Connection.Close();
            return teachers;
        }
    }
}