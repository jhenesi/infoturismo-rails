'use strict';

angular.module('infoturismoApp').service('crumbs', ['labels', 'icons', 'routes', function(labels, icons, routes) {
	var addCrumb = function(crumb) {
		this.next = crumb;
		return crumb;
	};
	return {
		getGeneral: function() {
			return {
				name: labels.general,
      			href: routes.general.path,
      			icon: icons.general,
      			addCrumb: addCrumb
			};
		},

        //Crumbs Acceso al Destino e Infraestructura
		getAcceso: function() {
			return {
	    		name: labels.acceso,
	    		href: routes.acceso.path,
	    		icon: icons.acceso,
	    		addCrumb: addCrumb
    		};
    	},
        getAccesoSenalamiento: function() {
            return {
                name: labels.senalamiento,
                href: routes.acceso.senalamiento.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getAccesoOpciones: function() {
            return {
                name: labels.opciones,
                href: routes.acceso.opciones.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getAccesoCalidad: function() {
            return {
                name: labels.calidad,
                href: routes.acceso.calidad.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getAccesoMantenimiento: function() {
            return {
                name: labels.mantenimiento,
                href: routes.acceso.mantenimiento.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getAccesoAtencion: function() {
            return {
                name: labels.atencion,
                href: routes.acceso.atencion.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },

    	// Crumbs Atractivos y Oferta Turistica
    	getAtractivos: function() {
			return {
	    		name: labels.atractivos,
	    		href: routes.atractivos.path,
	    		icon: icons.atractivos,
	    		addCrumb: addCrumb
    		};
    	},
    	getAtractivosServicios: function() {
			return {
	    		name: labels.atractivosServicios,
	    		href: routes.atractivos.atractivosServicios.path,
	    		icon: icons.pieChart,
	    		addCrumb: addCrumb
    		};
    	},
    	getAtractivosConcervacion: function() {
			return {
	    		name: labels.atractivosConservacion,
	    		href: routes.atractivos.atractivosConservacion.path,
	    		icon: icons.pieChart,
	    		addCrumb: addCrumb
    		};
    	},
    	getAtractivosVariedad: function() {
			return {
	    		name: labels.atractivosVariedad,
	    		href: routes.atractivos.atractivosVariedad.path,
	    		icon: icons.pieChart,
	    		addCrumb: addCrumb
    		};
    	},
    	getAtractivosCalidad: function() {
			return {
	    		name: labels.atractivosCalidad,
	    		href: routes.atractivos.atractivosCalidad.path,
	    		icon: icons.pieChart,
	    		addCrumb: addCrumb
    		};
    	},
    	getAtractivosCulturales: function() {
			return {
	    		name: labels.atractivosCulturales,
	    		href: routes.atractivos.atractivosCulturales.path,
	    		icon: icons.pieChart,
	    		addCrumb: addCrumb
    		};
    	},
    	getAtractivosNaturales: function() {
			return {
	    		name: labels.atractivosNaturales,
	    		href: routes.atractivos.atractivosNaturales.path,
	    		icon: icons.pieChart,
	    		addCrumb: addCrumb
    		};
    	},

    	//Crumbs Consumo de servicios
    	getConsumo: function() {
			return {
	    		name: labels.consumo,
	    		href: routes.consumo.path,
	    		icon: icons.consumo,
	    		addCrumb: addCrumb
    		};
    	},

        getHospedaje: function() {
            return {
                name: labels.hospedaje,
                href: routes.consumo.hospedaje.path,
                icon: icons.hospedaje,
                addCrumb: addCrumb
            };
        },

        getHospedajePercepcion: function() {
            return {
                name: labels.hospedajePercepcion,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getHospedajeLimpieza: function() {
            return {
                name: labels.hospedajeLimpieza,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },

getHospedajeAtencion: function() {
            return {
                name: labels.hospedajeAtencion,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
getHospedajeEleccion: function() {
            return {
                name: labels.hospedajeAtencion,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        




         getAlimentacion: function() {
            return {
                name: labels.alimentacion,
                href: routes.consumo.alimentacion.path,
                icon: icons.alimentacion,
                addCrumb: addCrumb
            };
        },

        getAlimentacionExperiencia: function() {
            return {
                name: labels.alimentacionExperiencia,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getAlimentacionCalidad: function() {
            return {
                name: labels.alimentacionCalidad,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getAlimentacionLimpieza: function() {
            return {
                name: labels.alimentacionLimpieza,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },





         getExcursion: function() {
            return {
                name: labels.excursion,
                href: routes.consumo.servicioExcursion.path,
                icon: icons.servicioExcursion,
                addCrumb: addCrumb
            };
        },


        getExcursionServicio: function() {
            return {
                name: labels.serviciosExcursion,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExcursionCalidad: function() {
            return {
                name: labels.serviciosCalidad,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExcursionAtencion: function() {
            return {
                name: labels.serviciosAtencion,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        

         getTransporte: function() {
            return {
                name: labels.transporteEstacionamiento,
                href: routes.consumo.transporteEstacionamiento.path,
                icon: icons.transporteEstacionamiento,
                addCrumb: addCrumb
            };
        },
        getTransporteCalidad: function() {
            return {
                name: labels.transporteLocal,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getTransporteAtencion: function() {
            return {
                name: labels.transporteAtencion,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getTransporteDisponibilidad: function() {
            return {
                name: labels.transporteDisponibilidad,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
         getTransporteDisponibilidadEstacionamiento: function() {
            return {
                name: labels.transporteDisponibilidadEstacionamiento,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },



        /*
    	getConsumoHotel: function() {
			return {
	    		name: labels.hotel,
	    		href: routes.consumo.reactivos.hotel.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},
    	getConsumoMotel: function() {
			return {
	    		name: labels.motel,
	    		href: routes.consumo.reactivos.motel.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},
    	getConsumoCampamento: function() {
			return {
	    		name: labels.campamento,
	    		href: routes.consumo.reactivos.campamento.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},
    	getConsumoHuespedes: function() {
			return {
	    		name: labels.huespedes,
	    		href: routes.consumo.reactivos.huespedes.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},
    	getConsumoFamiliares: function() {
			return {
	    		name: labels.familiares,
	    		href: routes.consumo.reactivos.familiares.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},
    	getConsumoPropia: function() {
			return {
	    		name: labels.propia,
	    		href: routes.consumo.reactivos.propia.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},
    	getConsumoRentada: function() {
			return {
	    		name: labels.rentada,
	    		href: routes.consumo.reactivos.rentada.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},
    	getConsumoOtro: function() {
			return {
	    		name: labels.otro,
	    		href: routes.consumo.reactivos.otro.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},

		getConsumoNinguno: function() {
			return {
	    		name: labels.ninguno,
	    		href: routes.consumo.reactivos.ninguno.path,
	    		icon:'',
	    		addCrumb: addCrumb
    		}
    	},*/
    	

        //Crumbs Costo
        getCostoGeneral: function() {
            return {
                name: labels.costoGeneral,
                href: routes.costo.general.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getCostoTransportacion: function() {
            return {
                name: labels.costoTransportacion,
                href: routes.costo.transportacion.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
    	getCosto: function() {
    		return {
    			name: labels.costo,
    			href: routes.costo.path,
    			icon: icons.costo,
    			addCrumb: addCrumb
    		};
    	},
    	getCostoHospedaje: function() {
    		return {
    			name: labels.costoHospedaje,
    			href: routes.costo.hospedaje.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getCostoTransporte: function() {
    		return {
    			name: labels.costoTransporte,
    			href: routes.costo.transporte.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getCostoAlimentos: function() {
    		return {
    			name: labels.costoAlimentos,
    			href: routes.costo.alimentos.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getCostoExcursion: function() {
    		return {
    			name: labels.costoTransporte,
    			href: routes.costo.excursion.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getCostoEstacionamiento: function() {
    		return {
    			name: labels.costoEstacionamiento,
    			href: routes.costo.estacionamiento.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},

        //Experiencia
    	getExperiencia: function() {
    		return {
    			name: labels.experiencia,
    			href: routes.experiencia.path,
    			icon: icons.experiencia,
    			addCrumb: addCrumb
    		};
    	},
        getExperienciaViaje: function() {
            return {
                name: labels.experienciaViaje,
                href: routes.experiencia.experienciaViaje.path,
                icon: icons.experienciaViaje,
                addCrumb: addCrumb
            };
        },
        getExperienciaViajeObregon: function() {
            return {
                name: labels.experienciaViajeObregon,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExperienciaViajeHospitalidad: function() {
            return {
                name: labels.experienciaViajeHospitalidad,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExperienciaViajeActividades: function() {
            return {
                name: labels.experienciaViajeActividades,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExperienciaViajeEmocion: function() {
            return {
                name: labels.experienciaViajeEmocion,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExperienciaViajeNaturales: function() {
            return {
                name: labels.experienciaViajeNaturales,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExperienciaViajeDiferente: function() {
            return {
                name: labels.experienciaViajeDiferente,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getExperienciaViajeDisponibilidad: function() {
            return {
                name: labels.experienciaViajeDisponibilidad,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactores: function() {
            return {
                name: labels.factores,
                href: routes.experiencia.factores.path,
                icon: icons.factores,
                addCrumb: addCrumb
            };
        },
        getFactoresRecomendaciones: function() {
            return {
                name: labels.factoresRecomendaciones,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresConocimiento: function() {
            return {
                name: labels.factoresConocimiento,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresCercania: function() {
            return {
                name: labels.factoresCercania,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresPrecios: function() {
            return {
                name: labels.factoresPrecios,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresDisponibilidad: function() {
            return {
                name: labels.factoresDisponibilidad,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresDiversidad: function() {
            return {
                name: labels.factoresDiversidad,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresInteres: function() {
            return {
                name: labels.factoresInteres,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresSalud: function() {
            return {
                name: labels.factoresSalud,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresTrabajo: function() {
            return {
                name: labels.factoresTrabajo,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getFactoresOtro: function() {
            return {
                name: labels.factoresOtro,
                href: '',
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        /*
    	getExperienciaObregon: function() {
    		return {
    			name: labels.experienciaObregon,
    			href: routes.experiencia.obregon.path,
    			icon: '',
    			addCrumb: addCrumb
    		};
    	},
    	getExperienciaHospitalidad: function() {
    		return {
    			name: labels.experienciaHospitalidad,
    			href: routes.experiencia.hospitalidad.path,
    			icon: '',
    			addCrumb: addCrumb
    		};
    	},
    	getExperienciaNaturales: function() {
    		return {
    			name: labels.experienciaNaturales,
    			href: routes.experiencia.naturales.path,
    			icon: '',
    			addCrumb: addCrumb
    		};
    	},
    	getExperienciaDiferente: function() {
    		return {
    			name: labels.experienciaDiferente,
    			href: routes.experiencia.diferente.path,
    			icon: '',
    			addCrumb: addCrumb
    		};
    	},
    	getExperienciaDisponibilidad: function() {
    		return {
    			name: labels.experienciaDisponibilidad,
    			href: routes.experiencia.disponibilidad.path,
    			icon: '',
    			addCrumb: addCrumb
    		};
    	},*/

		//Imagen
    	getImagen: function() {
    		return {
    			name: labels.imagen,
    			href: routes.imagen.path,
    			icon: icons.imagen,
    			addCrumb: addCrumb
    		};
    	},  	
    	getImagenPercepcion: function() {
    		return {
    			name: labels.seguridad,
    			href: routes.imagen.percepciones.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getImagenSitios: function() {
    		return {
    			name: labels.imagenSitio,
    			href: routes.imagen.imagenes.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getImagenAmbulantes: function() {
    		return {
    			name: labels.vendedores,
    			href: routes.imagen.ambulantes.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getImagenTrasito: function() {
    		return {
    			name: labels.transito,
    			href: routes.imagen.transito.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},
    	getImagenLimpieza: function() {
    		return {
    			name: labels.limpieza,
    			href: routes.imagen.limpieza.path,
    			icon: icons.pieChart,
    			addCrumb: addCrumb
    		};
    	},


    	//Crumbs Satisfaccion y Recomendacion
    	getSatisfaccion: function() {
    		return {
    			name: labels.satisfaccion,
    			href: routes.satisfaccion.path,
    			icon: icons.satisfaccion,
    			addCrumb: addCrumb
    		};
    	},
        getSatisfaccionNivel: function() {
            return {
                name: labels.nivelSatisfaccion,
                href: routes.satisfaccion.nivelSatisfaccion.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getSatisfaccionExpectativas: function() {
            return {
                name: labels.expectativas,
                href: routes.satisfaccion.expectativas.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getSatisfaccionDisposicion: function() {
            return {
                name: labels.disposicion,
                href: routes.satisfaccion.disposicion.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        },
        getSatisfaccionRecomendacion: function() {
            return {
                name: labels.recomendacion,
                href: routes.satisfaccion.recomendacion.path,
                icon: icons.pieChart,
                addCrumb: addCrumb
            };
        }
	};
}]);
