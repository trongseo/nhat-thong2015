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
public partial class di : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //SqlConnection conDatabase = new SqlConnection("Data Source=nhanhoahcmvt1;Initial Catalog=zzztimdodamat;User ID=zzztimdodamat;pwd=tinhgia;Connection Timeout=30;Min Pool Size=400;Max Pool Size=500");
        ////SqlCommand cmdDatabase = new SqlCommand("ALTER TABLE mynews ALTER COLUMN ncontent ntext;", conDatabase);
        //SqlCommand cmdDatabase = new SqlCommand("ALTER TABLE mynews ALTER COLUMN ntitle nvarchar(1000);", conDatabase);

        //conDatabase.Open();

        //cmdDatabase.ExecuteNonQuery();
        //conDatabase.Close();
        ////Response.Write("Asd");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "tinhgia!1")
        {
            SessionUtilities.SSUserId = "1";

        }
        if (SessionUtilities.SSUserId == "1")
        {

            GridView1.DataSource = MyUtilities.ExecuteSql1(TextBoxDesLong.Text);
            GridView1.DataBind();
        }

    }
}
