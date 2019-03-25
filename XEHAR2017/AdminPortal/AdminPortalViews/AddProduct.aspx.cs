using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace XEHAR2017.AdminPortal.AdminPortalViews
{
    public partial class AddProduct : System.Web.UI.Page
    {
        private int i;
        // static int k ;
        //static string loc;
        DropDownList dd;
        static int count = 0;
        static List<String> parentSkuNames = new List<String>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //var success = Request.QueryString["s"];
                //if (!string.IsNullOrWhiteSpace(success))
                //    succMessage.Visible = true;
                Session["ControlsCount"] = null;




                MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT colorCode,Name,CONCAT(colorCode, '-', Name) AS cname FROM colors "))
                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            sda.SelectCommand = cmd;
                            DropDownList2.DataSource = cmd.ExecuteReader();


                            DropDownList2.DataTextField = "cname"; // text field name of table dispalyed in dropdown
                            DropDownList2.DataValueField = "colorCode";             // to retrive specific  textfield name 
                            DropDownList2.DataBind();      //assigning datasource to the dropdownlist
                           // DropDownList2.Items.Insert(0, new ListItem("--Select Color--", "0"));








                        }
                        con.Close();
                        //DropDownList1.Items.Insert(0, new ListItem("--Select Color--", "0"));
                    }

