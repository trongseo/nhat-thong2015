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
using System.Drawing;
using System.Drawing.Imaging;

namespace DemoWebsite.AdminModule
{
    public partial class PriceTableManage : System.Web.UI.Page
    {
        public int Id =0;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Id = MyUtilities.GetId();
            if (IsPostBack) return;
            
            if (Id != 0)
            {
                LinkTextBox.Text = Business.PriceTableManager.GetPriceTable(Id).Title;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Business.PriceTable av = new Business.PriceTable();
            av.PathFile = "";
            av.Title = LinkTextBox.Text.Trim();
            if (Id != 0)
            {
                av.Id = Id;
                Business.PriceTableManager.UpdatePriceTable(av);
                SaveFile(Id);
            }
            else
            {
                int idInserted = Business.PriceTableManager.InsertPriceTable(av);
                SaveFile(idInserted);
            }

            Response.Redirect("PriceTableList.aspx");


        }
        void SaveFile(int idInserted)
        {
            FileUpload fileUpEx = FileUpload1;
            if (fileUpEx.HasFile)
                if (FileUtilities.IsNormal(fileUpEx.PostedFile.FileName))
                {
                    string filepath = fileUpEx.PostedFile.FileName;
                    string file_ext = "";
                    string filename = "";
                    filename = fileUpEx.PostedFile.FileName.Substring(fileUpEx.PostedFile.FileName.LastIndexOf("\\") + 1);
                    string strFileType = fileUpEx.PostedFile.ContentType;
                    file_ext = filename.Substring(filename.LastIndexOf("."));
                    string file = idInserted.ToString() + "_" + file_ext;
                    string path = Server.MapPath("..") + MyContext.PathFilePrice;
                    path = path + "/" + file;
                    fileUpEx.PostedFile.SaveAs(path);
                    int id = Int32.Parse(idInserted.ToString());
                    //  av.ViewPriority = idInserted;
                    MyUtilities.ExecuteSql(id, file, "uspPriceTableUpdatePathFile", "PathFile");
                    
                }
        }
    }
}
