<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="ChooseGroupItem.aspx.cs" Inherits="DemoWebsite.AdminModule.ChooseGroupItem"  %>
     <%@ Register Src="../PageNavigator.ascx" TagName="PageNavigator" TagPrefix="Paging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script>
	
	  if(document.location.indexOf('-1')>-1)
	  {
		document.location='ItemDetailList.aspx';
	  }
	</script>
    <table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom">
            <td width="100%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%" height="22">
                            <img src="images/titlevector.jpg" width="20" height="18" align="absMiddle"></td>
                        <td width="6%" height="22" nowrap background="images/title_front.jpg">
                            <b>
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Chọn nhóm để thêm sản phẩm hoặc xem sản phẩm"></asp:Literal>
                                </b></td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            </td>
                    </tr>
                   
                </table>
                Chọn nhóm cha:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                    DataSourceID="sqlGroupItem"  DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    Width="130px" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="-1">Chọn nh&#243;m</asp:ListItem>
                </asp:DropDownList><asp:SqlDataSource ID="sqlGroupItem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
                    SelectCommand="uspGroupItemParentSelect" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                 <table width="100%" cellspacing="0" cellpadding="0" border="0" class="greenboxmain" style="border-collapse: collapse;table-layout:fixed">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="sdsGroupItemList"
                    Width="100%" AutoGenerateColumns="false" CssClass="grid" CellSpacing="2" CellPadding="2">
                    <HeaderStyle CssClass="gridheader" />
                    <FooterStyle CssClass="gridalternaterow" />
                    <AlternatingRowStyle CssClass="gridalternaterow" />
                    <RowStyle CssClass="gridrow" />
                    <Columns>
                     <asp:TemplateField >
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate >
                                <asp:CheckBox runat="server" ID="RowLevelCheckBox" Checked="false" />
                            </ItemTemplate>
                          <HeaderStyle Width="1px" />
                        </asp:TemplateField>
                      
                        <asp:TemplateField >
                            <HeaderTemplate>Tên nhóm</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Name") %>
                            </ItemTemplate>
                            <HeaderStyle Width="200px"  />
                        </asp:TemplateField>
                        <asp:TemplateField  >
                            <ItemTemplate>
                                   <a href='ItemDetailList.aspx?GroupId=<%# Eval("Id") %>'>Xem số sản phẩm trong nhóm (<%# Eval("CountItem") %>)</a>  
                                   
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsGroupItemList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
                    SelectCommand="uspGroupItemsParentSelectPaged" SelectCommandType="StoredProcedure" OnSelected="sdsGroupItemList_Selected" OnSelecting="sdsGroupItemList_Selecting">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="PageIndex" QueryStringField="Page"
                            Type="Int32" />
                        <asp:QueryStringParameter DefaultValue="8" Name="PageSize" QueryStringField="PageSize"
                            Type="Int32" />
                        <asp:Parameter DefaultValue="GroupItem.Id desc " Name="OrderBy" Type="String" />
                        <asp:Parameter DefaultValue="" Direction="Output" Name="TotalRows" Type="Int32" />
                        <asp:QueryStringParameter  DefaultValue="-1"  Name="ParentGroupItemId" Type="Int32" QueryStringField="ParentGroupItemId" />
                        
                    </SelectParameters>
                    
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td class="whiteline" style="height:5px"></td>
        </tr>
        <tr>
            <td class="gridheader"><Paging:PageNavigator ID="Paginater1" runat="server" /></td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="0" border="0" style="border-collapse: collapse;table-layout:fixed;margin-left:5px">
                    <tr>
                        <td></td>
                        <td align="right"></td>
                    </tr>
                </table>
                <table style="width: 719px">
                    <tr>
                        <td colspan="3">
                            Các bước thêm sản phẩm:<br />
                            <strong>Bước 1</strong>:<strong> </strong>Bên Menu trái nhấp vào <a href="http://localhost:1705/AdminModule/ChooseGroupItem.aspx">
                                Thêm sản phẩm</a>&nbsp;<br />
                            <strong>Bước 2</strong>:Chọn nhóm cha phía trên<br />
                            <strong>Bước 3</strong>: Sau khi chọn nhóm cha thì nó sẽ hiện ra danh sách các nhóm
                            con bên dưới rồi chọn&nbsp; <strong>Thêm sản phẩm&nbsp;</strong> hoặc muốn xem danh
                            sách sản phẩm trong nhóm thì chọn&nbsp; <strong>Xem số sản phẩm trong nhóm</strong></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            </td>
                    </tr>
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
	
</asp:Content>
