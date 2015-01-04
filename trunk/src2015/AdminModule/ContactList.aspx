<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="DemoWebsite.AdminModule.ContactList"  %>
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
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Danh sách liên hệ"></asp:Literal></b></td>
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
            <td>
                   <table width="100%" cellspacing="0" cellpadding="0" border="0" class="greenboxmain" style="border-collapse: collapse;table-layout:fixed">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="sdsContactList"
                    Width="100%" AutoGenerateColumns="false" CssClass="grid"  >
                    <HeaderStyle CssClass="gridheader" />
                    <FooterStyle CssClass="gridalternaterow" />
                    <AlternatingRowStyle CssClass="gridalternaterow" />
                    <RowStyle CssClass="gridrow" />
                    <Columns  >
                     <asp:TemplateField >
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate >
                                <asp:CheckBox runat="server" ID="RowLevelCheckBox" Checked="false" />
                                <asp:HiddenField runat="server" ID="HiddenId" Value='<%# Eval("Id")%>' />
                            </ItemTemplate>
                          <HeaderStyle Width="1px" />
                        </asp:TemplateField>
                      <asp:TemplateField  >
                         <HeaderTemplate>Tiêu đề</HeaderTemplate>
                            <ItemTemplate>
                                <a href='ContactView.aspx?Id=<%# Eval("Id")%>'><%# Eval("Subject") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <HeaderTemplate>Tên khách hàng</HeaderTemplate>
                            <ItemTemplate>
                                <a href='ContactManage.aspx?Id=<%# Eval("Id")%>'><%# Eval("Name") %></a>
                            </ItemTemplate>
                            <HeaderStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField  >
                           <HeaderTemplate>Điện thoại</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Telephone")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField  >
                           <HeaderTemplate>Email</HeaderTemplate>
                            <ItemTemplate>
                            <a href="mailto:<%# Eval("Email")%>?subject=Thu cam on tu maytinh24gio" ><%# Eval("Email")%></a>

                               
                            </ItemTemplate>
                        </asp:TemplateField>
                         
                        
                    </Columns>
                   
                </asp:GridView>
                <asp:SqlDataSource ID="sdsContactList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
                    SelectCommand="uspContactsSelectPaged" SelectCommandType="StoredProcedure" OnSelected="sdsContactList_Selected" OnSelecting="sdsContactList_Selecting">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="PageIndex" QueryStringField="Page"
                            Type="Int32" />
                        <asp:QueryStringParameter DefaultValue="8" Name="PageSize" QueryStringField="PageSize"
                            Type="Int32" />
                        <asp:Parameter DefaultValue="Contact.Id desc " Name="OrderBy" Type="String" />
                        <asp:Parameter DefaultValue="" Direction="Output" Name="TotalRows" Type="Int32" />
                    </SelectParameters>
                    
                </asp:SqlDataSource>
                <asp:Label ID="LabelReport" runat="server" Width="351px"></asp:Label></td>
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
                        <td><asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click"  Text="Xoá" CssClass="button" Width="72px" /></td>
                        <td align="right"></td>
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
</asp:Content>