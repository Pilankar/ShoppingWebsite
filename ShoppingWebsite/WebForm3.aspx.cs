using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; //for ConfigurationManager
using System.Diagnostics;

namespace ShoppingWebsite
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            //var xValues = new List<Int32>() { 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150 };
            //var yValues = new List<Int32>() { 7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15 };
            

            try
            {
                var xValues = new List<string>();
                var yValues = new List<string>();

                con = new SqlConnection(strcon); //strcon is Connection String
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter("SELECT Product.Id, Product.[name], StockDetails.size, StockDetails.stock_no " +
                                                        "FROM Product INNER JOIN MappingTable " +
                                                        "ON Product.Id = MappingTable.product_id " +
                                                        "INNER JOIN StockDetails " +
                                                        "ON MappingTable.stock_id = StockDetails.Id " +
                                                        "WHERE Product.seller_id = 101; ", con);
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[4] {
                    new DataColumn("Id", typeof(string)),
                    new DataColumn("name", typeof(string)),
                    new DataColumn("size", typeof(string)),
                    new DataColumn("stock_no", typeof(string)) 
                });

                da.Fill(dt);
                string[] x = new string[dt.Rows.Count];
                string[] y = new string[dt.Rows.Count];
                
                for(int i=0; i< dt.Rows.Count; i++)
                {
                    x[i] = dt.Rows[i]["name"].ToString();
                    y[i] = dt.Rows[i]["stock_no"].ToString();
                    //Response.Write(i);
                    //Response.Write(x[i]);
                }
                xValues = x.OfType<string>().ToList();
                yValues = y.OfType<string>().ToList();
                HiddenField1.Value = Newtonsoft.Json.JsonConvert.SerializeObject(xValues);
                HiddenField2.Value = Newtonsoft.Json.JsonConvert.SerializeObject(yValues);
                //Response.Write(xValues);
                //Response.Write(yValues);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }

            
        }
    }
}