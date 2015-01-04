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
    public partial class AdvertiseManage : System.Web.UI.Page
    {
        int Id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Id = MyUtilities.GetId();
            if (IsPostBack) return;
            if (Id != 0)
            {
                LinkTextBox.Text = Business.AdvertiseManager.GetAdvertise(Id).Link;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Business.Advertise av = new Business.Advertise();
            av.PathImage = "";
            av.IsLeft = IsLeftCheckBox.Checked;
            av.Link = LinkTextBox.Text;
            if (Id != 0)
            {
                Business.AdvertiseManager.UpdateAdvertise(av);
                SaveFile(Id);
            }
            else
            {
                int idInserted = Business.AdvertiseManager.InsertAdvertise(av);
                SaveFile(idInserted);
            }

            Response.Redirect("AdvertiseList.aspx");


        }
        void SaveFile(int idInserted)
        {
            FileUpload fileUpEx = FileUpload1;
            if (fileUpEx.HasFile)
                if (FileUtilities.IsImageFile(fileUpEx.PostedFile.FileName))
                {
                    string filepath = fileUpEx.PostedFile.FileName;
                    string file_ext = "";
                    string filename = "";
                    filename = fileUpEx.PostedFile.FileName.Substring(fileUpEx.PostedFile.FileName.LastIndexOf("\\") + 1);
                    string strFileType = fileUpEx.PostedFile.ContentType;
                    file_ext = filename.Substring(filename.LastIndexOf("."));
                    string file = idInserted.ToString() + "_" + file_ext;
                    string path = Server.MapPath("..") + MyContext.PathImageAdvertise;
                    path = path + "/" + file;
                    fileUpEx.PostedFile.SaveAs(path);
                    //195

                    //Bitmap m_bmpRepresentation = new Bitmap(path, false);
                    //if (m_bmpRepresentation.Width > 174)
                    //{
                    //    FileUtilities.CreateThumbnailImage(path, file_ext, 174);
                    //}
                    //else
                    //{ 
                    //    FileUtilities.RenameFile(path,path.Replace(".","_icon."));
                    //}

                    //  FileUtilities.DeleteFile(path);
                    int id = Int32.Parse(idInserted.ToString());
                   
                    MyUtilities.ExecuteSql(id,file, "uspAdvertiseUpdateImage", "PathImage");


                }
        }
    }
}
