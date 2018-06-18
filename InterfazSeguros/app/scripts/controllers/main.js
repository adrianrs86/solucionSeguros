'use strict';

/**
 * @ngdoc function
 * @name interfazSegurosApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the interfazSegurosApp
 */
angular.module('interfazSegurosApp')
  .controller('MainCtrl', function ($scope, $filter, PolizaService) {
    
    $scope.polizas = [];

    $scope.cubrimientos = [
        {text:"Terremoto", value: 1},{text:"Incendio", value: 2},{text:"Robo", value: 3},{text:"Pérdida", value: 4}
      ];

    $scope.riesgos = [
        {text:"Alto", value: 1},{text:"Medio-Alto", value: 2},{text:"Medio", value: 3},{text:"Bajo", value: 4}
      ];
      
      function obtenerModeloPoliza(){
        var modelo = {
          id:"",
          nombre:"",
          descripcion:"",
          tipoCubrimiento:"",
          cubrimiento:"",
          porcentajeCobertura:"",
          inicioVigencia:"",
          periodoCobertura:"",
          precio:"",
          tipoRiesgo:"",
          riesgo:""
        };

        return modelo;
      }

    function consultarPolizas(){
      PolizaService.obtenerTodo().then(function(respuesta, estado){
        if(respuesta.status === 200){
          $scope.polizas = respuesta.data;
        }
      });
    }

    $scope.editar = function(indice){
      var registro = $scope.polizas[indice];
      var cubrimiento = $filter('filter')($scope.cubrimientos, {value: registro.CodigoTipoCubrimiento}, true);
      var riesgo = $filter('filter')($scope.riesgos, {value: registro.CodigoTipoRiesgo}, true);

      $scope.modeloPoliza.id = registro.Id;
      $scope.modeloPoliza.nombre = registro.Nombre;
      $scope.modeloPoliza.descripcion = registro.Descripcion;
      $scope.modeloPoliza.cubrimiento = cubrimiento[0];
      $scope.modeloPoliza.porcentajeCobertura = registro.PorcentajeCobertura;
      $scope.modeloPoliza.inicioVigencia = new Date(registro.Vigencia);
      $scope.modeloPoliza.periodoCobertura = registro.PeriodoCobertura;
      $scope.modeloPoliza.precio = registro.Precio;
      $scope.modeloPoliza.riesgo = riesgo[0];
    }

    $scope.eliminar = function(indice){
      var registro = $scope.polizas[indice];
      PolizaService.eliminar({"id": registro.Id}).then(function(respuesta){
        consultarPolizas();
      });
    }

    $scope.guardar = function(){
      if($scope.formPoliza.$valid){
        $scope.modeloPoliza.tipoCubrimiento = $scope.modeloPoliza.cubrimiento.value;
        $scope.modeloPoliza.tipoRiesgo = $scope.modeloPoliza.riesgo.value;
        if($scope.modeloPoliza.id == ""){
          crearPoliza();
        }else{
          actualizarPoliza();
        }
      }
    };

    function crearPoliza(){
      PolizaService.crear($scope.modeloPoliza).then(function(respuesta){
        ValidarRespuesta(respuesta)
      });
    }

    function actualizarPoliza(){
      PolizaService.actualizar($scope.modeloPoliza).then(function(respuesta){
        ValidarRespuesta(respuesta)
      });
    }
    
    function ValidarRespuesta(respuesta){
      if(respuesta.status === 200){
        if(respuesta.data.Valido){
          consultarPolizas();
        }else{
          alert(respuesta.data.MensajeError);
        }
      }
    }

    $scope.cancelar = function(){
      $scope.modeloPoliza = obtenerModeloPoliza();
    }

    function init(){
      consultarPolizas();
      $scope.modeloPoliza = obtenerModeloPoliza();
    }

    init();

  });
