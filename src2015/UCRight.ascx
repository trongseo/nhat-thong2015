<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCRight.ascx.cs" Inherits="UCLeft" %>
<table cellspacing="0" cellpadding="0" border="0" width="200">
          <tbody><tr>
            <td><img height="7" width="200" src="images/border_right_top_add.jpg"></td>
          </tr>
          <tr>
            <td><table cellspacing="3" cellpadding="0" border="0" width="100%">
              <tbody>
              <tr>
                <td align="center" class="number"><span class="title-bar">LIÊN HỆ NHANH</span><br>A.Nhật: 0918456648<br>
A.Thông: 0918464135<br>
</td>
              </tr>
              <tr>
                <td align="center"><br /><span class="title-bar">SẢN PHẨM </span><br>
                <marquee height="140px" width="100%" onmouseover="this.stop()" onmouseout="this.start()" scrollamount="1" scrolldelay="60" direction="up"> 
                  
                  
                 <%
                     for (int i = 0; i < dtSlide.Rows.Count; i++)
                        {
                            System.Data.DataRow dreee = dtSlide.Rows[i];
                           
                            %>
                            <p>
                    <a href="ProductDetailt.aspx?Id=<%=dreee["id"]%>" class="menu-left-link"> <img style="border:0" src="ItemImage/<%=dreee["PathImage"]%>" width="184"  /></a></p>
                            <%
                        }
                         %> 
                         </marquee>
                  
               <%-- <img height="91" width="189" src="images/ads/banner_breeze_linkbox.jpg">--%></td>
              </tr>
                <tr>
                <td align="center"> <object height="200" width="188" data="http://edmullen.net/flash/relog.swf" type="application/x-shockwave-flash">
<param value="http://edmullen.net/flash/relog.swf" name="movie">
<param value="Transparent" name="WMode">
</object></td>
              </tr>
             
              <tr>
                <td align="center"><a class="menu-left-link" href="#"><br /> TỈ GIÁ NGOẠI TỆ</a></td>
              </tr>
              <tr>
                <td align="center">
                  <script src="http://www.vnexpress.net/service/forex_content.js"></script>
                
                <script src="http://www.sincovn.com/tigia.js"></script></td>
              </tr>
              <tr>
                <td align="center"><img height="235" width="170" src="images/ads/1185706777.gif"></td>
              </tr>
              <tr>
                <td align="center"><img height="91" width="189" src="images/ads/banner_picto_orderform.jpg"></td>
              </tr>
              <tr>
                <td align="center"><img height="74" width="189" src="images/ads/banner_pixelcreator.jpg"></td>
              </tr>
              <tr>
                <td align="center"><img height="60" width="190" src="images/ads/bookpack2.gif"></td>
              </tr>
            
              <tr>
                <td align="center">&nbsp;</td>
              </tr>
            </tbody></table></td>
          </tr>
        </tbody></table>