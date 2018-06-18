namespace WebApiSeguros.Datos.GestionPersonaPoliza
{
    using Modelo;
    using System.Collections.Generic;
    using System.Linq;

    public class PersonaPolizaRepositorio : IPersonaPolizaRepositorio
    {
        public bool Crear(Dominio.Dtos.PersonaPolizas.PersonaPolizas personaPoliza)
        {
            int filas = 0;
            using (var dbContext = new SegurosEntities())
            {
                var registro = new Modelo.PersonaPolizas()
                {
                    PersonaId = personaPoliza.PersonaId,
                    PolizaId = personaPoliza.PolizaId,
                    activo = 1
                };

                dbContext.PersonaPolizas.Add(registro);
                filas = dbContext.SaveChanges();
            }

            return filas > 0 ? true : false;
        }

        public List<Dominio.Dtos.PersonaPolizas.PersonaPolizaRegistro> ObtenerPorPersona(string personaId)
        {
            var lista = new List<Dominio.Dtos.PersonaPolizas.PersonaPolizaRegistro>();
            using (var dbContext = new SegurosEntities())
            {
                lista = (from p in dbContext.PersonaPolizas
                         join po in dbContext.Polizas on p.PolizaId equals po.Id
                         where p.PersonaId == personaId
                         select new Dominio.Dtos.PersonaPolizas.PersonaPolizaRegistro()
                         {
                             Id = p.Id,
                             NombrePoliza = po.Nombre
                         }).ToList();
            }

            return lista;
        }
    }
}
