using FacultyManagement.Model.EntityLayer;
using System;
using System.Globalization;
using System.Windows.Data;

namespace FacultyManagement.Converters
{
    class StudentConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            if (!int.TryParse(values[0].ToString(), out int studentId)) studentId = 0;
            if (!int.TryParse(values[1].ToString(), out int groupId)) groupId = 0;

            return new Student()
            {
                StudentId = studentId,
                GroupId = groupId,
                FirstName = values[2].ToString(),
                LastName = values[3].ToString(),
                Cnp = values[4].ToString(),
                Email = values[5].ToString(),
            };
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            Student student = value as Student;
            object[] result = new object[7]
            {
                student.StudentId,
                student.GroupId,
                student.FirstName,
                student.LastName,
                student.Cnp,
                student.Email,
                student.IsActive
            };
            return result;
        }
    }
}
