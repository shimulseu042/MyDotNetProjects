﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Gateway
{
    public class DepartmentGateway:Gateway
    {
        public int SaveDepartment(Department department)
        {
            Query = "INSERT INTO Department VALUES('"+department.Code+"','"+department.Name+"')";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public string FindDuplicateCode(Department department)
        {
            Query = "SELECT * FROM Department WHERE Code='" + department.Code + "'";
            Command.CommandText = Query;
            string message = null;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                message = "Department Code Already Exist";
            }
            Reader.Close();
            Connection.Close();
            return message;
        }

        public string FindDuplicateName(Department department)
        {
            Query = "SELECT * FROM Department WHERE Name='" + department.Name + "'";
            Command.CommandText = Query;
            string message = null;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                message = "Department Name Already Exist";
            }
            Reader.Close();
            Connection.Close();
            return message;
        }

        public List<Department> GetAllDepartments()
        {
            List<Department> departmentsList = new List<Department>();
            Query = "SELECT * FROM Department";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Department aDepartment = new Department();
                aDepartment.Id = (int?) Reader["Id"];
                aDepartment.Code = Reader["Code"].ToString();
                aDepartment.Name = Reader["Name"].ToString();
                departmentsList.Add(aDepartment);
            }
            Reader.Close();
            Connection.Close();
            return departmentsList;
        }
    }
}