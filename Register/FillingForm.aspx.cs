using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Register
{
    public partial class FillingForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // Hàm này chạy mỗi khi trang được tải.
            // Bạn có thể thêm logic khởi tạo nếu cần.
        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            // Kiểm tra các validator có hợp lệ không
            if (Page.IsValid)
            {
                // Hiển thị thông báo đăng ký thành công
                lblThongBao.Text = "Đăng ký thành công!";
                lblThongBao.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                // Nếu chưa hợp lệ, hiển thị thông báo lỗi
                lblThongBao.Text = "Vui lòng kiểm tra lại thông tin!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}