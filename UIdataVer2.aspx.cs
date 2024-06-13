using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Spatial;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class UIdataVer2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Multiview1.SetActiveView(view1);
            LlenaControlEstados(ddlEdoNac);
            LlenaControlNacionalidad(ddlNacionalidad);
            LlenaControlPais(ddlPais);
            ddlNacionalidad.SelectedValue = "México"; 
            ddlPais.SelectedValue = "42";//42 es el ID de México para el valor por defecto
            LlenaControlEstados(ddlEstado);
            LlenaControlEstados(ddlLugarEscolaridad);
            LlenaControlPlantel();
            btnEnviaErr.Enabled = false;
            btnGuardar.Enabled = false;
        }
    }

    private void LlenaControlPlantel()
    {
        using (var context = new unimoVerInfoEntities())
        {
            List<plantel> Listaplantel = (from p in context.plantels
                                          select p).GroupBy(m => new { m.nombre_plantel, m.id_plantel })
                                           .Select(g => g.FirstOrDefault())
                                           .Where(w => w.activo == 1)
                                           .ToList();
            ddlPlantel.DataSource = Listaplantel;
            ddlPlantel.DataTextField = "nombre_plantel";
            ddlPlantel.DataValueField = "id_plantel";
            ddlPlantel.DataBind();
        }
    }
    private void LlenaControlPais(DropDownList dropDownList)
    {
        using (var context = new unimoVerInfoEntities())
        {
            List<pai> Listapai = (from p in context.pais
                                  select p).GroupBy(m => new { m.pais, m.id_pais })
                                           .Select(g => g.FirstOrDefault())
                                           .ToList();
            dropDownList.DataSource = Listapai;
            dropDownList.DataTextField = "Pais";
            dropDownList.DataValueField = "id_Pais";
            dropDownList.DataBind();
        }
    }

    private void LlenaControlNacionalidad(DropDownList dropDownList)
    {
        using (var context = new unimoVerInfoEntities())
        {
            List<pai> Listapai = (from p in context.pais
                                  select p).GroupBy(m => new { m.pais, m.id_pais })
                                           .Select(g => g.FirstOrDefault())
                                           .ToList();
            dropDownList.DataSource = Listapai;
            dropDownList.DataTextField = "Pais";
            dropDownList.DataValueField = "Pais";
            dropDownList.DataBind();
        }
    }

    private void LlenaControlEstados(DropDownList dropDownList)
    {
        using (var context = new unimoVerInfoEntities())
        {
            List<estado> ListaEstados = (from estado in context.estadoes
                                         select estado).GroupBy(n => new { n.edoGES })
                                           .Select(g => g.FirstOrDefault())
                                           .OrderBy(n => n.edoGES)
                                           .ToList();
            dropDownList.DataSource = ListaEstados;
            dropDownList.DataTextField = "edoGES";
            dropDownList.DataValueField = "edoGES";
            dropDownList.DataBind();
        }
    }

    public DateTime FormatoFecha(string fecha)
    {
        string result = fecha.ToString().Substring(6, 4) + "/"; //AÑO
        result += fecha.ToString().Substring(3, 2) + "/"; //MES
        result += fecha.ToString().Substring(0, 2); //DIA

        return Convert.ToDateTime(result);
    }
    protected void btnCargar_Click(object sender, EventArgs e)
    {
        LimpiarFormulario(0);
        double matricula = 0;
        DateTime fechaIngreso;
        DateTime fechaCumple;
        try
        {
            matricula = Convert.ToDouble(txtMatricula.Text);
            using (var context = new unimoVerInfoEntities())
            {
                var query = context.dataVer1
                        .Where(a => a.MATRICULA == matricula)
                        .FirstOrDefault<dataVer1>();
                if (query.MATRICULA.ToString() != string.Empty)
                {
                    lblMatricula.Attributes.Add("class", "alert alert-success");
                    lblMatricula.Text = "Matricula válida.";
                }
                hfNumeroAlu.Value = query.NUMEROALUMNO.ToString();
                cvApaterno.ValueToCompare = query.PATERNO;
                cvAMterno.ValueToCompare = query.MATERNO;
                cvNombres.ValueToCompare = query.NOMBRE;
                fechaCumple = (DateTime)query.FECHA_NACIMIENTO;
                cvFechaNac.ValueToCompare = fechaCumple.ToString("dd/MM/yyyy");
                cvLugarNac.ValueToCompare = query.LUGAR_NACIMIENTO;
                cvEstadoNac.ValueToCompare = query.ESTADO_NACIMIENTO;
                cvNacionalidad.ValueToCompare = query.NACIONALIDAD;
                cvPlantel.ValueToCompare = query.PLANTEL.ToString();
                cvClave.ValueToCompare = query.CLAVE_CIUDADANA;
                cvNivel.ValueToCompare = query.NIVEL;
                cvSemestre.ValueToCompare = query.GRADO.ToString();
                cvCiudad.ValueToCompare = query.CIUDAD;
                cvEstado.ValueToCompare = query.ESTADO;
                cvCP.ValueToCompare = query.CP;
                cvddlPais.ValueToCompare = query.PAIS.ToString();
                cvTelPar.ValueToCompare = query.TELEFONO;
                cvMovil.ValueToCompare = query.CELULAR;
                cvCorreo.ValueToCompare = query.EMAIL;
                cvEduProcede.ValueToCompare = query.ESCUELA_PROCEDENCIA;
                cvEduLugar.ValueToCompare = query.ESTADO_ESCOLARIDAD;
                cvEdoCivil.ValueToCompare = query.ESTADO_CIVIL;
                fechaIngreso = (DateTime)query.FECHA_INGRESO;
                cvFechaIngreso.ValueToCompare = fechaIngreso.ToString("dd/MM/yyyy");
                cvGenero.ValueToCompare = query.GENERO;
                cvCalle.ValueToCompare = query.CALLE;
                cvNumExt.ValueToCompare = query.NUMEXT;
                cvNumInt.ValueToCompare = query.NUMINT;
                cvColonia.ValueToCompare = query.COLONIA;
                cvddlPais.ValueToCompare = query.PAIS.ToString();
                cvCodigoGrupo.ValueToCompare = query.CODIGOGRUPO;
                cvCiclo.ValueToCompare = query.CICLO;
                btnEnviaErr.Enabled = true;
                btnGuardar.Enabled = true;
            }
        }
        catch (SystemException ex)
        {
            lblMatricula.Attributes.Add("class", "alert alert-danger");
            lblMatricula.Text = ex.Message;
            return;
        }
        finally
        {
        }

    }



    protected void LimpiarFormulario(int opcion)
    {
        if (opcion == 1)
        {
            txtMatricula.Text = string.Empty;
            hfNumeroAlu.Value = string.Empty;
        }
        txtAMaterno.Text = string.Empty;
        txtApaterno.Text = string.Empty;
        txtCiudad.Text = string.Empty;
        txtClave.Text = string.Empty;
        txtCorreo.Text = string.Empty;
        txtCP.Text = string.Empty;
        txtCiudad.Text= string.Empty;
        txtCalle.Text = string.Empty;
        txtNumExt.Text= string.Empty;
        txtNumInt.Text = string.Empty;
        txtColonia.Text= string.Empty;
        txtCodigoGrupo.Text= string.Empty;
        txtCiclo.Text= string.Empty;
        ddlPais.SelectedIndex = -1;
        ddlEstado.SelectedIndex = -1;
        ddlEdoNac.SelectedIndex = -1;
        ddlNacionalidad.SelectedValue = "México";
        ddlEdoCivil.SelectedIndex = -1;
        ddlPlantel.SelectedIndex = -1;
        txtFechaIngreso.Text = string.Empty;
        txtFechaNac.Text = string.Empty;
        txtLugarNac.Text = string.Empty;
        txtLugarNac.Text = string.Empty;
        txtMovil.Text = string.Empty;
        txtNivel.Text = string.Empty;
        txtNombres.Text = string.Empty;
        txtSemestre.Text = string.Empty;
        txtTelPar.Text = string.Empty;
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        
        using (var context = new unimoVerInfoEntities())
        {
            var dv2 = new dataVer2()
            {
                NUMEROALUMNO = Convert.ToDouble(hfNumeroAlu.Value),
                NOMBRE = txtNombres.Text,
                PATERNO = txtApaterno.Text,
                MATERNO = txtAMaterno.Text,
                MATRICULA = Convert.ToDouble(txtMatricula.Text),
                FECHA_NACIMIENTO = FormatoFecha(txtFechaNac.Text),
                CLAVE_CIUDADANA = txtClave.Text,
                NIVEL = txtNivel.Text,
                GRADO = Convert.ToDouble(txtSemestre.Text),
                CALLE = txtCalle.Text,
                NUMEXT = txtNumExt.Text,
                NUMINT = txtNumInt.Text,
                COLONIA = txtColonia.Text,
                CIUDAD = txtCiudad.Text,
                ESTADO = ddlEstado.Text,
                PAIS = Convert.ToInt16(ddlPais.SelectedValue),
                CP = txtCP.Text,
                TELEFONO = txtTelPar.Text,
                CELULAR = txtMovil.Text,
                ESTADO_CIVIL = ddlEdoCivil.SelectedItem.Value,
                GENERO = ddlGenero.SelectedValue,
                EMAIL = txtCorreo.Text,
                LUGAR_NACIMIENTO = txtLugarNac.Text,
                ESTADO_NACIMIENTO = ddlEdoNac.SelectedValue,
                ESCUELA_PROCEDENCIA = txtEduProcede.Text,
                ESTADO_ESCOLARIDAD = ddlLugarEscolaridad.SelectedItem.Value,
                FECHA_INGRESO = FormatoFecha(txtFechaIngreso.Text),
                NACIONALIDAD = ddlNacionalidad.SelectedItem.Text,
                CODIGOGRUPO = txtCodigoGrupo.Text,
                FECHAREVISION = System.DateTime.Now,
                PLANTEL = Convert.ToInt16(ddlPlantel.SelectedValue),
                CICLO = txtCiclo.Text
            };

            context.Entry(dv2).State = System.Data.Entity.EntityState.Added;
            context.dataVer2.Add(dv2);


            try
            {
                context.SaveChanges();
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp("Se envió la 2da Revisión Exitósa",
                    Convert.ToDouble(txtMatricula.Text),
                    Convert.ToDouble(hfNumeroAlu.Value),
                    DateTime.Now);
                LimpiarFormulario(1);
                lblMatricula.Attributes.Add("class", "alert alert-success");
                lblMatricula.Text = "Registro enviado para actualizar";
            }
            catch (SystemException ex)
            {
                lblMatricula.Text = ex.Message;
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp(ex.Message,
                    Convert.ToDouble(txtMatricula.Text),
                    Convert.ToDouble(hfNumeroAlu.Value),
                    DateTime.Now);
            }
        }
    }

    protected void btnEnviaErr_Click(object sender, EventArgs e)
    {
        using (var context = new unimoVerInfoEntities())
        {
            var dv2Err = new dataVer2ERR()
            {
                NUMEROALUMNO = Convert.ToDouble(hfNumeroAlu.Value),
                NOMBRE = Convert.ToInt16(chkNombres.Checked),
                PATERNO = Convert.ToInt16(chkApaterno.Checked),
                MATERNO = Convert.ToInt16(chkAMaterno.Checked),
                FECHA_NACIMIENTO = Convert.ToInt16(chkFechaNac.Checked),
                CLAVE_CIUDADANA = Convert.ToInt16(chkClave.Checked),
                NIVEL = Convert.ToInt16(chkNivel.Checked),
                GRADO = Convert.ToInt16(chkSemestre.Checked),
                CALLE = Convert.ToInt16(chkCalle.Checked),
                NUMEXT = Convert.ToInt16(chkNumExt.Checked),
                NUMINT = Convert.ToInt16(chkNumInt.Checked),
                COLONIA = Convert.ToInt16(chkColonia.Checked),
                PAIS = Convert.ToInt16(chkPais.Checked),
                CIUDAD = Convert.ToInt16(chkCiudad.Checked),
                ESTADO = Convert.ToInt16(chkEstado.Checked),
                CP = Convert.ToInt16(chkCP.Checked),
                TELEFONO = Convert.ToInt16(chkTelefono.Checked),
                CELULAR = Convert.ToInt16(chkMovil.Checked),
                ESTADO_CIVIL = Convert.ToInt16(chkEstado.Checked),
                GENERO = Convert.ToInt16(chkGenero.Checked),
                EMAIL = Convert.ToInt16(chkCorreo.Checked),
                LUGAR_NACIMIENTO = Convert.ToInt16(chkLugarNac.Checked),
                ESTADO_NACIMIENTO = Convert.ToInt16(chkEdoNac.Checked),
                ESCUELA_PROCEDENCIA = Convert.ToInt16(chkProcede.Checked),
                ESTADO_ESCOLARIDAD = Convert.ToInt16(chkLugarEdu.Checked),
                FECHA_INGRESO = Convert.ToInt16(chkFechaIngreso.Checked),
                NACIONALIDAD = Convert.ToInt16(chkFechaNac.Checked),
                PLANTEL = Convert.ToInt16(chkPlantel.Checked),
                CICLO = Convert.ToInt16(chkCiclo.Checked),
                CODIGOGRUPO = Convert.ToInt16(chkCodigoGrupo.Checked),
                TIMESTAMP = System.DateTime.Now
            };
            context.Entry(dv2Err).State = System.Data.Entity.EntityState.Added;
            context.dataVer2ERR.Add(dv2Err);

            try
            {
                context.SaveChanges();
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp("Información marcada como incorrecta, se regreso a 1era revisión",
                    Convert.ToDouble(txtMatricula.Text),
                    Convert.ToDouble(hfNumeroAlu.Value),System.DateTime.Now);
                LimpiarFormulario(1);
                LimpiarChksErroneos();
                lblMatricula.Attributes.Add("class", "alert alert-success");
                lblMatricula.Text = "Registro enviado a Erroneos";
            }
            catch (SystemException ex)
            {
                lblMatricula.Text = ex.Message;
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp(ex.Message,
                    Convert.ToDouble(txtMatricula.Text),
                    Convert.ToDouble(hfNumeroAlu.Value),System.DateTime.Now);
            }
        }
    }


    private void LimpiarChksErroneos()
    {
        chkAMaterno.Checked = false;
        chkApaterno.Checked = false;
        chkCalle.Checked = false;
        chkCiclo.Checked = false;
        chkCiudad.Checked = false;
        chkClave.Checked = false;
        chkCodigoGrupo.Checked = false;
        chkColonia.Checked = false;
        chkCorreo.Checked = false;
        chkCP.Checked = false;
        chkEdoCivil.Checked = false;
        chkEdoNac.Checked = false;
        chkEstado.Checked = false;
        chkFechaIngreso.Checked = false;
        chkFechaNac.Checked = false;
        chkGenero.Checked = false;
        chkLugarEdu.Checked = false;
        chkLugarNac.Checked = false;
        chkMovil.Checked = false;
        chkNacionalidad.Checked = false;
        chkNivel.Checked = false;
        chkNombres.Checked = false;
        chkNumExt.Checked = false;
        chkNumInt.Checked = false;
        chkPais.Checked = false;
        chkPlantel.Checked = false;
        chkProcede.Checked = false;
        chkSemestre.Checked = false;
        chkTelefono.Checked = false;
    }

    protected void btnAcceso_Click(object sender, EventArgs e)
    {
        if (txtClaveAcc.Text == "unimo")
        {
            Multiview1.SetActiveView(view2);
        }
    }

    protected void ListaIncorrectos_Click(object sender, EventArgs e)
    {
        Multiview1.SetActiveView(view3);
    }

  
}