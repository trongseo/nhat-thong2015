using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


    public class ClassGroup
    {
        System.Collections.Stack stack_ = new System.Collections.Stack();
      public   ArrayList arrlist_ = new ArrayList();
        DataTable dtmain = new DataTable();
        const int Col_idparent = 1;
        const int Col_id = 0;
        DataTable dt = new DataTable();
        public ClassGroup()
        {

            //DataColumn dc1 = new DataColumn("Id");
            //dc1.DataType = Type.GetType("System.String");
            //dt.Columns.Add(dc1);
            //DataColumn dc2 = new DataColumn("ParentGroupItemId");
            //dc2.DataType = Type.GetType("System.String");
            //dt.Columns.Add(dc2);
            //DataColumn dc3 = new DataColumn("Level");
            //dc3.DataType = Type.GetType("Level");
            //dt.Columns.Add(dc3);

            //DataColumn dc4 = new DataColumn("Name");
            //dc4.DataType = Type.GetType("System.String");
            //dt.Columns.Add(dc4);
            
        }

        /*
         * Danh sach lay ve order by theo thu tu,theo parrentid=0
         * Mot stack  
         * Lay nhung thang parrent id=0 dua vao stack
         * For khi stack>0
         * * Pop trong stack ra 
         *   if(giatri la cha (parrentid=0)) thi level =0 else level ++
         *  dua gia tri nay  vao DataTable danh dau level
         * Tu giatri lay tat ca con cua no dua vao stack
         * end for
         * 
         * bay gio ta co table nhu sau
         *  Id ParrentId Level
         *  1    0          0
         *  2    1          1
         *  3    2           2
         *  4    2           2
         * */
        public string getAllIDFromIDParent( string groupID)
        {
            stack_.Clear();
            arrlist_.Clear();
            string sql = "SELECT Id,ParentGroupItemId,Name,Level ='0',haschild='0',texts='' " +
                         " FROM GroupItem order by ViewPriority desc ";


            dtmain = MyUtilities.ExecuteSql1(sql);
            bool haschild = fillStackFrom("0");
            
            if (haschild == false)
            {
                arrlist_.Add(groupID);

            }
            
            //loc con của gropID đưa vào stack
            int parentlevel = 0;
            while (stack_.Count > 0)
            {
                DataRow drt = (DataRow)stack_.Pop();
                groupID = drt["Id"].ToString();
                haschild = fillStackFrom(groupID);
                if (haschild == true)
                {
                    
                    drt["haschild"] = "1";
                    drt["texts"] = startdiv + "-" + enddiv;
                }
                
                arrlist_.Add(drt);

                

            }
            string return_val = "";
            for (int j = 0; j < arrlist_.Count; j++)
            {
                return_val += arrlist_[j].ToString() + ",";
            }
            return_val = return_val.Substring(0, return_val.Length - ",".Length);
            return return_val;
        }
        string startdiv = "";
        string enddiv = "";
        bool fillStackFrom(string groupID)
        {
            bool first = true;
            bool haschild = false;
            for (int i = 0; i < dtmain.Rows.Count; i++)
            {
                if (dtmain.Rows[i][Col_idparent].ToString() == groupID) // groupID la cha thi đưa vào satck
                {
                    //DataRow dr = dt.NewRow();
                    //dr["Id"] = dtmain.Rows[i]["Id"].ToString();
                    //dr["ParentGroupItemId"] = dtmain.Rows[i]["ParentGroupItemId"].ToString();
                    //dr["Name"] = dtmain.Rows[i]["Name"].ToString();
                    if (dtmain.Rows[i]["ParentGroupItemId"].ToString() != "0")//khong phai la root
                    {
                        dtmain.Rows[i]["Level"] = GetMyLevel(dtmain.Rows[i]["ParentGroupItemId"].ToString());
                    }
                    if (first == true)
                    {
                      
                        stack_.Push(dtmain.Rows[i]);
                        first = false;
                        startdiv = dtmain.Rows[i]["Id"].ToString();
                    }
                    else
                    {
                        stack_.Push(dtmain.Rows[i]);
                    }
                    
                    haschild = true;
                }

            }
            if (haschild == true)
            {
                DataRow drp= (DataRow)stack_.Pop();
                enddiv = drp["Id"].ToString() ;
                stack_.Push(drp);
            }
            return haschild;
        }
        string GetMyLevel(string parentid)
        {
           int x= GetParentLevel(parentid);
            x++;
            return x.ToString();

        }
        int GetParentLevel(string parentid)
        {
            for (int i = 0; i < dtmain.Rows.Count; i++)
            {
                if (dtmain.Rows[i]["Id"].ToString() == parentid) // groupID la cha thi đưa vào satck
                {
                    return int.Parse( dtmain.Rows[i]["Level"].ToString());
                }
            }
            return 0;//never return 0
        }

      
    }
