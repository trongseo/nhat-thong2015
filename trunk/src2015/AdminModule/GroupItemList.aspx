<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true"
    CodeFile="GroupItemList.aspx.cs" Inherits="DemoWebsite.AdminModule.GroupItemList"
     %>
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
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Danh sách  nhóm cha"></asp:Literal>
                                </b></td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            </td>
                    </tr>
                   
                </table>
                <asp:HyperLink ID="HyperLinkNewGroup" runat="server" NavigateUrl="GroupItemManage.aspx"
                    Width="166px">Thêm nhóm mới</asp:HyperLink></td>
        </tr>
        <tr>
            <td>
                 <table width="100%" cellspacing="0" cellpadding="0" border="0" class="greenboxmain" style="border-collapse: collapse;table-layout:fixed">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="sdsGroupItemList"
                    Width="100%" AutoGenerateColumns="false" CssClass="grid"  >
                    <HeaderStyle CssClass="gridheader" />
                    <FooterStyle CssClass="gridalternaterow" />
                    <AlternatingRowStyle CssClass="gridalternaterow" />
                    <RowStyle CssClass="gridrow" />
                    <Columns  >
                     <asp:TemplateField  ItemStyle-Width="1px" >
                            <ItemStyle HorizontalAlign="Center"  />
                            <ItemTemplate >
                                <asp:CheckBox runat="server" ID="RowLevelCheckBox" Checked="false" />
                            </ItemTemplate>
                          <HeaderStyle Width="1px" />
                        </asp:TemplateField>
                      
                        <asp:TemplateField >
                            <HeaderTemplate>Tên nhóm</HeaderTemplate>
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenId" runat="server" Value='<%# Eval("Id")%>' />
                                <a href='GroupItemManage.aspx?Id=<%# Eval("Id")%>&ParentGroupItemId=<%# Eval("ParentGroupItemId") %>'><%# Eval("Name") %></a>
                            </ItemTemplate>
                            <HeaderStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField  >
                           
                            <ItemTemplate>
                                  <a href='GroupItemList.aspx?ParentGroupItemId=<%# Eval("Id")%>'>Xem nhóm con (<%# Eval("CountGroupChild") %>)</a>
                                  |<a href='GroupItemManage.aspx?ParentGroupItemId=<%# Eval("Id")%>'>Thêm nhóm con</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField  >
                            <HeaderTemplate>TT</HeaderTemplate>
                            <ItemTemplate>
                              <asp:TextBox ID="ViewPriority" runat="server"  Text='<%# Eval("ViewPriority")%>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                   
                </asp:GridView>
                &nbsp;
                            <asp:SqlDataSource ID="sdsGroupItemList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectDB %>"
                                SelectCommand="uspGroupItemsParentSelectPaged" SelectCommandType="StoredProcedure" OnSelected="sdsGroupItemList_Selected1" OnSelecting="sdsGroupItemList_Selecting">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="1" Name="PageIndex" QueryStringField="PageIndex"
                                        Type="Int32" />
                                    <asp:QueryStringParameter DefaultValue="20" Name="PageSize" QueryStringField="PageSize"
                                        Type="Int32" />
                                    <asp:QueryStringParameter DefaultValue="GroupItem.ViewPriority " Name="OrderBy" QueryStringField="Orderby"
                                        Type="String" />
                                    <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="TotalRows" Type="Int32" />
                                    <asp:QueryStringParameter DefaultValue="0" Name="ParentGroupItemId" QueryStringField="ParentGroupItemId"
                                        Type="Int32" />
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
                        <td style="width: 508px"><asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click"  Text="Xoá" CssClass="button" Width="72px" /></td>
                        <td align="left"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  Text="Cập nhật tất cả" CssClass="button" Width="116px" /></td>
                    </tr>
                </table>
                <table style="width: 719px">
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            Hướng dẫn:</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            +Danh sách nhóm đầu tiên gọi là danh sách nhóm cha.Tức là cấp cao nhất. Trong danh
                            sách nhóm này được phân ra làm 2 cấp gọi là cấp cha và cấp con . Muốn xem danh sách
                            các nhóm con nhấp vào con số trong cột <strong>Số lượng con.</strong> Ta con thể
                            quay lại danh sách các nhóm cha bằng cách nhấp&nbsp; vào <a href="GroupItemList.aspx">
                                <strong>Danh sách nhóm cha </strong></a>
                            <br />
                            +Cách thêm nhóm cha:Nhấp vào <a href="GroupItemList.aspx">
                                Danh sách danh mục</a>&nbsp; rồi chọn <a id="ctl00_ContentPlaceHolder1_HyperLinkNewGroup"
                                    href="GroupItemManage.aspx" style="width: 166px">
                                    Thêm nhóm mới</a><br />
                            + Muốn thêm nhóm con của 1 nhóm cha: Nhấp vào <span style="color: #0000ff; text-decoration: underline">
                                Danh sách danh mục</span>&nbsp; rồi nhấp vào 1 con số này đó trong danh sách
                            .Khi này sẽ hiển thị ra danh sách con của nhóm đó. Sau đó nhấp chuột vào <strong>Thêm
                                nhóm mới</strong></td>
                    </tr>
                </table>
           </td>
        </tr>
    </table>
            </td>
        </tr>
    </table>
</asp:Content>
