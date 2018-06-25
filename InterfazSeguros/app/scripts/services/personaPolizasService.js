angular.module('interfazSegurosApp').service('PersonaPolizasService', function($http){
    var base = "http://localhost:56330/api/";
    var urlCrear = base + "PersonaPoliza/Crear";
    var urlObtenerPorPersona = base + "PersonaPoliza/ObtenerPorPersona";
    var urlEliminar = base + "PersonaPoliza/Eliminar";

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

    this.eliminar = function(parametros){
        return $http({
            method: 'DELETE',
            url: urlEliminar,
            data: parametros,
            headers:{'Content-Type' : 'application/json'}
        });
    }
});