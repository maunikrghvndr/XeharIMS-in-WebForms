using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEHAR2017.AdminPortal.AdminPortalViews
{
    public partial class AddedProductsLocation : System.Web.UI.Page
    {
        static string childskuID;
        static string childsku;
        MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string skunumber = Request.QueryString["childskuID"];
            Char delimiter = ',';
            String[] substrings = skunumber.Split(delimiter);
            foreach (var substring in substrings)
            {
                childsku = substrings[0];
                childskuID = substrings[1];
            }
            if (!IsPostBack) {
             sku.Text = childsku;
            using (MySqlCommand cmd = new MySqlCommand("SELECT location_id,LName,wid cname FROM location"))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    sda.SelectCommand = cmd;

                        MySqlDataReader reader = cmd.ExecuteReader();
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        dropdownlist.DataSource = dt;
                        dropdownlist.DataTextField = "LName"; // text field name of table dispalyed in dropdown
                        dropdownlist.DataValueField = "location_id";                                // to retrive specific  textfield name 
                        dropdownlist.DataBind();      //assigning datasource to the dropdownlist
                        dropdownlist1.DataSource = dt;
                        dropdownlist1.DataTextField = "LName"; // text field name of table dispalyed in dropdown
                        dropdownlist1.DataValueField = "location_id";                                // to retrive specific  textfield name 
                        dropdownlist1.DataBind();      //assigning datasource to the dropdownlist
                        dropdownlist2.DataSource = dt;
                        dropdownlist2.DataTextField = "LName"; // text field name of table dispalyed in dropdown
                        dropdownlist2.DataValueField = "location_id";                                // to retrive specific  textfield name 
                        dropdownlist2.DataBind();      //assigning datasource to the dropdownlist
                    }
                con.Close();

            }
            }
        }
        protected void AddProductslocation(object sender, EventArgs e)
        {
            int childskuQuantity = Convert.ToInt32(quantity1.Value) + Convert.ToInt32(quantity2.Value) + Convert.ToInt32(quantity3.Value);
                if (quantity1.Value!="0" && quantity1.Value != "")
                {
                    con.Open();
                    string querylocation = "Insert INTO xehardb.productlocation (childskuID,location_ID,quantity) Values ('" + Convert.ToInt32(childskuID) + "','" + Convert.ToInt32(dropdownlist.SelectedValue) + "','"+Convert.ToInt32(quantity1.Value)+"')";
                    MySqlCommand cmd1 = new MySqlCommand(querylocation, con);
                   // MySqlDataAdapter da = new MySqlDataAdapter(cmd1);
                    cmd1.ExecuteReader();
                    con.Close();
                }
                if (quantity2.Value != "0" && quantity2.Value != "")
                {
                    con.Open();
                    string querylocation = "Insert INTO xehardb.productlocation (childskuID,location_ID,quantity) Values ('" + Convert.ToInt32(childskuID) + "','" + Convert.ToInt32(dropdownlist1.SelectedValue) + "','" + Convert.ToInt32(quantity2.Value) + "')";
                    MySqlCommand cmd2 = new MySqlCommand(querylocation, con);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd2);
                    cmd2.ExecuteReader();
                    con.Close();
                }
                if (quantity3.Value != "0" && quantity3.Value != "")
                {
                    con.Open();
                    string querylocation = "Insert INTO xehardb.productlocation (childskuID,location_ID,quantity) Values ('" + Convert.ToInt32(childskuID) + "','" + Convert.ToInt32(dropdownlist2.SelectedValue) + "','" + Convert.ToInt32(quantity3.Value) + "')";
                    MySqlCommand cmd1 = new MySqlCommand(querylocation, con);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd1);
                    cmd1.ExecuteReader();
                    con.Close();
                }
                if(Convert.ToInt32(quantity1.Value)+ Convert.ToInt32(quantity2.Value) + Convert.ToInt32(quantity3.Value) > 0)
                {
                con.Open();
                string querylocation = "Update xehardb.parentsku set quantity ='" + childskuQuantity + "' where parentskuID=(Select ParentskuID from childsku where childskuID='"+Convert.ToInt32(childskuID)+"')";
                MySqlCommand cmd1 = new MySqlCommand(querylocation, con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd1);
                cmd1.ExecuteReader();
                con.Close();
                }
            if (Convert.ToInt32(quantity1.Value) + Convert.ToInt32(quantity2.Value) + Convert.ToInt32(quantity3.Value) > 0)
            {
                con.Open();
                string querylocation = "Update xehardb.childsku set quantity ='" + childskuQuantity + "' where  childskuID='" + Convert.ToInt32(childskuID) + "'";
                MySqlCommand cmd1 = new MySqlCommand(querylocation, con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd1);
                cmd1.ExecuteReader();
                con.Close();
            }

            Response.Redirect("AddedProducts.aspx");
            
        }


    }
}