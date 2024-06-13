<%@ Page Title="BITACORA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Listado de Movimientos</h3>
    <br/>
    <div class="row">
        <div class="col-md-2">Matricula</div>
        <div class="col-md-2"><asp:TextBox runat="server" ID="TxtBuscar" CssClass="form-control"></asp:TextBox></div>
        <div class="col-md-2"><asp:Button runat="server" ID="BtnBuscar" Text="Buscar" OnClick="BtnBuscar_Click" CssClass="btn"/></div>
        <div class="col-md-6"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:GridView runat="server" ID="gv1" CssClass="table">

            </asp:GridView>
        </div>
    </div>
</asp:Content>
