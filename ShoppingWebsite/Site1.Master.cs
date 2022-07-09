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
    public partial class Site1 : System.Web.UI.MasterPage
    {

        private readonly string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                try
                {
                    if (Session["role"] == null)
                    {
                        LoginDropdown.Visible = true; // login dropdown
                        SignUpDropdown.Visible = true; // sign up dropdown

                        Logout.Visible = false; // logout link button
                        UserProfile.Visible = false; // hello user link button

                        SellerProfile.Visible = false;
                        Home.Visible = true;
                        Category.Visible = true;
                        A1.Visible = true;
                        A2.Visible = true;
                        A3.Visible = true;
                        A4.Visible = true;

                        //AdminLogin.Visible = true; // admin login link button
                        //AdminPortal.Visible = false; // admin portal link button

                    }

                    if (Session["role"].ToString() == "User")
                    {
                        LoginDropdown.Visible = false; // login dropdown
                        SignUpDropdown.Visible = false; // sign up dropdown

                        Logout.Visible = true; // logout link button
                        UserProfile.Visible = true; // hello user link button

                        SellerProfile.Visible = false;
                        Home.Visible = true;
                        Category.Visible = true;
                        A1.Visible = true;
                        A2.Visible = true;
                        A3.Visible = true;
                        A4.Visible = true;
                        UserProfile.Text = "Hello " + Session["username"].ToString();

                    }

                    else if (Session["role"].ToString() == "seller")
                    {

                        LinkButton3.Visible = true; // logout link button
                        SellerProfile.Visible = true; // hello seller link button

                        SellerProfile.Text = "Hello " + Session["username"].ToString();

                    }

                    else if (Session["role"].ToString() == "admin")
                    {
                        SellerProfile.Visible = false;
                        adminName.Text = "Hello Admin";
                    }

                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex);
                }

                Connect();
            
                BindCategory1();
                BindCategory2();
                BindCategory3();
                BindCategory4();

            }
        }

        

        protected void SearchBtnClicked(object sender, EventArgs e)
        {
            string sp = searchProduct.Value.Trim();
            Server.Transfer(Response.ApplyAppPathModifier("SearchProducts.aspx?s=" + Server.UrlEncode(sp)));
            Debug.WriteLine("Searched");
        }
            
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["Id"] = null;
            Session["username"] = null;
            Session["firstname"] = null;
            

            LoginDropdown.Visible = true; // login dropdown
            SignUpDropdown.Visible = true; // sign up dropdown

            Logout.Visible = false; // logout link button
            UserProfile.Visible = false; // hello user link button

            //Response.Redirect("~/HomePage.aspx");
            Session["role"] = null;
            Response.Redirect(Response.ApplyAppPathModifier("~/HomePage.aspx"));

        }

        protected void UserProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect(Response.ApplyAppPathModifier("LoginPages/Userprofile.aspx"));
        }
        
        protected void SellerProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect(Response.ApplyAppPathModifier("SellerProfile.aspx"));
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

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect(Response.ApplyAppPathModifier("HomePage.aspx"));
        }

        protected void Category_Click(object sender, EventArgs e)
        {
            Response.Redirect(Response.ApplyAppPathModifier("Categories.aspx"));
        }

        protected void AdminPortal_Click(object sender, EventArgs e)
        {
            Response.Redirect(Response.ApplyAppPathModifier("Admin/SellerManagement.aspx"));
        }

        protected void Connect()
        {
            con = new SqlConnection(strcon); //strcon is Connection String
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
    }
}