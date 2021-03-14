using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebSite
{
    public partial class InstanciarTarea : System.Web.UI.Page
    {
        DataSet ds;
        SqlDataAdapter adapter;
        DataTable TareasTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
            txtUsuario.Text = Session["User"].ToString();
            txtTarea.Text = HttpUtility.ParseQueryString(myUri.Query).Get("codTarea");
            txtHorasEst.Text = HttpUtility.ParseQueryString(myUri.Query).Get("horasEst");
            adapter = new SqlDataAdapter("SELECT * FROM EstudiantesTareas WHERE Email='" + Session["User"] + "' ", DataAccess.DataAccess.connect());
            ds = new DataSet("EstudiantesTareas");
            adapter.Fill(ds, "EstudiantesTareas");
            TareasTable = ds.Tables["EstudiantesTareas"];

            grdTareas.Visible = true;
            grdTareas.DataSource = TareasTable;
            grdTareas.DataBind();
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            DataRow row = TareasTable.NewRow();
            row["Email"] = txtUsuario.Text;
            row["CodTarea"] = txtTarea.Text;
            row["HEstimadas"] = txtHorasEst.Text;
            row["HReales"] = txtHorasReal.Text;
            TareasTable.Rows.Add(row);

            try
            {
                SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                adapter.Update(ds, "EstudiantesTareas");
                grdTareas.DataSource = TareasTable;
                grdTareas.DataBind();
                lblMsg.Text = "Tarea creada correctamente";
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }
    }
}