using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEHAR2017.AdminPortal.AdminPortalViews
{
    public partial class EditProducts : System.Web.UI.Page
    {
       
            
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindGridView();
            }
        }
        protected void BindGridView()
        {
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM xehardb.productdescription right join(Select * from products Right Join (SELECT * FROM xehardb.images right join (select sub.cid,sub.cname, sub.cparentid as ccparentid,sub.csize,sub.sname,sub.cquant , parentsku.PID as ppid from parentsku  join (SELECT childsku.childskuID as cid, childsku.name as cname, parentskuID as cparentid ,childsku.sizeID as csize, size.name as sname, childsku.quantity as cquant FROM xehardb.childsku , size where childsku.sizeID= size.sizeID)sub where sub.cparentid = parentsku.parentskuID group by sub.cid)sub2 on images.parentskuID= sub2.ccparentid) sub3 on products.PID=sub3.ppid )sub4 on productdescription.PID = sub4.PID"))

                //Here we use the reference status to be 0 to indicate the incomplete products
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gv1.DataSource = dt;
                            gv1.DataBind();

                        }
                    }
                }
            }
        }
        //protected bool isEditMode = false;
        //protected bool IsInEditMode
        //{

        //    get { return isEditMode; }

        //    set
        //    {
        //        isEditMode = value;
        //    }

        //}
        protected void Gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //isEditMode = true;
            gv1.EditIndex = e.NewEditIndex;

            
            BindGridView();
           
        }
        protected void Gv1_RowDelete(object sender, GridViewDeleteEventArgs e)
        {
            int z = Convert.ToInt32(gv1.EditIndex);
            int childid = Convert.ToInt32(gv1.Rows[e.RowIndex].Cells[4].Text);
            string constr;
            IFormatProvider culture = new CultureInfo("fr-Fr", true);
            constr = ConfigurationManager.ConnectionStrings["Xehar"].ConnectionString;
            var con = new MySqlConnection(constr);
            con.Open();
            string sql = "Delete from  childsku where childskuID ='" + childid + "'";
            var cmd = new MySqlCommand(sql, con);
            int res = cmd.ExecuteNonQuery();
            con.Close();
            //if (res == 1){
            //    con.Open();
            //    string sql1 = "Delete from  childsku where childskuID ='" + childid + "'";
            //    var cmd1 = new MySqlCommand(sql1, con);
            //    int res1 = cmd1.ExecuteNonQuery();
            //    con.Close();
            //}
            BindGridView();
        }
        protected void Gv1_CancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //isEditMode = false;
            gv1.EditIndex = -1;
            BindGridView();
        }
        protected void Gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //foreach (GridViewRow row in gv1.Rows)
            //      {

            //      }

            //for (int i = 0; i <= gv1.Rows.Count - 1; i++)
            //{
            GridViewRow row = gv1.Rows[e.RowIndex];
            int y = Convert.ToInt32(gv1.EditIndex);
            int pid = Convert.ToInt32(gv1.Rows[y].Cells[3].Text);
            int cid = Convert.ToInt32(gv1.Rows[y].Cells[4].Text);
            int size_id = Convert.ToInt32(gv1.Rows[y].Cells[5].Text);
            int parent_id = Convert.ToInt32(gv1.Rows[y].Cells[6].Text);
            String product_name = ((TextBox)(row.Cells[7].Controls[0])).Text;
            String description = ((TextBox)(row.Cells[8].Controls[0])).Text;
            String country = ((TextBox)(row.Cells[9].Controls[0])).Text;
            String size = ((TextBox)(row.Cells[10].Controls[0])).Text;

            int quantity = Convert.ToInt32(((TextBox)(row.Cells[11].Controls[0])).Text);
            String image1 = ((TextBox)(row.Cells[12].Controls[0])).Text;
        
            String image2 = ((TextBox)(row.Cells[13].Controls[0])).Text;
            String image3 = ((TextBox)(row.Cells[14].Controls[0])).Text;
            String image4 = ((TextBox)(row.Cells[15].Controls[0])).Text;
            String image5 = ((TextBox)(row.Cells[16].Controls[0])).Text;
            String image6 = ((TextBox)(row.Cells[17].Controls[0])).Text;
            String features = ((TextBox)(row.Cells[18].Controls[0])).Text;
            
            //String unit = ((TextBox)gv1.Rows[y].FindControl("Textbox13")).Text;
            //String spval = ((TextBox)gv1.Rows[y].FindControl("Textbox14")).Text;
            //String torval = ((TextBox)gv1.Rows[y].FindControl("Textbox15")).Text;
            //String obtval = ((TextBox)gv1.Rows[y].FindControl("Textbox16")).Text;




            string constr1;
            IFormatProvider culture = new CultureInfo("fr-Fr", true);
            constr1 = ConfigurationManager.ConnectionStrings["Xehar"].ConnectionString;
            var con = new MySqlConnection(constr1);
            con.Open();
            string sql = "UPDATE products SET  ProductName='" + product_name + "', CountryOrigin='" + country + "',ExtraFeatures = '" + features.Replace("'", "''") + "' where PID= '" + pid + "'";
            var cmd = new MySqlCommand(sql, con);
            int res = cmd.ExecuteNonQuery();
            
            
            con.Close();
            if (res == 1)
            {
                con.Open();
                string sql1 = "UPDATE productdescription SET  xehar_desc=N'" + description.Replace("'", "''") + "' where PID= '"+ pid + "'";
                var cmd1 = new MySqlCommand(sql1, con);
                int res1 = cmd1.ExecuteNonQuery();
                con.Close();
                if (res1 == 1)
                {
                    con.Open();
                    string sql2 = "UPDATE images SET  Front='" + image1 + "', Back='" + image2 + "',images.Left = '" + image3 + "', images.Right = '" + image4 + "',extra1 = '" + image5 + "',extra2 = '" + image6 + "' where parentskuID='"+ parent_id + "' ";
                    var cmd2 = new MySqlCommand(sql2, con);
                    int res2 = cmd2.ExecuteNonQuery();
                    con.Close();
                    if (res2 == 1)
                    {
                        con.Open();
                        string sql3 = "UPDATE childsku SET  sizeID=(select sizeID from size where size.name='" + size + "'), quantity='" + quantity + "'where childskuID= '" + cid + "'";
                        var cmd3 = new MySqlCommand(sql3, con);
                        int res3 = cmd3.ExecuteNonQuery();
                        con.Close();
                        gv1.EditIndex = -1;
                        BindGridView();

                    }
                }
            }
           // Response.Redirect("/AdminPortal/AdminPortalViews/EditProducts.aspx");
            //}

        }
    }
}