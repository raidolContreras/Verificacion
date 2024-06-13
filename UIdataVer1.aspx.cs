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


public partial class UIdataVer1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            Multiview1.SetActiveView(view1);
            LlenaControlPais(ddlNacionalidad);
            LlenaControlEstados(ddlEdoNac);
            LlenaControlPais(ddlPais);
            ddlNacionalidad.SelectedValue = "42";
            ddlPais.SelectedValue = "42";
            LlenaControlEstados(ddlEstado);
            LlenaControlEstados(ddlLugarEscolaridad);
            LlenaControlPlantel();
            BindGrid();
        }
    }

    public void BindGrid()
    {
        using (var context = new unimoVerInfoEntities())
        {
            var result = (from dtr in context.dataVer2ERR
                         join dv1 in context.dataVer1
                         on dtr.NUMEROALUMNO equals dv1.NUMEROALUMNO
                         select new
                         {
                             dv1.NUMEROALUMNO,
                             dv1.MATRICULA,
                             dtr.NOMBRE,
                             dtr.PATERNO,
                             dtr.MATERNO,
                             dtr.NACIONALIDAD,
                             dtr.NIVEL,
                             dtr.CODIGOGRUPO,
                             dtr.PLANTEL,
                             dtr.TELEFONO,
                             dtr.CELULAR,
                             dtr.CLAVE_CIUDADANA,
                             dtr.CALLE,
                             dtr.NUMEXT,
                             dtr.NUMINT,
                             dtr.COLONIA,
                             dtr.CP,
                             dtr.EMAIL,
                             dtr.ESCUELA_PROCEDENCIA,
                             dtr.PAIS,
                             dtr.ESTADO,
                             dtr.CIUDAD,
                             dtr.ESTADO_CIVIL,
                             dtr.ESTADO_ESCOLARIDAD,
                             dtr.ESTADO_NACIMIENTO,
                             dtr.FECHA_INGRESO,
                             dtr.FECHA_NACIMIENTO,
                             dtr.GENERO,
                             SEMESTRE = dtr.GRADO,
                             dtr.LUGAR_NACIMIENTO
          
                         }).ToList();

            GridView1.DataSource = result;
            GridView1.DataBind();
        }
    }

    private void LlenaControlPlantel()
    {
        using (var context = new unimoVerInfoEntities())
        {
            List<plantel> Listaplantel = (from p in context.plantels
                                  select p).GroupBy(m => new { m.nombre_plantel, m.id_plantel })
                                           .Select(g => g.FirstOrDefault())
                                           .Where(w=> w.activo == 1)
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
                                         select p).GroupBy(m => new { m.pais,m.id_pais })
                                           .Select(g => g.FirstOrDefault())
                                           .ToList();
            dropDownList.DataSource = Listapai;
            dropDownList.DataTextField = "Pais";
            dropDownList.DataValueField = "id_Pais";
            dropDownList.DataBind();
        }
    }
    private void LlenaControlEstados(DropDownList dropDownList)
    {
        using (var context = new unimoVerInfoEntities())
        {
            List<estado> ListaEstados = (from estado in context.estadoes
                                         select estado)
                                           .GroupBy(n => new { n.edoGES })
                                           .Select(g => g.FirstOrDefault())
                                           //.Where(e => e.id_pais ==  idpais)
                                           .OrderBy(n => n.edoGES)
                                           .ToList();
            dropDownList.DataSource = ListaEstados;
            dropDownList.DataTextField = "edoGES";
            dropDownList.DataValueField = "edoGES";
            dropDownList.DataBind();
        }
    }

    protected bool erroneo(double num)
    {
        bool result = false;
        string t = "";
        using (var context = new unimoVerInfoEntities())
        {
            var query = from q in context.dataVer2ERR
                        where q.NUMEROALUMNO == num
                        select q;
            foreach (dataVer2ERR dataVer2ERR in query)
            {
                t = dataVer2ERR.NUMEROALUMNO.ToString();
            }
            if (t != string.Empty)
            {
                result = true;
                lblMatricula.Attributes.Add("class", "alert alert-info");
                lblMatricula.Text = "Matricula en lista de ERRONEOS.";
            }
        }
        return result;
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
                var query = context.alumnosFromGES
                        .Where(a => a.MATRICULA == matricula)
                        .FirstOrDefault<alumnosFromGE>();
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
                lblDomicilio.Text = query.DOMICILIO;
                cvCiudad.ValueToCompare = query.CIUDAD;
                cvEstado.ValueToCompare = query.ESTADO;
                cvCP.ValueToCompare = query.CP;
                cvTelPar.ValueToCompare = query.TELEFONO;
                cvMovil.ValueToCompare = query.CELULAR;
                cvCorreo.ValueToCompare = query.EMAIL;
                cvEduProcede.ValueToCompare = query.ESCUELA_PROCEDENCIA;
                cvEduLugar.ValueToCompare = query.ESTADO_ESCOLARIDAD;
                cvEdoCivil.ValueToCompare = query.ESTADO_CIVIL;
                fechaIngreso = (DateTime)query.FECHA_INGRESO;
                cvFechaIngreso.ValueToCompare = fechaIngreso.ToString("dd/MM/yyyy");
                cvGenero.ValueToCompare = query.GENERO;
                txtCodigoGrupo.Text = query.CODIGOGRUPO;
                cvCodigoGrupo.ValueToCompare = query.CODIGOGRUPO;
            }

            if(!erroneo(Convert.ToDouble(hfNumeroAlu.Value)))
            {
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

    protected void btnVerificar_Click(object sender, EventArgs e)
    {

        double matricula = 0;
        try
        {
            matricula = Convert.ToDouble(txtMatricula.Text);
            using (var context = new unimoVerInfoEntities())
            {
                var query = context.alumnosFromGES
                       .Where(a => a.MATRICULA == matricula)
                       .FirstOrDefault<alumnosFromGE>();
                if (query.PATERNO != txtApaterno.Text)
                {
                    lblAPaternoC.InnerText = "No coincide";
                    lblAPaternoC.Attributes.Add("class", "alert alert-warning");

                }
                else
                {
                    lblAPaternoC.InnerText = "";
                    lblAPaternoC.Attributes.Add("class", "");
                }
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
        if(opcion ==1)
            txtMatricula.Text = string.Empty;
        txtAMaterno.Text = string.Empty;
        txtApaterno.Text = string.Empty;
        txtCiudad.Text = string.Empty;
        txtClave.Text = string.Empty;
        txtCorreo.Text = string.Empty;
        txtCP.Text = string.Empty;
        lblDomicilio.Text = string.Empty;
        ddlEstado.SelectedIndex = -1;
        ddlEdoNac.SelectedIndex = -1;
        ddlNacionalidad.SelectedValue = "42";
        txtFechaIngreso.Text = string.Empty;
        txtFechaNac.Text = string.Empty;
        txtLugarNac.Text = string.Empty;
        txtLugarNac.Text = string.Empty;
        txtMovil.Text = string.Empty;
        txtNivel.Text = string.Empty;
        txtNombres.Text = string.Empty;
        ddlPlantel.SelectedIndex = -1;
        txtSemestre.Text = string.Empty;
        txtTelPar.Text = string.Empty;
        txtEduProcede.Text = string.Empty;
        txtCalle.Text = string.Empty;
        txtNumExt.Text = string.Empty;
        txtNumInt.Text = string.Empty;
        txtColonia.Text = string.Empty;
        txtCodigoGrupo.Text = string.Empty;
        ddlPlantel.SelectedIndex = -1;
        ddlPais.SelectedValue = "42";
        ddlEdoCivil.SelectedIndex = 0;
        ddlGenero.SelectedIndex = 0;
        txtCiclo.Text = string.Empty;
        btnGuardar.Enabled = false;
    }

    public DateTime FormatoFecha(string fecha)
    {
        string result = fecha.ToString().Substring(6, 4) + "/"; //AÑO
        result += fecha.ToString().Substring(3, 2) + "/" ; //MES
        result += fecha.ToString().Substring(0, 2); //DIA
        
        return Convert.ToDateTime(result);
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        using (var context = new unimoVerInfoEntities())
        {
            var dv1 = new dataVer1()
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
                //DOMICILIO = txtDomicilio.Text,
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
                PLANTEL = Convert.ToInt16(ddlPlantel.SelectedItem.Value),
                CODIGOGRUPO = txtCodigoGrupo.Text,
                CICLO = txtCiclo.Text,
                FECHAREVISION = System.DateTime.Now
            };

            context.Entry(dv1).State = System.Data.Entity.EntityState.Added;
            context.dataVer1.Add(dv1);
            try
            {
                context.SaveChanges();
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp("Se envió la 1era Revisión Exitosa",
                    Convert.ToDouble(txtMatricula.Text),
                    Convert.ToDouble(hfNumeroAlu.Value),
                    System.DateTime.Now);
                lblMatricula.Text = "Registro Almacenado con Éxito";
                lblMatricula.Attributes.Add("class", "alert alert-success");
                LimpiarFormulario(1);
            }
            catch (SystemException ex)
            {
                lblMatricula.Text = ex.Message;
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp(ex.Message,
                    Convert.ToDouble(txtMatricula.Text),
                    Convert.ToDouble(hfNumeroAlu.Value), System.DateTime.Now);
            }
            finally { }
        }
    }

    protected void btnAcceso_Click(object sender, EventArgs e)
    {
        if (txtClaveAcc.Text == "12345")
        {
            // FormatoFecha("15/02/1989");
            Multiview1.SetActiveView(view2);
        }
    }


    protected void ListaIncorrectos_Click(object sender, EventArgs e)
    {
        Multiview1.SetActiveView(view3);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int record = Convert.ToInt16(GridView1.SelectedValue);
        using (var context = new unimoVerInfoEntities())
        {
            var x = (from data in context.dataVer2ERR
                     where data.NUMEROALUMNO == record
                     select data).FirstOrDefault();
            context.dataVer2ERR.Remove(x);

            var y = (from data in context.dataVer1
                     where data.NUMEROALUMNO == record
                     select data).FirstOrDefault();
            context.dataVer1.Remove(y);
            try
            {
                context.SaveChanges();
                Multiview1.SetActiveView(view2);
                txtMatricula.Text = GridView1.SelectedRow.Cells[2].Text;
                BindGrid();
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp("Se Registro para NUEVA Revisión",
                    Convert.ToDouble(txtMatricula.Text),
                    Convert.ToDouble(GridView1.SelectedValue), System.DateTime.Now);
            }
            catch (Exception err)
            {
                lblMatricula.Text = err.Message;
                CBitacoraVI cBitacoraVI = new CBitacoraVI();
                cBitacoraVI.EnviarOp(err.Message,
                    Convert.ToDouble(txtMatricula.Text),
                    -1, System.DateTime.Now);
            }
        }
    }

    protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int id = Convert.ToInt16(ddlPais.SelectedValue);
        //LlenaControlEstados(ddlEstado, id);
    }
}