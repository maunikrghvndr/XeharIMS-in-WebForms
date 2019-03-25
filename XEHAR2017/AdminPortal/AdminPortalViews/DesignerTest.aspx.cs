﻿using MySql.Data.MySqlClient;
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
    public partial class DesignerTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindData();

            }
        }

        private void BindData()
        {

            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar2"].ConnectionString);
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT Front FROM excessimages"))
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