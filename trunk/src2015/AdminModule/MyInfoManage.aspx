<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="MyInfoManage.aspx.cs" Inherits="DemoWebsite.AdminModule.MyInfoManage"  %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Admin DSS</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="js/CheckBox.js"></script>
    <script type="text/javascript" src="js/general.js"></script>
       <script type="text/javascript" src="../jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
tinyMCE.init({

   // mode : "textareas",
  mode : "exact",
    elements : "DescriptionTextBox",

    theme : "advanced",

    entities : "",

    plugins : "inlinepopups,emotions,eBizLink,eBizImage,eBizIcon,paste,visualchars,eBizUpload",    
	//plugins : "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",

    theme_advanced_buttons1 : "fontselect,fontsizeselect,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,eBizQuote,forecolor,backcolor,|,emotions,eBizIcon,eBizLink,eBizImage,eBizUpload",

    theme_advanced_buttons2 : "numlist,outdent,indent,|,pastetext,pasteword,removeformat,code",	    

    theme_advanced_buttons3 : "",
    //theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
	//theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
	//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
	//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",


    theme_advanced_toolbar_location : "top",

    theme_advanced_toolbar_align : "left",

    theme_advanced_statusbar_location : "none",

    theme_advanced_resizing : false,		

    content_css : "examples/js/tinymce/css/content.css",

    setup: function(ed) {        

        ed.addButton('eBizQuote', {

                        title : 'Chèn trích dẫn',

                        'class' : 'mceIcon mce_blockquote',

                        onclick : function() {

                            if (ed.selection.getContent() != null && ed.selection.getContent() != '')

                            {

                                var quote = ed.selection.getContent();

                                ed.selection.setContent('[quote]' + quote + '[/quote]');

                            }                                                       

                        }

                    });

    }

}); 

</script>   
</head>
<body>
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr align="right"> 
    <td height="25" colspan="2"><strong>QU&#7842;N L&Yacute; TH&Ocirc;NG TIN WEBSITE</strong>&nbsp;</td>
  </tr>
  <tr bgcolor="#00CCCC"> 
    <td width="59%" height="25"><strong></strong></td>
    <td width="41%" height="25" align="right" > 
      <strong> <a href="login.aspx?from=logout" class="style1">Tho&aacute;t</a>&nbsp; | &nbsp; <a href="#">&#272;&#7893;i m&#7853;t kh&#7849;u</a>&nbsp; 
      
      </strong></td>

  </tr>
</table>

					
    </td>

  </tr>
  <tr> 
    <td width="18%" valign="top"  class='lineR' >
     <!--#include file="hleftmenu.aspx"-->
   <%--  <table width="165" height="455" border="0" cellpadding="1" cellspacing="0">
  <tr id="wlc1">
    <td width="100%" height="174" valign="top"><table width="165" border="0" align="left" cellpadding="0" cellspacing="2">
     <tr>
        <td class="tableheader">Quản lý đặt hàng </td>
      </tr>
       <tr>
        <td style="padding-left:5px"  ><a href="OrderItemList.aspx">Danh sách đơn hàng </a></td>
      </tr>
	     <tr>

        <td style="padding-left:5px"  ><a href="ContactList.aspx">Danh sách liên hệ</a></td>
      </tr>
	   
      <tr>
        <td class="tableheader">Quản lý sản phẩm</td>
      </tr>

      <tr>
        <td style="padding-left:5px"><a href="ItemDetailManage.aspx">Thêm sản phẩm </a></td>
      </tr>
      <tr>
        <td style="padding-left:5px"><a href="ItemDetailList.aspx">Danh sách sản phẩm </a></td>
      </tr>
      
      
	  
	   <tr>
        <td class="tableheader">Quản lý danh mục</td>
      </tr>

      <tr>
        <td style="padding-left:5px"><a href="GroupItemList.aspx">Danh sách danh mục </a></td>
      </tr>
      

      <tr>
        <td class="tableheader">Quản lý khác</td>
      </tr>

      <tr>
        <td style="padding-left:5px"><a href="AdvertiseList.aspx">Quản lý quảng cáo </a></td>
      </tr>
      <tr>
        <td style="padding-left:5px"><a href="PriceTableList.aspx">DS báo giá </a></td>
      </tr>
      <tr>
        <td style="padding-left:5px"><a href="PriceTableManage.aspx">Thêm báo giá </a></td>
      </tr>
       <tr>
        <td style="padding-left:5px"><a href="MyInfoManage.aspx?Id=3">Cập nhật trang chủ </a></td>
             </tr>
      <tr>
        <td style="padding-left:5px">&nbsp;</td>
      </tr>
     

    
    </table></td>
  </tr>

  <tr id="wlc2">
    <td valign="top"></td>
  </tr>
  <tr id="Tr1" style="display: none">
    <td valign="top"></td>
  </tr>
  <tr id="wlc3" style="display: none">
    <td valign="top">&nbsp;</td>
  </tr>

  <tr id="wlc4" style="display: none">
    <td valign="top">&nbsp;</td>
  </tr>
  <tr id="wlc6" style="display: none">
    <td valign="top"></td>
  </tr>
  <tr style="display:none">
    <td>&nbsp;</td>
  </tr>

  <tr style="display: none">
    <td>&nbsp;</td>
  </tr>
</table>--%>

    </td>
    <td width="82%" valign="top" style="padding-left:5px">  <form id="form1" runat="server">
    <div>
         <table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom">
            <td width="100%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%" height="22">
                            <img src="images/titlevector.jpg" width="20" height="18" align="absmiddle"></td>
                        <td width="6%" height="22" nowrap background="images/title_front.jpg">
                            <b>
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Cập nhật thông tin"></asp:Literal>
                            </b>
                        </td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td height="10">
                        </td>
                        <td height="10" nowrap>
                            </td>
                        <td height="10">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <div>
                             <b>   <asp:Literal ID="Output" runat="server" /></b>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          
                            <br />
                            <br />
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Height="600px" TextMode="MultiLine"
                                            Width="315px"></asp:TextBox>
                            <asp:Button ID="SaveButton" Text="Cập nhật" OnClick="SaveButton_Click" runat="server" Width="94px" /></td>
                        <td valign="top">
                        <a href='guide.aspx' target="_blank">Huong dan cap nhat Film</a>    



 
</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            

</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
    </td>
  </tr>
  <tr> 
    <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr> 
    <td  height="5" > </td>
  </tr>
  <tr> 
    <td width="100%" align="center" valign="top" class="lineT"> Bản quyền thuộc maytinh24gio.com</td>
  </tr>
</table>

    </td>
  </tr>
</table>
</body>
</html>



