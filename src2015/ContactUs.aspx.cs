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

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string sql = "Insert into Contact(Name,Telephone,Fax,Email,Address,Subject,Message) values(@Name,@Telephone,@Fax,@Email,@Address,@Subject,@Message) ";
        System.Collections.Hashtable hs = new Hashtable();
        hs["Name"] = TenLHTextBox1.Text.Trim();
        hs["Telephone"] = DienThoaiTextBox1.Text;
        hs["Fax"] = FaxTextBox1.Text;
        hs["Email"] = EmailTextBox1.Text;
        hs["Address"] = DiaChiTextBox1.Text;
        hs["Subject"] = TieuDeTextBox1.Text;
        hs["Message"] = NoiDungTextBox1.Text;
        string arl = TenLHTextBox1.Text.Trim() + DienThoaiTextBox1.Text + FaxTextBox1.Text + DiaChiTextBox1.Text + TieuDeTextBox1.Text + NoiDungTextBox1.Text;
        if (arl.Length > 10)
        {
            MyUtilities.InsertData(sql, hs);
            MyUtilities.Show("Chúng tôi đã nhận được thông tin liên hệ của bạn! Xin cám ơn.Chúng tôi sẽ trả lời trong thời gian sớm nhất.","window.location.href='Default.aspx'");
        }
        else
        {
            MyUtilities.Show("Vui lòng nhập đầy đủ thông tin hơn!");
        }
        
        

    }
}
