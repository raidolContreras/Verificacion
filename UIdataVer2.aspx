<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UIdataVer2.aspx.cs" Inherits="UIdataVer2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(800, function(){
        $(this).remove(); 
    });
}, 5000);
</script>
    <br />
     <h3>Segunda Verificación de Datos<asp:HiddenField ID="hfNumeroAlu" runat="server" /></h3>
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
        </div>
    </div>
    <br />
        <p class="lead">
            <asp:label runat="server" id="lblMatricula"></asp:label>
            </p>
             <div class="row">
            <div class="col-md-2">
            <label>Matricula</label></div>
            <div class="col-md-2">
                <asp:TextBox runat="server" ID="txtMatricula" CssClass="form-control" autocomplete="off"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnCargar" runat="server" Text="Validar" CssClass="btn" OnClick="btnCargar_Click" CausesValidation="False"/>
            </div>
            <div class="col-md-5">
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
                <asp:CheckBox ID="chkApaterno" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-md-5">
                <asp:CompareValidator ID="cvApaterno" runat="server" ControlToValidate="txtApaterno" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
      </div>
    <br />
    <div class="row">
            <div class="col-md-2">
            <label>Apellido materno</label></div>
            <div class="col-md-2">
                <asp:TextBox runat="server" ID="txtAMaterno" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:CheckBox ID="chkAMaterno" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-md-5">
                <asp:CompareValidator ID="cvAMterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
      </div><br />
        <div class="row">
            <div class="col-sm-2">
                 <label>Nombres</label>
            </div>
            <div class="col-sm-2">
                <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                <asp:CheckBox ID="chkNombres" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvNombres" runat="server" ControlToValidate="txtNombres" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                <asp:CheckBox ID="chkFechaNac" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvFechaNac" runat="server" ControlToValidate="txtFechaNac" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                <asp:CheckBox ID="chkLugarNac" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvLugarNac" runat="server" ControlToValidate="txtLugarNac" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                <asp:CheckBox ID="chkEdoNac" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvEstadoNac" runat="server" ControlToValidate="ddlEdoNac" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                <asp:CheckBox ID="chkNacionalidad" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                <asp:CheckBox ID="chkClave" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvClave" runat="server" ControlToValidate="txtClave" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                 <asp:CheckBox ID="chkPlantel" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvPlantel" runat="server" ControlToValidate="ddlPlantel" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                     <asp:CheckBox ID="chkNivel" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvNivel" runat="server" ControlToValidate="txtNivel" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                <asp:CheckBox ID="chkCodigoGrupo" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5"><asp:CompareValidator ID="cvCodigoGrupo" runat="server" ControlToValidate="txtCodigoGrupo" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
</div>
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
                  <asp:CheckBox ID="chkSemestre" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvSemestre" runat="server" ControlToValidate="txtSemestre" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
        </div>
        <br />
               <div class="row">
            <div class="col-sm-2">
                 <label>Ciclo</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtCiclo" CssClass="form-control"></asp:TextBox>
                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" BehaviorID="txtCiclo_MaxExt3" TargetControlID="txtCiclo" runat="server" Mask="9999/9999" MaskType="None" ClearMaskOnLostFocus="False" />
            </div>
            <div class="col-sm-3">
                <asp:CheckBox ID="chkCiclo" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5"> <asp:CompareValidator ID="cvCiclo" runat="server" ControlToValidate="txtCiclo" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator></div>
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
                     <asp:CheckBox ID="chkProcede" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvEduProcede" runat="server" ControlToValidate="txtEduProcede" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
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
                               <asp:CheckBox ID="chkLugarEdu" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvEduLugar" runat="server" ControlToValidate="ddlLugarEscolaridad" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
        </div>
    <br />
        <div class="row">
            <div class="col-sm-3">
                 <label>Calle</label>
                <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:CheckBox ID="chkCalle" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
                <asp:CompareValidator ID="cvCalle" runat="server" ControlToValidate="txtCalle" ErrorMessage="*Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
           <div class="col-sm-3">
                 <label>Numero Exterior</label>
                <asp:TextBox ID="txtNumExt" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:CheckBox ID="chkNumExt" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
                <asp:CompareValidator ID="cvNumExt" runat="server" ControlToValidate="txtNumExt" ErrorMessage="*Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
            <div class="col-sm-3">
                 <label>Numero Interior</label>
                <asp:TextBox ID="txtNumInt" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:CheckBox ID="chkNumInt" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
                <asp:CompareValidator ID="cvNumInt" runat="server" ControlToValidate="txtNumInt" ErrorMessage="*Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
           <div class="col-sm-3">
                 <label>Colonia</label>
                <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:CheckBox ID="chkColonia" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
                <asp:CompareValidator ID="cvColonia" runat="server" ControlToValidate="txtColonia" ErrorMessage="*Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
            </div>
        </div>
    <br />
              <div class="row">
            <div class="col-sm-2">
                 <label>Pais</label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="ddlPais" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
                 <div class="col-sm-3">
                <asp:CheckBox ID="chkPais" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5"><asp:CompareValidator ID="cvddlPais" runat="server" ControlToValidate="ddlPais" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator></div>
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
                     <asp:CheckBox ID="chkEstado" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvEstado" runat="server" ControlToValidate="ddlEstado" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
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
                     <asp:CheckBox ID="chkCiudad" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvCiudad" runat="server" ControlToValidate="txtCiudad" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
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
                     <asp:CheckBox ID="chkCP" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvCP" runat="server" ControlToValidate="txtCP" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
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
                <asp:CheckBox ID="chkCorreo" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
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
                <asp:CheckBox ID="chkTelefono" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvTelPar" runat="server" ControlToValidate="txtTelPar" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
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
                <asp:CheckBox ID="chkMovil" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvMovil" runat="server" ControlToValidate="txtMovil" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
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
                <asp:CheckBox ID="chkEdoCivil" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvEdoCivil" runat="server" ControlToValidate="ddlEdoCivil" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
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
                 <asp:CheckBox ID="chkGenero" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvGenero" runat="server" ControlToValidate="ddlGenero" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                    </div>
        </div>
    <br />
            <div class="row">
            <div class="col-sm-2">
                 <label>Fecha de Ingreso</label>
            </div>
            <div class="col-sm-2">
         <asp:TextBox runat="server" ID="txtFechaIngreso" CssClass="form-control">
         </asp:TextBox>
                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderI" TargetControlID="txtFechaIngreso" runat="server" Mask="99/99/9999" MaskType="Date" BehaviorID="txtFechaI_MaskExtended"/>
            </div>
            <div class="col-sm-3">
                 <asp:CheckBox ID="chkFechaIngreso" runat="server" CssClass="form-check-input" Text="Marcar erroneo" />
            </div>
            <div class="col-sm-5">
                <asp:CompareValidator ID="cvFechaIngreso" runat="server" ControlToValidate="txtFechaIngreso" ErrorMessage="* Valor diferente" ForeColor="#FF9900"></asp:CompareValidator>
                </div>
        </div>
    <br />
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" Text="Guardar" ToolTip="Enviar Registro para Actualizar en Gestión Escolar" />
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnEnviaErr" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClick="btnEnviaErr_Click" Text="Enviar Erroneo" ToolTip="Enviar Errores para Próxima Validación" />
            <ajaxToolkit:ConfirmButtonExtender ID="confirm1" runat="server" BehaviorID="BConfirm1" ConfirmText="¿Seguro que desea enviar este registro como erroneo?" TargetControlID="btnEnviaErr" />
        </div>
        <div class="col-md-6">
        </div>
    </div>
             </asp:View>
        <asp:View ID="view3" runat="server">
            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

