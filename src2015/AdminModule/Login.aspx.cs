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
using Business;
namespace DemoWebsite.AdminModule
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (MyUtilities.GetValueRequest("from").ToLower() == "logout")
            {
                Session.Clear();
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Member mb = MemberManager.GetMemberFromUserNameAndPass(UserTextBox.Text, MyUtilities.HashPassWord(PassTextBox.Text));
            if (mb != null)
            {
             
                SessionUtilities.SessionUser = mb;
                UserTextBox.Text = "";
                PassTextBox.Text = "";
                Response.Redirect("Default.aspx");
            }
            else
            {

                Label1.Visible = true;
            }

        }
    }
}
