using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEHAR2017.AdminPortal.AdminPortalViews
{
    public partial class AdminPortalProduct : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
        static string pid = string.Empty;
        string modelNumber = string.Empty;
        string colorCode = string.Empty;
        string size = string.Empty;

         static string SKUString = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
                if (!String.IsNullOrEmpty(Request.QueryString["pid"]))
                {
                    pid = Request.QueryString["pid"].ToString();
                    string strSKU = "Select SKU FROM Products WHERE PID='" + pid + "'";
                    string strSKUdata = string.Empty;
                    MySqlCommand cmd = new MySqlCommand(strSKU, con);
                    cmd.Connection = con;
                    con.Open();
                    MySqlDataReader myReader;
                    myReader = cmd.ExecuteReader();
                    while (myReader.Read())
                    {

                        strSKUdata = myReader["SKU"].ToString();

                    }
                    con.Close();
                    string[] Skucolor = strSKUdata.Split('-');

                    this.BindProductData(Skucolor[0]);
                    lblColor.Text = Skucolor[0];
                    this.BindData(pid);
                }


            }

        }


        protected void btnConfirm_Click(object sender, EventArgs e)
        {

            string strData="Select SKU FROM Products WHERE PID='"+ pid +"'";
            MySqlCommand cmd = new MySqlCommand(strData, con);
            cmd.Connection = con;
            con.Open();

            MySqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            while (myReader.Read())
            {
               
                 SKUString = myReader["SKU"].ToString();
                
            }
            string[] SkuSplit = SKUString.Split('-');
            foreach (string split in SkuSplit)
            {
                Console.WriteLine(split);
            }

            Response.Redirect("AdminPurchaseOrder.aspx?Model="+SkuSplit[0]);
        }



        private void BindData(string pid)
        {
            string strData = "SELECT p.Description, p.`VendorCost`, p.Quantity FROM Products p WHERE p.PID='" + pid + "'";

            MySqlCommand cmd = new MySqlCommand(strData, con);
            cmd.Connection = con;
            con.Open();

            MySqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            while (myReader.Read())
            {
                lblVendorDescription.InnerText = myReader["Description"].ToString();
                lblVendorPrice.InnerText = "$ " + myReader["VendorCost"].ToString();
                Session["Totalvalue"] = myReader["Quantity"].ToString();
            }
        }

        private void BindProductData(string skucolor)
        {
            var filterdata = skucolor+"%";
            DataTable dt = new DataTable();
            DataTable dtCpy = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("Color", typeof(string)),
                            new DataColumn("Small", typeof(string)),
                            new DataColumn("Medium", typeof(string)),
                            new DataColumn("Large", typeof(string)),
                            new DataColumn("X-Large", typeof(string)),
                            new DataColumn("2X-Large", typeof(string)),
                            new DataColumn("3X-Large", typeof(string)),
                             });

            string strData = "SELECT SKU, Quantity FROM `products` where SKU like '" + filterdata + "' ";
            MySqlCommand cmd = new MySqlCommand(strData, con);
            cmd.Connection = con;
            con.Open();

            MySqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            while (myReader.Read())
            {
               string strsColorcode=myReader["SKU"].ToString().Split('-')[0] + "_" + myReader["SKU"].ToString().Split('-')[1];
                string strskuxcolor = myReader["SKU"].ToString().Split('-')[1];
                string strsize = myReader["SKU"].ToString().Split('-')[2];
                string quantity = myReader["Quantity"].ToString();


                if (dt.Rows.Count == 0)
                {
                    dt.Rows.Add(strskuxcolor, !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("s") ? quantity : "N/A") : "N/A",
                        !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("m") ? quantity : "N/A") : "N/A",
                        !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("l") ? quantity : "N/A") : "N/A",
                    !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("1xl") ? quantity : "N/A") : "N/A",
                    !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("2xl") ? quantity : "N/A") : "N/A",
                    !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("3xl") ? quantity : "N/A") : "N/A");
                }
                else
                {
                    
                    DataRow[] dtrow = dt.Select();
                    //for (int i = dt.Rows.Count - 1; i >= 0; i--)
                    foreach (DataRow row in dtrow)
                    {
                        DataRow[] drs = dt.Select("Color =" + strskuxcolor);
                        if (drs.Count() > 0 && row["Color"].ToString()==strskuxcolor)
                        {
                            row["Small"] = (row["Small"] != null && row["Small"] != "N/A") ? row["Small"] : (!string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("s") ? quantity : "N/A") : "N/A");
                            row["Medium"] = (row["Medium"] != null && row["Medium"] != "N/A") ? row["Medium"] : (!string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("m") ? quantity : "N/A") : "N/A");
                            row["Large"] = (row["Large"] != null && row["Large"] != "N/A") ? row["Large"] : (!string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("l") ? quantity : "N/A") : "N/A");
                            row["X-Large"] = (row["X-Large"] != null && row["X-Large"] != "N/A") ? row["X-Large"] : (!string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("1xl") ? quantity : "N/A") : "N/A");
                            row["2X-Large"] = (row["2X-Large"] != null && row["2X-Large"] != "N/A") ? row["2X-Large"] : (!string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("2xl") ? quantity : "N/A") : "N/A");
                            row["3X-Large"] = (row["3X-Large"] != null && row["3X-Large"] != "N/A") ? row["3X-Large"] : (!string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("3xl") ? quantity : "N/A") : "N/A");
                            dt.AcceptChanges();
                            row.SetModified();
                        }
                        else if(drs.Count()==0)
                        {
                            dt.Rows.Add(strskuxcolor, !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("s") ? quantity : "N/A") : "N/A",
                                               !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("m") ? quantity : "N/A") : "N/A",
                                               !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("l") ? quantity : "N/A") : "N/A",
                                           !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("1xl") ? quantity : "N/A") : "N/A",
                                           !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("2xl") ? quantity : "N/A") : "N/A",
                                           !string.IsNullOrWhiteSpace(strsize) ? (strsize.ToLower().Equals("3xl") ? quantity : "N/A") : "N/A");
                        }
                        else
                        {
                            
                        }
    

                    }
                    

                }
                
            }
            rptProducts.DataSource = dt;
            rptProducts.DataBind();


            con.Close();
                    
        }

    }
}