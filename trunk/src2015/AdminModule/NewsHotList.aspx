<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true" CodeFile="NewsHotList.aspx.cs" Inherits="DemoWebsite.AdminModule.NewsHotList" Title="Untitled Page" %>
     <%@ Register Src="../PageNavigator.ascx" TagName="PageNavigator" TagPrefix="Paging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script type="text/javascript" src="js/CheckBox.js">
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
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Danh sách tin tức"></asp:Literal>
                                </b></td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            </td>
                    </tr>
                   
                </table>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="NewsHotManage.aspx"
                    Width="112px">Thêm tin tức</asp:HyperLink></td>
        </tr>
        <tr>
            <td>
                 <table width="100%" cellspacing="0" cellpadding="0" border="0" class="greenboxmain" style="border-collapse: collapse;table-layout:fixed">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="sdsNewsHotList"
                    Width="100%" AutoGenerateColumns="false" CssClass="grid">
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
                            <HeaderTemplate>Hình</HeaderTemplate>
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenId" runat="server" Value='<%#Eval("Id") %>' />
                                <asp:Image ImageUrl='<%# path+ Eval("ImageNews") %>' Width="40" Height="40" ID="ImgNewsHot"
                                                            runat="server" ImageAlign="AbsBottom" />
                             <asp:HiddenField ID="HiddenFieldImageNews" runat="server" Value='<%#Eval("ImageNews") %>' />
                            </ItemTemplate>
                            <HeaderStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField   >
                           <HeaderTemplate >Tiêu đề</HeaderTemplate>
                            <ItemTemplate>
                                <a href='NewsHotManage.aspx?Id=<%# Eval("Id")%>'><%# Eval("Title") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField   >
                           <HeaderTemplate>Thứ tự</HeaderTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="ViewPriority" runat="server" Text='<%#Eval("ViewPriority") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField   >
                           <HeaderTemplate>Hiện TC</HeaderTemplate>
                            <ItemTemplate>
        
                                 <asp:CheckBox ID="IsHome" runat="server"  Checked='<%# Eval("IsHome") %>' />
        
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsNewsHotList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
                    SelectCommand="uspNewsHotsSelectPaged" SelectCommandType="StoredProcedure" OnSelected="sdsNewsHotList_Selected" OnSelecting="sdsNewsHotList_Selecting">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="PageIndex" QueryStringField="Page"
                            Type="Int32" />
                        <asp:QueryStringParameter DefaultValue="8" Name="PageSize" QueryStringField="PageSize"
                            Type="Int32" />
                        <asp:Parameter DefaultValue="NewsHot.Id desc" Name="OrderBy" Type="String" />
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
                        <td><asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" OnClientClick="return confirmDelete (this.form);"  Text="Xoá" CssClass="button" Width="72px" /></td>
                        <td align="right" style="padding-right:20px">
                        <asp:Button ID="BtnUpdateAll" runat="server" OnClick="BtnUpdateAll_Click"   Text="Cập nhật tất cả" CssClass="button"  />
                        </td>      
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

