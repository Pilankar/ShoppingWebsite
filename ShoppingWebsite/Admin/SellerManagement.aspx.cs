using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace ShoppingWebsite.Admin
{
    public partial class SellerManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Go button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getSellerByID();
        }

        // Active button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateSellerStatusByID("active");
        }

        // pending button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateSellerStatusByID("pending");
        }

        // deactive button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateSellerStatusByID("deactive");
        }

        // delete button
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteSellerByID();
        }


        // user defined function

        bool checkIfSellerExists()
        {
            try
            {
                Connect();

                SqlCommand cmd = new SqlCommand("SELECT * from seller_info where Id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    Debug.WriteLine("Seller Exists");
                    return true;
                }
                else
                {
                    Debug.WriteLine("Seller Not Exists");
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                Debug.WriteLine(ex.Message);
                return false;
            }
        }

        void deleteSellerByID()
        {
            if (checkIfSellerExists())
            {
                try
                {
                    Connect();

                    SqlCommand cmd = new SqlCommand("DELETE from seller_info WHERE Id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Seller Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void getSellerByID()
        {
            try
            {
                Connect();
                SqlCommand cmd = new SqlCommand("select * from seller_info where Id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        username.Text = dr.GetValue(9).ToString();
                        fname.Text = dr.GetValue(1).ToString();
                        lname.Text = dr.GetValue(2).ToString();
                        accStatus.Text = dr.GetValue(12).ToString();
                        adharno.Text = dr.GetValue(4).ToString();
                        TextBox3.Text = dr.GetValue(3).ToString();
                        TextBox4.Text = dr.GetValue(5).ToString();
                        TextBox9.Text = dr.GetValue(7).ToString();
                        TextBox10.Text = dr.GetValue(8).ToString();
                        TextBox6.Text = dr.GetValue(6).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateSellerStatusByID(string status)
        {
            if (checkIfSellerExists())
            {
                try
                {
                    Connect();
                    SqlCommand cmd = new SqlCommand("UPDATE seller_info SET status='" + status + "' WHERE Id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Seller Status Updated');</script>");
                    Debug.WriteLine("Seller Status Updated");
                    getSellerByID();
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Seller ID');</script>");
                Debug.WriteLine("Invalid Seller");
            }

        }

        void clearForm()
        {
            username.Text = "";
            fname.Text = "";
            lname.Text =  "";
            accStatus.Text = "";
            adharno.Text = "";
            TextBox3.Text = "";
            TextBox4.Text =  "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox6.Text = "";
        }

        void Connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
    }
}