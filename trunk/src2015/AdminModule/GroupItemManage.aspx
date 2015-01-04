<%@ Page Language="C#" MasterPageFile="~/AdminModule/MasterPageAdmin.Master" AutoEventWireup="true"
    CodeFile="GroupItemManage.aspx.cs" Inherits="DemoWebsite.AdminModule.GroupItemManage"
     %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom">
            <td width="100%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%" height="22">
                            <img src="images/titlevector.jpg" width="20" height="18" align="absmiddle"></td>
                        <td width="6%" height="22" nowrap background="images/title_front.jpg">
                            <b>
                                <asp:Literal ID="LiteralTitle" runat="server"></asp:Literal>
                            </b></td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td height="10">
                        </td>
                        <td height="10" nowrap>
                            <asp:HyperLink ID="HyperLinkBack" runat="server" NavigateUrl="GroupItemList.aspx"
                                Width="83px">Quay lại danh sách nhóm</asp:HyperLink></td>
                        <td height="10">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsGroupItem" OnItemInserting="FormView1_ItemInserting" OnItemUpdating="FormView1_ItemUpdating" DefaultMode="Insert" Width="233px" >
                    <EditItemTemplate>
                          <table style="width: 99%" >
                   
                    <tr>
                        <td align="right" class="tdinputtitle" style="height: 17px; width: 179px;">
                            Tên nhóm:  <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Id") %>' /></td>
                        <td class="row" style="width: 61px; height: 17px;">
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="rowerro" colspan="2" align="center" style="height: 17px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox"
                                Display="Dynamic" ErrorMessage="Vui lòng nhập tên nhóm!" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                    <td align="center" colspan="2" style="height: 24px">
                        <asp:Button ID="Button1" runat="server" CommandName="Update" CssClass="button" Text="Lưu"
                            Width="68px" />
                    </td>
                </tr>
                    <tr>
                        <td align="right" class="tdinputtitle" style="height: 17px; width: 179px;">
                        </td>
                        <td class="row" style="width: 61px; height: 17px">
                        </td>
                    </tr>
                </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                <table style="width: 100%" >
                   
                    <tr>
                        <td align="right" class="tdinputtitle" style="height: 17px">
                            Tên nhóm:</td>
                        <td class="row" style="width: 61px; height: 17px;">
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="rowerro" colspan="2" align="center" style="height: 17px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox"
                                Display="Dynamic" ErrorMessage="Vui lòng nhập tên nhóm!" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" CommandName="Insert" CssClass="button" Text="Lưu"
                            Width="68px" />
                    </td>
                </tr>
                    <tr>
                        <td align="right" class="tdinputtitle" style="height: 17px">
                        </td>
                        <td class="row" style="width: 61px; height: 17px">
                        </td>
                    </tr>
                </table>
                       
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Image1:
                        <asp:Label ID="Image1Label" runat="server" Text='<%# Bind("Image1") %>'></asp:Label><br />
                        ParentGroupItemId:
                        <asp:Label ID="ParentGroupItemIdLabel" runat="server" Text='<%# Bind("ParentGroupItemId") %>'>
                        </asp:Label><br />
                        Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Bind("Id") %>'></asp:Label><br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label><br />
                        Description:
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>'>
                        </asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit">
                        </asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="sdsGroupItem" runat="server" DataObjectTypeName="Business.GroupItem"
                    InsertMethod="InsertGroupItem" SelectMethod="GetGroupItem" TypeName="Business.GroupItemManager"
                    UpdateMethod="UpdateGroupItem" OnInserted="sdsGroupItem_Inserted" OnUpdated="sdsGroupItem_Updated">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="Id" Type="Int32" QueryStringField="Id" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
