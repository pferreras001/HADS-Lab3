<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasProfesor.aspx.cs" Inherits="WebSite.TareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                PROFESOR<br />
                GESTIÓN DE TAREAS<asp:Button ID="Button1" runat="server" Text="Cerrar Session" Style="float:right" OnClick="Button1_Click"/>
            </div>
            Seleccionar Asignatura<br />
            <asp:DropDownList ID="cboAsignatura" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-17ConnectionString %>" SelectCommand="SELECT gc.codigoasig FROM GruposClase AS gc INNER JOIN ProfesoresGrupo AS pg ON gc.codigo = pg.codigogrupo WHERE (pg.email = @param)">
                <SelectParameters>
                    <asp:SessionParameter Name="param" SessionField="User" />
                </SelectParameters>

            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ProfesorAsignatura" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-17ConnectionString %>" SelectCommand="SELECT gc.codigoasig FROM Asignaturas AS a INNER JOIN GruposClase AS gc ON a.codigo = gc.codigoasig INNER JOIN ProfesoresGrupo AS pg ON gc.codigo = pg.codigogrupo WHERE (pg.email = '&quot;Session['User']&quot;')"></asp:SqlDataSource>
            
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditButton="true" DataKeyNames="Codigo" DataSourceID="SqlDataSource3">
                        <Columns>
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                            <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                            <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                            <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                            <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-17ConnectionString %>" SelectCommand="SELECT [Codigo], [Descripcion], [Explotacion], [TipoTarea], [HEstimadas], [CodAsig] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)"
                UpdateCommand="UPDATE[TareasGenericas] SET Codigo=@Codigo,Descripcion=@Descripcion,Explotacion=@Explotacion,TipoTarea=@TipoTarea,HEstimadas=@HEstimadas,CodAsig=@CodAsig WHERE CodAsig=@CodAsig">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cboAsignatura" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="cboInsertar" runat="server" Text="Insertar Nueva Tarea" OnClick="cboInsertar_Click" />
        </div>
    </form>
</body>
</html>

