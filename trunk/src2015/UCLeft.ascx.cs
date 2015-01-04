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

public partial class UCLeft : System.Web.UI.UserControl
{
    public DataTable dt = new DataTable();
    public DataTable dtNewsSP = new DataTable();
    public DataTable dtQC = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        dt = MyUtilities.GetDataTable("select * from groupitem where parentgroupitemid=6");
        dtNewsSP = MyUtilities.GetDataTable("select top 1 * from ItemDetail where isdelete=0 order by Id desc");
        dtQC = MyUtilities.GetDataTable("select * from Advertise order by Id desc");
    }
}
