<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="coordinador.aspx.cs" Inherits="WebSite.vadillo.coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="cboAsignaturas" runat="server" DataSourceID="SqlDataSource1" DataTextField="CodAsig" DataValueField="CodAsig">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-17ConnectionString %>" SelectCommand="SELECT DISTINCT CodAsig FROM TareasGenericas"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="btnMedia" runat="server" OnClick="btnMedia_Click" Text="Obtener media" />
            <br />
            <br />
            <asp:Label ID="lblMedia" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
