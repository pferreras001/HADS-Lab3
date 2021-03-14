using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int log = DataAccess.DataAccess.login(txtUsuario.Text, txtContrasena.Text);
            if (log == 0)
            {
                Session["User"] = txtUsuario.Text;
                if (DataAccess.DataAccess.getUserType(Session["User"].ToString()) == "Profesor")
                {
                    Response.Redirect("Profesor.aspx");
                }
                else
                {
                    Response.Redirect("Alumno.aspx");
                }
            }
            else
            {
                lblError.Text = "Login incorrecto";
            }
        }
    }
}