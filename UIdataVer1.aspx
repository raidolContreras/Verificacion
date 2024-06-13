<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UIdataVer1.aspx.cs" Inherits="UIdataVer1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(800, function(){
        $(this).remove(); 
    });
}, 5000);
</script>
    <br />
     <h3>Primera Verificación de Datos<asp:HiddenField ID="hfNumeroAlu" runat="server" /></h3>
    <asp:MultiView ID="Multiview1" runat="server">
        <asp:View ID="view1" runat="server">
            <div class="row">
                <div class="col-md-2">Clave de Acceso</div>
                <div class="col-md-4"><asp:TextBox ID="txtClaveAcc" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></div>
                <div class="col-md-2"><asp:Button ID="btnAcceso" runat="server" CssClass="btn" Text="Aceptar" OnClick="btnAcceso_Click"/></div>
            </div>
        </asp:View>
         <asp:View ID="view2" runat="server">
        <div class="row">
        <div class="col-md-2">
            <asp:Button id="ListaIncorrectos" runat="server" CssClass="btn btn-dark" Text="Lista de Incorrectos" OnClick="ListaIncorrectos_Click" CausesValidation="False"/>
        </div>
    </div>
    <br />
        <div class="row">
            <div class="col-md-2">
            <label>Matricula</label></div>
            <div class="col-md-2">
                <asp:TextBox runat="server" ID="txtMatricula" CssClass="form-control" autocomplete="off"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnCargar" runat="server" Text="Validar" CssClass="btn" OnClick="btnCargar_Click" CausesValidation="False"/>
            </div>
            <div class="col-md-5"><asp:label runat="server" id="lblMatricula"></asp:label>
            </div>
      </div>
       <br />
        <div class="row">
            <div class="col-md-2">
            <label>Apellido Paterno</label></div>
            <div class="col-md-2">
                <asp:TextBox runat="server" ID="txtApaterno" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:CompareValidator ID="cvApaterno" runat="server" ControlToValidate="txtApaterno" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-md-5"><label runat="server" id="lblAPaternoC"></label></div>
      </div>
    <br />
    <div class="row">
            <div class="col-md-2">
            <label>Apellido materno</label></div>
            <div class="col-md-2">
                <asp:TextBox runat="server" ID="txtAMaterno" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:CompareValidator ID="cvAMterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator></div>
            <div class="col-md-5"><label class="" runat="server" id="Label1"></label></div>
      </div><br />
        <div class="row">
            <div class="col-sm-2">
                 <label>Nombres</label>
            </div>
            <div class="col-sm-2">
                <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvNombres" runat="server" ControlToValidate="txtNombres" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblNombres"></label></div>
        </div>
    <br />
     <div class="row">
            <div class="col-sm-2">
                 <label>Fecha de Nacimiento</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtFechaNac" CssClass="form-control" autocomplete="off"></asp:TextBox>
                <ajaxToolkit:MaskedEditExtender ID="Mascara2" TargetControlID="txtFechaNac" runat="server" Mask="99/99/9999" MaskType="Date" InputDirection="LeftToRight" BehaviorID="txtFechaNax_MaskExtended"/>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvFechaNac" runat="server" ControlToValidate="txtFechaNac" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblFechaNac"></label></div>
        </div>
    <br />
     <div class="row">
            <div class="col-sm-2">
                 <label>Lugar de Nacimiento</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtLugarNac" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvLugarNac" runat="server" ControlToValidate="txtLugarNac" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblLugarNac"></label></div>
        </div>
    <br />

    <div class="row">
            <div class="col-sm-2">
                 <label>Estado de Nacimiento</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlEdoNac" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvEstadoNac" runat="server" ControlToValidate="ddlEdoNac" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblEdoNac"></label></div>
        </div>
    <br />
    <div class="row">
            <div class="col-sm-2">
                 <label>Nacionalidad</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlNacionalidad" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="Label2"></label></div>
        </div>
    <br />

        <div class="row">
            <div class="col-sm-2">
                 <label>CURP o Clave</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtClave" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvClave" runat="server" ControlToValidate="txtClave" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblCurp"></label></div>
        </div>
    <br />

        <div class="row">
            <div class="col-sm-2">
                 <label>Plantel</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlPlantel" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
             <div class="col-sm-3">
                <asp:CompareValidator ID="cvPlantel" runat="server" ControlToValidate="ddlPlantel" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblPlantel"></label></div>
        </div>
    <br />
        <div class="row">
            <div class="col-sm-2">
                 <label>Nivel</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtNivel" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                 <div class="col-sm-2">
                <asp:CompareValidator ID="cvNivel" runat="server" ControlToValidate="txtNivel" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblNivel"></label></div>
        </div>
    <br />
              <div class="row">
            <div class="col-sm-2">
                 <label>Codigo Grupo</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtCodigoGrupo" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                 <div class="col-sm-2">
                <asp:CompareValidator ID="cvCodigoGrupo" runat="server" ControlToValidate="txtCodigoGrupo" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="Label5"></label></div>
        </div>
    <br />
        <div class="row">
            <div class="col-sm-2">
                 <label>Semestre</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtSemestre" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                 <div class="col-sm-2">
                <asp:CompareValidator ID="cvSemestre" runat="server" ControlToValidate="txtSemestre" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblSemestre"></label></div>
        </div>
        <br />
              <div class="row">
            <div class="col-sm-2">
                 <label>Ciclo</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtCiclo" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:MaskedEditExtender ID="MaskExt3" BehaviorID="txtCiclo_MaxExt3" TargetControlID="txtCiclo" runat="server" Mask="9999/9999" ClearMaskOnLostFocus="false"/>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvCiclo" runat="server" ControlToValidate="txtCiclo" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="Label6"></label></div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-2">
                 <label>Institución Educativa de Procedencia</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtEduProcede" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                 <div class="col-sm-2">
                <asp:CompareValidator ID="cvEduProcede" runat="server" ControlToValidate="txtEduProcede" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblProcede"></label></div>
        </div>
    <br />

    <div class="row">
            <div class="col-sm-2">
                 <label>Lugar donde se curso el grado de estudios</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlLugarEscolaridad" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-sm-3">
                 <div class="col-sm-2">
                <asp:CompareValidator ID="cvEduLugar" runat="server" ControlToValidate="ddlLugarEscolaridad" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblLugar"></label></div>
        </div>
    <br />
        <div class="row">
            <div class="col-sm-2">
                 <label>Domicilio</label>
            </div>
            <div class="col-sm-10">
         <asp:label runat="server" ID="lblDomicilio" CssClass="form-control"></asp:label>
            </div>
        </div>
    <br />
               <div class="row">
            <div class="col-sm-3">
                <label>Calle</label>
                <asp:TextBox runat="server" ID="txtCalle" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                 <label>Número Exterior</label>
            <asp:TextBox runat="server" ID="txtNumExt" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                 <label>Número Interior</label>
                 <asp:TextBox runat="server" ID="txtNumInt" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <label>Colonia</label>
                 <asp:TextBox runat="server" ID="txtColonia" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    <br />
               <div class="row">
            <div class="col-sm-2">
                 <label>Pais</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlPais" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPais_SelectedIndexChanged"></asp:DropDownList>
            </div>
                 <div class="col-sm-3">
                <asp:CompareValidator ID="cvddlPais" runat="server" ControlToValidate="ddlPais" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="Label4"></label></div>
        </div>
             <br />
            <div class="row">
            <div class="col-sm-2">
                 <label>Estado</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
                 <div class="col-sm-3">
                <asp:CompareValidator ID="cvEstado" runat="server" ControlToValidate="ddlEstado" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblEstado"></label></div>
        </div>
    <br />
              <div class="row">
            <div class="col-sm-2">
                 <label>Ciudad</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control"></asp:TextBox>
            </div>
                 <div class="col-sm-3">
                <asp:CompareValidator ID="cvCiudad" runat="server" ControlToValidate="txtCiudad" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblCiudad"></label></div>
        </div>
    <br />
            <div class="row">
            <div class="col-sm-2">
                 <label>Código Postal</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtCP" CssClass="form-control"></asp:TextBox>
            </div>
                 <div class="col-sm-3">
                <asp:CompareValidator ID="cvCP" runat="server" ControlToValidate="txtCP" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblCP"></label></div>
        </div>
    <br />
            <div class="row">
            <div class="col-sm-2">
                 <label>Correo Electrónico</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblCorreo"></label></div>
        </div>
    <br />
            <div class="row">
            <div class="col-sm-2">
                 <label>Teléfono Particular</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtTelPar" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvTelPar" runat="server" ControlToValidate="txtTelPar" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblTelPar"></label></div>
        </div>
    <br />
            <div class="row">
            <div class="col-sm-2">
                 <label>Teléfono Movil</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtMovil" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvMovil" runat="server" ControlToValidate="txtMovil" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblMovil"></label></div>
        </div>
    <br />

            <div class="row">
            <div class="col-sm-2">
                 <label>Estado Civil</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlEdoCivil" runat="server" CssClass="form-control">
                    <asp:ListItem>SELECCIONA VALOR</asp:ListItem>
                    <asp:ListItem Value="S">SOLTERO</asp:ListItem>
                    <asp:ListItem Value="C">CASADO</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-sm-3">
                <asp:CompareValidator ID="cvEdoCivil" runat="server" ControlToValidate="ddlEdoCivil" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblTelTrabajo"></label></div>
        </div>
    <br />
                <div class="row">
            <div class="col-sm-2">
                 <label>Genero</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlGenero" runat="server" CssClass="form-control">
                    <asp:ListItem>SELECCIONA VALOR</asp:ListItem>
                    <asp:ListItem Value="F">FEMENINO</asp:ListItem>
                    <asp:ListItem Value="M">MASCULINO</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-sm-3">
                 <asp:CompareValidator ID="cvGenero" runat="server" ControlToValidate="ddlGenero" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="Label3"></label></div>
        </div>
    <br />
            <div class="row">
            <div class="col-sm-2">
                 <label>Fecha de Ingreso</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtFechaIngreso" CssClass="form-control">
         </asp:TextBox>
                <%--<ajaxToolkit:CalendarExtender ID="Calendar_Extender_2" runat="server" BehaviorID="txtFechaIngreso_Calendar" TargetControlID="txtFechaIngreso" Format="dd/MM/yyyyy" />--%>
                <ajaxToolkit:MaskedEditExtender ID="Mascara1" TargetControlID="txtFechaIngreso" runat="server" Mask="99/99/9999" MaskType="Date" InputDirection="LeftToRight" BehaviorID="txtFechaI_MaskExtended" UserDateFormat="DayMonthYear"/>
            </div>
            <div class="col-sm-3">
                 <asp:CompareValidator ID="cvFechaIngreso" runat="server" ControlToValidate="txtFechaIngreso" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-5"><label class="" runat="server" id="lblFechaIngreso"></label></div>
        </div>
    <br />
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-2">
        </div>
        <div class="col-md-2">
            <asp:Button Text="Guardar" ID="btnGuardar" ToolTip="Guardar Gambios" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" CausesValidation="False" Enabled="False"/>
        </div>
        <div class="col-md-4">
        </div>
    </div>
             </asp:View>
        <asp:View ID="view3" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" DataKeyNames="NUMEROALUMNO" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">

                        <Columns>
                            <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True" SelectText="Revisar de nuevo" />
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

