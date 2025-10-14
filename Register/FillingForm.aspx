<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FillingForm.aspx.cs" Inherits="Register.FillingForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký khách hàng</title>
    <style>
        .title {
            font-weight: bold;
            text-align: center;
            background-color: #ccccff;
            padding: 8px;
            border: 1px solid gray;
        }
        .section-header {
            background-color: #666699;
            color: white;
            font-weight: bold;
            padding: 5px;
        }
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid gray;
        }
        .auto-style1 td {
            padding: 4px;
        }
        .auto-style2 {
            text-align: right;
            width: 200px;
        }
        .required {
            color: red;
        }
        .btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1" align="center" style="width:500px;">
            <tr>
                <td colspan="3" class="title">Đăng ký khách hàng</td>
            </tr>
            <tr>
                <td colspan="3" class="section-header">Thông tin đăng nhập</td>
            </tr>
            <tr>
                <td class="auto-style2">Tên đăng nhập:</td>
                <td>
                    <asp:TextBox ID="txtTenDN" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rf_TenDN" runat="server"
                        ControlToValidate="txtTenDN"
                        ErrorMessage="Tên đăng nhập không được rỗng" CssClass="required" Text="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Mật khẩu:</td>
                <td>
                    <asp:TextBox ID="txtMK" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rf_MK" runat="server"
                        ControlToValidate="txtMK"
                        ErrorMessage="Mật khẩu không được rỗng" CssClass="required" Text="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Nhập lại mật khẩu:</td>
                <td>
                    <asp:TextBox ID="txtNhaplaiMK" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rf_Nhaplai" runat="server"
                        ControlToValidate="txtNhaplaiMK"
                        ErrorMessage="Nhập lại mật khẩu không được rỗng"
                        Display="Dynamic" CssClass="required" Text="(*)"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv_Nhaplai" runat="server"
                        ControlToValidate="txtNhaplaiMK" ControlToCompare="txtMK"
                        ErrorMessage="Mật khẩu nhập lại chưa đúng" CssClass="required" Display="Dynamic"
                        ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="section-header">Chi tiết</td>
            </tr>
            <tr>
                <td class="auto-style2">Họ tên khách hàng:</td>
                <td>
                    <asp:TextBox ID="txtKH" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rf_KH" runat="server"
                        ControlToValidate="txtKH"
                        ErrorMessage="Họ tên khách hàng không được rỗng" CssClass="required" Text="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Ngày sinh:</td>
                <td>
                    <asp:TextBox ID="txtNgaySinh" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="cv_Ngaysinh" runat="server"
                        ControlToValidate="txtNgaySinh"
                        Operator="DataTypeCheck" Type="Date"
                        ErrorMessage="Ngày sinh không hợp lệ" CssClass="required" Text="(*)"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Giới tính:</td>
                <td colspan="2">
                    <asp:RadioButton ID="radNam" runat="server" GroupName="Gender" Text="Nam" />
                    <asp:RadioButton ID="radNu" runat="server" GroupName="Gender" Text="Nữ" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Email không hợp lệ" CssClass="required" Text="(*)"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Thu nhập:</td>
                <td>
                    <asp:TextBox ID="txtThuNhap" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RangeValidator ID="rvThuNhap" runat="server"
                        ControlToValidate="txtThuNhap"
                        MinimumValue="1000000" MaximumValue="50000000" Type="Double"
                        ErrorMessage="Thu nhập từ 1 triệu đến 50 triệu" CssClass="required" Text="(*)"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="btnDangky" runat="server" Text="Đăng ký" OnClick="btnDangky_Click" CssClass="btn" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Label ID="lblThongBao" runat="server" ForeColor="Green"></asp:Label>
                </td>
            </tr>
        </table>

        <asp:ValidationSummary ID="vsTonghop" runat="server" HeaderText="Danh sách các lỗi" ForeColor="Red" />
    </form>
</body>
</html>
