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
    public partial class ContactList : System.Web.UI.Page
    {
       
       
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //if (SessionUtilities.SessionUser == null)
            //{
            //    Response.Redirect(MusicContext.PathAccessDeny);

            //}


        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
            BtnDelete.Attributes.Add("onclick", "return confirmDelete (this.form);");

        }

        protected void sdsContactList_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Command.Parameters["@TotalRows"].Value.ToString()))
                Paginater1.ItemCount = 0;
            else
                Paginater1.ItemCount = Int32.Parse(e.Command.Parameters["@TotalRows"].Value.ToString());
        }

        protected void sdsContactList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PageSize"].Value = Paginater1.PageSize;
            e.Command.Parameters["@PageIndex"].Value = Paginater1.CurrentPage;


        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string ContactDelete = string.Empty;
            string ContactCannotDelete = string.Empty;
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox cb = GridView1.Rows[index].FindControl("RowLevelCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    HyperLink HyperLink1 = GridView1.Rows[index].FindControl("HyperLink1") as HyperLink;
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    int ContactId = int.Parse(hd.Value);
                    Business.ContactManager.DeleteContact(ContactId,null);
                }
            }
            GridView1.DataBind();

        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            //for (int index = 0; index < GridView1.Rows.Count; index++)
            //{
            //    CheckBox cb = GridView1.Rows[index].FindControl("chkActiveItem") as CheckBox;
            //    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
            //    int ContactId = int.Parse(hd.Value);
            //    if (cb.Checked)
            //    {
            //        ContactManager.ContactsActiveOrUnActive(ContactId, true);
            //    }
            //    else
            //    {
            //        ContactManager.ContactsActiveOrUnActive(ContactId, false);
            //    }
            //}
            //LabelReport.Text = "";
            //GridView1.DataBind();
        }
    }
}
