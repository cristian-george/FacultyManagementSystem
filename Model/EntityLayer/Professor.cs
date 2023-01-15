namespace FacultyManagement.Model.EntityLayer
{
    public class Professor
    {
        private int? _professorId;
        public int? ProfessorId
        {
            get { return _professorId; }
            set
            {
                _professorId = value;
            }
        }

        private string _firstName;
        public string FirstName
        {
            get { return _firstName; }
            set
            {
                _firstName = value;
            }
        }

        private string _lastName;
        public string LastName
        {
            get { return _lastName; }
            set
            {
                _lastName = value;
            }

        }

        private string _cnp;
        public string Cnp
        {
            get { return _cnp; }
            set
            {
                _cnp = value;
            }
        }

        private string _phone;
        public string Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }

        private string _email;
        public string Email
        {
            get { return _email; }
            set
            {
                _email = value;
            }
        }

        private bool _isActive;
        public bool IsActive
        {
            get { return _isActive; }
            set
            {
                _isActive = value;
            }
        }
    }
}
