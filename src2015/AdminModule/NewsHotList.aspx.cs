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
    public partial class NewsHotList : System.Web.UI.Page
    {
        public string path = "";
        public bool Check_Value(object check)
        {
            if( (check.ToString().ToLower() == "true")||(check.ToString().ToLower() == "1") )
            {
                return true;
            }
            return false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            path = MyContext.PathImageNewsHot + "/";
        }
       
        protected void sdsNewsHotList_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Command.Parameters["@TotalRows"].Value.ToString()))
                Paginater1.ItemCount = 0;
            else
                Paginater1.ItemCount = Int32.Parse(e.Command.Parameters["@TotalRows"].Value.ToString());
        }

        protected void sdsNewsHotList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@PageSize"].Value = Paginater1.PageSize;
            e.Command.Parameters["@PageIndex"].Value = Paginater1.CurrentPage;
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string NewsHotDelete = string.Empty;
            string NewsHotCannotDelete = string.Empty;
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox cb = GridView1.Rows[index].FindControl("RowLevelCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                    int myId = int.Parse(hd.Value);
                    HiddenField HiddenFieldImageNews = GridView1.Rows[index].FindControl("HiddenFieldImageNews") as HiddenField;
                    FileUtilities.DeleteFile(Server.MapPath(MyContext.PathImageNewsHot) + "/"+HiddenFieldImageNews.Value);
                    FileUtilities.DeleteFile(Server.MapPath(MyContext.PathImageNewsHot) + "/" + HiddenFieldImageNews.Value.Replace(".","_icon."));
                    Business.NewsHotManager.DeleteNewsHot(myId, null);
                }
            }
            GridView1.DataBind();

        }
        protected void BtnUpdateAll_Click(object sender, EventArgs e)
        {
            string NewsHotDelete = string.Empty;
            string NewsHotCannotDelete = string.Empty;
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                HiddenField hd = GridView1.Rows[index].FindControl("HiddenId") as HiddenField;
                int myId = int.Parse(hd.Value);
                Business.NewsHot t = Business.NewsHotManager.GetNewsHot(myId);
                CheckBox cb = GridView1.Rows[index].FindControl("IsHome") as CheckBox;
                t.IsHome = cb.Checked;
                TextBox tb = GridView1.Rows[index].FindControl("ViewPriority") as TextBox;
                int prio = t.ViewPriority;
                int.TryParse(tb.Text,out prio);
                t.ViewPriority = prio;
                Business.NewsHotManager.UpdateNewsHot(t);
                
            }
            GridView1.DataBind();

        }
        
    }
}
