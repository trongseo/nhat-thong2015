<%@ Page Language="C#"  AutoEventWireup="true"
    CodeFile="ItemDetailManage.aspx.cs" enableEventValidation="false" Inherits="DemoWebsite.AdminModule.ItemDetailManage"  ValidateRequest="false" %>
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
    <td width="18%" valign="top"  class='lineR' > 
   <!--#include file="hleftmenu.aspx"-->
    </td>
    <td width="82%" valign="top" style="padding-left:5px">  <form id="form1" runat="server">
    <div>
       <script src="js/validates.js" type="text/javascript"></script>
<script src="js/validateNumber.js" type="text/javascript"></script>

<script type="text/javascript">
    
function onSubmitCheck()
{ 
    var flag=true;
    var DDFather=getof('DDParent').value;
    if(DDFather=='0')
        {   
            alert("Xin vui lòng chọn nhóm cha!");
            getof('DDParent').focus();
            flag=false;
        }
       
    var FileUpload1=getof('FileUpload1').value;
    if( (RequestUrl('Id')=='') ||(RequestUrl('id')=='' ))
    if(FileUpload1=='' && document.images['ctl00_ContentPlaceHolder1_Image1']==null)
        {
            alert("Xin vui lòng chọn hình đại diện!");
            getof('FileUpload1').focus();
            flag=false;
        }
    var i=0;
    if(getof("HiddenCode").value=="")
    {
        for(i=0;i<ArrayCode.length;i++)
        {
            if(ArrayCode[i]==getof("CodeTextBox").value)
            {
                alert("Mã sản phẩm đã tồn tại, xin vui lòng nhập mã sản phẩm khác!");
                getof("CodeTextBox").focus();
                flag=false;
                i=ArrayCode.length;
            }
        }
    }else
    {
        for(i=0;i<ArrayCode.length;i++)
        { 
            if(ArrayCode[i]==getof("CodeTextBox").value && getof("CodeTextBox").value!=getof("HiddenCode").value)
            {
                alert("Mã sản phẩm đã tồn tại, xin vui lòng nhập mã sản phẩm khác!");
                getof("CodeTextBox").focus();
                getof("CodeTextBox").value=getof("HiddenCode").value;
                flag=false;
                i=ArrayCode.length;
            }
        }
    }
    
    return flag;
}
function SetSelectedParent(idParent)
{
  var ddp = getof('DDParent');
  
    
    for(var i=0; i<ddp.length;i++)
    {
        if(idParent==ddp.options[i].value)
        {
            ddp.options[i].selected=true;
            return ;
        }
    }
}
function GetParentId()
{
    var idChild= getof('GroupIdHidden').value ;
    for(var i =0;i<ArrayId.length ;i++)
    {
     if(ArrayId[i]==idChild)
     {
        return ArrayParentGroupItemId[i];
     }
    }
}

