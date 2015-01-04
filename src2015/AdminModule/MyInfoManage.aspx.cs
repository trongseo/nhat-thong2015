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

namespace DemoWebsite.AdminModule
{
    public partial class MyInfoManage : System.Web.UI.Page
    {
        public string details = "";

        protected void Page_Load(Object Src, EventArgs E)
        {
            if (!IsPostBack)
            {
                DescriptionTextBox.Text = Business.InfoManager.GetInfo(MyUtilities.GetId()).HTMLContent;
                Output.Text = MyUtilities.GetValueRequest("title");
            }
        }

        protected void SaveButton_Click(Object Src, EventArgs E)
        {
            Business.Info ifo = new Business.Info();
            ifo.Id = MyUtilities.GetId();
            ifo.HTMLContent = DescriptionTextBox.Text;
            Business.InfoManager.UpdateInfo(ifo);

        }
    }
}
