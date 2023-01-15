using FacultyManagement.Model.DataAccessLayer;
using FacultyManagement.Model.EntityLayer;
using System.Collections.ObjectModel;
using System.Windows;

namespace FacultyManagement.Model.BusinessLogicLayer
{
    public class StudentBLL
    {
        readonly static StudentDAL studentDAL = new StudentDAL();

        public ObservableCollection<Student> StudentList { get; set; }

        public ObservableCollection<Student> GetAllStudents()
        {
            return studentDAL.GetAllStudents();
        }

        public Student GetStudent(int id)
        {
            return studentDAL.GetStudent(id);
        }

        public bool AddStudent(Student student)
        {
            if (student.GroupId == 0)
            {
                MessageBox.Show("The group can't be zero!");
                return false;
            }

            if (string.IsNullOrEmpty(student.FirstName) || string.IsNullOrEmpty(student.LastName))
            {
                MessageBox.Show("First name and last name can't be blank!");
                return false;
            }

            if (string.IsNullOrEmpty(student.Cnp))
            {
                MessageBox.Show("Cnp can't be blank!");
                return false;
            }

            studentDAL.AddStudent(student);
            return true;
        }

        public bool UpdateStudent(Student student)
        {
            if (student.StudentId == 0)
            {
                MessageBox.Show("The ID can't be zero!");
                return false;
            }

            if (student.GroupId == 0)
            {
                MessageBox.Show("The group ID can't be zero!");
                return false;
            }

            if (string.IsNullOrEmpty(student.FirstName) || string.IsNullOrEmpty(student.LastName))
            {
                MessageBox.Show("First name and last name can't be blank!");
                return false;
            }

            if (string.IsNullOrEmpty(student.Cnp))
            {
                MessageBox.Show("Cnp can't be blank!");
                return false;
            }

            studentDAL.UpdateStudent(student);
            return true;
        }

        public bool RemoveStudent(Student student)
        {
            if (student.StudentId == 0)
            {
                MessageBox.Show("The ID can't be zero!");
                return false;
            }

            studentDAL.RemoveStudent(student);
            return true;
        }
    }
}
