<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Proyectos.aspx.cs" Inherits="StartBlocklyALPHA.GUI.Proyectos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br /><br />
    <div class="col-lg-12" style="text-align:center">
        <asp:LinkButton ID="lbNuevo" runat="server" ForeColor="#ffcc00" Width="60px" OnClick="lbNuevo_Click"><h2 style="color:black">Nuevo</h2></asp:LinkButton>
    
    <div class="col-md-12 center-block">
                <br />
        <asp:GridView HorizontalAlign="Center" ID="GridView1" runat="server" class="table table-bordered" AutoGenerateColumns="false" ForeColor="#333333" GridLines="None" Width="1130px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="idsave" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha">
                    <ControlStyle BorderStyle="Groove" />
                    <HeaderStyle Width="12px" />
                </asp:BoundField>
                <asp:BoundField DataField="Titulo" HeaderText="Proyectos">
                    <HeaderStyle Width="12px" Wrap="True" />
                </asp:BoundField>
                <asp:ButtonField CommandName="Detalle" Text="Importar" ButtonType="Button">
                    <HeaderStyle BackColor="#63C600" Width="12px" Wrap="True" />
                </asp:ButtonField>
                <asp:ButtonField CommandName="Elim" Text="Eliminar" ButtonType="Button">
                    <HeaderStyle BackColor="#63C600" Width="12px" Wrap="True" />
                </asp:ButtonField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#61C419" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
        <asp:TextBox ID="txtBlocky" runat="server" Width="737px" style="display:none"></asp:TextBox>
    </div>
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br />
</asp:Content>
