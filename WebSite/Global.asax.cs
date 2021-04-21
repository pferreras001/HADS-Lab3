using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Collections;

namespace WebSite
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            Application["ListaAlumnos"] = new ArrayList();
            Application["ListaProfesores"] = new ArrayList();

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["User"] = "";
        }

        void Application_End(object sender, EventArgs e)
        {
            ((ArrayList)Application["ListaAlumnos"]).Clear();
            ((ArrayList)Application["ListaProfesores"]).Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }


        void Session_End(object sender, EventArgs e)
        {
            if (DataAccess.DataAccess.getUserType(Session["User"].ToString()) == "Profesor")
            {
                ((ArrayList)Application["ListaAlumnos"]).Remove(Session["User"].ToString());
            }
            else
            {
                ((ArrayList)Application["ListaProfesores"]).Remove(Session["User"].ToString());
            }

        }
    }
}