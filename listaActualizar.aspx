<%@ Page Title="Lista de Actualizados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="listaActualizar.aspx.cs" Inherits="listActualizar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p></p>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gv1" runat="server" CssClass="table" DataKeyNames="NUMEROALUMNO" AutoGenerateColumns="False">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="NUMEROALUMNO" DataNavigateUrlFormatString="etiquetas?_={0}" DataTextField="NUMEROALUMNO" HeaderText="Etiquetas" Target="_blank" />
                    <asp:BoundField DataField="MATRICULA" HeaderText="MATRICULA" />
                    <asp:BoundField DataField="PATERNO" HeaderText="A. PATERNO" />
                    <asp:BoundField DataField="MATERNO" HeaderText="A. MATERNO" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRES" />
                    <asp:BoundField DataField="CLAVE_CIUDADANA" HeaderText="CLAVE_CIUDADANA" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
