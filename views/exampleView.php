<?php

	/**
	 * This file contains the logic to administer the
	 *	the example view. Use this as a guide for your
	 * 	other views.
	 */

	

	function exampleIndexView(){
		$app = $app = \Slim\Slim::getInstance();
		
		$mensaje = newExample();

		$empleados = getEmpleados();

		//print_r($empleados);

		$app->render('example.twig.html', array(
				'mensaje' => $mensaje,
				'empleados' => $empleados,
		));


	}


	function exampleNewView(){

	}


	function exampleDeleteView($id){

	}

	function exampleModifyView($id){

	}



?>