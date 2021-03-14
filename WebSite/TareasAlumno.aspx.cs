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
    public partial class TareasAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cboAsignaturas_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (grdTareas.Columns.Count > 0)
            {
                grdTareas.Columns.RemoveAt(0);
                grdTareas.DataBind();

            }
                
            
            lblPrueba.Text = cboAsignaturas.SelectedValue;
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT Codigo, Descripcion, HEstimadas, TipoTarea FROM TareasGenericas WHERE Explotacion = 1 and CodAsig='"+ cboAsignaturas.SelectedValue + "' and Codigo NOT IN (SELECT CodTarea FROM EstudiantesTareas WHERE Email='"+ Session["User"] +"')", DataAccess.DataAccess.connect());
            DataSet ds = new DataSet("TareasGenericas");
            adapter.Fill(ds, "TareasGenericas");
            DataTable TareasTable = ds.Tables["TareasGenericas"];

            grdTareas.Visible = true;
            grdTareas.DataSource = TareasTable;
            ButtonField btnInstanciar = new ButtonField();
            btnInstanciar.ButtonType = ButtonType.Button;
            btnInstanciar.Text = "Instanciar";
            grdTareas.Columns.Insert(0, btnInstanciar);
            grdTareas.DataBind();
        }

        protected void grdTareas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grdTareas.Rows[index];
            lblPrueba.Text = row.Cells[1].Text;
            Response.Redirect("InstanciarTarea.aspx?codTarea="+ row.Cells[1].Text +"&horasEst=" + row.Cells[3].Text + " ");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}