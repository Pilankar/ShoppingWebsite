using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingWebsite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Detail_Click(object sender, EventArgs e)
        {
            int i, j;
            int n = 3;
            string[,] cars = new string[n, 2];
            
            for (i = 0; i < n; i++)
            {
                cars[i, 0] = "Hello";
                cars[i, 1] = "Bye";
            }
            Context.Items.Add("Name", "Sandeep Singh Shekhawat");
            Context.Items.Add("Email", "sandeep.shekhawat88@gmail.com");
            Context.Items.Add("Car Names", cars);
            Server.Transfer("WebForm2.aspx");
        }
    }
}