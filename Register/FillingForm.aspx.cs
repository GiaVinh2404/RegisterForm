using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Register
{
    public partial class FillingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Chạy khi trang load
        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            try
            {
                clsDatabase db = new clsDatabase();

                // 1. Lấy dữ liệu từ form
                string tenDN = txtTenDN.Text;
                string matKhau = txtMK.Text;
                string nhapLaiMK = txtNhaplaiMK.Text;
                string hoTen = txtKH.Text;
                string ngaySinh = txtNgaySinh.Text;
                string email = txtEmail.Text;
                string gioiTinh = radNam.Checked ? "Nam" : "Nữ";
                string thuNhap = txtThuNhap.Text;

                string sql = @"INSERT INTO KhachHang
                                (TenDangNhap, MatKhau, HoTen, Email, NgaySinh, GioiTinh, ThuNhap)
                               VALUES
                                (@TenDangNhap, @MatKhau, @HoTen, @Email, @NgaySinh, @GioiTinh, @thuNhap)";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@TenDangNhap", tenDN),
                    new SqlParameter("@MatKhau", matKhau),
                    new SqlParameter("@HoTen", hoTen),
                    new SqlParameter("@Email", email),
                    new SqlParameter("@NgaySinh", ngaySinh),
                    new SqlParameter("@GioiTinh", gioiTinh),
                    new SqlParameter("@thuNhap", thuNhap)
                };

                int kq = db.Excute(sql, parameters);

                if (kq > 0)
                {
                    lblThongBao.Text = "Đăng ký thành công!";
                    lblThongBao.ForeColor = System.Drawing.Color.Green;

                    // Xóa trắng form
                    txtTenDN.Text = "";
                    txtMK.Text = "";
                    txtNhaplaiMK.Text = "";
                    txtKH.Text = "";
                    txtNgaySinh.Text = "";
                    txtEmail.Text = "";
                    txtThuNhap.Text = "";
                    radNam.Checked = false;
                    radNu.Checked = false;
                }
                else
                {
                    lblThongBao.Text = "Đăng ký thất bại. Vui lòng thử lại!";
                    lblThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627) // trùng khóa chính
                {
                    lblThongBao.Text = "Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác!";
                    lblThongBao.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblThongBao.Text = "Lỗi CSDL: " + ex.Message;
                    lblThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblThongBao.Text = "Lỗi hệ thống: " + ex.Message;
                lblThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
