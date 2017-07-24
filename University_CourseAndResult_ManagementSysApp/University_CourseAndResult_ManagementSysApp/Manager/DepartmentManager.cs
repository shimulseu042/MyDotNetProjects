﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using University_CourseAndResult_ManagementSysApp.Gateway;
using University_CourseAndResult_ManagementSysApp.Models.ViewModel;

namespace University_CourseAndResult_ManagementSysApp.Manager
{
    public class DepartmentManager
    {
        DepartmentGateway departmentGateway = new DepartmentGateway();

        public string SaveDepartment(Department department)
        {
            if (departmentGateway.FindDuplicateCode(department) == null)
            {
                if (departmentGateway.FindDuplicateName(department) == null)
                {
                    if (departmentGateway.SaveDepartment(department) > 0)
                    {
                        return "Department Save Successfully.";
                    }
                    else
                    {
                        return "Sorry! Department Save Fail.";
                    }
                }
                else
                {
                    return departmentGateway.FindDuplicateName(department);
                }
            }
            else
            {
                return departmentGateway.FindDuplicateCode(department);
            }

        }

        public List<Department> GetAllDepartments()
        {
            return departmentGateway.GetAllDepartments();
        }
    }
}