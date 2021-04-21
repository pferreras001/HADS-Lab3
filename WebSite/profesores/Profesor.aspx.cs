using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Profesor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrayList alumnos = ((ArrayList)Application["ListaAlumnos"]);
            ArrayList profesores = ((ArrayList)Application["ListaProfesores"]);

            lblLogeados.Text = alumnos.Count + "Alumno/s y " + profesores.Count + " Profesore/s";

            DataSet profesoresSet = ArrayToDs(profesores.ToArray());
            lvProfesores.DataSource = profesoresSet.Tables[0];
            lvProfesores.DataBind();

            DataSet alumnosSet = ArrayToDs(alumnos.ToArray());
            lvAlumnos.DataSource = alumnosSet.Tables[0];
            lvAlumnos.DataBind();


        }

        private DataSet ArrayToDs(Object[] list)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("ListaEmail", Type.GetType("System.String")));
            for (int i = 0; i < list.Length; i++)
            {
                DataRow dr = dt.NewRow();
                dr["ListaEmail"] = list[i].ToString();
                dt.Rows.Add(dr);

            }

            ds.Tables.Add(dt);
            return ds;

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}