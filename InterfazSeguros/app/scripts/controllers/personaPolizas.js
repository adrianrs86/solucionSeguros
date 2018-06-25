'use strict';

/**
 * @ngdoc function
 * @name interfazSegurosApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the interfazSegurosApp
 */
angular.module('interfazSegurosApp')
  .controller('PersonaPolizaCtrl', function ($scope, PolizaService, PersonaPolizasService) {
    
    function obtenerModeloPersonaPoliza(){
      var modelo = {
        personaId: "",
        poliza: "",
        polizaId: ""
      };

      return modelo;
    }

    function consultarPolizas(){
      PolizaService.obtenerBasico().then(function(respuesta){
        if(respuesta.status === 200){
          $scope.polizas = respuesta.data;
        }
      });
    }

    function consultarPolizasPorPersona(personaId){
      PersonaPolizasService.obtenerPorPersona({"personaId": personaId}).then(function(resultado){
        $scope.polizasPersona = resultado.data;
      });
    }

    $scope.asignarPoliza = function(){
      if($scope.formAsignacionPoliza.$valid){
        $scope.modeloPersonPolizas.polizaId = $scope.modeloPersonPolizas.poliza.Id;
        PersonaPolizasService.crear($scope.modeloPersonPolizas).then(function(resultado){
          consultarPolizasPorPersona($scope.modeloPersonPolizas.personaId);
        });
      }
    };

    $scope.eliminar = function(indice){
      var registro = $scope.polizasPersona[indice];
      PersonaPolizasService.eliminar({"id": registro.Id}).then(function(respuesta){
        consultarPolizasPorPersona($scope.modeloPersonPolizas.personaId);
      });
    }

    function init(){
      consultarPolizas();
      $scope.modeloPersonPolizas = obtenerModeloPersonaPoliza();
    }

    init();
  });
