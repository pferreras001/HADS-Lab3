using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Xml;
using System.Data;
using System.Data.SqlClient;


namespace WebSite
{
    public partial class ImportarTareas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Xml1.DocumentSource = Server.MapPath("../App_Data/" + cboAsignaturas.SelectedValue + ".xml");
            Xml1.TransformSource = Server.MapPath("../App_Data/VerTablaTareas.xsl");

        }

        protected void cboAsignaturas_TextChanged(object sender, EventArgs e)
        {
            Xml1.DocumentSource = Server.MapPath("../App_Data/" + cboAsignaturas.SelectedValue + ".xml");
            Xml1.TransformSource = Server.MapPath("../App_Data/VerTablaTareas.xsl");
        }

        protected void cboAsignaturas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnImportar_Click(object sender, EventArgs e)
        {
            XmlDocument xmlTareas = new XmlDocument();
            xmlTareas.Load(Server.MapPath("../App_Data/" + cboAsignaturas.SelectedValue + ".xml"));

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM TareasGenericas", DataAccess.DataAccess.connect());
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            DataSet ds = new DataSet("TareasGenericas");
            adapter.Fill(ds, "TareasGenericas");
            DataTable TareasTable = ds.Tables["TareasGenericas"];

            XmlNodeList nodes = xmlTareas.GetElementsByTagName("tarea");
            foreach (XmlNode node in nodes)
            {
                DataRow row = TareasTable.NewRow();
                row["Codigo"] = node.Attributes["codigo"].Value;
                row["Descripcion"] = node.ChildNodes[0].InnerText;
                row["CodAsig"] = cboAsignaturas.SelectedValue;
                row["HEstimadas"] = Int32.Parse(node.ChildNodes[1].InnerText);
                row["Explotacion"] = Boolean.Parse(node.ChildNodes[2].InnerText);
                row["TipoTarea"] = node.ChildNodes[3].InnerText;
                TareasTable.Rows.Add(row);
            }
            try
            {
                adapter.Update(ds, "TareasGenericas");
                lblMsg.Text = "Tareas importadas correctamente";
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }
    }
}