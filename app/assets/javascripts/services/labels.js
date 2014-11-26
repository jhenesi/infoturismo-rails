'use strict';

angular.module('infoturismoApp').service('labels',['$sce', function($sce) {
	return {
		
	 	//Labels vista General
	 	general: $sce.trustAsHtml('Observatorio'),
	 	
	 	//Labels Acceso al destino e infraestructura
	 	acceso: $sce.trustAsHtml('Acceso al Destino e Infraestructura'),
	 	senalamiento: $sce.trustAsHtml('Se&ntilde;alamiento'),
	 	opciones: $sce.trustAsHtml('Opciones'),
	 	calidad: $sce.trustAsHtml('Calidad'),
	 	mantenimiento: $sce.trustAsHtml('Matenimiento'),
	 	atencion: $sce.trustAsHtml('Atenci&oacute;n'),

	 	//Labels Atractivos y oferta turistica
	 	atractivos: $sce.trustAsHtml('Atractivos y Oferta Tur&iacute;stica'),
	 	atractivosServicios: $sce.trustAsHtml('Atractivos y Servicios'),
	 	atractivosConservacion: $sce.trustAsHtml('Conservacion de los atractivos'),
	 	atractivosVariedad: $sce.trustAsHtml('Variedad de los atractivos'),
	 	atractivosCalidad: $sce.trustAsHtml('Calidad de los atractivos'),
	 	atractivosCulturales: $sce.trustAsHtml('Conservacion de atractivos culturales'),
	 	atractivosNaturales: $sce.trustAsHtml('Conservacion de atractivos naturales'),

	 	//Labels Consumo
	 	consumo: $sce.trustAsHtml('Consumo de Servicios'),
	 	hospedaje: $sce.trustAsHtml('Hospedaje'),
	 	alimentacion: $sce.trustAsHtml('Alimentacion'),
		transporteEstacionamiento: $sce.trustAsHtml('Transporte y Estacionamiento'),
	 	hospedajePercepcion: $sce.trustAsHtml('Percepci&oacute;n General'),
		excursion: $sce.trustAsHtml('Servicios de excursion/turisticos'),
	 	hospedajeLimpieza: $sce.trustAsHtml('Limpieza'),
	 	hospedajeAtencion: $sce.trustAsHtml('Atención del personal'),
	    hospedajeEleccion: $sce.trustAsHtml('Facilidad de eleccion'),
	    alimentacionExperiencia: $sce.trustAsHtml('Experiencia del consumo de alimentos y bebidas'),
		alimentacionCalidad: $sce.trustAsHtml('Calidad de los alimentos y bebidas'),
		alimentacionLimpieza: $sce.trustAsHtml('Limpieza/Higiene'),
		serviciosExcursion: $sce.trustAsHtml('Servicios de excursion/turisticos'),
		serviciosCalidad: $sce.trustAsHtml('calidad de los servicios de excursion/turisticos'),
		serviciosAtencion: $sce.trustAsHtml('Atencion del personal'),
		transporteLocal: $sce.trustAsHtml('Calidad del transporte local'),
		transporteAtencion: $sce.trustAsHtml('Atención del personal del servicio'),
		transporteDisponibilidad: $sce.trustAsHtml('Disponibilidad del transporte'),

	 	//Labels Costo
	 	costo: $sce.trustAsHtml('Costo'),
	 	costoHospedaje: $sce.trustAsHtml('Hospedaje'),
	 	costoTransporte: $sce.trustAsHtml('Transportacion'),
	 	costoAlimentos: $sce.trustAsHtml('Alimentos y bebidas'),
	 	costoExcursion: $sce.trustAsHtml('Excursion/turistico.'),
	 	costoEstacionamiento: $sce.trustAsHtml('Estacionamiento'),
	 	
	 	//Labels Experiencia de viaje
	 	experiencia: $sce.trustAsHtml('Experiencia'),
	 	experienciaViaje: $sce.trustAsHtml('Experiencia de viaje'),
	 	factores: $sce.trustAsHtml('Factores de viaje'),
	 	factoresRecomendaciones: $sce.trustAsHtml('Recomendaciones'),
	 	factoresConocimiento: $sce.trustAsHtml('Conocimiento previo'),
	 	factoresCercania: $sce.trustAsHtml('Cercania del lugar de origen'),
	 	factoresPrecios: $sce.trustAsHtml('Precios'),
	 	factoresDisponibilidad: $sce.trustAsHtml('Disponibilidad de tiempo'),
	 	factoresDiversidad: $sce.trustAsHtml('Diversidad de actividades'),
	 	factoresInteres: $sce.trustAsHtml('Interes de conocer nuevos lugares'),
	 	factoresSalud: $sce.trustAsHtml('Salud'),
	 	factoresTrabajo: $sce.trustAsHtml('Trabajo'),
	 	factoresOtro: $sce.trustAsHtml('Otro'),
	 	experienciaViajeObregon: $sce.trustAsHtml('Experiencia de viaje a Cd. Obregon.'),
	 	experienciaViajeHospitalidad: $sce.trustAsHtml('Hospitalidad de los residentes que no trabajan en la industria.'),
 		experienciaViajeNaturales: $sce.trustAsHtml('Visitar los sitios naturales/culturales.'),
 		experienciaViajeDiferente: $sce.trustAsHtml('Ofrece una experiencia diferente.'),
 		experienciaViajeDisponibilidad: $sce.trustAsHtml('Disponibilidad de informacion turistica.'),
 		
 		//Labels Imagen
 		imagen: $sce.trustAsHtml('Imagen'),
 		seguridad: $sce.trustAsHtml('Percepcion de seguridad'),
 		imagenSitio: $sce.trustAsHtml('Imagen de los sitios naturales o culturales'),
 		vendedores: $sce.trustAsHtml('Vendedores ambulantes'),
 		transito: $sce.trustAsHtml('Transito vehicular'),
 		limpieza: $sce.trustAsHtml('Limpieza de calles y areas publicas'),

 		//Labels Satisfacción y recomendacion
 		satisfaccion: $sce.trustAsHtml('Satisfacci&oacute;n y Recomendaci&oacute;n'),
 		nivelSatisfaccion: $sce.trustAsHtml('Nivel de satisfaccion'),
 		expectativas: $sce.trustAsHtml('Cumplimiento de expectativas'),
 		disposicion: $sce.trustAsHtml('Disposicion de Visitarnos nuevamente'),
 		recomendacion: $sce.trustAsHtml('Recomendaria visitarnos'),
        
 		//Labels logo y cerrar sesión
		marca: 'Infoturismo',
		cerrarSesion: $sce.trustAsHtml('Cerrar Sesi&oacute;n'),

		//Label filter menu
		motivo: $sce.trustAsHtml('Motivo de Viaje'),
		transporte: $sce.trustAsHtml('Medio Transporte'),
		genero: $sce.trustAsHtml('Genero'),
		edad: $sce.trustAsHtml('Edad'),
		compania: $sce.trustAsHtml('Con qui&eacute;n viaja'),
		ultima: $sce.trustAsHtml('&Uacute;ltima Visita'),
		frecuencia: $sce.trustAsHtml('Frecuencia de Visita'),
		ocupacion: $sce.trustAsHtml('Ocupaci&oacute;n'),
		estancia: $sce.trustAsHtml('Duraci&oacute;n de la estancia'),
		residencia: $sce.trustAsHtml('Lugar de residencia'),
		grado: $sce.trustAsHtml('Grado Escolar'),
		oportunidad: $sce.trustAsHtml('Oportunidad de regresar'),
		gasto: $sce.trustAsHtml('Gasto')
 	};
}]);