function formatListPrice(eform)
{
    var price= getof(eform).value ;
	//document.getElementById(eform).value =FormatNumber(price,2);
}
    
        
function CheckPath1(sender, args)
{
 var val_=getof('FileUpload1').value;
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

function CheckPath2(sender, args)
{
 var val_=getof('FileUpload2').value;
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

function CheckPath3(sender, args)
{
 var val_=getof('FileUpload3').value;
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

function InitGoupParrent()
{
//var ArrayId = new Array();
//var ArrayName = new Array();
//var ArrayParentGroupItemId = new Array();

   var ddp =getof('DDParent');
    for(var i=0; i<ArrayId.length;i++)
    {
        if(ArrayParentGroupItemId[i]==0)
        {
            var newOption = window.document.createElement('OPTION');
            newOption.text = ArrayName[i];
            newOption.value = ArrayId[i];
            ddp.options.add(newOption);
        }
    }
}
function ChangParrent(idvalue)
{
  var ddp =getof('DDParent');
    
    for(var i=0; i<ddp.length;i++)
    {
        if(idvalue==ddp.options[i].value)
        {
            ddp.options[i].selected=true;
            ShowChild();
            SelectedChild(RequestUrl('GroupItemId'))
            return ;
        }
    }
}
function SelectedChild(idvalue)
{
  var ddc =getof('DDChild');
    
    for(var i=0; i<ddc.length;i++)
    {
        if(idvalue==ddc.options[i].value)
        {
            ddc.options[i].selected=true;
            
            return ;
        }
    }
}
function ShowChild()
{
    ////var ArrayId = new Array();
//var ArrayName = new Array();
//var ArrayParentGroupItemId = new Array();
    RemoveAllChild();
   var ddp =getof('DDParent');
    var ddc =getof('DDChild');
   
    for(var i=0; i<ArrayId.length;i++)
    {
        if(ArrayParentGroupItemId[i]==ddp.value)
        {
            var newOption = window.document.createElement('OPTION');
            newOption.text = ArrayName[i];
            newOption.value = ArrayId[i];
            ddc.options.add(newOption);
        }
    }
}
function RemoveAllChild()
{
    
    var ddc =getof('DDChild');
    for(var i=0; i<ddc.length;i++)
    {
      ddc.remove(i);
      i--;
      // alert(ddc.options[i].text);
    }
}
//--------RequestUrl
function RequestUrl(ulx)
{
var qs = location.search.substring(1);
  var nv = qs.split('&');
  var url = new Object();
  for(i = 0; i < nv.length; i++)
  {
    eq = nv[i].indexOf('=');
    url[nv[i].substring(0,eq).toLowerCase()] =
    unescape(nv[i].substring(eq + 1));
  }
  return url[ulx.toLowerCase()];
}
    </script>

    <table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom">
            <td style="width: 734px">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%" height="22">
                            <img src="images/titlevector.jpg" width="20" height="18" align="absMiddle"></td>
                        <td width="6%" height="22" nowrap background="images/title_front.jpg">
                            <b>
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Thêm sản phẩm"></asp:Literal></b></td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                        </td>
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
            <td >
                <table style="width:100%">
                    <tr>
                        <td >
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <table width="100%"  id="TABLE1">
                                <tr class="hiddenthis" >
                                    <td width="159" align="right" class="tdinputtitle" >
                                        Nhóm cha<strong>*</strong>:</td>
                                    <td width="769" class="row" >
                                        <asp:DropDownList ID="DDParent" runat="server" Width="230px" onChange='ShowChild()'
                                            AppendDataBoundItems="True" OnDataBound="DDParent_DataBound">
                                            <asp:ListItem Value="0">Chọn nh&#243;m cha</asp:ListItem>
                                        </asp:DropDownList>
                                  </td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                        <asp:CustomValidator ID="CustomValidatorGroupFather" runat="server" Display="Dynamic"
                                            ErrorMessage="CustomValidator" SetFocusOnError="True">Xin vui lòng chọn nhóm cha!</asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td align="right" class="tdinputtitle" s>
                                        Nhóm con<strong>*</strong>:</td>
                                    <td class="row" >
                                        <asp:DropDownList ID="DDChild" runat="server" Width="227px">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                        <asp:CustomValidator ID="CustomValidatorGroupChild" runat="server" Display="Dynamic"
                                            ErrorMessage="CustomValidator">Xin vui lòng chọn nhóm con!</asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td align="right" class="tdinputtitle" >
                                        Mã sản phẩm<strong>*</strong>:</td>
                                    <td class="row" >
                                        <asp:TextBox ID="CodeTextBox" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CodeTextBox"
                                            Display="Dynamic" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True">Xin vui lòng cho biết mã sản phẩm!</asp:RequiredFieldValidator></td>
                              <tr>
                                        <td align="right" class="tdinputtitle" >
                                            Tên sản phẩm<strong>*</strong>:</td>
                                        <td class="row" >
                                            <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox></td>
                              </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NameTextBox"
                                            Display="Dynamic" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True">Xin vui lòng cho biết tên sản phẩm!</asp:RequiredFieldValidator></td>
                            <tr >
                                        <td align="right" class="tdinputtitle" >
                                            Chọn hình đại diện<strong>*</strong>:</td>
                                        <td class="row" >
                                            <asp:FileUpload ID="FileUpload1" runat="server" />(Hình đại diện này sẽ hiện lên
                                            trên danh sách sản phẩm)</td>
                              </tr>
                              <tr  >
                                    <td class="rowerro" colspan="2" align="center" >
                                        <asp:Image ID="Image1" runat="server" Height="40px" Visible="False" Width="40px" />
                                        <asp:CustomValidator ID="CustomValidatorImage1" runat="server" Display="Dynamic"
                                            ErrorMessage="CustomValidator" SetFocusOnError="True" ClientValidationFunction="CheckPath1" ControlToValidate="FileUpload1">Xin vui lòng chọn đúng hình cần lưu!</asp:CustomValidator></td>
                                </tr>
                                <tr  class="hiddenthis"  >
                                    <td align="right" class="tdinputtitle hiddenthis"  >
                                        Hình thêm cho sản phẩm:</td>
                                    <td class="row hiddenthis" >
                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                        <asp:Image ID="Image2" runat="server" Height="40px" Visible="False" Width="40px" /></td>
                                </tr>
                                 <tr  class="hiddenthis"  >
                                    <td class="rowerro" colspan="2" align="center">
                                        <asp:CustomValidator ID="CustomValidatorImage2" runat="server" ControlToValidate="FileUpload2"
                                            Display="Dynamic" ErrorMessage="CustomValidator" SetFocusOnError="True" ClientValidationFunction="CheckPath2">Xin vui lòng chọn đúng hình cần lưu!</asp:CustomValidator></td>
                                </tr>
                                 <tr  class="hiddenthis"  >
                                    <td align="right" class="tdinputtitle" style=" height: 32px;">
                                        Hình thêm cho sản phẩm:</td>
                                    <td class="row" style="width: 63px; height: 32px;">
                                        <asp:FileUpload ID="FileUpload3" runat="server" />
                                        <asp:Image ID="Image3" runat="server" Height="40px" Visible="False" Width="40px" /></td>
                                </tr>
                                <tr  class="hiddenthis"  >
                                    <td class="rowerro" colspan="2" align="center">
                                        <asp:CustomValidator ID="CustomValidatorImage3" runat="server" Display="Dynamic"
                                            ErrorMessage="CustomValidator" SetFocusOnError="True" ClientValidationFunction="CheckPath3" ControlToValidate="FileUpload3">Xin vui lòng chọn đúng hình cần lưu!</asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td align="right" class="tdinputtitle" style=" height: 23px;">
                                        Giá<strong>*</strong>:</td>
                                    <td class="row" style="width: 63px; height: 23px;">
                                        <asp:TextBox ID="PriceTextBox" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PriceTextBox"
                                            Display="Dynamic" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True">Xin vui lòng cho biết giá của sản phẩm!</asp:RequiredFieldValidator></td>
                                </tr>
                                <tr   class="hiddenthis"  >
                                    <td align="right" class="tdinputtitle"  valign="top">
                                        Mô tả ngắn gọn (200 ký tự):</td>
                                    <td class="row" >
                                        <asp:TextBox ID="ShortDescriptionTextBox" runat="server" Height="72px" TextMode="MultiLine"
                                            Width="315px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tdinputtitle" valign="top" >
                                        Mô tả chi tiết:</td>
                                    <td class="row" >
                                                             <asp:TextBox runat="server" ID="DescriptionTextBox" TextMode="MultiLine"  Width="507px" Height="500px"></asp:TextBox>

                                  
                                             
                                  </td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tdinputtitle" >
                                    </td>
                                    <td class="row" >
                                        <asp:Button ID="Button1" runat="server" CssClass="mybutton" Text="Lưu" Width="131px"
                                            OnClick="Button1_Click" OnClientClick="SetGroupId()" />
                                            <asp:HiddenField ID="GroupIdHidden" runat="server" Value="-1" />
                                            <script type="text/javascript">
                                            function SetGroupId()
                                            {
                                                getof('GroupIdHidden').value =getof('DDChild').value ;
                                                //alert(getof('GroupIdHidden').value );
                                            }
                                            </script>
                                  </td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tdinputtitle" >
                                        <asp:HiddenField ID="Image2Hidden" runat="server" Value="" />
                                        <asp:HiddenField ID="Image3Hidden" runat="server"  Value=""/>
                                        <asp:HiddenField ID="HiddenCode" runat="server"  Value=""/>
                                  </td>
                                    <td class="row" >
                                  </td>
                                </tr>
                                <tr>
                                    <td class="rowerro" colspan="2" align="center">
                                    </td>
                                </tr>
                          </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <script type="text/javascript">
    InitGoupParrent();
   
   
    if(RequestUrl('Id')==null)
    {
         window.location.href="itemdetailmanage.aspx?IdParrent="+ getof('DDParent').options[1].value;
          // window.location.href="itemdetailmanage.aspx?IdParrent=6";
    }

    getof('PriceTextBox').value=FormatNumber(getof('PriceTextBox').value,2);
    
    if(getof('GroupIdHidden').value!='')
    {
        SetSelectedParent(GetParentId());
        ShowChild();
        SelectedChild(getof('GroupIdHidden').value);
    }
        ChangParrent(6);

    </script>
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

