using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
            string email = HttpUtility.ParseQueryString(myUri.Query).Get("mbr");
            string numconf = HttpUtility.ParseQueryString(myUri.Query).Get("numconf");

            DataAccess.DataAccess.validateUser(email, numconf);

            Response.Redirect("Login.aspx");
        }
    }
}