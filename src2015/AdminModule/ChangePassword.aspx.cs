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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if ((NewPassword.Text.Trim() == "") || (ReNewPassword.Text.Trim() == ""))
            {
                LabelErr.Visible = true;
                LabelErr.Text = "Vui lòng nhập mật khẩu Mới !";
                return;
            }
            if (NewPassword.Text != ReNewPassword.Text)
            {
                LabelErr.Visible = true;
                LabelErr.Text = "Vui lòng nhập mật khẩu Mới giống nhau!";
                return;
            }
            bool rightPass = Business.MemberManager.CheckOldPassword(SessionUtilities.SessionUser.Id, OldPassWord.Text);
            if (rightPass == true)
            {
                LabelErr.Visible = true;
                Business.MemberManager.UpdateMemberChangePassword(SessionUtilities.SessionUser.Id, NewPassword.Text.Trim());
                LabelErr.Text = "Đổi mật khẩu thành công!";
            }
        }
    }
}
