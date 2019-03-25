using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using System.Diagnostics;

namespace XEHAR2017.AdminPortal.AdminPortalViews
{
    public partial class PendingProduct2ndPage : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Xehar"].ConnectionString.ToString());
        static string PID;
        static string styleno;
        static string psize;
       // static string parent_name;
        static List<string> parent_name = new List<string>();
        
       // parent_name.Clear();
        //string skunumber;
        string ImageStr;
        string OldImg;
        string OldImg1;
        string OldImg2;
        string OldImg3;
        protected void Page_Load(object sender, EventArgs e)
        {

            //  myDiv.InnerHtml = productMarkup;

            parent_name.Clear();

            string skunumber = Request.QueryString["PID"];
            Char delimiter = '-';
            String[] substrings = skunumber.Split(delimiter);
            foreach (var substring in substrings)
            {
                PID = substrings[0];
                styleno = substrings[1];
                // pcolor = substrings[2];
                // psize = substrings[3];
            }
            stylenumber.Text = styleno;
            var panel = new Panel();
            var dynamicImage = new System.Web.UI.WebControls.Image();
            var fileupload = new FileUpload();
            var button = new Button();
            var productMarkup = "";
            var dynamicLabel = new Label();
            using (MySqlCommand cmd = new MySqlCommand("SELECT parentskuID,parentsku.name FROM xehardb.parentsku where pid= " + PID))
            {
                int x = 0;
                con.Open();
                cmd.Connection = con;
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    // parent_name += ","+ dr["name"].ToString();
                    parent_name.Add(dr["name"].ToString()+","+ dr["parentskuID"].ToString());
                     dynamicLabel = new Label();
                    panel = new Panel();
                  //  button = new Button();
                    panel.Controls.Add(dynamicLabel);
                    myDiv.Controls.Add(panel);

                    dynamicLabel.Text = dr["name"].ToString();
                    for (int i = 0; i < 6; i++)
                    {
                        //Label dynamicLabel = new Label();
                      //dynamicImage = new System.Web.UI.WebControls.Image();
                        panel = new Panel();
                        fileupload = new FileUpload();
                       // button = new Button();
                       // panel.Controls.Add(dynamicImage);
                        panel.Controls.Add(fileupload);
                       // panel.Controls.Add(button);
                       // fileupload.Attributes.Add("ID", "fileupload-" + x + "-" + i);
                        fileupload.ID="fileupload-" + x + "-" + i;
                      // fileupload.Attributes.Add("onchange", "ShowImg1(event)");
                       // button.Attributes.Add("id", "fileupload" + i);
                      //  button.Attributes.Add("onclick", "ShowImg()");

                       // button.Attributes.Add("text", "upload");

                      //  dynamicImage.Attributes.Add("name", "img-" + x + "-" + i);
                       // dynamicImage.Attributes.Add("title", "img-" + x + "-" + i);
                      //  dynamicImage.Attributes.Add("ID", "img-" + x + "-" + i);
                     //   dynamicImage.Attributes.Add("height", "100px");
                      //  dynamicImage.Attributes.Add("width", "100px");
                      //  dynamicImage.Attributes.Add("runat", "server");
                        //button.Attributes.Add("runat", "server");
                        fileupload.Attributes.Add("runat", "server");
                        fileupload.Attributes.Add("title", dr["parentskuID"].ToString());
                        myDiv.Controls.Add(panel);
                        panel.Attributes.Add("style", "display:inline-block");
                        if (i == 5)
                        {
                            //  myDiv.InnerHtml = "<br/>";
                        }
                    }
                 //   panel.Controls.Add(button);
                 //   myDiv.Controls.Add(panel);
                   // button.Attributes.Add("onclick", "ShowImg1(event)");
                  //  button.Attributes.Add("runat", "server");
                  //  button.ID = "button-" + x;
                    x++;

                }
                con.Close();
             
            }


            if (!IsPostBack)
            {
                var success = Request.QueryString["s"];
                if (!string.IsNullOrWhiteSpace(success))
                    succMessage.Visible = true;
            }

