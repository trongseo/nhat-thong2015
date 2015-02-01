<%@ Page Language="C#" AutoEventWireup="true" CodeFile="amItemListNo.aspx.cs" Inherits="AdminModule_amItemList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
 <!--#include file="htext.aspx"-->
</head>
<body>
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <!--#include file="htopmenu.aspx"-->
  <tr> 
    <td width="18%" valign="top"  class='lineR' >
     <!--#include file="hleftmenu.aspx"-->

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
                            <b>&nbsp;Danh sách sản phẩm</b></td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td height="10">
                        </td>
                        <td height="10" nowrap>
                            <a href="amItemNo.aspx">Thêm  mới</a></td>
                        <td height="10">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="greenboxmain" >
        <tr>
            <td>
            <div style="display:none">
                <asp:FileUpload ID="FileUpload1" runat="server" Visible="true" />
               </div> 
                 <table  cellspacing="0" border="1"  class="grid" width="90%">
		<tr class="gridheader">
			<th style="width: 1px;" scope="col">&nsbp; </th>
        <th scope="col">
                Hình</th>    <th scope="col">
                Tên </th>
             <th scope="col">
                Giá </th>
             <th scope="col">
                Thứ tự </th>
             <th scope="col">
                Hiện trang chủ  </th>
		</tr>
		   <%
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dt.Rows[i];
                            %>
		<tr class="gridrow">
			<td align="center">
                                <input type="checkbox" name="checkbox_<%=dr["Id"]%>" id="checkbox_<%=dr["Id"]%>"/>
                                
                            </td><td>
                           
                           <img src='../ItemImage/<%= MyUtilities.Replace_Icon( dr["PathImage"]) %>' /> 
                            </td>
                             <td>
                          <a href='ItemDetailManage.aspx?Id=<%=dr["Id"]%>&GroupItemDetailId=<%=dr["GroupItemId"]%>'><%=dr["Name"]%></a>  
                           
                            </td>
                            
                              <td>
                          <%= MyUtilities.FormatNumber(dr["Price"] )%>
                           
                            </td>
               <td>
             <input type="text" name="ViewPriority_<%=dr["Id"]%>" id="ViewPriority_<%=dr["Id"]%>" value='<%=dr["ViewPriority"]%>' />

                   </td>
             <td>
            <% string ischecked = dr["IsHOme"].ToString() == "False" ? "" : "checked"; %>
                     <input type="checkbox" name="checkboxishome_<%=dr["Id"]%>" <%=ischecked %> name="checkboxishome_<%=dr["Id"]%>" id="checkboxishome_<%=dr["Id"]%>"/>
                            
                   </td>

		</tr>
		    <%
                        }
                         %>
		
		
	</table>
               
                </td>
        </tr>
        <tr>
            <td class="whiteline" style="height:5px"></td>
        </tr>
        <tr>
            <td class="gridheader"><table><tr> <%=quesryxx_%></tr></table></td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="0" border="0" style="border-collapse: collapse;table-layout:fixed;margin-left:5px">
                    <tr>
                        <td style="width: 335px">
                            <asp:Button ID="Button1" runat="server" CssClass="button" Text="Xóa" Width="66px" OnClick="btn_Delete_Click" /></td>
                        <td align="left">
                            <asp:Button ID="Button2" runat="server" CssClass="button" Text="Cập nhật tất cả"
                                Width="165px" OnClick="Button2_Click" /></td>
                    </tr>
                </table>
                <table style="width: 719px">
                    <tr>
                        <td colspan="3">
                        </td>
                    </tr>
                    
                </table>
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
     <!--#include file="hfooter.aspx"-->
</table>
</body>
</html>
