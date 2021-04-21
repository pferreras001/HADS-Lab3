using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.vadillo
{
    public partial class coordinador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMedia_Click(object sender, EventArgs e)
        {
            ServiceReference1.Service1Client wsMedia = new ServiceReference1.Service1Client();
            int media = wsMedia.getHorasMedia(cboAsignaturas.SelectedValue);
            lblMedia.Text = "Las horas de media de la asignatura son: " + media.ToString();
        }
    }
}