<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetailt.aspx.cs" Inherits="ProductDetailt" %>

<%@ Register Src="UCLeft.ascx" TagName="UCLeft" TagPrefix="uc1" %>
<%@ Register Src="UCRight.ascx" TagName="UCRight" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--#include file="htext.aspx"-->

      <script type="text/javascript" src="highslide/highslide-with-gallery.js"></script>
<link rel="stylesheet" type="text/css" href="highslide/highslide.css" />

<!--
	2) Optionally override the settings defined at the top
	of the highslide.js file. The parameter hs.graphicsDir is important!
-->

<script type="text/javascript">
    hs.graphicsDir = 'highslide/graphics/';
    hs.align = 'center';
    hs.transitions = ['expand', 'crossfade'];
    hs.wrapperClassName = 'dark borderless floating-caption';
    hs.fadeInOut = true;
    hs.dimmingOpacity = .75;

    // Add the controlbar
    if (hs.addSlideshow) hs.addSlideshow({
        //slideshowGroup: 'group1',
        interval: 5000,
        repeat: false,
        useControls: true,
        fixedControls: 'fit',
        overlayOptions: {
            opacity: .6,
            position: 'bottom center',
            hideOnMouseOut: true
        }
    });

</script>

    <style type="text/css">
        .text
        {
            margin-left: 5px;
            width: 780px;
        }
        </style>

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
        <td width="800" align="center" valign="top" class="line-content-bg">

            <table border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td width="7" align="left"><b><img src="images/bar_left.jpg" width="7" height="27"></b></td>
                 <td width="848" align="left" background="images/bar_bg.jpg" class="title-bar">THÔNG 
                     TIN SẢN PHẨM</td>
                <td width="28" align="left"><img src="images/bar_right.jpg" width="28" height="27"></td>
              </tr>
            </tbody></table></td>
          </tr>
          <tr>
            <td align="center">
			    <br/>
             <h1>  <font color="gray">  <%=mTenSP %></font></h1></td>
          </tr>
           <tr>
            <td align="center" class="style2">
			    <hr style=" height:1px; color:#CCCCCC; width: 548px;"></td>
          </tr>
          <tr>
            <td align="center">
			<div class="text">
            <a href="ItemImage/<%=mHinh %>" class="highslide" onclick="return hs.expand(this)">
	<img align="middle&quot;" src="ItemImage/<%=mHinh.Replace(".","_icon.") %>" alt="Highslide JS" title="Click để phóng to"></a></div></td>
          </tr>
          <tr>
            <td><div class="text">
  <%=mMoTa %></div></td>
          </tr>
         
          <tr>
            <td></td>
          </tr>
        </tbody></table>
        </td>
       
      </tr>
    </table></td>
  </tr>
 
  <tr>
   <td><!--#include file="hfooter.aspx"--></td>
  </tr>
</table>
</body>
</html> 



