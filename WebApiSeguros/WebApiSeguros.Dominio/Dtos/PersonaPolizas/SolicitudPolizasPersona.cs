namespace WebApiSeguros.Dominio.Dtos.PersonaPolizas
{
    using System.ComponentModel.DataAnnotations;
    using System.Runtime.Serialization;

    [DataContract(Name = "SolicitudPolizasPersona")]
    public class SolicitudPolizasPersona
    {
        [DataMember(Name = "personaId")]
        public string PersonaId { get; set; }
    }
}
