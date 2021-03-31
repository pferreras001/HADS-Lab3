using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

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
                    if (Session["User"].ToString().Equals("vadillo@ehu.es"))
                    {
                        FormsAuthentication.SetAuthCookie("Vadillo", false);
                        Session["usuario"] = "Vadillo";
                    }
                    else
                    {
                        FormsAuthentication.SetAuthCookie("Profesor", false);
                        Session["usuario"] = "Profesor";
                    }
                    Response.Redirect("profesores/Profesor.aspx");
                }
                else
                {
                    FormsAuthentication.SetAuthCookie("Alumno", false);
                    Session["usuario"] = "Alumno";
                    Response.Redirect("alumnos/Alumno.aspx");
                }
            }
            else
            {
                lblError.Text = "Login incorrecto";
            }
        }
    }
}