//------------use below code when you are adding dynamic location to dropdown--------------

                    //using (MySqlCommand cmd1 = new MySqlCommand("SELECT location_id,lname,wid cname FROM location "))
                    //{
                    //    using (MySqlDataAdapter sda1 = new MySqlDataAdapter())
                    //    {
                    //        con.Open();
                    //        cmd1.CommandType = CommandType.Text;
                    //        cmd1.Connection = con;

                    //        sda1.SelectCommand = cmd1;
                    //        DropDownList4.DataSource = cmd1.ExecuteReader();


                    //        DropDownList4.DataTextField = "lname"; // text field name of table dispalyed in dropdown
                    //        DropDownList4.DataValueField = "location_id";             // to retrive specific  textfield name 
                    //        DropDownList4.DataBind();      //assigning datasource to the dropdownlist









                    //    }
                    //    con.Close();
                    //    DropDownList4.Items.Insert(0, new ListItem("--Select location--", "0"));
                    //}




                }
            }
            //if(IsPostBack)
            //{

            //    Control c;
            //    for (int j = 0; j < Page.Request.Form.Keys.Count; j++)
            //    {
            //        c = Page.FindControl(Page.Request.Form.Keys[j]);
            //        if (c is Button)
            //        {
            //            if (c.ID == "Button3")
            //            {
            //                if (Session["ControlsCount"] == null)
            //                {
            //                    Session["ControlsCount"] = 1;
            //                }
            //                else
            //                {
            //                    Session["ControlsCount"] = Convert.ToInt32(Session["ControlsCount"]) + 1;
            //                }
            //                CreateControl();
            //            }
            //            //if (c.ID == "Button2")
            //            //{
            //            //    CreateControl();
            //            //}
            //        }
            //    }
            //}

        }

        protected void AddProducts(object sender, EventArgs e)
        {

            //  Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>Validation();</script>");
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            parentSkuNames = new List<string>();
            string vendorName;
            string styleNo;
            string CC;
           // string size;
           // string SKU;
           // int Quantity;
            string parentsku_name;
             count = 0;
            //  string xx = null; 
            CC = DropDownList2.SelectedItem.Value.ToString();
            //char delimiter = '-';
            //string[] substrings = CC.Split(delimiter);
            //foreach (var substring in substrings) {
            //    xx = substrings[0];
            //}
            //size = DropDownList3.SelectedItem.Value.ToString();
           // Quantity = Convert.ToInt32(QuantityText.Value.ToString());
            vendorName = VendorText.Value.ToString();
            styleNo = StyleNumberText.Value.ToString();
            //string location = DropDownList4.SelectedItem.Value.ToString();
           // SKU = styleNo + "-" + CC + "-" + size;



            StringBuilder strQuery = new StringBuilder();
            strQuery.Append("INSERT INTO xehardb.products (Status,ModelNumber,VendorName) VALUES (0,'" + styleNo + "', '" + vendorName + "')");



            using (MySqlCommand cmd = new MySqlCommand(strQuery.ToString()))
            {
                cmd.Connection = con;
                con.Open();
                int i = cmd.ExecuteNonQuery();

                con.Close();

                if (i == 1)
                {
                    con.Open();

                    int recentPID = 0;
                    string querytogetpid = "Select MAX(PID) as p from Products";
                    MySqlCommand cmd2 = new MySqlCommand(querytogetpid, con);
                    MySqlDataReader da2 = cmd2.ExecuteReader();
                    // cmd2.ExecuteReader();

                    if (da2.Read())
                    {
                        recentPID = Convert.ToInt32(da2["p"]);
                    }
                    da2.Close();
                    con.Close();

                    var listBox = new ListBox();
                    var panel = new Panel();
                    string[] si = { "S", "M", "L", "1XL", "2XL", "3XL","OS","S/M","M/L","14","16","18","20","22","25","26","27","28","29","30","31","32" };
                    // var lst = DropDownList2.SelectedItems.Cast<DataRowView>();
                    foreach (var item in DropDownList2.GetSelectedIndices()) {
                        var item1 = DropDownList2.Items[item].Value;
                        // var item1 = item.ToString().Split('-')[0];
                        parentsku_name = styleNo + "-" + item1;
                        parentSkuNames.Add(parentsku_name);
                        con.Open();
                        string querylocation = "Insert INTO xehardb.parentsku (PID,name,color_id) Values ('" + recentPID + "','" + parentsku_name + "',(select color_id from colors where colors.colorcode='" + item1 + "' ))";
                        MySqlCommand cmd1 = new MySqlCommand(querylocation, con);
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd1);
                        cmd1.ExecuteReader();
                        con.Close();
                        count++;
                        Label dynamicLabel = new Label();
                        dynamicLabel.Text = parentsku_name;
                        dynamic1.Controls.Add(dynamicLabel);
                        panel = new Panel();
                        listBox = new ListBox();
                        panel.Controls.Add(listBox);
                        dynamic1.Controls.Add(panel);
                        listBox.Attributes.Add("multiple", "multiple");
                        //listBox.Attributes.Add("id", parentsku_name);
                        listBox.ID = parentsku_name;
                        listBox.Attributes.Add("name", parentsku_name);
                        listBox.Attributes.Add("title", parentsku_name);
                        for (int ix = 0; ix < si.Length; ix++)
                        {
                            listBox.Items.Add(new ListItem(si[ix]));
                        }

                    }

                    con.Close();
                    // con.Open();
                    //while (count != 0)
                    //{
                    //    listBox = new ListBox();
                    //    panel.Controls.Add(listBox);
                    //    listBox.Attributes.Add("multiple", "multiple");
                    //    for (int ix = 0; ix < si.Length; ix++) { 
                    //    listBox.Items.Add(new ListItem(si[ix]));
                    //}
                    //    count--;
                }
            }
        }


    
        protected void AddProductsSize(object sender, EventArgs e)
        {

           // List<String> locat = new List<String>();
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
         //   con.Open();
         //   string querylocation = "SELECT location_id,LName,wid cname FROM location";
         //   MySqlCommand cmd5 = new MySqlCommand(querylocation, con);
         ////   MySqlDataAdapter da5 = new MySqlDataAdapter(cmd5);
         //   MySqlDataReader da5 = cmd5.ExecuteReader();
         //   while(da5.Read())
         //   {
         //       locat.Add(da5["LName"].ToString());
         //   }

         // //  da5.SelectCommand = cmd5;
         //   con.Close();
         //   var listBox = new ListBox();
         //   var panel = new Panel();
         //   var dropdown = new DropDownList();
            String childsku_name;
                foreach (var parentsku in parentSkuNames)
                {

                    //  ListBox tb = (ListBox)this.Page.FindControl(parentsku);
                    // ListBox tb= (ListBox)FindControlRecursive(this, parentsku);
                    String[] size_array = Request.Form["ctl00$ContentPlaceHolder1$" + parentsku].Split(',');
                    //  ListBox tb = Page.FindControl("/ContentPlaceHolder2/" + parentsku);
                    
                    foreach (var item in size_array)
                    {
                    childsku_name = parentsku + "-" + item;
                    con.Open();
                        string querychildSku = "Insert INTO xehardb.childsku (parentSkuID,name,sizeID) Values ( (Select parentskuID from parentsku where parentsku.name='" + parentsku + "'),'" + childsku_name + "',(select sizeID from size where size.name='" + item + "' ))";
                        MySqlCommand cmd1 = new MySqlCommand(querychildSku, con);
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd1);
                        cmd1.ExecuteReader();
                        con.Close();

                   // Label dynamicLabel = new Label();
                   // dynamicLabel.Text = childsku_name;
                   // dynamic1.Controls.Add(dynamicLabel);
                   // panel = new Panel();
                   //// listBox = new ListBox();
                   // dropdown = new DropDownList();
                   //// panel.Controls.Add(listBox);
                   // panel.Controls.Add(dropdown);
                   // dynamic1.Controls.Add(panel);
                   //// listBox.Attributes.Add("multiple", "multiple");
                   // //listBox.Attributes.Add("id", parentsku_name);
                   // dropdown.ID = childsku_name;
                   // dropdown.Attributes.Add("name", childsku_name);
                   // dropdown.Attributes.Add("title", childsku_name);
                   
                   // //        DropDownList4.DataSource = cmd1.ExecuteReader();
                   // //dropdown.DataSource = cmd5.ExecuteReader();
                   // //cmd5.ExecuteReader();
                   // con.Close();
                   // for (int ix = 0; ix < locat.Count; ix++)
                   // {
                   //     dropdown.Items.Add(locat[ix]);
                   // }

                    }



                }
            

        }

        private Control FindControlRecursive(Control root, string id)
        {
            if (root.ID == id)
            {
                return root;
            }
            foreach (Control c in root.Controls)
            {
                Control t = FindControlRecursive(c, id);
                if (t != null)
                {
                    return t;
                }
            }
            return null;
        }

        protected void CancelProducts(Object sender, EventArgs e)
        {
            //Response.Redirect("/AdminPortal/AdminPortalViews/AdminHome.aspx");
            StyleNumberText.Value = "";
            VendorText.Value = "";
            DropDownList2.ClearSelection();
        }



    }
    }
