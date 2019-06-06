using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Desafio
{
    public class Conexion
    {
        String cadena;
        SqlConnection cn;
        SqlCommand cmd;
        public Conexion()
        {
            cadena = @"Data Source=EDUARD\EDUARD;Initial Catalog=empleados;Persist Security Info=True;User ID=sa;Password=181912";
            cn = new SqlConnection(cadena);


        }
        public SqlDataReader Detalles(int id)
        {
            cn.Open();
            cmd = new SqlCommand("SELECT e.id AS ID, e.fname as Nombre, e.lname as Apellido, e.email AS Correo, e.job_position AS Cargo, e.gender AS Género, e.dui as DUI FROM employees e where e.id = " + id, cn);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                return dr;
            }
            return null;
        }
        public bool Insertar(String nombre, String apellido, String correo, String genero, int cargo, String dui)
        {
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            String insert = "insert into employees values('" + nombre + "', '" + apellido + "', '" + correo + "', " + cargo + ", '" + genero + "', '" + dui + "')";
            cmd = new SqlCommand(insert, cn);
            da.InsertCommand = cmd;
            int var = da.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            return var > 0;
        }
        public bool Editar(int id, String nombre, String apellido, String correo, String genero, int cargo, String dui)
        {
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            String insert = "update employees set fname='" + nombre + "', lname='" + apellido + "', email='" + correo + "', job_position=" + cargo + ", gender='" + genero + "', dui='" + dui + "' where id = " + id;
            cmd = new SqlCommand(insert, cn);
            da.InsertCommand = cmd;
            int var = da.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            return var > 0;
        }
    }
}