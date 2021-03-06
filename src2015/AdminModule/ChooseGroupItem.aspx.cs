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
    public partial class ChooseGroupItem : System.Web.UI.Page
    {
        public string From
        {
            get
            {
                if (Request.QueryString["From"] != null)
                {
                    return Request.QueryString["From"];
                }
                return "";
            }
        }
        public string ParentGroupItemId
        {
            get
            {
                if (Request.QueryString["ParentGroupItemId"] != null)
                {
                    return Request.QueryString["ParentGroupItemId"];
                }
                return "0";
            }
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //if (SessionUtilities.SessionUser == null)
            //{
            //    Response.Redirect(MusicContext.PathAccessDeny);

            //}


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int intParentGroupId = 0;
            int.TryParse(ParentGroupItemId, out intParentGroupId);
            if ((intParentGroupId != 0) && ((intParentGroupId != -1)))
            {
                LiteralTitle.Text = "Danh sách các nhóm con của <b><i>" + Business.GroupItemManager.GetGroupItem(intParentGroupId).Name + "</i></b>";
            }

            if(!IsPostBack)
            DropDownList1.SelectedValue = Request.QueryString["ParentGroupItemId"];

        }

        protected void sdsGroupItemList_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Command.Parameters["@TotalRows"].Value.ToString()))
                Paginater1.ItemCount = 0;
            else
                Paginater1.ItemCount = Int32.Parse(e.Command.Parameters["@TotalRows"].Value.ToString());
        }

        protected void sdsGroupItemList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PageSize"].Value = Paginater1.PageSize;
            e.Command.Parameters["@PageIndex"].Value = Paginater1.CurrentPage;


        }
       

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            //for (int index = 0; index < GridView1.Rows.Count; index++)
            //{
            //    CheckBox cb = GridView1.Rows[index].FindControl("chkActiveItem") as CheckBox;
            //    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
            //    int GroupItemId = int.Parse(hd.Value);
            //    if (cb.Checked)
            //    {
            //        GroupItemManager.GroupItemsActiveOrUnActive(GroupItemId, true);
            //    }
            //    else
            //    {
            //        GroupItemManager.GroupItemsActiveOrUnActive(GroupItemId, false);
            //    }
            //}
            //LabelReport.Text = "";
            //GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ChooseGroupItem.aspx?ParentGroupItemId=" + DropDownList1.SelectedValue);
        }
    }
}
