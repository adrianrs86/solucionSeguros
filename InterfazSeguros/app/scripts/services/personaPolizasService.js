angular.module('interfazSegurosApp').service('PersonaPolizasService', function($http){
    var base = "http://localhost:56330/api/";
    var urlCrear = base + "PersonaPoliza/Crear";
    var urlObtenerPorPersona = base + "PersonaPoliza/ObtenerPorPersona";

    this.crear = function(parametros){
        return $http({
            method: 'POST',
            url: urlCrear,
            data: parametros,
            headers:{'Content-Type' : 'application/json'}
        });
    }

    this.obtenerPorPersona = function(parametros){
        return $http({
            method: 'POST',
            url: urlObtenerPorPersona,
            data: parametros,
            headers:{'Content-Type' : 'application/json'}
        });
    }
});