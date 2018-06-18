'use strict';

/**
 * @ngdoc overview
 * @name interfazSegurosApp
 * @description
 * # interfazSegurosApp
 *
 * Main module of the application.
 */
angular
  .module('interfazSegurosApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      })
      .when('/personaPoliza', {
        templateUrl: 'views/personaPoliza.html',
        controller: 'PersonaPolizaCtrl',
        controllerAs: 'personaPoliza'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
