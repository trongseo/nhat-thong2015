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
    public partial class ContactView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = MyUtilities.GetId();
            if (id == 0) return;
            Business.Contact cont = Business.ContactManager.GetContact(id);

            SubjectLabel.Text = cont.Subject;

            FaxLabel.Text = cont.Fax;

            TelephoneLabel.Text = cont.Telephone;

            EmailLabel.Text = cont.Email;
            CustomerNameLabel.Text = cont.Fax;

            MessageLabel.Text = MyUtilities.HtmlEncode( cont.Message);

            AddressLabel.Text = cont.Address;



        }
    }
}
