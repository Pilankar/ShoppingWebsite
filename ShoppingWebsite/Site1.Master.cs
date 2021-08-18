using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; //for ConfigurationManager
using System.Data; //for ConnectionState
using System.Data.SqlClient; //for SqlConnection


namespace ShoppingWebsite
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LoginDropdown.Visible = true; // login dropdown
                    SignUpDropdown.Visible = true; // sign up dropdown

                    Logout.Visible = false; // logout link button
                    UserProfile.Visible = false; // hello user link button

                    //AdminLogin.Visible = true; // admin login link button
                    //AdminPortal.Visible = false; // admin portal link button


                }
                else if (Session["role"].Equals("user"))
                {
                    LoginDropdown.Visible = false; // login dropdown
                    SignUpDropdown.Visible = false; // sign up dropdown

                    Logout.Visible = true; // logout link button
                    UserProfile.Visible = true; // hello user link button
                    UserProfile.Text = "Hello " + Session["username"].ToString();

                    //AdminLogin.Visible = true; // admin login link button
                    //AdminPortal.Visible = false; // admin portal link button

                }
                else if (Session["role"].Equals("seller"))
                {
                    LoginDropdown.Visible = false; // login dropdown
                    SignUpDropdown.Visible = false; // sign up dropdown

                    Logout.Visible = true; // logout link button
                    UserProfile.Visible = false; // hello user link button
                    SellerProfile.Visible = true; // hello seller link button

                    SellerProfile.Text = "Hello " + Session["username"].ToString();

                    home.Visible = false;
                    category.Visible = false;
                    A1.Visible = false;
                    A2.Visible = false;
                    A3.Visible = false;
                    A4.Visible = false;

                    //AdminLogin.Visible = true; // admin login link button
                    //AdminPortal.Visible = false; // admin portal link button

                }
                else if (Session["role"].Equals("admin"))
                {
                    LoginDropdown.Visible = false; // login dropdown
                    SignUpDropdown.Visible = false; // sign up dropdown

                    Logout.Visible = true; // logout link button
                    UserProfile.Visible = true; // hello user link button
                    UserProfile.Text = "Hello Admin";

                    AdminPortal.Visible = true; // admin portal link button

                }
            }
            catch (Exception ex)
            {
                //
            }

            connect();
            if (!Page.IsPostBack)
            {
                BindCategory1();
                BindCategory2();
                BindCategory3();
                BindCategory4();
            }
        }

        

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";

            LoginDropdown.Visible = true; // login dropdown
            SignUpDropdown.Visible = true; // sign up dropdown

            Logout.Visible = false; // logout link button
            UserProfile.Visible = false; // hello user link button

            AdminPortal.Visible = false; // admin portal link button

            Response.Redirect("~/HomePage.aspx");
        }

        protected void UserProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPages/Userprofile.aspx");
        }
        
        protected void SellerProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPages/Userprofile.aspx");
        }

        protected void connect()
        {
            con = new SqlConnection(strcon); //strcon is Connection String
            con.Open();
        }
        protected void BindCategory1()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] = 'Women';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepWomen.DataSource = dt;
            RepWomen.DataBind();
        }
        protected void BindCategory2()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] like 'Men';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepMen.DataSource = dt;
            RepMen.DataBind();
        }
        protected void BindCategory3()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] like 'Kids';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepKids.DataSource = dt;
            RepKids.DataBind();
        }
        protected void BindCategory4()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] like 'Accessories';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepAcc.DataSource = dt;
            RepAcc.DataBind();
        }
    }
}