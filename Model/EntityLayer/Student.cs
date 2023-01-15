namespace FacultyManagement.Model.EntityLayer
{
    public class Student : BasePropertyChanged
    {
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

        private int? _groupId;
        public int? GroupId
        {
            get { return _groupId; }
            set
            {
                _groupId = value;
                NotifyPropertyChanged(nameof(GroupId));
            }
        }

        private string _firstName;
        public string FirstName
        {
            get { return _firstName; }
            set
            {
                _firstName = value;
                NotifyPropertyChanged(nameof(FirstName));
            }
        }

        private string _lastName;
        public string LastName
        {
            get { return _lastName; }
            set
            {
                _lastName = value;
                NotifyPropertyChanged(nameof(LastName));
            }

        }

        private string _cnp;
        public string Cnp
        {
            get { return _cnp; }
            set
            {
                _cnp = value;
                NotifyPropertyChanged(nameof(Cnp));
            }
        }

        private string _email;
        public string Email
        {
            get { return _email; }
            set
            {
                _email = value;
                NotifyPropertyChanged(nameof(Email));
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
