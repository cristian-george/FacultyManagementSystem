using FacultyManagement.ViewModel;
using System.Windows;

namespace FacultyManagement.View
{
    public partial class NotesWindow : Window
    {
        public NotesWindow(MainWindowVM mainWindowVM)
        {
            InitializeComponent();

            DataContext = new NotesWindowVM(mainWindowVM);
        }
    }
}
