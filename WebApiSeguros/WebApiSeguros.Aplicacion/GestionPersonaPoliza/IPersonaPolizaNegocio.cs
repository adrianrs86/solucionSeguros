namespace WebApiSeguros.Aplicacion.GestionPersonaPoliza
{
    using System.Collections.Generic;
    public interface IPersonaPolizaNegocio
    {
        Dominio.Dtos.PersonaPolizas.RespuestaPersonaPolizas Crear(Dominio.Dtos.PersonaPolizas.PersonaPolizas personaPolizas);
        List<Dominio.Dtos.PersonaPolizas.PersonaPolizaRegistro> ObtenerPorPersona(string personaId);
        Dominio.Dtos.PersonaPolizas.RespuestaPersonaPolizas Eliminar(int id);
    }
}
