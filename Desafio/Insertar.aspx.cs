using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Desafio
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Conexion cn = new Conexion();
            if (IsValid)
            {
                if (cn.Insertar(TextBoxNombre.Text, TextBoxApellido.Text, TextBoxCorreo.Text, TextBoxGenero.SelectedValue, int.Parse(TextBoxCargo.Text), TextBoxDui.Text))
                {
                    Response.Redirect("~/Default");
                }
                else
                {

                }
            }
        }
    }
}