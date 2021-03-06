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
    public partial class GroupItemList : System.Web.UI.Page
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
            
           
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
          //  if (IsPostBack) return;
            int intParentGroupId = 0;
            int.TryParse(ParentGroupItemId, out intParentGroupId);
            if (intParentGroupId != 0)
            {
                LiteralTitle.Text = "<a href='GroupItemList.aspx'>Danh sách nhóm cha </a>><b>" + Business.GroupItemManager.GetGroupItem(intParentGroupId).Name + "</b>";
                HyperLinkNewGroup.NavigateUrl += "?ParentGroupItemId=" + intParentGroupId.ToString();
               // if (GridView1.Columns.Count > 2)
                    //GridView1.Columns.RemoveAt(2);
                GridView1.Columns[2].Visible = false;
            }
            else
            {
                LiteralTitle.Text = "Danh sách nhóm cha";
            }
            BtnDelete.Attributes.Add("onclick", "return confirmDelete (this.form);");
            
           
        }

        protected void sdsGroupItemList_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
          
        }

        protected void sdsGroupItemList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
          //  e.Command.Parameters["@PageSize"].Value = Paginater1.PageSize;
            e.Command.Parameters["@PageIndex"].Value = Paginater1.CurrentPage;
            

        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string GroupItemDelete = string.Empty;
            string GroupItemCannotDelete = string.Empty;
            bool flag = true;
            int ParentGroupItemId = MyUtilities.GetValueIdRequest("ParentGroupItemId");
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox cb = GridView1.Rows[index].FindControl("RowLevelCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    if (ParentGroupItemId != 0)
                    {
                        if (ItemDetailManager.CheckGroupItemExistFromItemDetail(int.Parse(hd.Value)) == false)
                        {
                            GroupItemManager.DeleteGroupItem(int.Parse(hd.Value), null);
                        }
                        else
                        {
                            flag = false;
                        }
                    }
                    else
                    {
                        if (GroupItemManager.CheckParentGroupItemIdExistFromGroupItem(int.Parse(hd.Value)) == false)
                        {
                            GroupItemManager.DeleteGroupItem(int.Parse(hd.Value), null);
                        }
                        else
                        {
                            flag = false;
                        }
                    }
                }
            }
            if(flag==false)
                LabelReport.Text = "Bạn không thể xóa nhóm cha khi nó có nhóm con hoặc nhóm có chứa sản phẩm!";
            GridView1.DataBind();

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

        protected void sdsGroupItemList_Selected1(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Command.Parameters["@TotalRows"].Value.ToString()))
                Paginater1.ItemCount = 0;
            else
                Paginater1.ItemCount = Int32.Parse(e.Command.Parameters["@TotalRows"].Value.ToString());
        }
        /// <summary>
        /// update all
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                TextBox tb = GridView1.Rows[index].FindControl("viewpriority") as TextBox;
                int vl = -1;
                int.TryParse(tb.Text.Trim(), out vl);
                HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                int GroupItemId = int.Parse(hd.Value);
                MyUtilities.CallStoreInt(GroupItemId,vl, "uspGroupItemUpdateViewPriority", "viewpriority");
                
            }
            GridView1.DataBind();
        }
    }
}

