using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; //for ConfigurationManager
using System.Data; //for ConnectionState
using System.Data.SqlClient; //for SqlConnection
using System.Diagnostics;

namespace ShoppingWebsite
{
    public partial class AddToCart : System.Web.UI.Page
    {
        private readonly string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        int sumFooterValue = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs ee)
        {
            if (ee.Row.RowType == DataControlRowType.DataRow)
            {
                //string quan = ((Label)ee.Row.FindControl("quantity")).Text;
                string cost = ((Label)ee.Row.FindControl("Label1")).Text;
                int totalvalue = Int32.Parse(cost);
                sumFooterValue += totalvalue;
            }

            if (ee.Row.RowType == DataControlRowType.Footer)
            {
                var lbl = (Label)ee.Row.FindControl("lbltotal");
                lbl.Text = "&#8377; " + sumFooterValue.ToString();
            }

            badge.Text = (GridView1.Rows.Count).ToString();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            connect();

            int i;
            int n = GridView1.Rows.Count;
            string[] prodId = new string[n];
            string[] prodQ = new string[n];
            string[] prodS = new string[n];

            cmd = new SqlCommand("SELECT Product.Id, Product.name, Product.price, Cart.quantity, Cart.size FROM Product INNER JOIN Cart ON Product.Id = Cart.product_id WHERE (Cart.customer_id = " + 101 + ")", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            da.Fill(dt1);


            for (i = 0; i < n; i++)
            {
                prodId[i] = dt1.Rows[i]["Id"].ToString();
                prodQ[i] = dt1.Rows[i]["quantity"].ToString();
                prodS[i] = dt1.Rows[i]["size"].ToString();

                Debug.WriteLine(prodId[i] + prodQ[i] + prodS[i]);
            }

            //Response.Write("Data Added");
            Context.Items.Add("prodId", prodId);
            Context.Items.Add("prodQ", prodQ);
            Context.Items.Add("prodS", prodS);
            Context.Items.Add("totalRow", n);
            //Response.Write(prodId);

            Server.Transfer("Checkout.aspx");

        }
        protected void connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
    }
}