            //     MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            {
                //using (MySqlCommand cmd = new MySqlCommand("SELECT name FROM categories "))
                //{
                //    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                //    {
                //        cmd.CommandType = CommandType.Text;
                //        cmd.Connection = con;
                //        con.Open();
                //        sda.SelectCommand = cmd;
                //        DropDownList1.DataSource = cmd.ExecuteReader();


                //        DropDownList1.DataTextField = "name"; // text field name of table dispalyed in dropdown
                //                     // to retrive specific  textfield name 
                //        DropDownList1.DataBind();      //assigning datasource to the dropdownlist
                //    }
                //    con.Close();
                //}
                using (MySqlCommand cmd = new MySqlCommand("SELECT name FROM subcategories "))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        sda.SelectCommand = cmd;
                        DropDownList2.DataSource = cmd.ExecuteReader();
                        DropDownList2.DataTextField = "name"; // text field name of table dispalyed in dropdown
                                                              // to retrive specific  textfield name 
                        DropDownList2.DataBind();      //assigning datasource to the dropdownlist

                    }
                    con.Close();
                }
            }
        }
        [WebMethod]
        public static void ShowImg(string material, string stylee,string measure,string price,string country,string desc,string pname ,string sub_cat,string[] sim)
        {
           

            ExtraFeatures extraFeatures = new ExtraFeatures();
            extraFeatures.Style = stylee;
            extraFeatures.Material = material;
            extraFeatures.Measurements = measure;
            
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            //sub_cat = DropDownList2.SelectedItem.Value.ToString();
            int z = 0;
            List<string> copy = parent_name.ToList();
            string output = JsonConvert.SerializeObject(extraFeatures);
            //string[] parents = parent_name.Split(',');
            //string[] images_array = sim.Split(',');
            int i = 0;
            int ooo= 0;
            foreach (var par in copy)
            {
                string parentskuids = "";
                string parentskuname = "";
                List<string> imgname = new List<string>();
                
                String[] substr = par.Split(',');
                foreach (var substring in substr)
                {
                    parentskuname = substr[0];
                    parentskuids = substr[1];
                    // pcolor = substrings[2];
                    // psize = substrings[3];
                }
                ooo = ooo + 6;
              
                for (; i < ooo; i++)
                {
                    //string dirPath = HostingEnvironment.MapPath(par.ToString());
                    if (sim[i] == "")
                    {
                        imgname.Add(sim[i]);
                        continue;
                    }
                   string dirPath= System.Web.HttpContext.Current.Server.MapPath("~/"+ parentskuname + "/");
                  //  if (!Directory.Exists(dirPath))
                   // {
                       // Directory.CreateDirectory(dirPath);
                   // }
                    FileInfo f = new FileInfo(sim[i]);
                    FileInfo f1 = new FileInfo(f.Name);
                    var fileName = Regex.Match(sim[i], @"[^\\]+$");
                    string fileUrl1 = dirPath  + f1.Name;
                    // File.WriteAllText(fileUrl1);
                    //  File.Create(fileUrl1);
                 //  if (!File.Exists(fileUrl1))
                    //{
                    //    // If it doesn't exist then copy to project STILL NEED TO CHECK THIS!!
                    //    File.Copy(f1.FullName, fileUrl1);
                    //}
                    imgname.Add(f.Name);
                 
                   // DirectoryInfo hdDirectoryInWhichToSearch = new DirectoryInfo(@"c:\");
                  //  FileInfo[] filesInDir = hdDirectoryInWhichToSearch.GetFiles(f.Name);

                    //foreach (FileInfo foundFile in filesInDir)
                    //{
                    //    string fullName = foundFile.FullName;
                    //    Console.WriteLine(fullName);
                    //}
                }
                con.Open();
                MySqlCommand cmd1 = new MySqlCommand("insert into images(images.front,images.back,images.left,images.right,images.extra1,images.extra2,images.parentskuID) values('" + imgname[0] + "','" + imgname[1] + "','" + imgname[2] + "','" + imgname[3] + "','"+ imgname[4] + "','" + imgname[5] + "','" + parentskuids + "')", con);
                 z = cmd1.ExecuteNonQuery();
                con.Close();
                imgname.Clear();
                  if(z==1)
                {
                    con.Open();
                    MySqlCommand cmd133 = new MySqlCommand("insert into productsaleschannels(scid,saleschannelprice,parentskuID) values('" + 8 +  "','" + Convert.ToDecimal(price) + "','" + parentskuids + "')", con);
                    cmd133.ExecuteNonQuery();
                    con.Close();
                } 
            }
            
                con.Open();
                MySqlCommand cmd2 = new MySqlCommand("update  `xehardb`.`products` set status=1 , subcategories_id=(select subcategories_id from subcategories where name='" + sub_cat + "'),productName='" + pname + "', CountryOrigin='" + country + "', ExtraFeatures='" + output.Replace("'", "''") + "' where pid='" + PID + "'", con);
                int ze = cmd2.ExecuteNonQuery();
                con.Close();

                if (ze == 1)
                {
                    con.Open();
                    MySqlCommand cmdee = new MySqlCommand("INSERT INTO `xehardb`.`productdescription` (`PID`, `xehar_desc`) VALUES ('" + PID + "', '" + desc + "')", con);
                    int zewww = cmdee.ExecuteNonQuery();
                    con.Close();
                 //   return "PendingProducts.aspx";
                }
                // return "PendingProducts.aspx";
                //  Http.Response.StatusCode = 307;
               // HttpContext.Current.Response.Redirect("~/PendingProducts.aspx", false);
            
           // return null;


        }

     
        protected void UploadFile(object sender, EventArgs e)
        {

            //Stream fImage = fileFront.PostedFile.InputStream;
            //Stream lImage = fileLeft.PostedFile.InputStream;
            //Stream bImage = fileBack.PostedFile.InputStream;
            //Stream rImage = fileRight.PostedFile.InputStream;

            //BinaryReader brF = new BinaryReader(fImage);
            //BinaryReader brL = new BinaryReader(lImage);
            //BinaryReader brB = new BinaryReader(bImage);
            //BinaryReader brR = new BinaryReader(rImage);
            //byte[] Fbytes = brF.ReadBytes((Int32)fImage.Length);
            //byte[] Lbytes = brL.ReadBytes((Int32)lImage.Length);
            //byte[] Bbytes = brB.ReadBytes((Int32)bImage.Length);
            //byte[] Rbytes = brR.ReadBytes((Int32)rImage.Length);

            
            //Console.Write(desc);
            // string constr = ConfigurationManager.ConnectionStrings["xehardb"].ConnectionString;
            // MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);

            // string query = "UPDATE designs SET Front='" + Fbytes + "',LeftIM='" + Lbytes + "',Back='" + Bbytes + "',RightIM='" + Rbytes + "' WHERE PID='" + PID + "'";
            //using (MySqlCommand cmd = new MySqlCommand(query))
            //{
            //    cmd.Connection = con;
            //    con.Open();
            //    cmd.ExecuteNonQuery();
            //    con.Close();
            //}









            //string PD = MyBox.Text;
            //string query1 = ("INSERT INTO `xehardb`.`productdescription` (`PID`, `xehar_desc`) VALUES ('" + PID + "', '" + desc + "')");
            //using (MySqlCommand cmdo = new MySqlCommand(query1))
            //{
            //    cmdo.Connection = con;
            //    con.Open();
            //    cmdo.ExecuteNonQuery();
            //    con.Close();
            //}
            //string query2 = ("update  `xehardb`.`products` set status=1 , subcategories_id=(select subcategories_id from subcategories where name='" + sub_cat + "') where pid='" + PID + "'");
            //using (MySqlCommand cmd5 = new MySqlCommand(query2))
            //{
            //    cmd5.Connection = con;
            //    con.Open();
            //    cmd5.ExecuteNonQuery();
            //    con.Close();
            //}
            //try
            //{
        //    con.Open();

        //    MySqlCommand cmd = new MySqlCommand("select images.front as f,images.left as l,images.right as r,images.back as b from images where Front='" + Image1.ImageUrl + "'", con);
        //    MySqlDataReader dr = cmd.ExecuteReader();

        //    if (dr.Read())
        //    {
        //        // Check, if the Image is available in the Database  

        //        OldImg = dr["f"].ToString();
        //        OldImg1 = dr["b"].ToString();
        //        OldImg2 = dr["r"].ToString();
        //        OldImg3 = dr["l"].ToString();

        //        //if (OldImg == Image1.ImageUrl)
        //        //{
        //        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Front Image Already Exist.')", true);
        //        //}


        //        //if (OldImg1 == Image2.ImageUrl)
        //        //{
        //        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Back Image Already Exist.')", true);
        //        //}

        //        //if (OldImg2 == Image3.ImageUrl)
        //        //{
        //        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Right Image Already Exist.')", true);
        //        //}

        //        //if (OldImg3 == Image4.ImageUrl)
        //        //{
        //        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Left Image Already Exist.')", true);
        //        //}

        //    }

        //    else
        //    {
        //        // If not avaliable, then insert it path to the database  

        //        //dr.Close();
        //        //MySqlCommand cmd1 = new MySqlCommand("insert into images(images.front,images.back,images.left,images.right) values('" + Image1.ImageUrl + "','" + Image3.ImageUrl + "','" + Image2.ImageUrl + "','" + Image4.ImageUrl + "')", con);
        //        //int i = cmd1.ExecuteNonQuery();
        //        //con.Close();

        //        //if (i == 1)
        //        //{
        //        //    con.Open();
        //        //    string queryimage = "Insert INTO xehardb.productimages (IMID,PID) Values ((select IMID from images where Front='" + Image1.ImageUrl + "'),'" + PID + "')";
        //        //    MySqlCommand cmd2 = new MySqlCommand(queryimage, con);
        //        //    MySqlDataAdapter da = new MySqlDataAdapter(cmd2);
        //        //    cmd2.ExecuteReader();
        //        //    con.Close();
        //        //    //con.Open();
        //        //}
        //    }

        //    con.Close();
        //    //}
        //    //catch (Exception Exc)
        //    //{
        //    //    Label1.ForeColor = Color.Red;
        //    //    Label1.Text = "Application Error." + Exc.Message;
        //    //}

        //    //fImage.Close();
        //    //lImage.Close();
        //    //bImage.Close();
        //    //rImage.Close();
        //    //brF.Close();
        //    //brL.Close();
        //    //brB.Close();
        //    //brR.Close();
        //    Response.Redirect("PendingProducts.aspx");

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
            Response.Redirect("/AdminPortal/AdminPortalViews/AdminHome.aspx");
        }




        //protected void btnUpload_Click(object sender, EventArgs e)
        //{



        //    //try
        //   // {
        //        if (FileUpload1.HasFile)
        //        {
        //            string dirUrl = styleno + "/" + pcolor;

        //            string dirPath = Server.MapPath(dirUrl);

        //            // Check for Directory, If not exist, then create it  

        //            if (!Directory.Exists(dirPath))
        //            {
        //                Directory.CreateDirectory(dirPath);
        //            }

        //            // save the file to the Specifyed folder  

        //            string fileUrl = dirUrl + "/" + Path.GetFileName(FileUpload1.PostedFile.FileName);
        //            FileUpload1.PostedFile.SaveAs(Server.MapPath(fileUrl));

        //            //Display the Image in the File Upload Control  
        //            Image1.ImageUrl = fileUrl;
        //        }

        //        //    if (FileUpload2.HasFile)
        //        //    {
        //        //        string dirUrl = styleno + "/" + pcolor;

        //        //        string dirPath = Server.MapPath(dirUrl);

        //        //        // Check for Directory, If not exist, then create it  

        //        //        if (!Directory.Exists(dirPath))
        //        //        {
        //        //            Directory.CreateDirectory(dirPath);
        //        //        }

        //        //        // save the file to the Specifyed folder  

        //        //        string fileUrl1 = dirUrl + "/" + Path.GetFileName(FileUpload2.PostedFile.FileName);
        //        //        FileUpload2.PostedFile.SaveAs(Server.MapPath(fileUrl1));

        //        //        //Display the Image in the File Upload Control  
        //        //        Image2.ImageUrl = fileUrl1;
        //        //    }
        //        //    if (FileUpload3.HasFile)
        //        //    {
        //        //        string dirUrl = styleno + "/" + pcolor;

        //        //        string dirPath = Server.MapPath(dirUrl);

        //        //        // Check for Directory, If not exist, then create it  

        //        //        if (!Directory.Exists(dirPath))
        //        //        {
        //        //            Directory.CreateDirectory(dirPath);
        //        //        }

        //        //        // save the file to the Specifyed folder  

        //        //        string fileUrl1 = dirUrl + "/" + Path.GetFileName(FileUpload3.PostedFile.FileName);
        //        //        FileUpload3.PostedFile.SaveAs(Server.MapPath(fileUrl1));

        //        //        //Display the Image in the File Upload Control  
        //        //        Image3.ImageUrl = fileUrl1;
        //        //    }
        //        //    if (FileUpload4.HasFile)
        //        //    {
        //        //        string dirUrl = styleno + "/" + pcolor;

        //        //        string dirPath = Server.MapPath(dirUrl);

        //        //        // Check for Directory, If not exist, then create it  

        //        //        if (!Directory.Exists(dirPath))
        //        //        {
        //        //            Directory.CreateDirectory(dirPath);
        //        //        }

        //        //        // save the file to the Specifyed folder  

        //        //        string fileUrl1 = dirUrl + "/" + Path.GetFileName(FileUpload4.PostedFile.FileName);
        //        //        FileUpload4.PostedFile.SaveAs(Server.MapPath(fileUrl1));

        //        //        //Display the Image in the File Upload Control  
        //        //        Image4.ImageUrl = fileUrl1;
        //        //    }
        //        //}
        //        //catch (Exception Exc)
        //        //{
        //        //    Label1.ForeColor = Color.Red;
        //        //    Label1.Text = "Application Error : " + Exc.Message;
        //        //}

        //        try
        //        {

        //        }
        //        catch (Exception Exc)
        //        {
        //            Label1.ForeColor = Color.Red;
        //            Label1.Text = "Application Error : " + Exc.Message;
        //        }
        //   // }
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    //try
        //    //{
        //    //    con.Open();

        //    //    MySqlCommand cmd = new MySqlCommand("select front,left,right,back from images where Front='" + Image1.ImageUrl + "' ", con);
        //    //    MySqlDataReader dr = cmd.ExecuteReader();

        //    //    if (dr.Read())
        //    //    {
        //    //        // Check, if the Image is available in the Database  

        //    //        OldImg= dr["front"].ToString();
        //    //        OldImg1 = dr["back"].ToString();
        //    //        OldImg2 = dr["right"].ToString();
        //    //        OldImg3 = dr["left"].ToString();

        //    //        if (OldImg == Image1.ImageUrl)
        //    //        {
        //    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Front Image Already Exist.')", true);
        //    //        }


        //    //        if (OldImg1 == Image2.ImageUrl)
        //    //        {
        //    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Back Image Already Exist.')", true);
        //    //        }

        //    //        if (OldImg2 == Image3.ImageUrl)
        //    //        {
        //    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Right Image Already Exist.')", true);
        //    //        }

        //    //        if (OldImg3 == Image4.ImageUrl)
        //    //        {
        //    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Left Image Already Exist.')", true);
        //    //        }

        //    //    }

        //    //    else
        //    //    {
        //    //        // If not avaliable, then insert it path to the database  

        //    //        dr.Close();
        //    //        MySqlCommand cmd1 = new MySqlCommand("insert into images(front,back,left,right) values('" + Image1.ImageUrl + "','" + Image3.ImageUrl + "','" + Image2.ImageUrl + "','" + Image4.ImageUrl + "')", con);
        //    //        cmd1.ExecuteNonQuery();
        //    //    }

        //    //    con.Close();
        //    //}
        //    //catch (Exception Exc)
        //    //{
        //    //    Label1.ForeColor = Color.Red;
        //    //    Label1.Text = "Application Error." + Exc.Message;
        //    //}
        //}
        //}
        protected void Page_Init(object sender, EventArgs e) {
           
        }

        public class ExtraFeatures
        {



            public string Style { get; set; }
            public string Measurements { get; set; }
           public string Material { get; set; }


        }
    }
    
}
