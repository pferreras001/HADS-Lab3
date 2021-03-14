using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int register = DataAccess.DataAccess.insertUser(txtCorreo.Text, txtNombre.Text, txtApellidos.Text, cboRol.SelectedValue, txtContrasena1.Text);
            if (register != -1)
            {
                int numconfir = DataAccess.DataAccess.getUserCode(txtCorreo.Text);
                String authUrl = "https://localhost:" + HttpContext.Current.Request.Url.Port + "/Confirm.aspx" + "?mbr=" + txtCorreo.Text + "&numconf=" + numconfir;
                Mailing.Mailing.mailing(txtCorreo.Text, "Enlace para activar cuenta", authUrl);
                lbl.Text = "Te hemos enviado un correo de confirmación a " + txtCorreo.Text;
            }
        }
    }
}