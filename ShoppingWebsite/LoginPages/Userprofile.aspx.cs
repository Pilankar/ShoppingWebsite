using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ShoppingWebsite.LoginPages
{
    public partial class Userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("../LoginPages/LoginUser.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            updateUserPersonalDetails();
        }


        // user defined function

        void connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
        void updateUserPersonalDetails()
        {
            
            try
            {
                connect();

                SqlCommand cmd = new SqlCommand("UPDATE Customer SET fname=@fname, lname=@lname, contact=@contact, email=@email, address=@address, state=@state, city=@city, pincode=@pincode WHERE Id='" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);

                cmd.Parameters.AddWithValue("@fname", firstName.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", lastName.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", contact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@state", state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", pincode.Text.Trim());

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex + ");</script>");
            }
        }


        void getUserPersonalDetails()
        {
            try
            {
                connect();

                SqlCommand cmd = new SqlCommand("SELECT * from Customer where Id='" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                firstName.Text = dt.Rows[0]["fname"].ToString();
                lastName.Text = dt.Rows[0]["lname"].ToString();
                contact.Text = dt.Rows[0]["contact"].ToString();
                email.Text = dt.Rows[0]["email"].ToString();
                address.Text = dt.Rows[0]["address"].ToString();
                state.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                city.Text = dt.Rows[0]["city"].ToString();
                pincode.Text = dt.Rows[0]["pincode"].ToString();
                username.Text = dt.Rows[0]["username"].ToString();
                password.Attributes["value"] = dt.Rows[0]["password"].ToString();
                
            }
            catch (Exception ex)
            {
                //
            }
        }

        protected void cnfpsw_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cnfpsw.Text))
            {
                connect();

                SqlCommand cmd = new SqlCommand("SELECT password from Customer where Id = '" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                cnfpsw.Attributes["value"] = cnfpsw.Text;
                if (dt.Rows[0]["password"].ToString() == cnfpsw.Text)
                {
                    lblmsg.Visible = true;
                    pswsucc.Visible = true;
                    check.Attributes.Add("class", "fas fa-check-circle text-success");
                    lblmsg.Text = "";
                    btnnext1.Enabled = true;
                }
                else
                {
                    lblmsg.Visible = true;
                    pswsucc.Visible = true;
                    check.Attributes.Add("class", "fas fa-times-circle text-danger");
                    lblmsg.Text = "Incorrect Password..!!";
                    username.Focus();
                }
            }
            else
            {
                lblmsg.Visible = false;
                pswsucc.Visible = false;
                btnnext1.Enabled = false;
            }
        }

        protected void btnnext1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(passwordconfirm.Text))
            {
                connect();

                SqlCommand cmd = new SqlCommand("update Customer set password=@password where Id = '" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);
                passwordconfirm.Attributes["value"] = passwordconfirm.Text;
                cmd.Parameters.AddWithValue("@password", passwordconfirm.Text);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    //Response.Write("<script>alert('Password Updated Successfully');</script>");
                    updCheck.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }
            }
        }
    }
}