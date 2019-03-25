using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quicky
{
    public partial class index : System.Web.UI.Page
    {
        MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //CLT.InnerText = Customers();
        }
        public string Open()
        {

            string m = "";

            try
            {
                k.Open();
                return "The connection was successful";
            }
            catch (Exception s)
            {
                m = "Failure" + s.Message;
                return m;
            }

        }
        [WebMethod]
        public static string Customers()
        {
           // MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
           // k.Open();
            string query = "select PID, ProductName,  max(TotalSold) as s from products group by ProductName Order by s desc limit 5";

            DataTable DT_Results;

            DT_Results = RunSQL(query);
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
        private static DataTable RunSQL(string query)
        {
            MySqlConnection con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);

            con.Open();
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
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
        public static List<string> TopSalesChannels(string[] pid)
        {
            //Debug.WriteLine("this is the pid"+pid);
            MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
             k.Open();
          //  MySqlCommand cmd;
          //  List<string> termsList = new List<string>();
            DataTable dt = new DataTable();
            var hashList = new List<Hashtable>();
            var libyList = new List<KeyValuePair<string, Int32>>();
            var JSONArrrayList = new List<String>();
            foreach (string s in pid)
            {
                string query = ("select PID ,s.Name , p.SoldOnSalesChannel from saleschannels as s, productsaleschannels as p where PID =" + s + "  and s.SCID = p.SCID");
                MySqlCommand cmd = new MySqlCommand(query, k);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                MySqlDataReader r = cmd.ExecuteReader();
                
                while (r.Read())
                {
                    var kv = new KeyValuePair<string, Int32>(r.GetString(1), r.GetInt32(2));
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