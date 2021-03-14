<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebSite.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Dirección de correo:<br />
            <asp:TextBox ID="txtCorreo" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:RegularExpressionValidator ID="valEmail" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo" ErrorMessage="Email incorrecto"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Introduzca email"></asp:RequiredFieldValidator>
            <br />
            <br />
            Nombre:<br />
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="valName" runat="server" ValidationExpression="[a-zA-Z/'/-]+" ControlToValidate="txtNombre" ErrorMessage="Nombre incorrecto"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="reqNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Introduzca Nombre"></asp:RequiredFieldValidator>
            <br />
            <br />
            Apellidos:<br />
            <asp:TextBox ID="txtApellidos" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="[a-zA-Z/'/-]+" ControlToValidate="txtApellidos"  ErrorMessage="Apellidos incorrectos"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="reqApellidos" runat="server" ControlToValidate="txtApellidos" ErrorMessage="Introduzca Apellidos"></asp:RequiredFieldValidator>
            <br />
            <br />
            Contraseña:<br />
            <asp:TextBox ID="txtContrasena1" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqContraseña" runat="server" ControlToValidate="txtContrasena1" ErrorMessage="Introduzca contraseña"></asp:RequiredFieldValidator>
            <br />
            <br />
            Repita contraseña:<br />
            <asp:TextBox ID="txtContrasena2" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="valPass" runat="server" ControlToCompare="txtContrasena1" ControlToValidate="txtContrasena2" ErrorMessage="Las contraseñas no coinciden"></asp:CompareValidator>
            <br />
            <br />
            Rol:<br />
            <asp:DropDownList ID="cboRol" runat="server">
                <asp:ListItem>Alumno</asp:ListItem>
                <asp:ListItem>Profesor</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
        </div>
        <p>
            <asp:Label ID="lbl" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
