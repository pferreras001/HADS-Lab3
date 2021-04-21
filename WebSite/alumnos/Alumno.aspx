<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumno.aspx.cs" Inherits="WebSite.Alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
            <Items>
                <asp:MenuItem Text="Tareas Genericas" Value="Tareas Genericas" NavigateUrl="~/TareasAlumno.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Tareas Propias" Value="Tareas Propias"></asp:MenuItem>
                <asp:MenuItem Text="Grupos" Value="Grupos"></asp:MenuItem>
            </Items>
        </asp:Menu>

            <br />

        </div>

        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="USUARIOS LOGEADOS:"></asp:Label>
                &nbsp;<asp:Label ID="lblLogeados" runat="server"></asp:Label>
                <br />
                <br />
                Profesores:
                <br />
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
                <br />
                Alumnos:
                <br />
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

        <br />
        <br />
        <br />
    </form>
</body>
</html>
