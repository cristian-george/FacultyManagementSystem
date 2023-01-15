using FacultyManagement.Model.EntityLayer;
using System.Collections.ObjectModel;
using System.Data.SqlClient;

namespace FacultyManagement.Model.DataAccessLayer
{
    public class StudentDAL
    {
        public ObservableCollection<Student> GetAllStudents()
        {
            using (SqlConnection conn = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("spStudentSelectAll", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                ObservableCollection<Student> result = new ObservableCollection<Student>();

                while (reader.Read())
                {
                    Student student = new Student
                    {
                        StudentId = (int)reader[0],
                        GroupId = (int)reader[1],
                        FirstName = (string)reader[2],
                        LastName = (string)reader[3],
                        Cnp = (string)reader[4],
                        Email = (string)reader[5]
                    };

                    result.Add(student);
                }

                reader.Close();
                return result;
            }
        }

        public Student GetStudent(int id)
        {
            using (SqlConnection conn = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("spStudentSelect", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter parameters = new SqlParameter("@StudentId", id);
                cmd.Parameters.Add(parameters);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                Student student = new Student
                {
                    StudentId = (int)reader[0],
                    GroupId = (int)reader[1],
                    FirstName = (string)reader[2],
                    LastName = (string)reader[3],
                    Cnp = (string)reader[4],
                    Email = (string)reader[5]
                };

                reader.Close();
                cmd.ExecuteNonQuery();

                return student;
            }
        }

        public void AddStudent(Student student)
        {
            using (SqlConnection conn = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("spStudentInsert", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter paramGroupId = new SqlParameter("@GroupeId", student.GroupId);
                SqlParameter paramFirstName = new SqlParameter("@FirstName", student.FirstName);
                SqlParameter paramLastName = new SqlParameter("@LastName", student.LastName);
                SqlParameter paramCnp = new SqlParameter("@Cnp", student.Cnp);
                SqlParameter paramEmail = new SqlParameter("@Email", student.Email);

                cmd.Parameters.Add(paramGroupId);
                cmd.Parameters.Add(paramFirstName);
                cmd.Parameters.Add(paramLastName);
                cmd.Parameters.Add(paramCnp);
                cmd.Parameters.Add(paramEmail);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void UpdateStudent(Student student)
        {
            using (SqlConnection conn = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("spStudentUpdate", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter paramStudentId = new SqlParameter("@StudentId", student.StudentId);
                SqlParameter paramGroupId = new SqlParameter("@GroupeId", student.GroupId);
                SqlParameter paramFirstName = new SqlParameter("@FirstName", student.FirstName);
                SqlParameter paramLastName = new SqlParameter("@LastName", student.LastName);
                SqlParameter paramCnp = new SqlParameter("@Cnp", student.Cnp);
                SqlParameter paramEmail = new SqlParameter("@Email", student.Email);
                SqlParameter paramActive = new SqlParameter("@Active", 1);

                cmd.Parameters.Add(paramStudentId);
                cmd.Parameters.Add(paramGroupId);
                cmd.Parameters.Add(paramFirstName);
                cmd.Parameters.Add(paramLastName);
                cmd.Parameters.Add(paramCnp);
                cmd.Parameters.Add(paramEmail);
                cmd.Parameters.Add(paramActive);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void RemoveStudent(Student student)
        {
            using (SqlConnection conn = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("spStudentDelete", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter paramStudentId = new SqlParameter("@StudentId", student.StudentId);
                cmd.Parameters.Add(paramStudentId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}