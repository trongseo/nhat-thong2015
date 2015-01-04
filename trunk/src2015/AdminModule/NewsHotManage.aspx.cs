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
using FredCK.FCKeditorV2;
using Business;

namespace DemoWebsite.AdminModule
{
    public partial class NewsHotManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Id !=0)
            {
                NewsHot nh = Business.NewsHotManager.GetNewsHot(Id);

                DescriptionTextBox.Text = nh.Description;
                CheckBox1.Checked = nh.IsActive;
                ShortdescriptionTextBox.Text = nh.Shortdescription;
                TitleTextBox.Text = nh.Title;
               
            }
            
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
                    string file = idInserted.ToString() + file_ext;
                    string fileicon = idInserted.ToString() + "_" + idInserted.ToString() + "_ico" + file_ext;
                    string path = Server.MapPath("..") + MyContext.PathImageNewsHot;
                    path = path + "/" + file;
                    fileUpEx.PostedFile.SaveAs(path);
                    String imageUrl = file;
                    if (imageUrl.IndexOf("/") >= 0 || imageUrl.IndexOf("\\") >= 0)
                    {
                        Response.End();
                    }
                    imageUrl = path;
                    System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(imageUrl);
                    int imageWidth = 75;
                    int imageHeight = FileUtilities.GetHeightImage(fullSizeImg.Width, fullSizeImg.Height, imageWidth, out imageWidth);
                    System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
                    System.Drawing.Image thumbNailImg = fullSizeImg.GetThumbnailImage(imageWidth, imageHeight, dummyCallBack, IntPtr.Zero);
                    DateTime MyDate = DateTime.Now;
                    String MyString = idInserted.ToString() + "_icon" + file_ext;
                    thumbNailImg.Save(Server.MapPath("..") + MyContext.PathImageNewsHot + "/" + MyString);
                    thumbNailImg.Dispose();
                    //-------------------
                    int id = Int32.Parse(idInserted.ToString());
                    NewsHotManager.UpdateNewsHotImage(id, file);
                }
        }

       
       

       
        public int Id
        { 
            get
            {
                int id_ = 0;
                int.TryParse(Request.QueryString["Id"], out id_);
                return id_;
            }
            
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (Id == 0)
            {
                NewsHot nh = new NewsHot();
                nh.Description = DescriptionTextBox.Text;
                nh.DateCreate = DateTime.Now;
                nh.Id = Id;
                nh.IsActive = CheckBox1.Checked;
                nh.IsDelete = false;
                nh.IsHome = false;
                nh.Shortdescription = ShortdescriptionTextBox.Text;
                nh.Title = TitleTextBox.Text;
                nh.ViewPriority = 0;
                int id_x=Business.NewsHotManager.InsertNewsHot(nh);
                SaveFile(id_x);
                
            }
            else
            {
                NewsHot nh = Business.NewsHotManager.GetNewsHot(Id);
                nh.Description = DescriptionTextBox.Text;
                nh.Id = Id;
                nh.IsActive = CheckBox1.Checked;
                nh.Shortdescription = ShortdescriptionTextBox.Text;
                nh.Title = TitleTextBox.Text;
                Business.NewsHotManager.UpdateNewsHot(nh);
                SaveFile(Id);
            }
            Response.Redirect("NewsHotList.aspx");
            
            
        }

        void UploadMainImageFile(int idInserted,FileUpload fileUpEx)
        {
             
            if (fileUpEx.HasFile)
                if (FileUtilities.IsImageFile(fileUpEx.PostedFile.FileName))
                {

                    string filepath = fileUpEx.PostedFile.FileName;
                    string file_ext = "";
                    string filename = "";
                    filename = fileUpEx.PostedFile.FileName.Substring(fileUpEx.PostedFile.FileName.LastIndexOf("\\") + 1);
                    string strFileType = fileUpEx.PostedFile.ContentType;
                    file_ext = filename.Substring(filename.LastIndexOf("."));
                    string file = idInserted.ToString() + file_ext;
                    string fileicon = idInserted.ToString() + "_" + idInserted.ToString() + "_ico" + file_ext;
                    string path = Server.MapPath("..") + MyContext.PathImageItem;
                    path = path + "/" + file;
                    fileUpEx.PostedFile.SaveAs(path);
                    String imageUrl = file;
                    if (imageUrl.IndexOf("/") >= 0 || imageUrl.IndexOf("\\") >= 0)
                    {
                        Response.End();
                    }
                    imageUrl = path;
                    System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(imageUrl);
                    int imageWidth = 75;
                    int imageHeight = FileUtilities.GetHeightImage(fullSizeImg.Width, fullSizeImg.Height, imageWidth, out imageWidth);
                    System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
                    System.Drawing.Image thumbNailImg = fullSizeImg.GetThumbnailImage(imageWidth, imageHeight, dummyCallBack, IntPtr.Zero);
                    DateTime MyDate = DateTime.Now;
                    String MyString = idInserted.ToString() + "_icon" + file_ext;
                    thumbNailImg.Save(Request.PhysicalApplicationPath + "ItemImage\\" + MyString);
                    thumbNailImg.Dispose();

                    int id = Int32.Parse(idInserted.ToString());
                    MyUtilities.ExecuteSql(id, file, "uspItemDetailUpdateImage", "PathImage");
                }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }

       
    }
}
