<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor.aspx.cs" Inherits="WebSite.Profesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .menuLateral {
            width: 196px;
            height: 509px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
            <Items>
                <asp:MenuItem Text="Asignaturas" Value="Asignaturas"></asp:MenuItem>
                <asp:MenuItem Text="Tareas" Value="Tareas" NavigateUrl="~/profesores/TareasProfesor.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Grupos" Value="Grupos"></asp:MenuItem>
                <asp:MenuItem Text="Importar v. XMLDocument" Value="Importar v. XMLDocument" NavigateUrl="~/vadillo/ImportarTareas.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Exportar" Value="Exportar" NavigateUrl="~/vadillo/ExportarTareas.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Importar v. DataSet" Value="Importar v. DataSet"></asp:MenuItem>
            </Items>
        </asp:Menu>

        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="USUARIOS LOGEADOS:"></asp:Label>
                <asp:Label ID="lblLogeados" runat="server"></asp:Label>
                <br />
                <br />
                Profesores:
                <br />
                <asp:ListView ID="lvProfesores" runat="server">
                    <LayoutTemplate>
                        <ul class="list-group">
                            <li id="itemPlaceholder" runat="server" />
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li class="list-group-item"><%#: Eval("ListaEmail") %></li>
                    </ItemTemplate>
                </asp:ListView>
                <br />
                Alumnos:<br />
                <br />
                <asp:ListView ID="lvAlumnos" runat="server">
                    <LayoutTemplate>
                        <ul class="list-group">
                            <li id="itemPlaceholder" runat="server" />
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li class="list-group-item"><%#: Eval("ListaEmail") %></li>
                    </ItemTemplate>
                </asp:ListView>
            </ContentTemplate>
        </asp:UpdatePanel>

        <br />
&nbsp;<br />
        <br />
        &nbsp;</form>

        </body>
</html>
