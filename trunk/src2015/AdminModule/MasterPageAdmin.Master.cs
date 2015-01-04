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

public partial class AdminModule_MasterPageAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //

        //if (SessionUtilities.SessionUser != null)
        //{
        //    SessionUtilities.SSUserId = "3";
        //}
        //else
        //{
        //    Response.Redirect("Login.aspx");
        //}
        //if (Request.Url.ToString().ToLower().IndexOf("login.aspx") == -1)
        //{
        //    //Response.Redirect("Login.aspx");
           
        //}
        if (Request.Url.ToString().ToLower().IndexOf("login.aspx") == -1)
        {
            if (SessionUtilities.SessionUser == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
}
