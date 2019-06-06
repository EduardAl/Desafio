<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Desafio.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <div class="form-group">
            <br />
            <h2>
                <asp:Label ID="Labeltitulo" runat="server" Text=""></asp:Label>
            </h2>
            <div class="card-body m1-4">
                <div class="form-group col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label4" CssClass="label label-primary label-md" runat="server" Text="Label">ID</asp:Label><br />
                        <asp:TextBox ID="TextBoxID" ReadOnly="true" CssClass="form-control input-md input-primary" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <div class="form-group">
                            <asp:Label ID="Label2" CssClass="label label-primary" runat="server" Text="Label">Nombre</asp:Label><br />
                            <asp:TextBox ID="TextBoxNombre" ReadOnly="true" CssClass="form-control input-primary input-md" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator CssClass="alert alert-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="TextBoxNombre"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <asp:Label ID="Label8" CssClass="label label-primary" runat="server" Text="Label">Apellido</asp:Label><br />
                            <asp:TextBox ID="TextBoxApellido" ReadOnly="true" CssClass="form-control input-primary input-md" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator CssClass="alert alert-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="TextBoxApellido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <asp:Label ID="Label6" CssClass="label label-primary label-md" runat="server" Text="Label">DUI</asp:Label><br />
                            <asp:TextBox required="" ID="TextBoxDui" ReadOnly="true" CssClass="form-control input-md input-primary" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <div>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                    ControlToValidate="TextBoxDui"
                                    ValidationExpression="^[0-9]{8}-[0-9]{1}$"
                                    Display="Static"
                                    ErrorMessage="Debe ingresar un dui válido"
                                    EnableClientScript="false"
                                    runat="server"
                                    CssClass="alert alert-danger">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="form-group col-md-6">
                        <div class="form-group">
                            <div class="ror">
                                <div class="col-md-4">
                                    <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Editar" OnClick="Button1_Click" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Button CssClass="btn btn-danger" ID="Button2" runat="server" Text="Cancelar" Visible="false" OnClick="Button2_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="alert-danger">
                                <asp:Label ID="Label7" CssClass="label label-danger" runat="server" ForeColor="Red" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <div class="form-group">
                        <div class="form-group">
                            <asp:Label ID="Label1" CssClass="label label-primary" runat="server" Text="Label">Correo Electrónico</asp:Label><br />
                            <asp:TextBox required="" ID="TextBoxCorreo" ReadOnly="true" CssClass="form-control input-primary input-md" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                ControlToValidate="TextBoxCorreo"
                                ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                Display="Static"
                                ErrorMessage="Debe ingresar un correo válido"
                                EnableClientScript="False"
                                runat="server"
                                CssClass="alert alert-danger">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <asp:Label ID="Label3" CssClass="label label-primary" runat="server" Text="Label">cargo</asp:Label><br />
                            <asp:DropDownList ID="TextBoxCargo" CssClass="form-control input-primary input-md" ReadOnly="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="job_position" DataValueField="id"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:empleadosConnectionString %>" SelectCommand="SELECT [id], [job_position] FROM [positions]"></asp:SqlDataSource>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator CssClass="alert alert-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="TextBoxCargo"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group" id="tratar" runat="server">
                            <asp:Label ID="Label9" CssClass="label label-primary" runat="server" Text="Label">Genero</asp:Label><br />
                            <asp:DropDownList ID="TextBoxGenero" CssClass="form-control input-primary input-md" ReadOnly="true" runat="server">
                                <asp:ListItem Value="M">Masculino</asp:ListItem>
                                <asp:ListItem Value="F">Femenino</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
