using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace University_CourseAndResult_ManagementSysApp.Models.ViewModel
{
    public class Course
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Enter the Course Code")]
        [StringLength(100,MinimumLength = 5,ErrorMessage = "Course code must be 5 characters long")]
        public string Code { get; set; }
        [Required(ErrorMessage = "Enter the course name")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Enter the course credit")]
        [Range(0.5, 5.0,ErrorMessage = "Course credit must be between 0.5 to 5.0 ")]
        public decimal Credit { get; set; }
        [Required(ErrorMessage = "Enter the course description")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Select a department")]
        [DisplayName("Department")]
        public int DepartmentId { get; set; }
        [Required(ErrorMessage = "Select a semester")]
        [DisplayName("Semester")]
        public string Semester { get; set; }
    }
}