<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="StartBlocklyALPHA.GUI.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
    <section id="loginForm" style="margin-left:100px">
        <h2>Use el formulario siguiente para crear una cuenta nueva.</h2>
        <fieldset>
            <legend>Formulario de registro</legend>
            <ol>
                <li>
                    <asp:Label ID="Label1" runat="server" Text="Nombre de usuario"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo nombre de usuario es obligatorio" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>--%>

                </li>
                <li>
                    <asp:Label ID="Label2" runat="server" Text="Apellido de usuario"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo apellido de usuario es obligatorio" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>--%>
                </li>
                <li>
                    <asp:Label ID="Label3" runat="server" Text="Dirección de correo electrónico"></asp:Label>
                    <br />

                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Email"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo de correo electrónico es obligatorio" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>--%>
                </li>
                <li>
                    <asp:Label ID="Label4" runat="server" Text="Contraseña"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El campo de contaseña es obligatorio" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>--%>
                </li>
                <li>
                    <asp:Label ID="Label5" runat="server" Text="Confirmar contraseña"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El campo de contraseña es obligatorio" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>--%>
                    <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="Las contraseñas no son iguales."></asp:CompareValidator>--%>
                </li>
            </ol>
            <asp:Button ID="Button1" runat="server" Text="Registrarse" OnClick="Button1_Click" />
        </fieldset>
    </section>
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
