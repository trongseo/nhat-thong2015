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
using System.Data.SqlClient;
using Business;
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;
namespace DemoWebsite.AdminModule
{
    public partial class ItemDetailManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (MyUtilities.GetId() != 0)
            {
                int id = MyUtilities.GetId();
                ItemDetail itemDetail = new ItemDetail();
                itemDetail = ItemDetailManager.GetItemDetail(id);
                CodeTextBox.Text = itemDetail.Code;
                NameTextBox.Text = itemDetail.Name;
                PriceTextBox.Text =itemDetail.Price.ToString();
                ShortDescriptionTextBox.Text = itemDetail.ShortDescription;
                DescriptionTextBox.Text = itemDetail.Description;
                string image1="";
                GroupIdHidden.Value =itemDetail.GroupItem.Id.ToString();
                image1 = itemDetail.PathImage.ToString();
                if (image1 != "")
                {
                    Image1.Visible = true;
                    Image1.ImageUrl = MyContext.PathImageItem+"/"+image1;
                }
                
                loadImage();
            }
            if (MyUtilities.GetValueIdRequest("IdParrent") != 0)
            {
                Business.ItemDetail item = new Business.ItemDetail();
                item.IsDelete = true;
                item.GroupItem = new Business.GroupItem(MyUtilities.GetValueIdRequest("IdParrent"));
                
                int iditem = Business.ItemDetailManager.InsertItemDetail(item);
                Response.Redirect("ItemDetailManage.aspx?Id=" + iditem.ToString());

            }
            
