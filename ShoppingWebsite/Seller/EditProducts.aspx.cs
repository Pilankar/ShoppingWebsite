using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ShoppingWebsite.Seller
{
    public partial class EditProducts : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"].ToString() == "" || Session["username"] == null)
            //{
            //    //Response.Write("<script>alert('Session Expired Login Again');</script>");
            //    //Response.Redirect("~/Seller/SellerProfile.aspx");
            //}
            choicesforWomen.Visible = false;
            choicesforMen.Visible = false;
            choicesforKids.Visible = false;
            choicesforAccessories.Visible = false;
        }

        void connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(TextBox2.Text.Trim() != null)
            {
                getProductDetails();
            }
        }
        void getProductDetails()
        {
            try
            {
                connect();

                SqlCommand cmd = new SqlCommand("SELECT * from Product where Id='" + TextBox2.Text.Trim() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Name.Text = dt.Rows[0]["name"].ToString();
                Desc.Text = dt.Rows[0]["desc"].ToString();
                brand.Text = dt.Rows[0]["brand"].ToString();
                Categories.SelectedValue = dt.Rows[0]["category_type"].ToString();
                if (dt.Rows[0]["category_type"].ToString() == "Women")
                {
                    choicesforWomen.Visible = true;
                    choicesforMen.Visible = false;
                    choicesforKids.Visible = false;
                    choicesforAccessories.Visible = false;
                    RadioButtonList1.SelectedValue = dt.Rows[0]["category_subtype"].ToString();
                }
                if (dt.Rows[0]["category_type"].ToString() == "Men")
                {
                    choicesforMen.Visible = true;
                    choicesforWomen.Visible = false;
                    choicesforKids.Visible = false;
                    choicesforAccessories.Visible = false;
                    RadioButtonList2.SelectedValue = dt.Rows[0]["category_subtype"].ToString();
                }
                if (dt.Rows[0]["category_type"].ToString() == "Kids")
                {
                    choicesforKids.Visible = true;
                    choicesforWomen.Visible = false;
                    choicesforMen.Visible = false;
                    choicesforAccessories.Visible = false;
                    RadioButtonList3.SelectedValue = dt.Rows[0]["category_subtype"].ToString();
                }
                if (dt.Rows[0]["category_type"].ToString() == "Accessories")
                {
                    choicesforAccessories.Visible = true;
                    choicesforWomen.Visible = false;
                    choicesforMen.Visible = false;
                    choicesforKids.Visible = false;
                    RadioButtonList4.SelectedValue = dt.Rows[0]["category_subtype"].ToString();
                }
                mrp.Text = dt.Rows[0]["mrp"].ToString();
                productPrice.Text = dt.Rows[0]["price"].ToString();
                fit_type.Text = dt.Rows[0]["fit_type"].ToString();
                color.Text = dt.Rows[0]["color"].ToString();
                care_instr.Text = dt.Rows[0]["care_instr"].ToString();
                more_details.Text = dt.Rows[0]["more_details"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert( " + ex + ");</script>");
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                connect();

                SqlCommand cmd = new SqlCommand("UPDATE Product SET Name=@Name, Desc=@Desc, mrp=@mrp, price=@price, care_instr=@care_instr, fit_type=@fit_type, color=@color, more_details=@more_details, category_type=@category_type, category_subtype=@category_subtype  WHERE Id='" + TextBox2.Text.Trim() + "'; ", con);

                cmd.Parameters.AddWithValue("@firstname", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@lastname", Desc.Text.Trim());
                cmd.Parameters.AddWithValue("@adhar_no", brand.Text.Trim());
                cmd.Parameters.AddWithValue("@category_type", Categories.SelectedValue);

                if (Categories.SelectedItem.Value == "Women")
                {
                    cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList1.SelectedItem.Value);
                }
                if (Categories.SelectedItem.Value == "Men")
                {
                    cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList2.SelectedItem.Value);
                }
                if (Categories.SelectedItem.Value == "Kids")
                {
                    cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList3.SelectedItem.Value);
                }
                if (Categories.SelectedItem.Value == "Accessories")
                {
                    cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList4.SelectedItem.Value);
                }

                cmd.Parameters.AddWithValue("@mrp", int.Parse(mrp.Text.Trim()));
                cmd.Parameters.AddWithValue("@price", int.Parse(productPrice.Text.Trim()));
                cmd.Parameters.AddWithValue("@care_instr", care_instr.Text.Trim());
                cmd.Parameters.AddWithValue("@fit_type", fit_type.Text.Trim());
                cmd.Parameters.AddWithValue("@color", color.Text.Trim());
                cmd.Parameters.AddWithValue("@more_details", more_details.Text.Trim());

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Product Details Updated Successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Invalid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex + ");</script>");
            }
        }
    }
}