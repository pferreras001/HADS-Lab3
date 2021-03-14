<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertarTarea.aspx.cs" Inherits="WebSite.InsertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Codigo<br />
            <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
            <br />
            <br />
            Descripción<br />
            <asp:TextBox ID="txtDescripcion" runat="server" Height="62px" TextMode="MultiLine" Width="297px"></asp:TextBox>
            <br />
            <br />
            Asignatura<br />
            <asp:DropDownList ID="cboAsignatura" runat="server" DataSourceID="ProfesorAsignatura" DataTextField="codigoasig" DataValueField="codigoasig">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="ProfesorAsignatura" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-17ConnectionString %>" SelectCommand="SELECT gc.codigoasig FROM Asignaturas AS a INNER JOIN GruposClase AS gc ON a.codigo = gc.codigoasig INNER JOIN ProfesoresGrupo AS pg ON gc.codigo = pg.codigogrupo WHERE (pg.email = @param)">
                <SelectParameters>
                    <asp:SessionParameter Name="param" SessionField="User" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Horas Estimadas<br />
            <asp:TextBox ID="txtHoras" runat="server"></asp:TextBox>
            <br />
            <br />
            Tipo Tarea<br />
            <asp:DropDownList ID="cboTipo" runat="server">
                <asp:ListItem>Ejercicio</asp:ListItem>
                <asp:ListItem>Laboratorio</asp:ListItem>
                <asp:ListItem>Examen</asp:ListItem>
                <asp:ListItem>Trabajo</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnAñadir" runat="server" OnClick="Button1_Click" Text="Añadir" />
            <br />
            <br />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TareasProfesor.aspx">Ver tareas</asp:HyperLink>
    </form>
</body>
</html>
