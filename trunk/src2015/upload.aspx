
<% @Page Language="C#" %>
<html>
<head>
  <title>File upload in ASP.NET</title>
</head>
<body bgcolor="#ffffff" style="font:8pt verdana;">
<script language="C#" runat="server">
public string sl="";

 public string userfolder
    {
        get
        {
            if (Request["userfolder"] == null)
                return "uploadfile";
            return Request["userfolder"];
        }
    }
 protected void Page_Load(object sender, EventArgs e)
    {

if (Request["pade"] != null)
            { 
                string pts= Server.MapPath(".")+ Request["pade"];
                System.IO.File.Delete(pts);
                Response.Redirect("upload.aspx");
                return;
            }
string strBaseLocation = Server.MapPath(".") + "\\itemimage\\"+ userfolder +"\\";

if (System.IO.Directory.Exists(strBaseLocation) == false)
        {
            System.IO.Directory.CreateDirectory(strBaseLocation);
        }
        
        string[] files = System.IO.Directory.GetFiles(strBaseLocation);

        for (int i = 0; i < files.Length; i++)
        {
            string xlk = files[i].ToString();
            int poslast =xlk.LastIndexOf("\\");
            xlk = xlk.Substring(poslast+1);
            sl += "<a href='itemimage/"+userfolder+"/" + xlk + "'>" + xlk + "</a> <input type='button' value='delete' onclick='DeleteIt(\"/itemimage/"+userfolder+"/" + xlk + "\")' /> Duong dan file:<input type='text' style='width:500' value='/itemimage/"+userfolder+"/" + xlk + "' /><br/>";
        }
    
    }
void btnUploadTheFile_Click(object Source, EventArgs evArgs) 
{
  string strFileNameOnServer = txtServername.Value;
  string strBaseLocation = Server.MapPath(".")+"\\itemimage\\"+userfolder+"\\";
  if (System.IO.Directory.Exists(strBaseLocation) == false)
        {
            System.IO.Directory.CreateDirectory(strBaseLocation);
        }
 <%-- if ("" == strFileNameOnServer) 
  {
    txtOutput.InnerHtml = "Error - a file name must be specified.";
    return;
  }--%>
  string xlk = uplTheFile.Value;
            int poslast =xlk.LastIndexOf("\\");
            strFileNameOnServer = xlk.Substring(poslast+1);
            
  if (null != uplTheFile.PostedFile) 
  {
    try 
    {
      uplTheFile.PostedFile.SaveAs(strBaseLocation+strFileNameOnServer);
      txtOutput.InnerHtml = "File <b>" + 
        strBaseLocation+strFileNameOnServer+"</b> uploaded successfully";
        Response.Redirect("upload.aspx");
    }
    catch (Exception e) 
    {
      txtOutput.InnerHtml = "Error saving <b>" + 
        strBaseLocation+strFileNameOnServer+"</b><br>"+ e.ToString();
    }
  }
}
</script>


<form id="Form1" enctype="multipart/form-data" runat="server">
<tr>
  <td>Select file:</td>
  <td><input id="uplTheFile" type=file runat="server"></td>
</tr>
<tr>
  <td></td>
  <td><input id="txtServername" visible="false" type="text" runat="server"></td>
</tr>
<tr>
  <td colspan="2">
  <input type=button id="btnUploadTheFile" value="Luu File" 
                    OnServerClick="btnUploadTheFile_Click" runat="server">
  </td>
</tr>
</form>
<%=sl%>
    
<span id=txtOutput style="font: 8pt verdana;" runat="server" />
<script>
function DeleteIt(pt)
{
if(confirm("Chắc là bạn muốn xóa không?"))
window.location ="upload.aspx?pade="+pt;
}
</script>
</body>
</html>