using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; //for ConfigurationManager
using System.Data.SqlClient; //for SqlConnection
using System.Diagnostics;


namespace ShoppingWebsite
{
    public partial class Checkout : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        DateTime thisDay;

        static int sumFooterValue;
        static string[] prodId, prodQ, prodS;
        static int totalRow=0;
        string[] prodName;
        string[] prodPrice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    totalRow = Int32.Parse(Context.Items["totalRow"].ToString());

                    prodId = new string[totalRow];
                    prodQ = new string[totalRow];
                    prodS = new string[totalRow];
                    prodName = new string[totalRow];
                    prodPrice = new string[totalRow];

                    prodId = ((IEnumerable)Context.Items["prodId"]).Cast<object>().Select(x => x.ToString()).ToArray();
                    prodQ = ((IEnumerable)Context.Items["prodQ"]).Cast<object>().Select(x => x.ToString()).ToArray();
                    //custId = ((IEnumerable)Context.Items["custId"]).Cast<object>().Select(x => x.ToString()).ToArray();
                    prodS = ((IEnumerable)Context.Items["prodS"]).Cast<object>().Select(x => x.ToString()).ToArray();

                    Debug.WriteLine(prodId + "  " + prodS + "  " + prodQ);

                    GetUserPersonalDetails();

                    BindGridview();

                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        Debug.WriteLine(prodId[i] + "  " + prodS[i] + "  " + prodQ[i]);
                    }
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                }

                
            }
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

        protected void sameaddress_CheckedChanged(object sender, EventArgs e)
        {
            if(sameaddress.Checked == true)
            {
                Panel1.Visible = false;
                s_address.Text = address.Text;
                s_city.Text = city.Text;
                s_state.SelectedValue = state.SelectedValue;
                s_pincode.Text = pincode.Text;
            }
            else
            {
                Panel1.Visible = true;
                s_address.Text = "";
                s_city.Text = "";
                s_state.SelectedValue = "select";
                s_pincode.Text = "";
            }
        }

        protected void RadioButtonList1_TextChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "COD")
                Panel2.Visible = false;
            else
                Panel2.Visible = true;
        }

        protected void Pay_Click(object sender, EventArgs e)
        {
            try
            {
                
                AddToOrderTable();

                AddToOrderDetailTable();

                // delete data from cart
                if (totalRow > 1)
                {
                    //delete data from cart
                    SqlCommand cmd5 = new SqlCommand("DELETE FROM Cart WHERE customer_id = '" + Session["Id"].ToString() + "'; ", con);
                    cmd5.ExecuteNonQuery();
                }

                Debug.WriteLine("PaymentComplete");

                con.Close();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }

        }

        private void BindGridview()
        {
            try
            {
                connect();
                for (int i = 0; i < totalRow; i++)
                {
                    cmd = new SqlCommand("Select name, price from Product where Id like '" + prodId[i] + "' ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt1 = new DataTable();
                    da.Fill(dt1);
                    prodName[i] = dt1.Rows[0]["name"].ToString();
                    prodPrice[i] = dt1.Rows[0]["price"].ToString();
                }

                con.Close();
                connect();

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[4] { 
                    new DataColumn("name", typeof(string)),
                    new DataColumn("quantity",typeof(int)),
                    new DataColumn("size",typeof(string)),
                    new DataColumn("price", typeof(int)) });

                for (int i = 0; i < totalRow; i++)
                {
                   dt.Rows.Add(prodName[i], prodQ[i], prodS[i], prodPrice[i]);
                    Debug.WriteLine(prodName[i] + prodQ[i] + prodS[i] + prodPrice[i]);
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }


        protected void connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void GetUserPersonalDetails()
        {
            try
            {
                Debug.WriteLine("Getting Info");

                con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                Debug.WriteLine("Connection Open");

                SqlCommand cmd = new SqlCommand("SELECT * from Customer where Id='" + (string)Session["Id"] + "' and username = '" + (string)Session["username"] + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Debug.WriteLine("Got Info");

                //Debug.WriteLine(dt.Rows[0]["fname"].ToString() + dt.Rows[0]["lname"].ToString() + dt.Rows[0]["contact"].ToString() + dt.Rows[0]["email"].ToString() + dt.Rows[0]["address"].ToString() + dt.Rows[0]["state"].ToString().Trim() + dt.Rows[0]["city"].ToString() + dt.Rows[0]["pincode"].ToString());
                //Debug.WriteLine(dt.Rows[0]["username"].ToString());

                firstName.Text = dt.Rows[0]["fname"].ToString();
                lastName.Text = dt.Rows[0]["lname"].ToString();
                contact.Text = dt.Rows[0]["contact"].ToString();
                email.Text = dt.Rows[0]["email"].ToString();
                address.Text = dt.Rows[0]["address"].ToString();
                state.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                city.Text = dt.Rows[0]["city"].ToString();
                pincode.Text = dt.Rows[0]["pincode"].ToString();

                Debug.WriteLine("Added Info");
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Something went wrong");
                Debug.WriteLine(ex);
            }
        }

        void AddToOrderTable()
        {
            // Get the current date.
            thisDay = DateTime.Today;

            Debug.WriteLine(thisDay);
            Debug.WriteLine(sumFooterValue + thisDay.ToString("D") + thisDay.AddDays(2).ToString("D"));
            Debug.WriteLine(totalRow + RadioButtonList1.SelectedValue + Session["Id"].ToString());

            //Adding order to Orders table
            connect();
            SqlCommand cmd1 = new SqlCommand("INSERT INTO [dbo].[Order] (totalPrice,orderedDate,shippingDate,status,totalProducts,mode,custId) VALUES (@totalPrice,@orderedDate,@shippingDate,@status,@totalProducts,@mode,@custId)", con);
            cmd1.Parameters.AddWithValue("@totalPrice", sumFooterValue);
            cmd1.Parameters.AddWithValue("@orderedDate", thisDay.ToString("D"));
            cmd1.Parameters.AddWithValue("@shippingDate", thisDay.AddDays(2).ToString("D"));

            cmd1.Parameters.AddWithValue("@totalProducts", totalRow);
            cmd1.Parameters.AddWithValue("@mode", RadioButtonList1.SelectedValue);
            cmd1.Parameters.AddWithValue("@custId", Session["Id"].ToString());

            if (RadioButtonList1.SelectedValue == "Credit Card")
            {
                cmd1.Parameters.AddWithValue("@status", "Paid");
                Response.Write("<script>alert('Paid');</script>");
            }
            else if (RadioButtonList1.SelectedValue == "Debit Card")
            {
                Response.Write("<script>alert('paid');</script>");
                cmd1.Parameters.AddWithValue("@status", "Paid");
            }
            else
            {
                Response.Write("<script>alert('UnPaid');</script>");
                cmd1.Parameters.AddWithValue("@status", "Unpaid");
            }
            Debug.WriteLine(" Produts added in Order Table ");
            cmd1.ExecuteNonQuery();
        }

        void AddToOrderDetailTable()
        {
            //getting last order id to map with OrderDetail Table
            connect();
            int orderID = 0;
            using (SqlCommand cmd2 = new SqlCommand("SELECT Max(Id) AS 'Identity' from [dbo].[Order];", con))
            {
                orderID = (int)cmd2.ExecuteScalar();
                Debug.WriteLine(orderID);
            }


            //adding products in OrderDetail Table
            connect();

            for (int i = 0; i < totalRow; i++)
            {
                SqlCommand cmd3 = new SqlCommand("INSERT INTO OrderDetail(product_id,size,quantity,order_id) values(@product_id,@size,@quantity,@order_id)", con);
                cmd3.Parameters.AddWithValue("@product_id", prodId[i]);
                cmd3.Parameters.AddWithValue("@size", prodS[i]);
                cmd3.Parameters.AddWithValue("@quantity", prodQ[i]);
                cmd3.Parameters.AddWithValue("@order_id", orderID);
                cmd3.ExecuteNonQuery();

                Debug.WriteLine(" Produts added in Order Detail Table ");


                // minus the quantity number from stocks of each product
                SqlCommand cmd4 = new SqlCommand("UPDATE StockDetails SET stock_no = stock_no - " + prodQ[i] + " FROM StockDetails INNER JOIN MappingTable ON StockDetails.Id = MappingTable.stock_id WHERE product_id = " + prodId[i] + " AND stock_no >= 0 AND size = '" + prodS[i] + "'; ", con);
                Debug.WriteLine(" Stocks Updated ");
                cmd4.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order generated')", true);
            }
        }

    }
}