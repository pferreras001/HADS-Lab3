using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess
{
    public class DataAccess
    {
        public static SqlConnection connect()
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = "Server=tcp:hads21-17.database.windows.net,1433;Initial Catalog=HADS21-17;Persist Security Info=False;User ID=pfadarraga@gmail.com@hads21-17;Password=Hohm-4548;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

                connection.Open();
                return connection;
            }
            catch(Exception ex){
                Console.WriteLine("ERROR DE CONEXIÓN: " + ex.Message);
                return null;
            }
        }

        public static int insertUser(String email, String nombre, String apellidos, String tipo, String pass)
        {
            SqlConnection connection = connect();
            int numregs = 0;
            var random = new Random();
            string s = string.Empty;
            for (int i = 0; i < 7; i++)
                s = String.Concat(s, random.Next(10).ToString());
            int numconfir = int.Parse(s);
            try
            {
                SqlCommand comando = new SqlCommand();
                String insert = "insert into Usuarios (email, nombre, apellidos, numconfir, confirmado, tipo, pass, codpass) values ('" + email + "','" + nombre + "','" + apellidos + "'," + numconfir + "," + 0 + ",'" + tipo + "','" + pass + "'," + pass + ")";
                comando = new SqlCommand(insert, connection);

                try
                {
                    numregs = comando.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    connection.Close();
                    return -1;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("ERROR DE CONEXIÓN: " + ex.Message);
                connection.Close();
                return -1;
            }
            connection.Close();
            return 0;
        }

        public static int getUserCode(String email)
        {
            SqlConnection connection = connect();
            String sql = "Select numconfir From Usuarios Where email = '" + email + "' ";
            SqlCommand comando = new SqlCommand();
            comando = new SqlCommand(sql, connection);

            int numconfir = (Int32)comando.ExecuteScalar();
            connection.Close();
            return numconfir;
        }

        public static int validateUser(String email, String numconf)
        {
            SqlConnection connection = connect();
            String sql = "Select numconfir From Usuarios Where email = '" + email + "' ";
            SqlCommand comando = new SqlCommand();
            comando = new SqlCommand(sql, connection);

            int numconfir = (Int32)comando.ExecuteScalar();

            if (numconf == numconfir.ToString())
            {
                String update = "Update Usuarios Set confirmado=1 Where email = '" + email + "'";
                comando = new SqlCommand(update, connection);

                comando.ExecuteNonQuery();

                connection.Close();

                return 0;
            }

            connection.Close();
            return -1;
        }

        public static String getUserType(String email)
        {
            SqlConnection connection = connect();
            String sql = "Select tipo From Usuarios Where email = '" + email + "' ";
            SqlCommand comando = new SqlCommand();
            comando = new SqlCommand(sql, connection);

            String type = comando.ExecuteScalar().ToString();
            connection.Close();
            return type;
        }

        public static int login(String email, String pass)
        {
            SqlConnection connection = connect();
            String sql = "Select pass From Usuarios Where email = '" + email + "' And confirmado=1 ";
            SqlCommand comando = new SqlCommand();
            comando = new SqlCommand(sql, connection);

            String password = (String)comando.ExecuteScalar();
            if(pass == password.ToString())
            {
                return 0;
            }
            return -1;
        }
    }
}
