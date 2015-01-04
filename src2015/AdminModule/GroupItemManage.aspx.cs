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
    public partial class GroupItemManage : System.Web.UI.Page
    {
        public string ParentGroupId
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
        public int Id
        {
            get
            {

                int intId = 0;
                int.TryParse(MyUtilities.GetValueRequest("Id"), out intId);
                return intId;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int intParentGroupId = 0;
            int.TryParse(ParentGroupId,out intParentGroupId);
            
            if (Id != 0)
            {
                FormView1.ChangeMode(FormViewMode.Edit);
                if (intParentGroupId != 0)
                {

                    LiteralTitle.Text = "Sửa con của nhóm :<b>" + Business.GroupItemManager.GetGroupItem(intParentGroupId).Name + "</b>";
                }
                else
                {
                    LiteralTitle.Text = "Sửa nhóm ";
                }

            }
            else 
            {
                if (intParentGroupId != 0)
                {
                   
                    LiteralTitle.Text = "Thêm con của nhóm :<b>" + Business.GroupItemManager.GetGroupItem(intParentGroupId).Name + "</b>";
                }
                else
                {
                    LiteralTitle.Text = "Thêm con của nhóm mới";
                }
            }
            HyperLinkBack.NavigateUrl += "?ParentGroupItemId=" + intParentGroupId.ToString();
            
        }

        protected void sdsGroupItem_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int pid = 0;
            int.TryParse(ParentGroupId, out pid);
            e.Values["ParentGroupItemId"] = pid;
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int pid = 0;
            int.TryParse(ParentGroupId, out pid);
            e.NewValues["ParentGroupItemId"] = pid;
        }

        protected void sdsGroupItem_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Response.Redirect("GroupItemList.aspx?ParentGroupItemId=" + ParentGroupId);
        }

        protected void sdsGroupItem_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Response.Redirect("GroupItemList.aspx?ParentGroupItemId=" + ParentGroupId);
        }

       
    }
}
