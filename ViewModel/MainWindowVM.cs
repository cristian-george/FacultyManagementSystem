using FacultyManagement.Model;
using FacultyManagement.Model.BusinessLogicLayer;
using FacultyManagement.Model.EntityLayer;
using FacultyManagement.View;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace FacultyManagement.ViewModel
{
    public class MainWindowVM : BasePropertyChanged
    {
        StudentBLL studentBLL = new StudentBLL();

        public ObservableCollection<Student> StudentList
        {
            get
            {
                return studentBLL.StudentList;
            }
            set
            {
                studentBLL.StudentList = value;
            }
        }

        public Student SelectedStudent { get; set; }

        public MainWindowVM()
        {
            StudentList = studentBLL.GetAllStudents();
        }

        private ICommand _addCommand;

        public ICommand AddCommand
        {
            get
            {
                if (_addCommand == null)
                    _addCommand = new RelayCommand(Add);

                return _addCommand;
            }
        }

        private void Add(object parameter)
        {
            if (studentBLL.AddStudent(parameter as Student))
                StudentList.Add(parameter as Student);
        }

        private ICommand _updateCommand;

        public ICommand UpdateCommand
        {
            get
            {
                if (_updateCommand == null)
                    _updateCommand = new RelayCommand(Update);

                return _updateCommand;
            }
        }

        private void Update(object parameter)
        {
            studentBLL.UpdateStudent(parameter as Student);
        }

        private ICommand _deleteCommand;

        public ICommand DeleteCommand
        {
            get
            {
                if (_deleteCommand == null)
                    _deleteCommand = new RelayCommand(Delete);

                return _deleteCommand;
            }
        }

        private void Delete(object parameter)
        {
            if (studentBLL.RemoveStudent(parameter as Student))
                StudentList.Remove(parameter as Student);
        }

        private ICommand _viewNotesCommand;
        public ICommand ViewNotesCommand
        {
            get
            {
                if (_viewNotesCommand == null)
                    _viewNotesCommand = new RelayCommand(OpenNotesWindow);

                return _viewNotesCommand;
            }
        }

        private void OpenNotesWindow(object parameter)
        {
            NotesWindow window = new NotesWindow(this);
            window.ShowDialog();
        }
    }
}
