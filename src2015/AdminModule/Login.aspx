<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="DemoWebsite.AdminModule.Login"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom"> 
          <td width="100%"> <table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr> 
    <td width="2%" height="22"><img src="images/titlevector.jpg" width="20" height="18" align="absmiddle"></td>
    <td width="6%" height="22" nowrap background="images/title_front.jpg">  <b>
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Dang nhap de bat dau"></asp:Literal>
                            </b></td>
    <td width="92%" height="22"  style="background-image: url(images/title_back.jpg)" >&nbsp;</td>
  </tr>
  <tr> 
    <td height="10"></td>
    <td height="10" nowrap></td>
    <td height="10"></td>

  </tr>
</table>
</td>
        </tr>
        <tr> 
          <td> 
    <table style="width: 46%">
                   
                    <tr>
                        <td align="right" class="tdinputtitle">
                            Tên đăng nhập :</td>
                        <td class="row" style="width: 61px">
                <asp:TextBox ID="UserTextBox" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="rowerro" colspan="2" align="center" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserTextBox"
                                Display="Dynamic" ErrorMessage="RequiredFieldValidator">Vui lòng nhập tên đăng nhập.</asp:RequiredFieldValidator></td>
                    </tr>
                     <tr><td align="right" class="tdinputtitle">
                Mật khẩu :</td>
                         <td class="row" style="width: 61px">
                <asp:TextBox ID="PassTextBox" TextMode="Password" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr><td class="rowerro" colspan="2" align="center" style="height: 1px" >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassTextBox"
                            Display="Dynamic" ErrorMessage="RequiredFieldValidator">Vui lòng nhập mật khẩu.</asp:RequiredFieldValidator></td>
                    </tr>
 <tr>
     <td align="center" class="row" colspan="2">
                      <asp:Button ID="LoginButton" runat="server" Text="Đăng nhập" OnClick="LoginButton_Click" /></td>
                    </tr>
                    <tr>
                        <td align="center" class="tdinputtitle" colspan="2">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Tên đăng nhập hoặc mật khẩu bị sai"
                                Visible="False"></asp:Label></td>
                    </tr>
                </table>
          </td>
        </tr>

      </table>
   
</asp:Content>

