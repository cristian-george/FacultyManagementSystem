using FacultyManagement.Model.BusinessLogicLayer;
using FacultyManagement.Model.EntityLayer;
using System.Collections.ObjectModel;

namespace FacultyManagement.ViewModel
{
    public class NotesWindowVM
    {
        readonly NoteBLL noteBLL = new NoteBLL();
        readonly Student currentStudent = null;

        public ObservableCollection<Note> StudentNotesList
        {
            get
            {
                return noteBLL.GetStudentNotes(currentStudent);
            }
        }

        public NotesWindowVM(MainWindowVM mainWindowVM)
        {
            currentStudent = mainWindowVM.SelectedStudent;
        }
    }
}
