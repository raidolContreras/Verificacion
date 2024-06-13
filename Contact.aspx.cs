using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            BuildGridView();
    }

    public void BuildGridView()
    {
        using (var context = new unimoVerInfoEntities())
        {
            var result = (from bvi in context.BitacoraVIs
                          .OrderByDescending(o => o.FECHA)
                          .Take(500)
                          select new
                          {
                              bvi.MATRICULA,
                              bvi.MOVIMIENTO,
                              bvi.FECHA
                          }).ToList();
            gv1.DataSource = result;
            gv1.DataBind();
        }
    }

    protected void BtnBuscar_Click(object sender, EventArgs e)
    {
        double mat = Convert.ToDouble(TxtBuscar.Text);
        using (var context = new unimoVerInfoEntities())
        {
            var result = (from bvi in context.BitacoraVIs
                          .Where(q=>q.MATRICULA == mat)
                          select new
                          {
                              bvi.MATRICULA,
                              bvi.MOVIMIENTO,
                              bvi.FECHA
                          }).ToList();
            gv1.DataSource = result;
            gv1.DataBind();
        }
    }
}