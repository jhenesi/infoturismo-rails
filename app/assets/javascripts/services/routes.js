'use strict';

angular.module('infoturismoApp').constant('routes', {
		general: {
			path: '#/',
		},
		login: {
			path: '#/login'
		},
		//rutas Acceso al destino e infraestructura
		acceso: {
			path: '#/acceso',
	  		senalamiento: {
	          path: '#/acceso/senalamiento'
	        },
	        opciones: {
	          path: '#/acceso/opciones'
	        },
	        calidad: {
	          path: '#/acceso/calidad'
	        },
	        mantenimiento: {
	          path: '#/acceso/mantenimiento'
	        },
	        atencion: {
	          path: '#/acceso/atencion'
	        }
		},

		//rutas Atractivos y oferta turistica
		atractivos: {
			path: '#/atractivos',
		  	
		  		atractivosServicios: {
		          path: '#/atractivos/atractivosServicios'
		        },
		        atractivosConservacion: {
		          path: '#/atractivos/atractivosConservacion'
		        },
		        atractivosVariedad: {
		          path: '#/atractivos/atractivosVariedad'
		        },
		        atractivosCalidad: {
		          path: '#/atractivos/atractivosCalidad'
		        },
		        atractivosCulturales: {
		          path: '#/atractivos/atractivosCulturales'
		        },
		        atractivosNaturales: {
		          path: '#/atractivos/atractivosNaturales'
		        }
			
		},

		//rutas Costos
		costo: {
			path: '#/costo',
			
				general: {
					path: '#/costo/general'
				},
				transportacion: {
					path: '#/costo/transportacion'
				},
				hospedaje: {
					path: '#/costo/hospedaje'
				},
				transporte: {
					path: '#/costo/transporte'
				},
				alimentos: {
					path: '#/costo/alimentos'
				},
				excursion: {
					path: '#/costo/excursion'
				},
				estacionamiento: {
					path: '#/costo/estacionamiento'
				}
			
		},

		//rutas Consumo de servicios
		consumo: {
			path: '#/consumo',
	  		hospedaje: {
	  			path: '#/consumo/hospedaje',
  				percepcion: {
  					path: '#/consumo/hospedaje/percepcion'
  				},
  				limpieza: {
					path: '#/consumo/hospedaje/limpieza'
  				},
  				atencion: {
					path: '#/consumo/hospedaje/atencion'
  				},
  				facilidadEleccion: {
  					path: '#/consumo/hospedaje/facilidadeleccion'
  				}
	  		},
	  		alimentacion: {
	  			path: '#/consumo/alimentacion',
	  			experiencia: {
  					path: '#/consumo/alimentacion/experiencia'
  				},
  				calidad: {
					path: '#/consumo/alimentacion/calidad'
  				},
  				limpieza: {
					path: '#/consumo/alimentacion/limpieza'
  				}
	  		},
	  		servicioExcursion: {
	  			path: '#/consumo/servicioExcursion',
	  			servicios: {
  					path: '#/consumo/servicioExcursion/servicios'
  				},
  				calidad: {
					path: '#/consumo/servicioExcursion/calidad'
  				},
  				atencion: {
					path: '#/consumo/servicioExcursion/atencion'
  				}
	  		},
	  		transporteEstacionamiento: {
	  			path: '#/consumo/transporteEstacionamiento',
	  			calidad: {
  					path: '#/consumo/transporteEstacionamiento/calidad'
  				},
  				atencion: {
					path: '#/consumo/transporteEstacionamiento/atencion'
  				},
  				disponibilidad: {
					path: '#/consumo/transporteEstacionamiento/disponibilidad'
  				},
  				disponibilidadEstacionamiento:{
					path: '#/consumo/transporteEstacionamiento/disponibilidadEstacionamiento'
  				}
	  		}
		},



		experiencia: {
			path: '#/experiencia',
			experienciaViaje: {
				path: '#/experiencia/experienciaViaje',
				obregon: {
					path: '#/experiencia/experienciaViaje/obregon'
				},
				hospitalidad: {
					path: '#/experiencia/experienciaViaje/hospitalidad'
				},
				actividades: {
					path: '#/experiencia/experienciaViaje/actividades'
				},
				emocion: {
					path: '#/experiencia/experienciaViaje/emocion'
				},
				naturales: {
					path: '#/experiencia/experienciaViaje/naturales'
				},
				diferente: {
					path: '#/experiencia/experienciaViaje/diferente'
				},
				disponibilidad: {
					path: '#/experiencia/experienciaViaje/disponibilidad'
				}
			},
			factores: {
				path: '#/experiencia/factores',
				recomendaciones: {
					path: '#/experiencia/factores/recomendaciones'
				},
				conocimiento: {
					path: '#/experiencia/factores/conocimiento'
				},
				cercania: {
					path: '#/experiencia/factores/cercania'
				},
				precios: {
					path: '#/experiencia/factores/precios'
				},
				disponibilidad: {
					path: '#/experiencia/factores/disponibilidad'
				},
				diversidad: {
					path: '#/experiencia/factores/diversidad'
				},
				interes: {
					path: '#/experiencia/factores/interes'
				},
				salud: {
					path: '#/experiencia/factores/salud'
				},
				trabajo: {
					path: '#/experiencia/factores/trabajo'
				},
				otro: {
					path: '#/experiencia/factores/otro'
				}
			}
		},

		imagen: {
			path: '#/imagen',
     		
     			percepciones:{
     				path: '#/imagen/percepcion'
     			},
     			imagenes:{
     				path: '#/imagen/sitios'
     			},
     			ambulantes:{
     				path: '#/imagen/ambulantes'
     			},
     			transito:{
     				path: '#/imagen/transito'
     			},
     			limpieza:{
     				path: '#/imagen/limpieza'
     			}
     		
		},


		satisfaccion: {
			path: '#/satisfaccion',
     		
     			nivelSatisfaccion:{
     				path: '#/satisfaccion/nivel'
     			},
     			expectativas:{
     				path: '#/satisfaccion/expectativas'
     			},
     			disposicion:{
     				path: '#/satisfaccion/disposicion'
     			},
     			recomendacion:{
     				path: '#/satisfaccion/recomendacion'
     			}
     		
		}
	

});
