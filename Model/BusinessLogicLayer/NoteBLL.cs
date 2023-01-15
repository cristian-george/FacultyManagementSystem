using FacultyManagement.Model.DataAccessLayer;
using FacultyManagement.Model.EntityLayer;
using System.Collections.ObjectModel;

namespace FacultyManagement.Model.BusinessLogicLayer
{
    internal class NoteBLL
    {
        readonly static NoteDAL noteDAL = new NoteDAL();

        public ObservableCollection<Note> GetStudentNotes(Student student)
        {
            return noteDAL.GetStudentNotes(student);
        }
    }
}
