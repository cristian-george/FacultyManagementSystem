namespace FacultyManagement.Model.EntityLayer
{
    public class GroupType
    {
        private int? _groupTypeId;
        public int? GroupTypeId
        {
            get { return _groupTypeId; }
            set
            {
                _groupTypeId = value;
            }
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
