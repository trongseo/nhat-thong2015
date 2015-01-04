<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>


<%@ Register Src="UCLeft.ascx" TagName="UCLeft" TagPrefix="uc1" %>
<%@ Register Src="UCRight.ascx" TagName="UCRight" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--#include file="htext.aspx"-->
</head>

<body class="body">
<center>
<form runat="server">
<table width="1000" border="0" cellpadding="0" cellspacing="0">
<!--#include file="hmenu.aspx"-->
  <tr>
    <td height="5" bgcolor="#FFFFFF"></td>
  </tr>

  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="1000" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="200" align="center" valign="top" class="line-left-bg">  <uc1:UCLeft ID="UCLeft1" runat="server" /></td>
        <td width="600" align="center" valign="top" class="line-content-bg">
<table width="" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="7"><img src="images/bar_left.jpg" width="7" height="27" /></td>
                <td width="650" background="images/bar_bg.jpg" class="title-bar">LI&Ecirc;N H&#7878; </td>
                <td width="28" align="right"><img src="images/bar_right.jpg" width="28" height="27" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>
			<div class="text">
			<img style="float:left; padding:5px;" src="images/logo.jpg" width="236" height="107" />	
			<strong> CÔNG TY TNHH THƯƠNG MẠI CÔNG NGHỆ KÍNH NHẬT THÔNG</strong> <br />
			Địa chỉ: 23 - C1 Cộng Hòa, P.13, Q.Tân Bình ,TP. HỒ CHÍ MINH
            <br />
			Tel:+848 6296 1042 Fax:+848 3842 6944<br />
			Email: vnglasstech@hcm.fpt.vn<br />
			Tài khoản: Cty TNHH TM-TB-KT-CNK Nhật Thông -Số: 0071004763345 - Vietcombank<br />
			Website: <a href='http://NHATTHONGGLASSTECH.COM'>NHATTHONGGLASSTECH.COM</a></div>			</td>
			 
          
                
          </tr>
          <tr>
            <td class="text">Vui lòng điền thông tin dưới đây</td>
          </tr>
          <tr>
            <td><table width="70%" border="0" align="center" cellpadding="0" cellspacing="3">
              <tr>
                <td width="24%" align="right" class="text">Tên liên hệ: </td>
               <td> <asp:TextBox ID="TenLHTextBox1" runat="server" CssClass="copyright"   Width="200" ></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" class="text">Điện thoại::</td>
                <td> <asp:TextBox ID="DienThoaiTextBox1" runat="server" CssClass="copyright"  Width="200" ></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" class="text">Email:  	 </td>
              <td> <asp:TextBox ID="EmailTextBox1" runat="server" CssClass="copyright"   Width="200" ></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" class="text">Fax:  	 </td>
                   <td> <asp:TextBox ID="FaxTextBox1" runat="server" CssClass="copyright"   Width="200" ></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" class="text">Địa chỉ: </td>
              <td> <asp:TextBox ID="DiaChiTextBox1" runat="server" CssClass="copyright"   Width="200" ></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" class="text">Tiêu đề: </td>
                <td> <asp:TextBox ID="TieuDeTextBox1" runat="server" CssClass="copyright"  Width="300"></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" class="text">Nội dung: </td>
                <td>
                    <asp:TextBox ID="NoiDungTextBox1" runat="server" TextMode="MultiLine"   Width="300"  Rows="5" CssClass="copyright" ></asp:TextBox></td>
              </tr>
              
              <tr>
                <td align="right" class="text">&nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/submit.gif" OnClick="ImageButton1_Click" />
                
                </td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="200" valign="top" class="line-right-bg-add"><uc2:UCRight ID="UCRight" runat="server" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><!--#include file="hfooter.aspx"--></td>
  </tr>
</table>
</form>
</body>
</html> 