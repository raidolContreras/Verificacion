using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listActualizar : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BuildGridView();
        }
    }

    public void BuildGridView()
    {
        using (var context = new unimoVerInfoEntities())
        {
            var result = (from dv2 in context.dataVer2
                          select new
                          {
                              dv2.MATRICULA,
                              dv2.PATERNO,
                              dv2.MATERNO,
                              dv2.NOMBRE,
                              dv2.CLAVE_CIUDADANA,
                              dv2.PLANTEL,
                              dv2.NIVEL,
                              dv2.GRADO,
                              dv2.NUMEROALUMNO
                          }).ToList();
            gv1.DataSource = result;
            gv1.DataBind();
        }
    }
}