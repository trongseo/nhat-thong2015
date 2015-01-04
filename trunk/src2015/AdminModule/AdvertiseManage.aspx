<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="AdvertiseManage.aspx.cs" Inherits="DemoWebsite.AdminModule.AdvertiseManage"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<TABLE style="WIDTH: 508px"><TBODY><TR><TD style="WIDTH: 132px" class="tdinputtitle" 
align=right>Chọn hình:</TD><TD 
style="WIDTH: 61px" class="row"><asp:FileUpload id="FileUpload1" runat="server" Width="268px"></asp:FileUpload></TD></TR><TR><TD style="HEIGHT: 17px" class="rowerro" 
align=center colSpan=2>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="FileUpload1"
        ErrorMessage="Vui lòng chọn hình đúng hình ảnh." ValidationExpression="^.+\.((jpg)|(gif)|(jpeg)|(png)|(bmp))$"></asp:RegularExpressionValidator></TD></TR><TR><TD style="WIDTH: 132px" class="tdinputtitle" 
align=right>
    Liên kết(Vd:http://www.dss.com.vn):</TD><TD 
style="WIDTH: 61px" class="row">
    <asp:TextBox ID="LinkTextBox" runat="server" Width="264px">http://</asp:TextBox></TD></TR><TR><TD style="HEIGHT: 17px" class="rowerro" 
align=center colSpan=2>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="LinkTextBox"
        ErrorMessage="Vui lòng nhập liên kết hợp lệ(Ví dụ:http://dss.com.vn" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
        Width="293px"></asp:RegularExpressionValidator></TD></TR><TR style="display:none"><TD 
style="WIDTH: 132px" class="tdinputtitle" align=right>Hình nằm phía bên trái thì nhấp vào ô kế bên. Còn mặc định sẽ là quảng cáo bên phải</TD><TD 
style="WIDTH: 61px" class="row"><asp:CheckBox id="IsLeftCheckBox" runat="server" Checked='<%# Bind("IsLeft") %>' Text="Hình quảng cáo này cho bên trái" Width="270px"></asp:CheckBox></TD></TR><TR><TD 
style="HEIGHT: 17px" class="rowerro" align=center colSpan=2></TD></TR><TR><TD style="WIDTH: 132px" 
class="tdinputtitle" align=right>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AdvertiseList.aspx">Danh sách hình  quảng cáo</asp:HyperLink></TD><TD style="WIDTH: 61px" 
class="row">
    <asp:Button ID="Button1" runat="server" CssClass="mybutton" OnClick="Button1_Click"
        Text="Lưu" Width="100px" /></TD></TR><TR><TD style="HEIGHT: 17px" 
class="tdinputtitle" align=center colspan="2">
    </TD></TR></TBODY></TABLE>
</asp:Content>
