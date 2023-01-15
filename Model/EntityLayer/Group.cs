namespace FacultyManagement.Model.EntityLayer
{
    public class Group
    {
        private int? _groupId;
        public int? GroupId
        {
            get { return _groupId; }
            set { _groupId = value; }
        }

        private int _groupTypeId;
        public int GroupTypeId
        {
            get { return _groupTypeId; }
            set { _groupTypeId = value; }
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
