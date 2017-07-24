﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace University_CourseAndResult_ManagementSysApp.Models.ViewModel
{
    public class Student
    {
        public Student(int? id, string name, string regNo)
        {
            Id = id;
            Name = name;
            RegNo = regNo;

        }

        public Student()
        {

        }

        public Nullable<int> Id { set; get; }
        public string RegNo { get; set; }
        [Required(ErrorMessage = "Enter Student Name")]
        public string Name { set; get; }
        [Required(ErrorMessage = "Enter Email Number")]
        [RegularExpression("^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$", ErrorMessage = "E-mail is not valid")]
        public string Email { set; get; }
        [Required(ErrorMessage = "Enter Contact Number")]
        [DisplayName("Contact No.")]
        public string ContactNo { set; get; }
        [Required(ErrorMessage = "Enter Date")]

        public DateTime Date { get; set; }
        [Required(ErrorMessage = "Enter student Address")]
        public string Address { set; get; }
        [DisplayName("Department")]
        [Required(ErrorMessage = "Select Departmatent")]
        public int DepartmentId { set; get; }
    }
}
