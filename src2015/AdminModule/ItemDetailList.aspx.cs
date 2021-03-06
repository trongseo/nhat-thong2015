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
    public partial class ItemDetailList : System.Web.UI.Page
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
        public string GroupId1
        {
            get
            {
                if (Request.QueryString["ParentGroupItemId"] != null)
                {
                    return Request.QueryString["ParentGroupItemId"];
                }
                return "6";
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
            int GroupId = 0;
            int.TryParse(GroupId1, out GroupId);
            if ((GroupId != 0) && ((GroupId != -1)))
            {
                LiteralTitle.Text = "Danh sách sản phẩm của nhóm <b><i>" + Business.GroupItemManager.GetGroupItem(GroupId).Name + "</i></b>";
            }
            
            if(!IsPostBack)
            DropDownList1.SelectedValue = Request.QueryString["ParentGroupItemId"];
            BtnDelete.Attributes.Add("onclick", "return confirmDelete (this.form);");
            if (MyUtilities.GetValueRequest("from") == "SearchName")
            {
                GridView1.DataSourceID = "SqlDataSourceName";
               
            }

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox cb = GridView1.Rows[index].FindControl("RowLevelCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    MyUtilities.GetSqlDataReader("DeleteItemDetailFromIsDelete", int.Parse(hd.Value));
                    HiddenField hdi = GridView1.Rows[index].FindControl("HiddenImageName") as HiddenField;
                    FileUtilities.DeleteFile(Server.MapPath("..")+ MyContext.PathImageItem + "/" + hdi.Value);
                    FileUtilities.DeleteFile(Server.MapPath("..") + MyContext.PathImageItem + "/" + hdi.Value.Replace(".","_icon."));
                    
                }
            }
            GridView1.DataBind();

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
            Response.Redirect("ItemDetailList.aspx?ParentGroupItemId=" + DropDownList1.SelectedValue);
        }

        protected void ButtonUPdateAll_Click(object sender, EventArgs e)
        {
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                try
                {
                
                CheckBox cb = GridView1.Rows[index].FindControl("IsHome") as CheckBox;
                TextBox tb = GridView1.Rows[index].FindControl("ViewPriority") as TextBox;
                HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;

                MyUtilities.CallStoreBool(int.Parse(hd.Value), cb.Checked, "uspItemDetailUpdateIsHome", "IsHome");
                MyUtilities.CallStoreInt(int.Parse(hd.Value), int.Parse(tb.Text), "uspItemDetailUpdateViewPriority", "ViewPriority");
                }
                catch
                {
                }

            }
           
            GridView1.DataBind();
        }
//search in admin
        protected void Button1_Click(object sender, EventArgs e)
        {
            string texts = TextBoxCode.Text.Replace("'", "").Trim();
            Response.Redirect("ItemDetailList.aspx?From=SearchName&Name=" + texts + "");
        }
    }
}
