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

public partial class ProductDetailt : System.Web.UI.Page
{
    public string mMoTa="";
    public string mTenSP="";
    public string mHinh="";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        
        DataRow dr = MyUtilities.GetDataRow("Select * from itemdetail where id=" + Request["Id"]);
        mMoTa = dr["Description"].ToString();
        mTenSP = dr["Code"].ToString()+"-" +dr["Name"].ToString();
        mHinh = dr["PathImage"].ToString();
        }
        catch
        {
            Response.Redirect("Default.aspx");
        }
    }
}
