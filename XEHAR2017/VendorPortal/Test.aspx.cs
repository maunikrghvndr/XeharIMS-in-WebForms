using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Drawing;
using System.Configuration;
//  
using System.IO;
using MySql.Data.MySqlClient;

namespace XEHAR2017.AdminUI
{
    public partial class Test : System.Web.UI.Page
    {


        
       
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Xehar"].ConnectionString.ToString());

            string ImageStr;
            string OldImg;

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {

                }
            }

            protected void btnUpload_Click(object sender, EventArgs e)
            {

                                                                                            

                try
                {
                    if (FileUpload1.HasFile)
                    {
                        string dirUrl = "Uploads" ;

                        string dirPath = Server.MapPath(dirUrl);

                        // Check for Directory, If not exist, then create it  

                        if (!Directory.Exists(dirPath))
                        {
                            Directory.CreateDirectory(dirPath);
                        }

                        // save the file to the Specifyed folder  

                        string fileUrl = dirUrl + "/" + Path.GetFileName(FileUpload1.PostedFile.FileName);
                        FileUpload1.PostedFile.SaveAs(Server.MapPath(fileUrl));

                        //Display the Image in the File Upload Control  
                        Image1.ImageUrl = fileUrl;
                    }
                }
                catch (Exception Exc)
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Application Error : " + Exc.Message;
                }
            }
            protected void btnSave_Click(object sender, EventArgs e)
            {
                try
                {
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("select image from images where image='" + Image1.ImageUrl + "' ", con);
                    MySqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        // Check, if the Image is available in the Database  

                        OldImg = dr["image"].ToString();

                        if (OldImg == Image1.ImageUrl)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('This Image Already Exist.')", true);
                        }

                    }

                    else
                    {
                        // If not avaliable, then insert it path to the database  

                        dr.Close();
                        MySqlCommand cmd1 = new MySqlCommand("insert into images(image) values('" + Image1.ImageUrl + "')", con);
                        cmd1.ExecuteNonQuery();
                    }

                    con.Close();
                }
                catch (Exception Exc)
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Application Error." + Exc.Message;
                }
            }
        

    
       

    }
}