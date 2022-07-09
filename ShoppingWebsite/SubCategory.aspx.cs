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
    public partial class Category : System.Web.UI.Page
    {
        private readonly string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            sortGrid();
        }
        private void sortGrid()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string by = DropDownList1.SelectedValue.ToString().Split('-')[0].ToString();
            string order = DropDownList1.SelectedValue.ToString().Split('-')[1].ToString();
            string sql = "SELECT * FROM Product WHERE (category_type = @category_type) AND (category_subtype = @category_subtype) ORDER BY " + by + " " + order;
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@category_type", Request.QueryString["cat"]);
            cmd.Parameters.AddWithValue("@category_subtype", Request.QueryString["subcat"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

    }
}