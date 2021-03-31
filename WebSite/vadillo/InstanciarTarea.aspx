<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanciarTarea.aspx.cs" Inherits="WebSite.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Usuario<br />
            <asp:TextBox ID="txtUsuario" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            Tarea<br />
            <asp:TextBox ID="txtTarea" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            Horas Est.<br />
            <asp:TextBox ID="txtHorasEst" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            Horas Reales<br />
            <asp:TextBox ID="txtHorasReal" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnCrear" runat="server" Text="Crear Tarea" OnClick="btnCrear_Click" />
            <br />
            <br />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="grdTareas" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TareasAlumno.aspx">Página anterior</asp:HyperLink>
        </div>
    </form>
</body>
</html>
