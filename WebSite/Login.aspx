<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSite.Login" %>

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
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            <br />
            <br />
            Contraseña<br />
            <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" Width="128px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" />
        </div>
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Register.aspx" runat="server">Registrarse</asp:HyperLink>
    </form>
</body>
</html>
