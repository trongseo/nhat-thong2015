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

public partial class AdminModule_amItemList : System.Web.UI.Page
{

    public DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request["add"] != null)
        //{
        //    MyUtilities.InsertData("insert into DiaDanh(diadanh) values('dia danh moi') ", null);
        //    Response.Redirect("amItemLista.aspx");
        //    return;
        //}
        if (IsPostBack) return;

        DataTable dtc = MyUtilities.GetDataTable("Select title=N'Tất cả',id='' union Select Name as title,id from GroupItem where ParentGroupItemId=6");
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
       
        //  Paginater1.PageSize = 6;
        int pz =40;
        int pi = 1;
        if (Request["page"] != null)
        {
            pi = int.Parse(Request["page"]);
        }
        string where = "";
        int recFrom = 1;
        int recTo = 1;
        if (pi == 1)
        {
            recFrom = 1;
            recTo = pz;
        }
        else
        {
            recFrom = pi * pz - pz + 1;
            recTo = recFrom + pz - 1;
        }
        // data: "name="+name+"&group_id="+group_id,
        Hashtable hs = new Hashtable();

        string where_ = "where 1=1 and isdelete=0 ";
         if ( Session["GroupId"]!=null)
        {
            DropDownList1.SelectedValue = Session["GroupId"].ToString();
            if ("0"!= Session["GroupId"].ToString())
            {
                  where_ += " and GroupItemId=" + Session["GroupId"].ToString();
            }
          
        }

        if (Request["user_name"] != null)
            if (Request["user_name"] != "")
            {
                hs["user_name"] = "%" + Request["user_name"] + "%";
                where_ = " and [user_name] like @user_name";
            }

        string tblname = "ItemDetail";
        string order_by = "Id desc";
        string sqlx = " WITH Ordered1 AS " +
        " (SELECT *, ROW_NUMBER() OVER (order by " + order_by + ") as RowNumber " +
        " FROM " + tblname + "  " + where_ + ")" +
        " SELECT * " +
        " FROM Ordered1 " +
        " WHERE RowNumber between " + recFrom + " and " + recTo;
        string sqlcount = " select count(Id) from " + tblname + " " + where_ + " ";
        string reco = MyUtilities.GetDataTable(sqlcount, hs).Rows[0][0].ToString();
        //Response.Write(sqlx);
        dt = MyUtilities.GetDataTable(sqlx, hs);
        int totalPage = int.Parse(reco) / pz;

        //add the last page, ugly
        if (int.Parse(reco) % pz != 0) totalPage++;

        PagingNum(totalPage, pi);
    }
    public string quesryxx_ = "";
    public string link = "";
    public string end_page = "";
    string pagemy = "amItemListNo.aspx";
    private void PagingNum(int totalpage, int currentpage)
    {


        end_page = totalpage.ToString();
        string first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' height='19' /></td>";
        //string first = "<td align='center' valign='middle'>First</td>";
        string prev = "<td align='center' valign='middle'><img src='images/btnPrev.gif' width='21' height='19' /></td>";
        //string prev = "<td align='center' valign='middle'><<Pre</td>";
        string next = "  <td align='center' valign='middle'><img src='images/btnNext.gif' width='21' height='19' /></td>";
        // string next = "  <td align='center' valign='middle'>NEXT</td>";
        string end = " <td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' height='19' /></td>";
        //string end = " <td align='center' valign='middle'>END</td>";

        string inpage = "<td align='center' valign='middle' nowrap='nowrap'>";

        if (totalpage == 1) return;
        if (totalpage >= 2)
        {
            first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (1).ToString() + "'\"  height='19' /></td>";
            end = "<td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (totalpage).ToString() + "'\"  height='19' /></td>";
            //totalpage = totalpage - 1;
            link = "";
            for (int i = 1; i <= totalpage; i++)
            {
                if (i != currentpage)
                {
                    link = link + "<a href='" + pagemy + "?page=" + i.ToString() + "'  class='URL' >" + i.ToString() + "</a>&nbsp;";
                }
                else
                    link = link + "<a href='javascript:void(0)' class='URL' >" + i.ToString() + "</a>&nbsp;";

            }
            inpage += link + "</td>";
            if (currentpage != totalpage)//next 
            {
                // link = link + " <span class='pagenum'><a  onclick='javascript:CallLoad(\"" + (currentpage + 1).ToString() + "\") ;return false;' href='javascript:void(0)'> trang tiếp »</a></span>";
                next = "  <td align='center' valign='middle'><img src='images/btnNext.gif' width='21' height='19' onclick=\"window.location.href='" + pagemy + "?page=" + (currentpage + 1).ToString() + "'\" /></td>";
            }
            if (currentpage != 1)//back
            {
                //link = " <span class='pagenum'><a onclick='javascript:CallLoad(\"" + (currentpage - 1).ToString() + "\") ;return false;' href='javascript:void(0)'>« trang trước </a></span>&nbsp;" + link;
                prev = "<td align='center' valign='middle'><img src='images/btnPrev.gif' width='21' height='19'  onclick=\"window.location.href='" + pagemy + "?page=" + (currentpage - 1).ToString() + "'\"  /></td>";
            }
        }
        quesryxx_ = first + prev + inpage + next + end;

    }

    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        string[] allk = Request.Form.AllKeys;
        string delete_id = "";
        for (int i = 0; i < allk.Length; i++)
        {
            if (allk[i].ToString().IndexOf("checkbox_") > -1)
            {
                delete_id += allk[i].Split("_".ToCharArray())[1] + ",";
            }

        }
        delete_id += "0";
        MyUtilities.DeleteData("Delete ItemDetail where Id in(" + delete_id + ")");
        Response.Redirect("amItemListNo.aspx");
    }
    
    /// <summary>
    /// cap nhat tat ca
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button2_Click(object sender, EventArgs e)
    {
        string[] allk = Request.Form.AllKeys;
        string all_id = "0";
        string ishome_id = "0";
        for (int i = 0; i < allk.Length; i++)
        {
            if (allk[i].ToString().IndexOf("ViewPriority") > -1)
            {
                string myid = allk[i].Split("_".ToCharArray())[1];
                string vmy = Request.Form["ViewPriority_" + myid].ToString();
                System.Collections.Hashtable hs = new Hashtable();
                hs["ViewPriority"] = vmy;
                MyUtilities.UpdateData(" Update ItemDetail set ViewPriority="+ vmy+" where Id =" + myid, hs);
                all_id += "," + myid;
            }
            if (allk[i].ToString().IndexOf("checkboxishome_") > -1)
            {
                string myid = allk[i].Split("_".ToCharArray())[1];
                ishome_id += "," + myid;
             
            }
            
        }
        MyUtilities.UpdateData("update ItemDetail set ishome=0 where Id in(" + all_id + ")", null);
        MyUtilities.UpdateData ("update ItemDetail set ishome=1 where Id in(" + ishome_id + ")",null);
       
        Response.Redirect("amItemListNo.aspx");
    }
    
    protected void btn_Add_Click(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["GroupId"] = DropDownList1.SelectedValue;
        Response.Redirect("amItemListNo.aspx?GroupId=" + DropDownList1.SelectedValue);
      
    }
}
