using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Desafio
{
    public partial class Detalles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBoxCargo.Enabled = false;
                TextBoxGenero.Enabled = false;
                Conexion cn = new Conexion();
                SqlDataReader dr = cn.Detalles(int.Parse(Request.QueryString["id"]));
                TextBoxID.Text = dr[0].ToString();
                Labeltitulo.Text = dr[1].ToString();
                TextBoxNombre.Text = dr[1].ToString();
                TextBoxApellido.Text = dr[2].ToString();
                TextBoxCorreo.Text = dr[3].ToString();
                TextBoxCargo.SelectedValue = dr[4].ToString();
                TextBoxGenero.SelectedValue = dr[5].ToString();
                if (TextBoxGenero.SelectedValue.Equals("M"))
                {
                    TextBoxGenero.Text = "Masculino";
                }
                else if (TextBoxGenero.SelectedValue.Equals("F"))
                {
                    {
                        TextBoxGenero.Text = "Femenino";
                    }
                }
                else
                {
                    TextBoxGenero.Text = "Eso no es de Dios";
                }
                TextBoxDui.Text = dr[6].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text.Equals("Guardar"))
            {
                Conexion cn = new Conexion();
                if (IsValid)
                {
                    if (cn.Editar(int.Parse(TextBoxID.Text), TextBoxNombre.Text, TextBoxApellido.Text, TextBoxCorreo.Text, TextBoxGenero.SelectedValue, int.Parse(TextBoxCargo.Text), TextBoxDui.Text))
                    {
                        Response.Redirect("~/Default");
                    }
                    else
                    {
                    }
                }
                Button1.Text = "Editar";
                TextBoxCargo.Enabled = !true;
                TextBoxCorreo.ReadOnly = !false;
                TextBoxDui.ReadOnly = !false;
                TextBoxGenero.Enabled = !true;
                TextBoxNombre.ReadOnly = !false;
                TextBoxApellido.ReadOnly = !false;
            }
            else
            {
                Button2.Visible = true;
                Button1.Text = "Guardar";
                TextBoxID.Text = TextBoxID.Text;
                TextBoxCargo.Enabled = true;
                TextBoxCorreo.ReadOnly = false;
                TextBoxDui.ReadOnly = false;
                TextBoxGenero.Enabled = true;
                TextBoxNombre.ReadOnly = false;
                TextBoxApellido.ReadOnly = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button2.Visible = false;
            Button1.Text = "Editar";
            TextBoxCargo.Enabled = !true;
            TextBoxCorreo.ReadOnly = !false;
            TextBoxDui.ReadOnly = !false;
            TextBoxGenero.Enabled = !true;
            TextBoxNombre.ReadOnly = !false;
            TextBoxApellido.ReadOnly = !false;
        }
        }
}