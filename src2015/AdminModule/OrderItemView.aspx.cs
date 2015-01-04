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

namespace DemoWebsite.AdminModule
{
    public partial class OrderItemView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = MyUtilities.GetId();
            if (id == 0) return;
            SqlDataReader data;
            data = MyUtilities.GetSqlDataReader("upsOrderItemAndItemNameSelect", id);
            while (data.Read())
            {
                SubjectLabel.Text = data["Subject"].ToString();
                if (data["Fax"] != null)
                    FaxLabel.Text = data["Fax"].ToString();
                if (data["Phone"] != null)
                    TelephoneLabel.Text = data["Phone"].ToString();
                if (data["Email"] != null)
                    EmailLabel.Text = data["Email"].ToString();
                if (data["CustomerName"] != null)
                    CustomerNameLabel.Text = data["CustomerName"].ToString();
                if (data["Message"] != null)
                    MessageLabel.Text = MyUtilities.HtmlEncode( data["Message"].ToString());
                if (data["Address"] != null)
                    AddressLabel.Text = data["Address"].ToString();
                if (data["ItemName"] != null)
                    ItemNameLabel.Text = data["ItemName"].ToString();
            } data.Close();
            
        }
    }
}
