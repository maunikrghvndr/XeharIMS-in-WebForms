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
    public partial class AddedProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindData();
            
        }

        private void BindData()
        {

            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            {
                using (MySqlCommand cmd = new MySqlCommand("select childsku.childskuID , childsku.name from childsku  join(select p.parentskuID as pd from parentsku as p, products as t where p.PID=t.PID ) sub where childsku.parentskuID=sub.pd and childsku.Quantity is  null"))

                //Here we use the reference status to be 0 to indicate the incomplete products
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
    }
}