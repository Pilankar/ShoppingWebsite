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

namespace ShoppingWebsite.Seller
{
    public partial class addStock : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Panel1.Visible = true;
                Label2.Visible = false;
                Label3.Visible = false;
                pid.Visible = false;
                pname.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() != null)
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    try
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("SELECT Id, name FROM Product WHERE Id='" + TextBox1.Text.Trim() + "'", con))
                        {
                            reader = cmd.ExecuteReader();
                            while (reader.Read())
                            {
                                Panel1.Visible = false;
                                Label2.Visible = true;
                                Label3.Visible = true;
                                pid.Visible = true;
                                pname.Visible = true;
                                pid.Text = reader.GetValue(0).ToString();
                                pname.Text = reader.GetValue(1).ToString();
                            }
                            reader.Close();
                            cmd.Dispose();
                        }
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Debug.WriteLine("Can not open connection ! ");
                    }
                }
            }
            else
            {
                Panel1.Visible = true;
            }
        }
    }
}