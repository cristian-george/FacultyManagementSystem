namespace FacultyManagement.Model.EntityLayer
{
    public class Note : BasePropertyChanged
    {
        private int? _noteId;
        public int? NoteId
        {
            get { return _noteId; }
            set
            {
                _noteId = value;
                NotifyPropertyChanged(nameof(NoteId));
            }
        }

        private int? _professorId;
        public int? ProfessorId
        {
            get { return _professorId; }
            set
            {
                _professorId = value;
                NotifyPropertyChanged(nameof(ProfessorId));
            }
        }

        private int? _studentId;
        public int? StudentId
        {
            get { return _studentId; }
            set
            {
                _studentId = value;
                NotifyPropertyChanged(nameof(StudentId));
            }
        }

        private int? _subjectId;
        public int? SubjectId
        {
            get { return _subjectId; }
            set
            {
                _subjectId = value;
                NotifyPropertyChanged(nameof(SubjectId));
            }
        }

        private string _examDate;
        public string ExamDate
        {
            get { return _examDate; }
            set
            {
                _examDate = value;
                NotifyPropertyChanged(nameof(ExamDate));
            }
        }

        private short _grade;
        public short Grade
        {
            get { return _grade; }
            set
            {
                _grade = value;
                NotifyPropertyChanged(nameof(Grade));
            }
        }

        private bool _isActive;
        public bool IsActive
        {
            get { return _isActive; }
            set
            {
                _isActive = value;
                NotifyPropertyChanged(nameof(IsActive));
            }
        }
    }
}
