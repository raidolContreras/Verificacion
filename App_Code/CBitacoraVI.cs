using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Spatial;
using System.Data.Entity.Validation;

/// <summary>
/// Descripción breve de CBitacoraVI
/// Clase para definir los Métodos y enviar la inforamación a la Base de Datos
/// </summary>
public class CBitacoraVI
{
    public CBitacoraVI()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public void EnviarOp(string movimiento, double matricual, double numeroalumno, DateTime fecha)
    {
        string ruta = HttpContext.Current.Server.MapPath("logs.txt");
        using (var context = new unimoVerInfoEntities())
        {
            var bvi = new BitacoraVI()
            {
                NUMEROALUMNO = numeroalumno,
                MATRICULA = matricual,
                MOVIMIENTO = movimiento,
                FECHA = fecha
            };
            context.Entry(bvi).State = System.Data.Entity.EntityState.Added;
            context.BitacoraVIs.Add(bvi);
            try
            {
                context.SaveChanges();
            }
            catch (System.Exception ex)
            {
                
                System.IO.StreamWriter wr = new System.IO.StreamWriter(ruta);
                wr.WriteLine(ex.Message + " ["+ "Datos] " + ex.Data);
                wr.Close();
                wr.Dispose();
            }
        }
    }
}