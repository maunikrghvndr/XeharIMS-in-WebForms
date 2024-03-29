﻿using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace XEHAR2017.AdminPortal.AdminPortalViews
{
    public partial class AmbassadorView : System.Web.UI.Page
    {
        static string aid = string.Empty;
        string modelNumber = string.Empty;
        string colorCode = string.Empty;
        string size = string.Empty;

        static string SKUString = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               this.BindImage();
            }

        }
        private void BindImage()
        {

            //MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            //{
            //    using (MySqlCommand cmd = new MySqlCommand("SELECT Content FROM files where AID=  "+ GetPid()))
            //    {
            //        using (MySqlDataAdapter sda = new MySqlDataAdapter())
            //        {
            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                sda.Fill(dt);
            //                if (dt.Rows[0]["Content"].ToString().Length > 1) {
            //                    Image1.ImageUrl = dt.Rows[0]["Content"].ToString();
            //                }

            //            }
            //        }
            //    }
            //}

            string constr = WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SELECT  Content FROM Files where FileId=" + GetAid() + "";
                    cmd.Connection = con;

                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        byte[] bytes = (byte[])dr["Content"];
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image1.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    dr.Close();

                }
                con.Close();
            }



        }

        public string GetAid()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["aid"]))
            {
                aid = Request.QueryString["aid"].ToString();

               

            }
            return aid;
        }
        [WebMethod]
        public static List<string> TopAmbassadorsRevenue(string aids)
        {
            // MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            // k.Open();
            // string query = "SELECT v.VID, v.Name , sum(p.TotalSold) as sm from vendors as v, products as p where v.VID= p.VID group by v.Name order by sm desc limit 5";
            // string query = "select s.SCID as scid, s.Name as name, sum(p.SoldOnSalesChannel) as su from saleschannels as s,  productsaleschannels as p where p.SCID = s.SCID group by name";
            string query = "AmbassadorRevenue";
            var JSONArrrayList = new List<String>();
            string JSONString = string.Empty;
            DataTable DT_Results;
            for (int i = 0; i<=4; i++) {
                if (i == 1)
                {
                    query = "AmbassadorExpenses";
                }
                if (i == 2)
                {
                    query = "AmbassadorsCommision";
                }
                if (i == 3)
                {
                    query = "AmbassadorExpenseProducts";
                }

                if (i == 4)
                {
                    query = "ProfitFromAmbassador";
                }
                DT_Results = RunSQL(query, aids);
               
                JSONString = JsonConvert.SerializeObject(DT_Results);
                JSONArrrayList.Add(JSONString);
              
            }
            // test for other query... read on monday

            // int [] pid= DT_Results.AsEnumerable().Select(r => r.Field<int>("PID")).ToArray();
            //var pid = DT_Results.AsEnumerable().Select(r => r.Field<int>("PID")).ToList();
            //pid.ForEach(Debug.Write());
            // string jpid=TopSalesChannels(pid);
            // var re = "hello";

            return JSONArrrayList;

        }
        [WebMethod]
        private static DataTable RunSQL(string query, string aids)
        {
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);

            con.Open();
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(
        new MySqlParameter("@AmbsID", aids));
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);
                    con.Close();
                    return dt;

                }

            }


        }
        [WebMethod]
        public static List<string> AmbassadorsProduct1( string aids)
        {
            //Debug.WriteLine("this is the pid"+pid);
            MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            k.Open();
            //  MySqlCommand cmd;
            //  List<string> termsList = new List<string>();
            DataTable dt = new DataTable();
            // var hashList = new List<Hashtable>();
            var libyList = new List<KeyValuePair<string, Int32>>();
            var JSONArrrayList = new List<String>();
            
                //   string query = ("SELECT p.ProductName, s.SoldOnSalesChannel from products as p, productsaleschannels as s where s.PID=p.PID and s.SCID =" + s);
                string query = "AmbassadorProducts1";

                MySqlCommand cmd = new MySqlCommand(query, k);
                cmd.CommandType = CommandType.StoredProcedure;
               // cmd.Parameters.Add(new MySqlParameter("@odate", date));
                cmd.Parameters.Add(new MySqlParameter("@AmbsID", aids));
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                MySqlDataReader r = cmd.ExecuteReader();

                while (r.Read())
                {
                    var kv = new KeyValuePair<string, Int32>(r.GetString(0), r.GetInt32(1));
                    libyList.Add(kv);

                }
                r.Close();
                var JSONString23 = JsonConvert.SerializeObject(libyList);
                JSONArrrayList.Add(JSONString23);
                libyList.Clear();
                //jack = JSONArrrayList.ToArray<string>
                //da.Fill(dt);
                //(new MySqlCommand(query, k)).ToString()
                // termsList.Add();
            

            //MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            string JSONString2 = string.Empty;

            JSONString2 = JsonConvert.SerializeObject(dt);
            // string jpid = Convert.ToString(cmd.ExecuteScalar());
            return JSONArrrayList;
        }
    }
}