namespace WebApiSeguros.Aplicacion.GestionPoliza
{
    using System.Collections.Generic;
    using WebApiSeguros.Dominio.Dtos.Polizas;

    public interface IPolizaNegocio
    {
        RespuestaPoliza Crear(Poliza poliza);

        List<PolizasRegistros> ObtenerTodo();

        List<PolizaRegistroBasico> ObtenerBasico();

        RespuestaPoliza Actualizar(Poliza poliza);

        RespuestaPoliza Eliminar(int id);
    }
}
