using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace University_CourseAndResult_ManagementSysApp.Models.ViewModel
{
    public class Department
    {
        public Nullable<int> Id { get; set; }
        [Required(ErrorMessage = "Enter the code number of the Department")]
        [StringLength(7, MinimumLength = 2,ErrorMessage = "Length of the code must be 2 to 7")]
        public string Code { get; set; }
        [Required(ErrorMessage = "Enter the name of the department")]
        public string Name { get; set; }

        public Department(int? id, string code, string name)
        {
            Id = id;
            Code = code;
            Name = name;
        }

        public Department()
        {
            
        }

    }
}