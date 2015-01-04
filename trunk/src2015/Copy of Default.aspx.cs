using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    
    public DataTable dtNewsSP = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
    
        dtNewsSP = MyUtilities.GetDataTable("select top 6 * from ItemDetail where isdelete=0 order by Id desc");
    }
}
