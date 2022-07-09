using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingWebsite
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.Write(string.Format("My name is {0} and email address is {1}",
                                              Context.Items["Name"].ToString(),
                                              Context.Items["Email"].ToString()));
                Response.Write(string.Format("My cars are {0}",
                                              Context.Items["Car Names"].ToString()));
                string[] cars = ((IEnumerable)Context.Items["Car Names"]).Cast<object>().Select(x => x.ToString()).ToArray();
                foreach (string i in cars)
                {
                    Response.Write(i);
                }
            }
            catch (NullReferenceException ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

        }
    }
}