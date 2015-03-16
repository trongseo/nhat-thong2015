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
        <td width="800" align="center" valign="top" class="line-content-bg">
<table width="" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="7"><img src="images/bar_left.jpg" width="7" height="27" /></td>
                <td width="848" background="images/bar_bg.jpg" class="title-bar">LI&Ecirc;N H&#7878; </td>
                <td width="28" align="right"><img src="images/bar_right.jpg" width="28" height="27" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>
			<div class="text" align="center">
			&nbsp;<strong><font size="4">CÔNG TY TNHH PHÁT TRIỂN CÔNG NGHỆ KÍNH NHẬT MINH</font></strong> <br>
			   <font size="2"> <strong><em>Trụ sở chính:</em></strong> Số 990/3, Đường Âu Cơ, P.14, Q.Tân Bình ,TP. HỒ CHÍ MINH
            <br> <b>Mã số thuế</b> :0313111597 <br />
			<b>Tel</b>: +848 62 557 983    <b>Fax</b>:  +848 62 557 895 <br>
			    <strong><em>Địa chỉ kho:</em></strong> 87/66 Phan Văn Hớn, Khu phố 4, P.Tân Thới Nhất, Q.12,TP. HỒ CHÍ MINH.<br>
			Website: <a href="http://NHATMINHGLASSTECH.COM">NHATMINHGLASSTECH.COM</a></font></div>			</td>
			 
          
                
          </tr>
    <tr>
            <td class="text" align="center">
                <br>
                <font size="5" color="gray">Bản đồ trụ sở chính</font> 
                <br>
                <br>
              <iframe width="450" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.vietbando.com/maps/vbdEmbed.aspx?t=1&amp;st=0&amp;sk=990/4+%c3%82u+c%c6%a1,+ph%c6%b0%e1%bb%9dng+14,+qu%e1%ba%adn+t%c3%a2n+b%c3%acnh,+th%c3%a0nh+ph%e1%bb%91+h%e1%bb%93+ch%c3%ad+minh&amp;l=15&amp;kv=10.7994782,106.641840&amp;cl=323325&amp;sb" style="color:#D98923;" mytubeid="mytube1">
                     
                &lt;/td&gt;</iframe>
              <%--  <a href="http://nhatthongglasstech.com/images/sodo_icon.jpg" class="highslide" onclick="return hs.expand(this)">
	            <img src="http://nhatthongglasstech.com/images/sodo_icon.jpg" alt="Highslide JS" title="Click to enlarge"></a>--%>
                     
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
      <%--  <td width="200" valign="top" class="line-right-bg-add"><uc2:UCRight ID="UCRight" runat="server" /></td>--%>
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