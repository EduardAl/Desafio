<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Desafio._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET - Desafío</h1>
        <p class="lead">Lista de Empleados</p>
    </div>
    <div class="container col-md-12">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CssClass="table table-striped" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                <asp:BoundField DataField="Género" HeaderText="Género" SortExpression="Género" />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Detalles.aspx?id={0}" DataTextField="ID" DataTextFormatString="Detalles" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:empleadosConnectionString %>" SelectCommand="SELECT e.id AS ID, { fn CONCAT({ fn CONCAT(e.fname, ' ') }, e.lname) } AS Nombre, e.email AS Correo, jp.job_position AS Cargo, e.gender AS Género FROM employees AS e INNER JOIN positions AS jp ON jp.id = e.job_position"></asp:SqlDataSource>

    </div>

</asp:Content>
