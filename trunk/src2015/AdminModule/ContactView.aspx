﻿<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="ContactView.aspx.cs" Inherits="DemoWebsite.AdminModule.ContactView"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom"> 
          <td width="100%"> <table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr> 
    <td width="2%" height="22"><img src="images/titlevector.jpg" width="20" height="18" align="absmiddle"></td>
    <td width="6%" height="22" nowrap background="images/title_front.jpg">  <b>
                                <asp:Literal ID="LiteralTitle" runat="server" Text="<a href='ContactList.aspx'>Danh sách liên hệ</a> >> Chi tiết"></asp:Literal>
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
          <td> <table>
        <tr>
            <td style="width: 126px" bgcolor="#00cfce">
                Tiêu đề:</td>
            <td style="width: 534px">
                <asp:Label ID="SubjectLabel" runat="server" Text=''></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 126px" bgcolor="#00cfce">
                Tên khách hàng:</td>
            <td style="width: 534px">
                <asp:Label ID="CustomerNameLabel" runat="server" Text=''></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 126px" bgcolor="#00cfce">
                Số điện thoại:</td>
            <td style="width: 534px">
                <asp:Label ID="TelephoneLabel" runat="server" Text=''></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 126px" bgcolor="#00cfce">
                Email:</td>
            <td style="width: 534px">
                <asp:Label ID="EmailLabel" runat="server" Text=''></asp:Label></td>
        </tr>
         <tr>
            <td style="width: 126px" bgcolor="#00cfce">
                Địa chỉ:</td>
            <td style="width: 534px">
                <asp:Label ID="AddressLabel" runat="server" Text=''></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 126px" bgcolor="#00cfce">
                Fax:</td>
            <td style="width: 534px">
                <asp:Label ID="FaxLabel" runat="server" Text=''></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 126px" bgcolor="#00cfce">
                Thông điệp:</td>
            <td style="width: 534px">
                <asp:Label ID="MessageLabel" runat="server" Text=''></asp:Label></td>
        </tr>
       
       
    </table>
          </td>
        </tr>

      </table>
   
</asp:Content>
