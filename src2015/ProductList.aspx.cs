using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ProductList : System.Web.UI.Page
{
    public DataTable dtNewsSP = new DataTable();
    public string mtitle = "DANH SÁCH SẢN PHẨM";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            
            if (Request["Id"] != null)
            {
                mtitle = MyUtilities.GetOneField("select Name from GroupItem where Id=" + Request["Id"]);
                dtNewsSP = MyUtilities.GetDataTable("select top 6 * from ItemDetail where isdelete=0 and GroupItemId=" + Request["Id"] + " order by Id desc");
            }
            else
            {
                dtNewsSP = MyUtilities.GetDataTable("select top 6 * from ItemDetail where isdelete=0  order by Id desc");
            }
        }
        catch
        {
            Response.Redirect("Default.aspx");
        }
        

        
    }
}
