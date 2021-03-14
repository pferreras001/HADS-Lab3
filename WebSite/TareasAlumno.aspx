<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasAlumno.aspx.cs" Inherits="WebSite.TareasAlumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cerrar Sesión" />
            <br />
            <br />
            Seleccionar asignatura:<br />
            <br />
            <asp:DropDownList ID="cboAsignaturas" runat="server" AutoPostBack="True" DataSourceID="EstudianteAsignatura" DataTextField="codigoasig" DataValueField="codigoasig" OnSelectedIndexChanged="cboAsignaturas_SelectedIndexChanged1">
            </asp:DropDownList>
            <asp:SqlDataSource ID="EstudianteAsignatura" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-17ConnectionString %>" SelectCommand="SELECT gc.codigoasig
FROM EstudiantesGrupo as eg JOIN GruposClase as gc ON eg.Grupo = gc.codigo
WHERE eg.email = @param">
                <SelectParameters>
                    <asp:SessionParameter Name="param" SessionField="User" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="grdTareas" runat="server" OnRowCommand="grdTareas_RowCommand">
        </asp:GridView>
        <asp:Label ID="lblPrueba" runat="server"></asp:Label>
        <br />
    </form>
</body>
</html>
