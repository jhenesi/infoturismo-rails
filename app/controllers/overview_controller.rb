class OverviewController  < ApplicationController
  def index
  	data = [{
  		:Clave => "Acceso",
		:Nombre => "Acceso al Destino e Infraestructura",
		:Promedio => 9
  	},{
		:Clave => "Atractivos",
		:Nombre => "Atractivos y Oferta Turística",
		:Promedio => 8
	},{
		:Clave => "Consumo",
		:Nombre => "Consumo de Servicios",
		:Promedio => 7
	},{
		:Clave => "Costo",
		:Nombre => "Costo",
		:Promedio => 9
	},{
		:Clave => "Experiencia",
		:Nombre => "Experiencia de Viaje",
		:Promedio => 10
	},{
		:Clave => "Imagen",
		:Nombre => "Imagen",
		:Promedio => 8
	},{
		:Clave => "Satisfaccion",
		:Nombre => "Satisfacción y Recomendación",
		:Promedio => 9
	}]

  	render json: data, status: 200
  end
end