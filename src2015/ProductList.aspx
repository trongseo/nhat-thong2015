<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="UCLeft.ascx" TagName="UCLeft" TagPrefix="uc1" %>
<%@ Register Src="UCRight.ascx" TagName="UCRight" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from nhatthongglasstech.com/Default.aspx by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Jan 2015 04:40:44 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <!--#include file="htext.aspx"-->

<title> May Mai Kinh | Máy Mài Kính</title> 
<meta name="keywords" content="May mai kinh,Da Mai Kinh"> 
<meta name="description" content="Chuyên cung cấp: Máy mài kính, Đá mài kính, Máy cắt kính CNC, Phụ Kiện , Máy móc gia công sau kính"> 

</head>

<body class="body">
<center>
<table width="1000" border="0" cellpadding="0" cellspacing="0">

<!--#include file="hmenu.aspx"-->

  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="1000" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="200" align="center" valign="top" class="line-left-bg">  
            <uc1:UCLeft ID="UCLeft1" runat="server" />
</td>
        <td width="800" align="center" valign="top" class="line-content-bg"><table  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>


            </td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="7" align="right"><img src="images/bar_left.jpg" width="7" height="27" /></td>
                  <td width="848" align="left" background="images/bar_bg.jpg" class="title-bar"><%=mtitle %></td>
                  <td width="28" align="left"><span class=""> <img src="images/bar_right.jpg" width="28" height="27" /></span></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td align="center"><table width="100%" border="0" cellspacing="5" cellpadding="0">
                  <%
                        for (int i = 0; i < dtNewsSP.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dtNewsSP.Rows[i];
                            System.Data.DataRow dr1 = null;
                            if (i + 1 < dtNewsSP.Rows.Count)
                            {
                             dr1 = dtNewsSP.Rows[i + 1];
                            }
                            
                            i++; 
                            %>
              
                <tr>
                    <td align="center">
                        <a href="ProductDetailt.aspx?Id=<%=dr["id"]%>"><img src="ItemImage/<%=dr["PathImage"]%>" width="269" height="127" /></a> <br />
                      <span class="title_number"><a href="ProductDetailt.aspx?Id=<%=dr["id"]%>" class="menu-left-link"> <%=dr["Name"]%></a><br />
M&atilde;:  <%=dr["Code"]%></span></td>
<% if (dr1 == null)
   { 
       %>
       <td align="center">&nbsp;
</td>
                 
       <%
    }
    else
    { 
       %>
       <td align="center"><a href="ProductDetailt.aspx?Id=<%=dr1["id"]%>"><img src="ItemImage/<%=dr["PathImage"]%>" width="269" height="127" /></a><br />
                      <span class="title_number"> <a href="ProductDetailt.aspx?Id=<%=dr1["id"]%>" class="menu-left-link"> <%=dr1["Name"]%></a><br />
M&atilde;: <%=dr1["Code"]%></span></td>
       <%
   }
        %>

                    
                  </tr>
                  
                            <%
                        }
                         %> 
                  
                
                     
                </table>
                </td>
          </tr>
           <tr>
              <td>
            
              </td>
           </tr>
          
        </table></td>
       
      </tr>
    </table></td>
  </tr>
 
  <tr>
   <td><!--#include file="hfooter.aspx"--></td>
  </tr>
</table>
</body>
</html> 



