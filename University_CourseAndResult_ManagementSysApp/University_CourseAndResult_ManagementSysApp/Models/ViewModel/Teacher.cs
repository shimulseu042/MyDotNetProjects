using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace University_CourseAndResult_ManagementSysApp.Models.ViewModel
{
    public class Teacher
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Enter Teacher Name")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Enter Teacher Address")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Enter Teacher Email")]
        [RegularExpression("^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$", ErrorMessage = "Enter Teacher Email")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Enter Teacher Contact Number")]
        [DisplayName("Contact No")]
        public int ContactNo { get; set; }
        [Required(ErrorMessage = "Enter Teacher Designation")]
        public string Designation { get; set; }
        [Required(ErrorMessage = "Enter a department")]
        [DisplayName("Department")]
        public int DepartmentId { get; set; }
        [Required(ErrorMessage = "Enter Teacher Credit To Be taken")]
        [Range(0,Int32.MaxValue,ErrorMessage = "Total Credit must be a positive number")]
        [DisplayName("Credit To Be Taken")]
        public decimal CreditToBeTaken { get; set; }
    }
}