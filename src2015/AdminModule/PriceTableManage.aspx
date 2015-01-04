<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="PriceTableManage.aspx.cs" Inherits="DemoWebsite.AdminModule.PriceTableManage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 508px">
        <tbody>
            <tr>
                <td style="width: 132px" class="tdinputtitle" align="right">
                    Chọn hình báo giá:</td>
                <td style="width: 61px" class="row">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="268px"></asp:FileUpload></td>
            </tr>
            <tr>
                <td style="height: 17px" class="rowerro" align="center" colspan="2">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="FileUpload1"
                        ErrorMessage="Vui lòng chọn file (doc)|(zip)|(rar)|(txt)|(rtf" ValidationExpression="^.+\.((doc)|(zip)|(rar)|(txt)|(rtf))$"
                        Width="232px"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 132px" class="tdinputtitle" align="right">
                    Mô tả:</td>
                <td style="width: 61px" class="row">
                    <asp:TextBox ID="LinkTextBox" runat="server" Width="264px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 17px" class="rowerro" align="center" colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LinkTextBox"
                        ErrorMessage="Vui lòng nhập mô tả báo giá!"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="height: 17px" class="rowerro" align="center" colspan="2">
                </td>
            </tr>
            <tr>
                <td style="width: 132px" class="tdinputtitle" align="right">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="PriceTableList.aspx">Danh sách bao giá</asp:HyperLink></td>
                <td style="width: 61px" class="row">
                    <asp:Button ID="Button1" runat="server" CssClass="mybutton" OnClick="Button1_Click"
                        Text="Lưu" Width="100px" /></td>
            </tr>
            <tr>
                <td style="height: 17px" class="tdinputtitle" align="center" colspan="2">
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
