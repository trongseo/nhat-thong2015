﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaoGia.aspx.cs" Inherits="BaoGia" %>
<%@ Register Src="UCLeft.ascx" TagName="UCLeft" TagPrefix="uc1" %>
<%@ Register Src="UCRight.ascx" TagName="UCRight" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--#include file="htext.aspx"-->
</head>

<body class="body">
<center>
<table width="1000" border="0" cellpadding="0" cellspacing="0">
<!--#include file="hmenu.aspx"-->
  <tr>
    <td height="5" bgcolor="#FFFFFF"></td>
  </tr>

  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="1000" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="200" align="center" valign="top" class="line-left-bg">  <uc1:UCLeft ID="UCLeft1" runat="server" /></td>
        <td width="600" align="center" valign="top" class="line-content-bg"><table  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>


            </td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="7"><img src="images/bar_left.jpg" width="7" height="27" /></td>
                  <td width="648" align="left" background="images/bar_bg.jpg" class="title-bar">BÁO GIÁ</td>
                  <td width="28" align="right"><span class=""> <img src="images/bar_right.jpg" width="28" height="27" /></span></td>
                </tr>
            </table></td>
          </tr>
          <tr>
          
 <td align="center" class="underline-dots"><table width="95%" border="0" cellpadding="0" cellspacing="3">
                
                    <%
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dt.Rows[i];
                            %>
      
                <tr>
                    
                    <td width="80%" height="20" align="left">
                    <a href="PriceTable/<%=dr["PathFile"]%>" class="menu-left-link"><%=dr["Title"]%></a>
					 </td>
					<td width="20%"><a href="PriceTable/<%=dr["PathFile"]%>" class="menu-left-link">Download</a></td>
                  </tr>
                         
                            <%
                        }
                         %>
                         
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
</body>
</html> 