﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor.aspx.cs" Inherits="WebSite.Profesor" %>

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

    </form>

        </body>
</html>