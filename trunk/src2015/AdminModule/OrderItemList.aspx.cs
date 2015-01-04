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
    public partial class OrderItemList : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            BtnDelete.Attributes.Add("onclick", "return confirmDelete (this.form);");
        }
        protected void sdsOrderItemList_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Command.Parameters["@TotalRows"].Value.ToString()))
                Paginater1.ItemCount = 0;
            else
                Paginater1.ItemCount = Int32.Parse(e.Command.Parameters["@TotalRows"].Value.ToString());
        }

        protected void sdsOrderItemList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PageSize"].Value = Paginater1.PageSize;
            e.Command.Parameters["@PageIndex"].Value = Paginater1.CurrentPage;
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox cb = GridView1.Rows[index].FindControl("RowLevelCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    OrderItemManager.DeleteOrderItem(int.Parse(hd.Value), null);
                }
            }
            GridView1.DataBind();

        }
    }
}
