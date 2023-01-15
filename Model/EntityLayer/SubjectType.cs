namespace FacultyManagement.Model.EntityLayer
{
    public class SubjectType
    {
        private int? _subjectTypeId;
        public int? SubjectTypeId
        {
            get { return _subjectTypeId; }
            set { _subjectTypeId = value; }
        }

        private string _shortName;
        public string ShortName
        {
            get { return _shortName; }
            set { _shortName = value; }
        }

        private string _fullName;
        public string FullName
        {
            get { return _fullName; }
            set { _fullName = value; }
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
