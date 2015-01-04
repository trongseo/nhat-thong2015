<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Copy of Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UCLeft.ascx" TagName="UCLeft" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--#include file="htext.aspx"-->
</head>

<body class="body" >
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
  <tr>
    <td>
  <!--#include file="hmenutop.aspx"-->
    </td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">
        <!--#include file="hmenu.aspx"-->
    </td>
  </tr>
  <tr>
    <td height="5" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="210" align="center" valign="top" class="line-left-bg">
            <uc1:UCLeft ID="UCLeft1" runat="server" />
        </td>
        <td width="691" valign="top" class="line-content-bg"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>
            <embed width="100%" height="100%" name="plugin" src="images/banner.swf" type="application/x-shockwave-flash"/>
            <%--<img src="images/banner.jpg" width="682" height="195" />--%></td>
          </tr>
          <tr>
            <td height="5" class="bg-white"></td>
          </tr>
          <tr>
            <td><table width="685" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="7"><img src="images/bar_left.jpg" width="7" height="27" /></td>
                      <td width="648" background="images/bar_bg.jpg" class="title-bar">SẢN PHẨM MỚI</td>
                      <td width="28" align="right"><span class="tab-menu-bg"> <img src="images/bar_right.jpg" width="28" height="27" /></span></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td align="center"><table width="100%" border="0" cellspacing="5" cellpadding="0">
                  <%
                        for (int i = 0; i < dtNewsSP.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dtNewsSP.Rows[i];
                            System.Data.DataRow dr1 = dtNewsSP.Rows[i+1];
                            i++; 
                            %>
              
                <tr>
                    <td align="center"><img src="ItemImage/<%=dr["PathImage"]%>" width="269" height="127" /><br />
                      <span class="title_number"><a href="ProductDetailt.aspx?Id=<%=dr["id"]%>" class="menu-left-link"> <%=dr["Name"]%></a><br />
M&atilde;:  <%=dr["Code"]%></span></td>
                    <td align="center"><img src="ItemImage/<%=dr1["PathImage"]%>" width="269" height="127" /><br />
                      <span class="title_number"> <a href="ProductDetailt.aspx?Id=<%=dr1["id"]%>" class="menu-left-link"> <%=dr1["Name"]%></a><br />
M&atilde;: <%=dr1["Code"]%></span></td>
                  </tr>
                  
                            <%
                        }
                         %> 
                  
                
                     
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>  <!--#include file="hfooter.aspx"--></td>
  </tr>
</table>
</body>
</html>
