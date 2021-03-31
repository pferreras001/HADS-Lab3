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
    public partial class InsertarTarea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
 
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM TareasGenericas", DataAccess.DataAccess.connect());
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            DataSet ds = new DataSet("TareasGenericas");
            adapter.Fill(ds, "TareasGenericas"); 
            DataTable TareasTable = ds.Tables["TareasGenericas"];
            DataRow row = TareasTable.NewRow();
            row["Codigo"] = txtCodigo.Text;
            row["Descripcion"] = txtDescripcion.Text;
            row["CodAsig"] = cboAsignatura.SelectedValue;
            row["HEstimadas"] = txtHoras.Text;
            row["Explotacion"] = false;
            row["TipoTarea"] = cboTipo.SelectedValue;
            TareasTable.Rows.Add(row);

            try
            {
                adapter.Update(ds, "TareasGenericas");
                lblMsg.Text = "Tarea insertada correctamente";
            }
            catch(Exception ex)
            {
                lblMsg.Text = ex.Message;
            }

        }
    }
}