            ClientScriptManager csManager = Page.ClientScript;
            csManager.RegisterClientScriptBlock(this.GetType(), "uspItemDetailImageSelectGenre", MyUtilities.GentJavascriptArray("uspItemDetailImageSelectGenre"), true);
            csManager.RegisterClientScriptBlock(this.GetType(), "uspItemDetailSelectCode", MyUtilities.GentJavascriptArray("uspItemDetailSelectCode"), true);
           // PriceTextBox.Attributes.Add("onblur", "formatListPrice('" + PriceTextBox.ClientID + "')");
          //  PriceTextBox.Attributes.Add("onkeyup", "formatListPrice('" + PriceTextBox.ClientID + "')");
            csManager.RegisterOnSubmitStatement(this.GetType(), "checksubmit", " return onSubmitCheck()");
            HiddenCode.Value = CodeTextBox.Text.ToString();
        }

        void loadImage()
        {
            SqlDataReader data;
            data= MyUtilities.GetSqlDataReader("uspItemDetailImageSelectFromItemDetailId",MyUtilities.GetId());
            bool hasValue = false;
            while(data.Read())
            {
                if (hasValue == false)
                {
                    Image2.Visible = true;
                    Image2.ImageUrl = MyContext.PathImageItem + "/" + data.GetValue(1).ToString();
                    Image2Hidden.Value = data.GetValue(0).ToString();
                    
                }
                if (hasValue==true)
                {
                    Image3.Visible = true;
                    Image3.ImageUrl = MyContext.PathImageItem + "/" + data.GetValue(1).ToString();
                    Image3Hidden.Value = data.GetValue(0).ToString();
                }
                hasValue = true;
            }
            data.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Business.ItemDetail item = new Business.ItemDetail();
            item.Code = CodeTextBox.Text;
            item.Description = DescriptionTextBox.Text;
            item.GroupItem = new Business.GroupItem( int.Parse(GroupIdHidden.Value));
            item.IsActive = true;
            item.IsDelete = false;
            item.Name = NameTextBox.Text;
            item.PathImage = "";
            item.Price = double.Parse(PriceTextBox.Text); //double.Parse(MyUtilities.UnFormatNumber(PriceTextBox.Text));
            item.ShortDescription = ShortDescriptionTextBox.Text;
            item.Id = MyUtilities.GetId();
            Business.ItemDetailManager.UpdateItemDetail(item);
            UploadMainImageFile(item.Id);
            UploadMoreImageFile1(FileUpload2,item.Id);
            UploadMoreImageFile2(FileUpload3, item.Id);
            Response.Redirect("amItemListNo.aspx");

            
        }
        void UploadMoreImageFile1(FileUpload fileUpEx, int idInserted)
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
                    int idinser = 0;
                    if (Image2Hidden.Value == "")
                    {
                        idinser = getIdImage(idInserted);
                    }
                    else
                    {
                        idinser= int.Parse(Image2Hidden.Value);
                    }
                    string file = idInserted.ToString() + "_" + idinser.ToString() + file_ext;
                   
                    string path = Server.MapPath("..") + MyContext.PathImageItem;
                    path = path + "/" + file;
                   
                    fileUpEx.PostedFile.SaveAs(path);
                    int id = Int32.Parse(idInserted.ToString());
                    ItemDetailImage itemimage = new ItemDetailImage();
                    itemimage.ItemDetail = new ItemDetail(idInserted);
                    itemimage.PathImage = file;

                    itemimage.Id = idinser;
                    Business.ItemDetailImageManager.UpdateItemDetailImage(itemimage);
                }
        }
        void UploadMoreImageFile2(FileUpload fileUpEx, int idInserted)
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
                    int idinser = 0;
                    if (Image3Hidden.Value == "")
                    {
                        idinser = getIdImage(idInserted);
                    }
                    else
                    {
                        idinser = int.Parse(Image3Hidden.Value);
                    }
                    string file = idInserted.ToString() + "_" + idinser.ToString() + file_ext;
                    string path = Server.MapPath("..") + MyContext.PathImageItem;
                    path = path + "/" + file;
                    fileUpEx.PostedFile.SaveAs(path);
                    int id = Int32.Parse(idInserted.ToString());
                    ItemDetailImage itemimage = new ItemDetailImage();
                    itemimage.ItemDetail = new ItemDetail(idInserted);
                    itemimage.PathImage = file;
                    itemimage.Id = idinser;
                    Business.ItemDetailImageManager.UpdateItemDetailImage(itemimage);
                }
        }

        int getIdImage(int idInserted)
        {        
            ItemDetailImage itemimage = new ItemDetailImage();
            itemimage.ItemDetail = new ItemDetail(idInserted);
            itemimage.PathImage = "";
            int idinser = Business.ItemDetailImageManager.InsertItemDetailImage(itemimage);
            return idinser;
        }
        void UploadMainImageFile(int idInserted)
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
                    int imageWidth = 500;
                    int imageHeight = FileUtilities.GetHeightImage(fullSizeImg.Width, fullSizeImg.Height, imageWidth, out imageWidth);

                  
                    System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
                    System.Drawing.Image thumbNailImg = fullSizeImg.GetThumbnailImage(imageWidth, imageHeight, dummyCallBack, IntPtr.Zero);
                   
                    String MyString = idInserted.ToString() + "_icon" + file_ext;

                    /////////////
                    Bitmap newImage = new Bitmap(imageWidth, imageHeight);
                    using (Graphics gr = Graphics.FromImage(newImage))
                    {
                        gr.SmoothingMode = SmoothingMode.HighQuality;
                        gr.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        gr.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        gr.DrawImage(fullSizeImg, new Rectangle(0, 0, imageWidth, imageHeight));
                       
                        gr.Save();
                        newImage.Save(Request.PhysicalApplicationPath + "ItemImage\\" + idInserted.ToString() + "_icon" + file_ext);
                        newImage.Dispose();
                        gr.Dispose();
                    }
                    ////////////
                   
                   // thumbNailImg.Save(Request.PhysicalApplicationPath + "ItemImage\\" + MyString);
                   // thumbNailImg.Dispose();

                    int id = Int32.Parse(idInserted.ToString());
                    MyUtilities.ExecuteSql(id, file, "uspItemDetailUpdateImage", "PathImage");
                }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }

        protected void sdsGroupParrent_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            
        }

        protected void DDParent_DataBound(object sender, EventArgs e)
        {
           
        }
    }
}
