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
    public partial class PriceTableList : System.Web.UI.Page
    {
        public string path = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            path = MyContext.PathFilePrice + "/";
            string from = MyUtilities.GetValueRequest("From");
            if (from == "up")
            {
                MoveUp();
                Response.Redirect("PriceTableList.aspx");
            }
            else
                if (from == "down")
                {
                    MoveDown();
                    Response.Redirect("PriceTableList.aspx");
                }

        }
        void MoveUp()
        {
            int id = MyUtilities.GetId();
            MyUtilities.GetSqlDataReader("uspPriceTableMoveUp", id);

        }
        void MoveDown()
        {
            int id = MyUtilities.GetId();
            MyUtilities.GetSqlDataReader("uspPriceTableMoveDown", id);
        }
        protected void sdsPriceTableList_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Command.Parameters["@TotalRows"].Value.ToString()))
                Paginater1.ItemCount = 0;
            else
                Paginater1.ItemCount = Int32.Parse(e.Command.Parameters["@TotalRows"].Value.ToString());
        }

        protected void sdsPriceTableList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PageSize"].Value = Paginater1.PageSize;
            e.Command.Parameters["@PageIndex"].Value = Paginater1.CurrentPage;


        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string PriceTableDelete = string.Empty;
            string PriceTableCannotDelete = string.Empty;
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox cb = GridView1.Rows[index].FindControl("RowLevelCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    int myId = int.Parse(hd.Value);
                    HiddenField hdf = GridView1.Rows[index].FindControl("HiddenPathFile") as HiddenField;

                    FileUtilities.DeleteFile(Server.MapPath("..") + MyContext.PathFilePrice + "/" + hdf.Value);
                    Business.PriceTableManager.DeletePriceTable(myId, null);
                }
            }
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string PriceTableDelete = string.Empty;
            string PriceTableCannotDelete = string.Empty;
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    TextBox tb = GridView1.Rows[index].FindControl("ViewPriority") as TextBox;
                    int myId = int.Parse(hd.Value);
                    int vp=-11;
                    Int32.TryParse(tb.Text, out vp);
                    if (vp == -11) continue;
                    MyUtilities.CallStoreInt(int.Parse(hd.Value), vp, "uspPriceTableUpdateViewPriority", "ViewPriority");
                
            }
            GridView1.DataBind();
        }

    }
}
