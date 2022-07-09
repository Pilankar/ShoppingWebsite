using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; //for ConfigurationManager
using System.Diagnostics;

namespace ShoppingWebsite.Seller
{
    public partial class SellerHomePage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                todayProfit();

                todayRevenue();

                todaySoldUnits();
                
                chartsBind();
                //Response.Write(xValues);
                //Response.Write(yValues);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void SellerProfile_Click(object sender, EventArgs e)
        {
            Server.Transfer(Response.ApplyAppPathModifier("SellerProfile.aspx"));
        }

        void Connect()
        {
            con = new SqlConnection(strcon); //strcon is Connection String
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void chartsBind()
        {
            //Chart 1 - Revenue Trend This Month
            chart1();

            //Chart 2 - Sales Per Category This Month
            chart2();

            //CHart 3 - Less than 200 Stocks per Product
            chart3();

            //Chart 4 - Profit Trend This Month
            chart4();
        }

        void chart1()
        {
            //Revenue Trend This Month
            Connect(); 

            var xValues = new List<string>();
            var yValues = new List<string>();

            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT Convert(varchar(10), [Order].orderedDate, 23) AS OrderedDate, SUM(Product.price*OrderDetail.quantity) AS TotalPrice " +
                "FROM Product INNER JOIN OrderDetail " +
                "ON Product.Id = OrderDetail.product_id INNER JOIN[Order] ON OrderDetail.order_id = [Order].Id " +
                "WHERE(MONTH([Order].orderedDate) = MONTH(GETDATE())) AND(Product.seller_id = 101) " +
                "GROUP BY[Order].orderedDate; ", con);

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] {
                    new DataColumn("OrderedDate", typeof(string)),
                    new DataColumn("TotalPrice", typeof(string))
                });

            da.Fill(dt);
            string[] x = new string[dt.Rows.Count];
            string[] y = new string[dt.Rows.Count];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i]["OrderedDate"].ToString();
                y[i] = dt.Rows[i]["TotalPrice"].ToString();
                //Response.Write(i);
                //Response.Write(x[i]);
                //Response.Write(y[i]);
            }
            xValues = x.OfType<string>().ToList();
            yValues = y.OfType<string>().ToList();
            HiddenField1.Value = Newtonsoft.Json.JsonConvert.SerializeObject(xValues);
            HiddenField2.Value = Newtonsoft.Json.JsonConvert.SerializeObject(yValues);
            con.Close();
        }

        void chart2()
        {
            //Sales Per Category This Month
            Connect();

            var xValues = new List<string>();
            var yValues = new List<string>();


            SqlDataAdapter da = new SqlDataAdapter("SELECT CONCAT(Product.category_type ,' ', Product.category_subtype) AS Category, SUM(Product.price*OrderDetail.quantity) AS TotalPrice " +
                "FROM Product INNER JOIN OrderDetail " +
                "ON Product.Id = OrderDetail.product_id INNER JOIN[Order] ON OrderDetail.order_id = [Order].Id " +
                "WHERE(MONTH([Order].orderedDate) = MONTH(GETDATE())) AND(Product.seller_id = 101) " +
                "GROUP BY CONCAT(Product.category_type, ' ', Product.category_subtype); ", con);
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] {
                    new DataColumn("Category", typeof(string)),
                    new DataColumn("TotalPrice", typeof(string))
                });

            da.Fill(dt);
            string[] x = new string[dt.Rows.Count];
            string[] y = new string[dt.Rows.Count];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i]["Category"].ToString();
                y[i] = dt.Rows[i]["TotalPrice"].ToString();
                //Response.Write(i);
                //Response.Write(x[i]);
            }
            xValues = x.OfType<string>().ToList();
            yValues = y.OfType<string>().ToList();
            HiddenField3.Value = Newtonsoft.Json.JsonConvert.SerializeObject(xValues);
            HiddenField4.Value = Newtonsoft.Json.JsonConvert.SerializeObject(yValues);
            con.Close();
        }

        void chart3()
        {
            //Less than 200 Stocks per Product
            Connect();

            var xValues = new List<string>();
            var yValues = new List<string>();


            SqlDataAdapter da = new SqlDataAdapter("SELECT Product.Id, StockDetails.size, StockDetails.stock_no " +
                                                    "FROM Product INNER JOIN MappingTable " +
                                                    "ON Product.Id = MappingTable.product_id " +
                                                    "INNER JOIN StockDetails " +
                                                    "ON MappingTable.stock_id = StockDetails.Id " +
                                                    "WHERE Product.seller_id = 101 AND StockDetails.stock_no <= 200; ", con);
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] {
                    new DataColumn("Id", typeof(string)),
                    new DataColumn("size", typeof(string)),
                    new DataColumn("stock_no", typeof(string))
                });

            da.Fill(dt);
            string[] x = new string[dt.Rows.Count];
            string[] y = new string[dt.Rows.Count];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i]["Id"].ToString();
                y[i] = dt.Rows[i]["stock_no"].ToString();
                //Response.Write(i);
                //Response.Write(x[i]);
            }
            xValues = x.OfType<string>().ToList();
            yValues = y.OfType<string>().ToList();
            HiddenField5.Value = Newtonsoft.Json.JsonConvert.SerializeObject(xValues);
            HiddenField6.Value = Newtonsoft.Json.JsonConvert.SerializeObject(yValues);
            con.Close();
        }

        void chart4()
        {
            //Profit Trend This Month
            Connect();

            var xValues = new List<string>();
            var yValues = new List<string>();


            SqlDataAdapter da = new SqlDataAdapter("SELECT Convert(varchar(10), [Order].orderedDate, 23) AS OrderedDate, SUM((Product.price*OrderDetail.quantity))+(-1000) AS Profit " +
                "FROM Product INNER JOIN OrderDetail " +
                "ON Product.Id = OrderDetail.product_id INNER JOIN[Order] ON OrderDetail.order_id = [Order].Id " +
                "WHERE(MONTH([Order].orderedDate) = MONTH(GETDATE())) AND(Product.seller_id = 101) " +
                "GROUP BY[Order].orderedDate; ", con);
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] {
                    new DataColumn("OrderedDate", typeof(string)),
                    new DataColumn("Profit", typeof(string))
                });

            da.Fill(dt);
            string[] x = new string[dt.Rows.Count];
            string[] y = new string[dt.Rows.Count];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i]["OrderedDate"].ToString();
                y[i] = dt.Rows[i]["Profit"].ToString();
                //Response.Write(i);
                //Response.Write(x[i]);
            }
            xValues = x.OfType<string>().ToList();
            yValues = y.OfType<string>().ToList();
            HiddenField7.Value = Newtonsoft.Json.JsonConvert.SerializeObject(xValues);
            HiddenField8.Value = Newtonsoft.Json.JsonConvert.SerializeObject(yValues);
            con.Close();
        }


        void todayProfit()
        {
            Connect();

            SqlCommand cmd = new SqlCommand("SELECT SUM(Product.price*OrderDetail.quantity)+(-1000) AS Profit " +
                "FROM Product INNER JOIN OrderDetail " +
                "ON Product.Id = OrderDetail.product_id INNER JOIN[Order] ON OrderDetail.order_id = [Order].Id " +
                "WHERE(convert(date,[Order].orderedDate) = convert(date, getdate())) AND(Product.seller_id = 101); ", con);
            if (cmd.ExecuteScalar().ToString() == "")
            {
                profit.InnerText = "₹ " + "0";
            }
            else
            {
                profit.InnerText = "₹ " + cmd.ExecuteScalar().ToString();
            }
        }

        void todayRevenue()
        {
            Connect();

            SqlCommand cmd = new SqlCommand("SELECT SUM(Product.price*OrderDetail.quantity) AS Revenue " +
                "FROM Product INNER JOIN OrderDetail " +
                "ON Product.Id = OrderDetail.product_id INNER JOIN[Order] ON OrderDetail.order_id = [Order].Id " +
                "WHERE(convert(date,[Order].orderedDate) = convert(date, getdate())) AND(Product.seller_id = 101); ", con);
            if (cmd.ExecuteScalar().ToString() == "")
            {
                revenue.InnerText = "₹ " + "0";
            }
            else
            {
                revenue.InnerText = "₹ " + cmd.ExecuteScalar().ToString();
            }
        }

        void todaySoldUnits()
        {
            Connect();

            SqlCommand cmd = new SqlCommand("SELECT SUM(OrderDetail.quantity) AS Units " +
                "FROM Product INNER JOIN OrderDetail " +
                "ON Product.Id = OrderDetail.product_id INNER JOIN[Order] ON OrderDetail.order_id = [Order].Id " +
                "WHERE(convert(date,[Order].orderedDate) = convert(date, getdate())) AND(Product.seller_id = 101); ", con);
            if (cmd.ExecuteScalar().ToString() == "")
            {
                unitsSold.InnerText = "0";
            }
            else
            {
                unitsSold.InnerText = cmd.ExecuteScalar().ToString();
            }
        }
    }
}