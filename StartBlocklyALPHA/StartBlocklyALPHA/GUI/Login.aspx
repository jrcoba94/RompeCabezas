<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StartBlocklyALPHA.GUI.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br /><br />
      <section id="loginForm" style="margin-left:90px">
        <h2>Utilice una cuenta local para iniciar sesión.</h2>
                <fieldset>
                    <legend>Formulario de inicio de sesión</legend>
                    <ol>
                       <li>
                           <asp:Label ID="Label1" runat="server" Text="Nombre de usuario"></asp:Label>
                           <br />
                           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo nombre de usuario es obligatorio" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>--%>
                       </li>
                        <li>
                            <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo de contraseña es obligatorio" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>--%>
                        </li>
                        <li>
                            <asp:CheckBox ID="RememberMe" runat="server" /><asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox" Text=" ¿Recordar cuenta?"></asp:Label>
                            <%--<asp:CheckBox runat="server" ID="RememberMe" /><asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">¿Recordar cuenta?</asp:Label>--%>
                        </li>
                    </ol>
                    <asp:Button ID="Button1" runat="server" Text="Ingresar" OnClick="Button1_Click" />
                  <%--  <asp:Button runat="server" CommandName="Login" Text="Iniciar sesión" />--%>
                </fieldset>
        <p>
            <asp:HyperLink ID="HyperLink1" href="Registro.aspx" runat="server">Registrarse</asp:HyperLink>
            si no tiene una cuenta.
            <br />
            <br />
            <br />
            <br />

           <%-- <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse</asp:HyperLink>
            si no tiene una cuenta.--%>
        </p>
    </section>
    <br /><br /><br /><br /><br /><br />
</asp:Content>
