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
    public partial class ExportarTareas : System.Web.UI.Page
    {
        public DataSet ds;
        public DataTable TareasTable;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT Codigo as codigo, Descripcion as descripcion, HEstimadas as hestimadas, Explotacion as explotacion, TipoTarea as tipotarea FROM TareasGenericas WHERE CodAsig='" + cboAsignaturas.SelectedValue + "' ", DataAccess.DataAccess.connect());
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            ds = new DataSet("TareasGenericas");
            adapter.Fill(ds, "TareasGenericas");
            TareasTable = ds.Tables["TareasGenericas"];

            grdTareas.DataSource = TareasTable;
            grdTareas.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT Codigo as codigo, Descripcion as descripcion, HEstimadas as hestimadas, Explotacion as explotacion, TipoTarea as tipotarea FROM TareasGenericas WHERE CodAsig='" + cboAsignaturas.SelectedValue + "' ", DataAccess.DataAccess.connect());
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            ds = new DataSet("tareas");
            adapter.Fill(ds, "tareas");
            TareasTable = ds.Tables["tareas"];
            TareasTable.Columns["codigo"].ColumnMapping = MappingType.Attribute;
            ds.WriteXml(Server.MapPath("App_Data/" + cboAsignaturas.SelectedValue + ".xml"));
        }
    }
}