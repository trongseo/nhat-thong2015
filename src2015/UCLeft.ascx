<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCLeft.ascx.cs" Inherits="UCLeft" %>

<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="7"><img src="images/bar_left.jpg" width="7" height="27" /></td>
                    <td width="186" align="center" background="images/bar_bg.jpg" class="title-bar">DANH MỤC SẢN PHẨM </td>
                    <td align="right"><img src="images/bar_right.jpg" width="28" height="27" /></td>
                  </tr>
                </table></td>
              </tr>
                  
                            
       <%
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dt.Rows[i];
                            %>
      
       <tr>
                <td align="center" class="underline-dots"><table width="95%" border="0" cellpadding="0" cellspacing="3">
                  <tr>
                    <td width="8%"><img src="images/icon_menu_left.jpg" width="8" height="5" /></td>
                    <td width="92%" height="20" align="left">
					<a href="ProductList.aspx?Id=<%=dr["id"]%>" class="menu-left-link"> <%=dr["Name"]%></a> </td>
                  </tr>
                </table></td>
              </tr>
                         
                            <%
                        }
                         %>
     <%--  <tr>
                <td align="center" class="underline-dots"><table width="95%" border="0" cellpadding="0" cellspacing="3">
                  <tr>
                    <td width="8%"><img src="images/icon_menu_left.jpg" width="8" height="5" /></td>
                    <td width="92%" height="20" align="left">
					<a href="ProductListf6c1.html?Id=77" class="menu-left-link"> KEO FILM PVB</a> </td>
                  </tr>
                </table></td>
              </tr>--%>
                         
                            
             
            
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="7"><img src="images/bar_left.jpg" width="7" height="27" /></td>
                      <td width="186" align="center" background="images/bar_bg.jpg" class="title-bar">LIÊN HỆ NHANH </td>
                      <td align="right"><img src="images/bar_right.jpg" width="28" height="27" /></td>
                    </tr>
                    
                </table></td>
              </tr>
                     

            </table>
            <TABLE>
                    <tr>
                    <td align="center" class="number"><br>A.Nhật: 0918456648<br>
A.Thông: 0918464135<br />
                        <br /> 
</td>
                    </tr>
                    </TABLE></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="padding-left:5px"><img src="images/title_support_online.jpg" width="184" height="46" /></td>
              </tr>
              <tr>
                <td style="padding-left:5px">

				<div><span class="title-bar">KINH DOANH </span> 



<a href="ymsgr:SendIM?minhtrungglass">
			   <img border="0" width='60' height='60' src="http://opi.yahoo.com/online?u=minhtrungglass&amp;m=g&amp;t=23" ></a>

</div>
				<div><span class="title-bar">K&#7928; THU&#7852;T </span> <a href="ymsgr:SendIM?mrquocky">
			   <img border="0" width='60' height='60' src="http://opi.yahoo.com/online?u=mrquocky&amp;m=g&amp;t=23" ></a></div>				</td>
              </tr>
            </table></td>
          </tr>
          
        </table>

