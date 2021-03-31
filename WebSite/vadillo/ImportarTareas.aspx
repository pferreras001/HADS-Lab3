<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportarTareas.aspx.cs" Inherits="WebSite.ImportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Seleccionar asignatura a importar:<br />
            <br />
            <asp:DropDownList ID="cboAsignaturas" runat="server" OnTextChanged="cboAsignaturas_TextChanged" AutoPostBack="True" OnSelectedIndexChanged="cboAsignaturas_SelectedIndexChanged">
                <asp:ListItem>HAS</asp:ListItem>
                <asp:ListItem>SEG</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Xml ID="Xml1" runat="server"></asp:Xml>
            <br />
            <asp:Button ID="btnImportar" runat="server" OnClick="btnImportar_Click" Text="Importar Tareas" />
            <br />
            <br />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor.aspx">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
