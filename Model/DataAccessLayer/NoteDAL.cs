using System.Collections.ObjectModel;
using System.Data.SqlClient;
using FacultyManagement.Model.EntityLayer;

namespace FacultyManagement.Model.DataAccessLayer
{
    internal class NoteDAL
    {
        public ObservableCollection<Note> GetStudentNotes(Student student)
        {
            using (SqlConnection conn = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("spGetStudentNotes", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter parameters = new SqlParameter("@StudentId", student.StudentId);
                cmd.Parameters.Add(parameters);
                conn.Open();

                ObservableCollection<Note> notes = new ObservableCollection<Note>();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Note note = new Note
                    {
                        NoteId = (int)reader[0],
                        ProfessorId = (int)reader[1],
                        StudentId = (int)reader[2],
                        SubjectId = (int)reader[3],
                        ExamDate = reader.GetDateTime(4).ToString("dd/MM/yyyy"),
                        Grade = (short)reader[5],
                    };

                    notes.Add(note);
                }

                reader.Close();
                cmd.ExecuteNonQuery();

                return notes;
            }
        }
    }
}
