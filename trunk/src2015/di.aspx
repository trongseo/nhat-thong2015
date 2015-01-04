<%@ Page Language="C#" AutoEventWireup="true" CodeFile="di.aspx.cs" Inherits="di" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /><br />
        <asp:TextBox ID="TextBoxDesLong" runat="server" Font-Size="X-Large" Height="146px"
            TextMode="MultiLine" Width="319px">Select top 100 NoiNhat,DesShort,DesLong,LienHe,Id  from YouLost where islost=0 </asp:TextBox>
        delete YouLost where id in (1,2) , select * from YouLost&nbsp; Order by DateUpdate
        desc<asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
