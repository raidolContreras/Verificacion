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

public partial class Etiquetas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            double NumeroAlu = Convert.ToDouble(Request.QueryString["_"]);
            using (var context = new unimoVerInfoEntities())
            {
                var query = context.dataVer2
                        .Where(a => a.NUMEROALUMNO == NumeroAlu)
                        .FirstOrDefault<dataVer2>();
                Amaterno.InnerText = query.MATERNO;
                Apaterno.InnerText = query.PATERNO;
                Nombres.InnerText = query.NOMBRE;
                Ciclo.InnerText = query.CICLO;
                Nivel.InnerText = query.NIVEL;
                Grupo.InnerText = query.CODIGOGRUPO;
                fecharev.Text = query.FECHAREVISION.ToString();
                lblMatricula.Text = query.MATRICULA.ToString();
            }
        }
        catch { }
    }
}