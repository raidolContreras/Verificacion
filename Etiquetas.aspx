<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Etiquetas.aspx.cs" Inherits="Etiquetas" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>UNIMO-ETIQUETAS</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="conteiner">
            <div class="row">
            <div class="col-md-2">
                <img src="images/escudo.png" class="img-thumbnail"/></div>
                <div class="col-10">
                      <div class="row">
            <div class="col-3"><h4>APELLIDO PATERNO</h4></div>
            <div class="col-3"><h4>APELLIDO MATERNO</h4></div>
            <div class="col-4"><h4>NOMBRES</h4></div>
                </div>
                    <div class="row">
            <div class="col-3"><label id="Apaterno" runat="server">APELLIDO PATERNO</label></div>
            <div class="col-3"><label id="Amaterno" runat="server">APELLIDO MATERNO</label></div>
            <div class="col-4"><label id="Nombres" runat="server">NOMBRES</label></div>
                </div>
                     <div class="row">
                         <div class="col-12"><hr /></div>
                     </div>
            <div class="row">
            <div class="col-3"><h4>CICLO</h4></div>
            <div class="col-3"><h4>NIVEL</h4></div>
            <div class="col-3"><h4>GRUPO</h4></div>
                </div>
                     <div class="row">
            <div class="col-3"><label id="Ciclo" runat="server">CICLO</label></div>
            <div class="col-3"><label id="Nivel" runat="server">NIVEL</label></div>
            <div class="col-3"><label id="Grupo" runat="server">GRUPO</label></div>
                </div>
                    <div class="row">
                         <div class="col-12"><hr /></div>
                     </div>
            <div class="row">
                <div class="col-5">
                    <h5>MATRICULA</h5> <asp:Label ID="lblMatricula" runat="server"></asp:Label>
                </div>
                <div class="col-5">
                    <h6>FECHA DE REVISIÓN</h6><asp:Label ID="fecharev" runat="server"></asp:Label>
                </div>
            </div>
                    <div class="row">
                         <div class="col-11">
                             Observaciones
                             <textarea id="TextObservas" class="form-control" runat="server" rows="5"></textarea>
                             </div>
                    </div>
        </div></div></div>
    </form>
</body>
</html>
