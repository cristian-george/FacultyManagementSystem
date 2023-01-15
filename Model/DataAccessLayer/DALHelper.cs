using System.Configuration;
using System.Data.SqlClient;

namespace FacultyManagement.Model.DataAccessLayer
{
    public class DALHelper
    {
        private static readonly string connectionString =
            ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;

        public static SqlConnection Connection
        {
            get
            {
                return new SqlConnection(connectionString);
            }
        }
    }
}
