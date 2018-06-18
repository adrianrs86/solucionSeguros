angular.module('interfazSegurosApp').service('PolizaService', function($http){
    var base = "http://localhost:56330/api/"
    var urlObtenerPolizas = base + "Poliza/ObtenerTodo";
    var urlObtenerPolizasBasico = base + "Poliza/ObtenerBasico";
    var urlGuardarPoliza = base + "Poliza/Crear";
    var urlActualizarPoliza = base + "Poliza/Actualizar";
    var urlEliminarPoliza = base + "Poliza/Eliminar";

    this.obtenerTodo = function(){
        return $http({
            method: 'GET',
            url: urlObtenerPolizas,
            data: null,
            headers:{'Content-Type' : 'application/json'}
        });
    }

    this.obtenerBasico = function(){
        return $http({
            method: 'GET',
            url: urlObtenerPolizasBasico,
            data: null,
            headers:{'Content-Type' : 'application/json'}
        });
    }

    this.crear = function(parametros){
        return $http({
            method: 'POST',
            url: urlGuardarPoliza,
            data: parametros,
            headers:{'Content-Type' : 'application/json'}
        });
    }

    this.actualizar = function(parametros){
        return $http({
            method: 'PUT',
            url: urlActualizarPoliza,
            data: parametros,
            headers:{'Content-Type' : 'application/json'}
        });
    } 

    this.eliminar = function(parametros){
        return $http({
            method: 'DELETE',
            url: urlEliminarPoliza,
            data: parametros,
            headers:{'Content-Type' : 'application/json'}
        });
    }
})