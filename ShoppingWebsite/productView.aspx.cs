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
    public partial class productView : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.Listeners.Add(new TextWriterTraceListener(Console.Out));
            Debug.AutoFlush = true;

            if (!IsPostBack)
            {


            }
        }

        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
            try
            {
                if ((string)Session["username"] == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Server.Transfer("~/LoginPages/LoginUser.aspx");
                }
                else
                {
                    Debug.WriteLine("Adding to cart");
                    var size = DetailsView1.FindControl("DropDownList1") as DropDownList;
                    var quantity = DetailsView1.FindControl("DropDownList2") as DropDownList;
                    //Response.Write(size.SelectedValue + quantity.SelectedValue);

                    Connect();

                    string productId = Request.QueryString["id"];
                    if (productId == null)
                    {
                        productId = "10003";
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * from Cart where product_id =" + productId + " and customer_id = " + Int32.Parse(Session["Id"].ToString()) + " and size = '" + size.SelectedValue + "' ;", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable(); //temp storage
                    da.Fill(dt);  //dt is table data got after firing query
                    if (dt.Rows.Count >= 1)  //if there are more than 1 data available with same username
                    {
                        Response.Write("<script>alert('Product Already Exist in Cart');</script>");
                    }
                    else
                    {
                        Cart(size, quantity);
                    }
                    
                }



            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }
        }

        protected void BuyNow_Command(object sender, CommandEventArgs e)
        {
            try
            {
                if ((string)Session["username"] == "" || Session["username"] == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Session Expired Login Again')", true);
                    //Response.Write("<script>alert('');</script>");

                    Server.Transfer("~/LoginPages/LoginUser.aspx");
                }
                else
                {
                    Debug.WriteLine("Redirecting to Checkout");
                    var size = DetailsView1.FindControl("DropDownList1") as DropDownList;
                    var quantity = DetailsView1.FindControl("DropDownList2") as DropDownList;
                    //Response.Write(size.SelectedValue + quantity.SelectedValue);

                    string pid = Request.QueryString["id"];
                    string cid = Session["Id"].ToString();

                    int i;
                    int n = 1;
                    string[] prodId = new string[n];
                    string[] prodQ = new string[n];
                    string[] custId = new string[n];
                    string[] prodS = new string[n];

                    for (i = 0; i < n; i++)
                    {
                        prodId[i] = pid;
                        prodQ[i] = quantity.SelectedValue;
                        //custId[i] = cid;
                        prodS[i] = size.SelectedValue;
                    }

                    Context.Items.Add("prodId", prodId);
                    Context.Items.Add("prodQ", prodQ);
                    //Context.Items.Add("custId", custId);
                    Context.Items.Add("prodS", prodS);
                    Context.Items.Add("totalRow", n);

                    Server.Execute("Checkout.aspx");
                    //Server.Transfer("Checkout.aspx?a='"+ prodId +"'&b='" + prodId[0] + "'");
                }



            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }
        }




        // user defined function

        void Connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void Cart(DropDownList size1, DropDownList quantity1)
        {

            try
            {
                Connect();

                SqlCommand cmd = new SqlCommand("INSERT INTO Cart(product_id, quantity, customer_id, size) values(@product_id, @quantity, @customer_id, @size); ", con);

                string productId = Request.QueryString["id"];
                if (productId == null)
                {
                    productId = "10003";
                }

                Debug.WriteLine(productId + quantity1.SelectedValue + Session["Id"].ToString() + size1.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@product_id", productId);
                cmd.Parameters.AddWithValue("@quantity", quantity1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@customer_id", Session["Id"].ToString());
                cmd.Parameters.AddWithValue("@size", size1.SelectedItem.Value);
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Write("<script>alert('Product Added to Cart');</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Product Added to Cart')", true);
                Debug.WriteLine("Added to cart");

            }
            catch (Exception ex)
            {
                Debug.WriteLine("<script>alert(" + ex + ");</script>");
            }
        }

        protected void Rated_btnclicked(object sender, EventArgs e)
        {
            Connect();
            SqlCommand cmd = new SqlCommand("SELECT rating FROM [dbo].[Product] where [Id] = '"+ Request.QueryString["id"] + "';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            var rateFromDB = dt.Rows[0]["rating"].ToString();
            Int32 rateInserted;

            if (star5r.Checked)
            {
                rateInserted = 5;
            }
            else if (star4r.Checked)
            {
                rateInserted = 4;
            }
            else if (star3r.Checked)
            {
                rateInserted = 3;
            }
            else if (star2r.Checked)
            {
                rateInserted = 2;
            }
            else if (star1r.Checked)
            {
                rateInserted = 1;
            }
            else
            {
                Response.Write("Returned");
                return;
            }

            Int32 avgRate = 0;
            if (Int32.Parse(rateFromDB) == 0)
            {
                avgRate = ((Int32.Parse(rateFromDB) + rateInserted) / 1) % 5;
            }
            else
            {
                avgRate = ((Int32.Parse(rateFromDB) + rateInserted) / 2) % 5;
            }
            Response.Write(avgRate);
            SqlCommand cmd1 = new SqlCommand("UPDATE Product SET rating=@rating WHERE Id=@product_id; ", con);
            cmd1.Parameters.AddWithValue("@rating", avgRate);

            string productId = Request.QueryString["id"].ToString();
            if (productId == null)
            {
                productId = "10003";
            }

            cmd1.Parameters.AddWithValue("@product_id", productId);
            cmd1.ExecuteNonQuery();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thanks for rating the product.')", true);

            con.Close();

            Rated.Disabled = true;
        }
    }
}

