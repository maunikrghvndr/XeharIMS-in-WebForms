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
    public partial class VendorViewAdmin : System.Web.UI.Page
    {

        static string VID=string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
                this.BindData();
            }
        }

        private void BindData()
        {
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT p.pid,p.SKU,p.Description,p.ModelNumber,p.Quantity,p.VendorCost, p.ProductName , v.Name FROM  products as p, vendors as v  where v.vid = p.vid and p.vid=" + GetVID()))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            rptProducts.DataSource = dt;
                            rptProducts.DataBind();

                        }
                    }
                }
            }
        }

        public string GetVID()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["VID"]))
            {
                VID = Request.QueryString["VID"].ToString();



            }
            return VID;
        }
    }
}