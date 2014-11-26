class ConsumoController < ApplicationController
	def index
		data = [{
			:Clave => "Hospedaje",
			:Nombre => "Hospedaje",
			:Promedio =>  8
		},{
			:Clave => "Alimentacion",
			:Nombre => "Alimentación",
			:Promedio =>  9
		},{
			:Clave => "ServicioExcursion",
			:Nombre => "Servicios de Excursión",
			:Promedio =>  7
		},{
			:Clave => "TransporteEstacionamiento",
			:Nombre => "Transporte y Estacionamiento",
			:Promedio =>  6
		}]

		render json: data, status: 200
	end
end