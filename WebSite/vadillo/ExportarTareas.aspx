<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportarTareas.aspx.cs" Inherits="WebSite.ExportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Seleccionar Asignatura a Exportar:<br />
            <br />
            <asp:DropDownList ID="cboAsignaturas" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig" OnTextChanged="DropDownList1_TextChanged">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-17ConnectionString %>" SelectCommand="SELECT gc.codigoasig FROM GruposClase AS gc INNER JOIN ProfesoresGrupo AS pg ON gc.codigo = pg.codigogrupo WHERE (pg.email = @param)">
                <SelectParameters>
                    <asp:SessionParameter Name="param" SessionField="User" />
                </SelectParameters>

            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="grdTareas" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Exportar XML" />
        </div>
    </form>
</body>
</html>
