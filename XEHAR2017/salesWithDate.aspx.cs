﻿using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEHAR2017
{
    public partial class salesWithDate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string SalesChannels(string date)
        {
            // MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            // k.Open();
            // string query = "SELECT v.VID, v.Name , sum(p.TotalSold) as sm from vendors as v, products as p where v.VID= p.VID group by v.Name order by sm desc limit 5";
            // string query = "select s.SCID as scid, s.Name as name, sum(p.SoldOnSalesChannel) as su from saleschannels as s,  productsaleschannels as p where p.SCID = s.SCID group by name";
            string query = "TopSalesChannels";

            DataTable DT_Results;

            DT_Results = RunSQL(query,date);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(DT_Results);

            // test for other query... read on monday

            // int [] pid= DT_Results.AsEnumerable().Select(r => r.Field<int>("PID")).ToArray();
            //var pid = DT_Results.AsEnumerable().Select(r => r.Field<int>("PID")).ToList();
            //pid.ForEach(Debug.Write());
            // string jpid=TopSalesChannels(pid);
            // var re = "hello";

            return JSONString;

        }
        [WebMethod]
        private static DataTable RunSQL(string query, string date)
        {
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);

            con.Open();
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(
        new MySqlParameter("@odate", date));
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
        public static List<string> TopSalesChannelProduct(string date,string[] scid)
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
            foreach (string s in scid)
            {
                //   string query = ("SELECT p.ProductName, s.SoldOnSalesChannel from products as p, productsaleschannels as s where s.PID=p.PID and s.SCID =" + s);
                string query = "TopSalesChannelsProducts";

                MySqlCommand cmd = new MySqlCommand(query, k);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(  new MySqlParameter("@odate", date));
                cmd.Parameters.Add(new MySqlParameter("@salesid", s));
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
            }

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