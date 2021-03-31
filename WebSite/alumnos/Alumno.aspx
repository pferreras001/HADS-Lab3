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

        </div>
    </form>
</body>
</html>
