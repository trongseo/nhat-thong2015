<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="ItemDetailList.aspx.cs" Inherits="DemoWebsite.AdminModule.ItemDetailList"  %>
<%@ Register Src="../PageNavigator.ascx" TagName="PageNavigator" TagPrefix="Paging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <table>
                    <tr>
                        <td style="width: 90px">
                Chọn nhóm cha:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                    DataSourceID="sqlGroupItem"  DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    Width="130px" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="-1">Chọn nh&#243;m</asp:ListItem>
                </asp:DropDownList></td>
                        <td>
                            <asp:TextBox ID="TextBoxCode" runat="server"></asp:TextBox></td>
                        <td style="width: 357px">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm" Width="61px" />
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="ItemDetailList.aspx?OrderBy=ItemDetail.ishome%20desc"
                                Width="128px">Sản phẩm trang chủ</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="ItemDetailList.aspx?OrderBy=ItemDetail.ViewPriority asc"
                                Width="128px">SX số thú tự</asp:HyperLink></td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="sqlGroupItem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
                    SelectCommand="uspGroupItemParentSelect" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                 <table width="100%" cellspacing="0" cellpadding="0" border="0" class="greenboxmain" style="border-collapse: collapse;table-layout:fixed">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="sdsGroupItemList"
                    Width="100%" AutoGenerateColumns="false" CssClass="grid" >
                    <HeaderStyle CssClass="gridheader" />
                    <FooterStyle CssClass="gridalternaterow" />
                    <AlternatingRowStyle CssClass="gridalternaterow" />
                    <RowStyle CssClass="gridrow" />
                    <Columns>
                     <asp:TemplateField >
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate >
                                <asp:CheckBox runat="server" ID="RowLevelCheckBox" Checked="false" />
                                <asp:HiddenField runat="server" ID="HiddenId" Value='<%# Eval("Id")%>' />
                            </ItemTemplate>
                          <HeaderStyle Width="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <HeaderTemplate>Hình</HeaderTemplate>
                            <ItemTemplate>
                              <img src='../ItemImage/<%# MyUtilities.Replace_Icon( Eval("PathImage")) %>' /> 
                               <asp:HiddenField runat="server" ID="HiddenImageName" Value='<%# Eval("PathImage")%>' />
                            </ItemTemplate>
                            <HeaderStyle Width="200px"  />
                        </asp:TemplateField>
                        <asp:TemplateField  >
                         <HeaderTemplate>Tên</HeaderTemplate>
                            <ItemTemplate>
                                   <a href='ItemDetailManage.aspx?Id=<%# Eval("Id")%>&GroupItemDetailId=<%# Eval("GroupItemId") %>'><%# Eval("Name") %></a>  
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  >
                         <HeaderTemplate>Giá</HeaderTemplate>
                            <ItemTemplate>
                                   <%# MyUtilities.FormatNumber(Eval("Price"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField  >
                         <HeaderTemplate>Thứ Tự</HeaderTemplate>
                            <ItemTemplate>
                                   <asp:TextBox ID="ViewPriority" runat="server" Text='<%# Eval("ViewPriority")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField  >
                         <HeaderTemplate>Home</HeaderTemplate>
                            <ItemTemplate>
                                   <asp:CheckBox ID="IsHome" runat="server" Checked='<%# Eval("IsHome")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                            
                    </Columns>
                    <EmptyDataTemplate>
                    <i>Không có dữ liệu!</i>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsGroupItemList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
                    SelectCommand="uspItemDetailsSelectForGroupIdPaged" SelectCommandType="StoredProcedure" OnSelected="sdsGroupItemList_Selected" OnSelecting="sdsGroupItemList_Selecting">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="PageIndex" QueryStringField="Page"
                            Type="Int32" />
                        <asp:QueryStringParameter DefaultValue="8" Name="PageSize" QueryStringField="PageSize"
                            Type="Int32" />
                        <asp:QueryStringParameter DefaultValue="ItemDetail.Id desc  " Name="OrderBy" Type="String" QueryStringField="OrderBy" />
                        <asp:Parameter DefaultValue="" Direction="Output" Name="TotalRows" Type="Int32" />
                        <asp:QueryStringParameter  DefaultValue="-1"  Name="GroupId" Type="string" QueryStringField="GroupId" />
                        
                    </SelectParameters>
                    
                </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlDataSourceName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
            SelectCommand="uspItemDetailsSelectForNamePaged" SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="PageIndex" QueryStringField="PageIndex"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="6" Name="PageSize" QueryStringField="PageSize"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="ItemDetail.ViewPriority " Name="OrderBy" QueryStringField="OrderBy"
                    Type="String" />
                <asp:Parameter DefaultValue="1" Direction="InputOutput" Name="TotalRows" Type="Int32" />
                  <asp:QueryStringParameter DefaultValue="1" Name="Name" QueryStringField="Name"
                    Type="string" />
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
                        <td style="height: 22px">
                            <asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" Text="Xoá" CssClass="button"
                                            Width="72px" />
                        </td>
                        <td align="center" style="height: 22px"><asp:Button ID="ButtonUPdateAll" runat="server" OnClick="ButtonUPdateAll_Click" Text="Cập nhật tất cả" CssClass="button"
                                            Width="125px" /></td>
                    </tr>
                </table>
                <table style="width: 719px">
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
