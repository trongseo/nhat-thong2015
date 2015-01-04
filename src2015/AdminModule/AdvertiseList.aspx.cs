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
    public partial class AdvertiseList : System.Web.UI.Page
    {
        public string path = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            path = MyContext.PathImageAdvertise + "/";
            string from = MyUtilities.GetValueRequest("From");
            if(from=="up")
            {
                MoveUp();
                Response.Redirect("AdvertiseList.aspx");
            }
            else
                if(from=="down")
                {
                    MoveDown();
                    Response.Redirect("AdvertiseList.aspx");
                }
           
        }
        void MoveUp()
        {
            int id = MyUtilities.GetId();
            MyUtilities.GetSqlDataReader("uspAdvertiseMoveUp",id);

        }
        void MoveDown()
        {
            int id = MyUtilities.GetId();
            MyUtilities.GetSqlDataReader("uspAdvertiseMoveDown", id);
        }
        protected void sdsAdvertiseList_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Command.Parameters["@TotalRows"].Value.ToString()))
                Paginater1.ItemCount = 0;
            else
                Paginater1.ItemCount = Int32.Parse(e.Command.Parameters["@TotalRows"].Value.ToString());
        }

        protected void sdsAdvertiseList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PageSize"].Value = Paginater1.PageSize;
            e.Command.Parameters["@PageIndex"].Value = Paginater1.CurrentPage;


        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string AdvertiseDelete = string.Empty;
            string AdvertiseCannotDelete = string.Empty;
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox cb = GridView1.Rows[index].FindControl("RowLevelCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    int myId = int.Parse(hd.Value);
                    Business.AdvertiseManager.DeleteAdvertise(myId,null);
                }
            }
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                TextBox tb = GridView1.Rows[index].FindControl("ViewPriority") as TextBox;
                HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                int myId = int.Parse(hd.Value);
                Business.Advertise ad= Business.AdvertiseManager.GetAdvertise(myId);
                int vp = ad.ViewPriority;
                int.TryParse(tb.Text, out vp);
                ad.ViewPriority = vp;
                Business.AdvertiseManager.UpdateAdvertise(ad);
            }
            GridView1.DataBind();
        }

    }
}
