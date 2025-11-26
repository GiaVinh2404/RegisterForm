using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Register
{
    public class clsDatabase
    {
        string connectionString = @"Data Source=DESKTOP-UA8MUMB;Initial Catalog=QLKhachHang;Integrated Security=True";

        SqlConnection con;

        // Phương thức để mở kết nối
        public void OpenConnect()
        {
            if (con == null)
            {
                con = new SqlConnection(connectionString);
            }
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
        }

        // Phương thức để đóng kết nối
        public void CloseConnect()
        {
            if (con != null && con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }

        // Phương thức để thực thi các câu lệnh (INSERT, UPDATE, DELETE)
        public int Excute(string sql, SqlParameter[] parameters)
        {
            OpenConnect();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddRange(parameters);
            int ketQua = cmd.ExecuteNonQuery();
            CloseConnect();
            return ketQua;
        }
    }
}