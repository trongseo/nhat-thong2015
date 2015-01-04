<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="DemoWebsite.AdminModule.ChangePassword" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td colspan="2">
                <asp:Label ID="LabelErr" runat="server" BackColor="Red" Text="Label" Visible="False"></asp:Label></td>
        </tr>
  <tr>
    <td width="23%">M&#7853;t kh&#7849;u c&#361; </td>
    <td width="77%"><asp:textbox runat="server" ID="OldPassWord" TextMode="Password"></asp:textbox></td>
  </tr>
  <tr>
    <td>M&#7853;t kh&#7849;u m&#7899;i </td>
    <td>
    <asp:textbox runat="server" ID="NewPassword" TextMode="Password"></asp:textbox>
    </td>
  </tr>
  <tr>
    <td>G&otilde; l&#7841;i m&#7853;t kh&#7849;u m&#7899;i </td>
    <td><asp:textbox runat="server" ID="ReNewPassword" TextMode="Password"></asp:textbox></td>
  </tr>
  <tr>
      <td colspan="2">
        <asp:Button ID="Button1" runat="server" Text="Đổi Mật khẩu" OnClick="Button1_Click" />&nbsp;</td>
  </tr>
</table>
</asp:Content>
