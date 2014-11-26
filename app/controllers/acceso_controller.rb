class AccesoController < ApplicationController
	def index
		data = [{
			:Clave => "Senalamiento",
			:Nombre => "Señalamiento para Arribar",
			:Promedio => 8
		},{
			:Clave => "Opciones",
			:Nombre => "Opciones de Transporte para Arribar",
			:Promedio => 10
		},{
			:Clave => "Calidad",
			:Nombre => "Calidad de la Infraestructura de Acceso",
			:Promedio => 9
		},{
			:Clave => "Mantenimiento",
			:Nombre => "Mantenimiento y Calidad del Medio de Transporte",
			:Promedio => 5
		},{
			:Clave => "Atencion",
			:Nombre => "Atención del personal de Transporte",
			:Promedio => 3
		}]

		render json: data, status: 200
	end

	def senalamiento
		if params[:groupBy].nil?
			data = [{
				:Clave => "MB",
				:Nombre => "Muy Baja",
				:Total => 1
			},{
				:Clave => "B",
				:Nombre => "Baja",
				:Total => 2
			},{
				:Clave => "M",
				:Nombre => "Media",
				:Total => 5
			},{
				:Clave => "A",
				:Nombre => "Alta",
				:Total => 10
			},{
				:Clave => "MA",
				:Nombre => "Muy Alta",
				:Total => 2
			}]
		else
			data = [{
				:Clave => "Vacaciones",
				:Nombre => "Vacaciones Ocio o Recreacion",
				:Total => 15,
				:Datos => [{
					:Clave => "MB",
					:Nombre => "Muy Baja",
					:Total => 1
				},{
					:Clave => "B",
					:Nombre => "Baja",
					:Total => 2
				},{
					:Clave => "M",
					:Nombre => "Media",
					:Total => 3
				},{
					:Clave => "A",
					:Nombre => "Alta",
					:Total => 4
				},{
					:Clave => "MA",
					:Nombre => "Muy Alta",
					:Total => 5
				}]
			},{
				:Clave => "Educacion",
				:Nombre => "Educacion o Capacitacion",
				:Total => 15,
				:Datos => [{
					:Clave => "MB",
					:Nombre => "Muy Baja",
					:Total => 5
				},{
					:Clave => "B",
					:Nombre => "Baja",
					:Total => 4
				},{
					:Clave => "M",
					:Nombre => "Media",
					:Total => 3
				},{
					:Clave => "A",
					:Nombre => "Alta",
					:Total => 2
				},{
					:Clave => "MA",
					:Nombre => "Muy Alta",
					:Total => 1
				}]
			},{
				:Clave => "Empresarial",
				:Nombre => "Empresarial o Profesional",
				:Total => 15,
				:Datos => [{
					:Clave => "MB",
					:Nombre => "Muy Baja",
					:Total => 1
				},{
					:Clave => "B",
					:Nombre => "Baja",
					:Total => 2
				},{
					:Clave => "M",
					:Nombre => "Media",
					:Total => 3
				},{
					:Clave => "A",
					:Nombre => "Alta",
					:Total => 4
				},{
					:Clave => "MA",
					:Nombre => "Muy Alta",
					:Total => 5
				}]
			}]
		end

		render json: data, status: 200
	end
end