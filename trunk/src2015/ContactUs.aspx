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
			<div class="text" align="center">
			&nbsp;<strong><font size="4">CÔNG TY TNHH THƯƠNG MẠI CÔNG NGHỆ KÍNH NHẬT THÔNG</font></strong> <br>
			   <font size="2"> <strong><em>Trụ sở chính:</em></strong> Số 67, Đường 22 ( số cũ M5), KCN Tân Bình Mở Rộng, F. Bình Hưng Hoà, Q.Bình Tân ,TP. HỒ CHÍ MINH
            <br>
			<b>Tel</b>: +848 37 658 780 - 37 658 781  <b>Fax</b>:  +848 37 658  779 <br>
			    <strong><em>Văn phòng phía bắc:</em></strong> biệt thự 23, Làng việt kiều Châu 
                Âu, khu đô thị Mỗ Lao, Hà Nội<br>
			Website: <a href="http://NHATTHONGGLASSTECH.COM">NHATTHONGGLASSTECH.COM</a></font></div>			</td>
			 
          
                
          </tr>
    <tr>
            <td class="text" align="center">
                <br>
                <font size="5" color="gray">Bản đồ trụ sở chính</font> 
                <br>
                <br>
               
                <a href="http://nhatthongglasstech.com/images/sodo_icon.jpg" class="highslide" onclick="return hs.expand(this)">
	            <img src="http://nhatthongglasstech.com/images/sodo_icon.jpg" alt="Highslide JS" title="Click to enlarge"></a>
                     
                </td>

          </tr>
          <tr>
            <td class="text" align="center">
                <br>
                <strong><font size="3"> VUI LÒNG ĐIỀN ĐẦY ĐỦ THÔNG TIN DƯỚI ĐÂY</font></strong><br>
                (Để công ty chúng tôi có thể liên lạc được với quý khách xin quý khách vui lòng 
                cung cấp chính xác tên, số điện thoại và nội dung. Xin cám ơn quý khách)</td>

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