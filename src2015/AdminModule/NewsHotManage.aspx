<%@ Page Language="C#"  AutoEventWireup="true"
    CodeFile="NewsHotManage.aspx.cs" Inherits="DemoWebsite.AdminModule.NewsHotManage"
    ValidateRequest="false" %>


    <script src="js/validates.js" type="text/javascript"></script>

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

    theme_advanced_buttons1 : "fontselect,fontsizeselect,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,eBizQuote,forecolor,backcolor,|,emotions,eBizIcon,eBizLink,eBizImage,eBizUpload",

    theme_advanced_buttons2 : "numlist,outdent,indent,|,pastetext,pasteword,removeformat",	    

    theme_advanced_buttons3 : "",

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
    <td width="18%" valign="top"  class='lineR' > <table width="165" height="455" border="0" cellpadding="1" cellspacing="0">
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
</table>

    </td>
    <td width="82%" valign="top" style="padding-left:5px">  <form id="form1" runat="server">
    <div>
         <script type="text/javascript">

function CheckPath(sender, args)
{
 var val_=getof("FileUpload1").value;
 if( CheckImage(val_)==true)
   {
        args.IsValid = true;
        return true;
   }else
   {
         args.IsValid = false;
         return false;
   }
} 
    </script>

    <table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom">
            <td width="100%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%" height="22">
                            <img src="images/titlevector.jpg" width="20" height="18" align="absmiddle"></td>
                        <td width="6%" height="22" nowrap background="images/title_front.jpg">
                            <b>
                                <asp:literal id="LiteralTitle" runat="server" text="Thêm tin tức"></asp:literal>
                            </b>
                        </td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="10">
                        </td>
                        <td height="10" nowrap>
                            <asp:hyperlink id="HyperLinkBack" runat="server" navigateurl="NewsHotList.aspx" width="83px">Quay lại danh sách tin</asp:hyperlink></td>
                        <td height="10">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                            <tr>
                               
                                <td width="15%" align="right" class="tdinputtitle" >
                              Tiêu đề:&nbsp; </td>
                                <td class="row" >
                              <asp:TextBox ID="TitleTextBox" runat="server"  Width="500px" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="rowerro" colspan="2" align="center">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TitleTextBox"
                                        Display="Dynamic" ErrorMessage="RequiredFieldValidator">Xin vui lòng nhập vào tiêu đề!</asp:RequiredFieldValidator></td>
                            </tr>
							<tr>
                                <td align="right" class="tdinputtitle" >
                                    Hình ảnh:
                                </td>
                                <td class="row" >
                                    <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" />
                                    </td>
                            </tr>
							<tr>
                                <td class="rowerro" colspan="2" align="center">
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="CheckPath"
                                        ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="CustomValidator"
                                        SetFocusOnError="True">Xin vui lòng chọn đúng định dạng hình cần lưu!</asp:CustomValidator></td>
                            </tr>
							<tr>
                                <td align="right" class="tdinputtitle" style="height: 16px; ">
                                    Mô tả ngắn gọn:</td>
                                <td class="row" >
                                     <asp:TextBox ID="ShortdescriptionTextBox" runat="server" height="106px" textmode="MultiLine" Width="500px"   ></asp:TextBox>
                                    </td>
                            </tr>
							 <tr>
                                <td class="rowerro" colspan="2" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="tdinputtitle"  valign="top">
                                    Mô tả chi tiết:</td>
                                <td class="row" >
                                <asp:TextBox ID="DescriptionTextBox" runat="server" Height="600px" TextMode="MultiLine"
                                            Width="315px"></asp:TextBox>
                              
                                    </td>
                            </tr>
                            <tr>
                                <td class="rowerro" colspan="2" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="tdinputtitle" style="height: 16px; ">
                                    Kích hoạt:</td>
                                <td class="row" style="width: 100px; height: 16px;">
                                    <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                            </tr>
                            <tr>
                                <td  colspan="4" >
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" CausesValidation="true" CssClass="button" Text="Lưu"
                                    Width="68px" OnClick="UpdateButton_Click" />
                                    <asp:Button ID="UpdateCancelButton" runat="server" CommandName="Cancel" CausesValidation="False" CssClass="button" Text="Hủy"
                                    Width="68px" /></td>   
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