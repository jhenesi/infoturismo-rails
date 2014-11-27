class AccesoSurveyResult < ActiveRecord::Base
  self.table_name = 'tbl_Results_v1'
  self.primary_key = 'id'

  def self.get_data
  	data = [{
			:Clave => "Senalamiento",
			:Nombre => "Señalamiento para Arribar",
			:Promedio => 0
		},{
			:Clave => "Opciones",
			:Nombre => "Opciones de Transporte para Arribar",
			:Promedio => 0
		},{
			:Clave => "Calidad",
			:Nombre => "Calidad de la Infraestructura de Acceso",
			:Promedio => 0
		},{
			:Clave => "Mantenimiento",
			:Nombre => "Mantenimiento y Calidad del Medio de Transporte",
			:Promedio => 0
		},{
			:Clave => "Atencion",
			:Nombre => "Atención del personal de Transporte",
			:Promedio => 0
		}]

  	sql = 
	  	'SELECT 
			ROUND(AVG("A2(A201)"), 1) as senalamiento_average,
			ROUND(AVG("A2(A202)"), 1) as opciones_average,
			ROUND(AVG("A2(A203)"), 1) as calidad_average,
			ROUND(AVG("A2(A204)"), 1) as mantenimiento_average,
			ROUND(AVG("A2(A205)"), 1) as atencion_average
		 FROM "tbl_Results_v1"'

	AccesoSurveyResult.find_by_sql(sql).each do |row|
		data[0]['Promedio'] = row.senalamiento_average
		data[1]['Promedio'] = row.opciones_average
		data[2]['Promedio'] = row.calidad_average
		data[3]['Promedio'] = row.mantenimiento_average
		data[4]['Promedio'] = row.atencion_average
	end

	data
  end

  	def self.get_senalamiento_data()
	  	data = [{
			:Clave => "MB",
			:Nombre => "Muy Baja",
			:Total => 0
		},{
			:Clave => "B",
			:Nombre => "Baja",
			:Total => 0
		},{
			:Clave => "M",
			:Nombre => "Media",
			:Total => 0
		},{
			:Clave => "A",
			:Nombre => "Alta",
			:Total => 0
		},{
			:Clave => "MA",
			:Nombre => "Muy Alta",
			:Total => 0
		}]

	  	sql = 
	  		'SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN "A2(A201)" >= 1 AND "A2(A201)" <= 2 THEN "muy_baja"
	           	WHEN "A2(A201)" >= 3 AND "A2(A201)" <= 4 THEN "baja"
	           	WHEN "A2(A201)" >= 5 AND "A2(A201)" <= 6 THEN "media"
	           	WHEN "A2(A201)" >= 7 AND "A2(A201)" <= 8 THEN "alta"
	           	WHEN "A2(A201)" >= 9 AND "A2(A201)" <= 10 THEN "muy_alta"
	         END as calificacion
			 FROM "tbl_Results_v1"
			 GROUP BY calificacion'

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			case row.calificacion
				when 'alta'
				  data[3][:Total] = row.conteo
				when 'baja'
				  data[1][:Total] = row.conteo
				when 'media'
					data[2][:Total] = row.conteo
				when 'muy_alta'
					data[4][:Total] = row.conteo
				when 'muy_baja' 
					data[0][:Total] = row.conteo
			end
		end
		data
  	end

  	def self.get_senalamiento_data_grouped(group_by)
  		columns = {
  			'motivo' => 'FD',
  			'transporte' => 'A1',
  			'genero' => 'H22',
  			'compania' => 'H21',
  			'ocupacion'=> 'H24'
  		}

  		categories = {
	  		'motivo' => {
	  			'A1' => {
	  				:Clave => "Vacaciones",
					:Nombre => "Vacaciones Ocio o Recreacion"
	  			},
	  			'A2' => {
	  				:Clave => "Educacion",
					:Nombre => "Educacion o Capacitacion",
	  			},
	  			'A3' => {
	  				:Clave => "Empresarial",
					:Nombre => "Empresarial o Profesional"
	  			},
	  			'A4' => {
	  				:Clave => "Visita",
					:Nombre => "Visita Familiares o Amigos"
	  			},
	  			'A5' => {
	  				:Clave => "Salud",
					:Nombre => "Salud o Atención Medica"
	  			},
	  			'A6' => {
	  				:Clave => "Religion",
					:Nombre => "Religión / Peregrinación"
	  			},
	  			'A7' => {
	  				:Clave => "Compras",
					:Nombre => "Compras"
	  			},
	  			'A8' => {
	  				:Clave => "Otro",
					:Nombre => "Otro"
	  			}
	  		},
	  		'transporte' => {
	  			'A101' => {
	  				:Clave => 'Bus',
	  				:Nombre => 'Autobús'
	  			},
	  			'A102' => {
	  				:Clave => 'AutoPropio',
	  				:Nombre => 'Automóvil Propio'
	  			},
	  			'A103' => {
	  				:Clave => 'AutoRentado',
	  				:Nombre => 'Automóvil Rentado'
	  			},
	  			'A104' => {
	  				:Clave => 'Avion',
	  				:Nombre => 'Avión'
	  			},
	  			'A105' => {
	  				:Clave => 'BusRentado',
	  				:Nombre => 'Autobús Rentado'
	  			},
	  			'-oth-' => {
	  				:Clave => 'Otro',
	  				:Nombre => 'Otro'
	  			},
	  		},
	  		'genero' => {
	  			'M' => {
	  				:Clave => 'M',
	  				:Nombre => 'Masculino'
	  			},
	  			'F' => {
					:Clave => 'F',
	  				:Nombre => 'Femenino'
	  			}
	  		},
	  		'compania' => {
	  			'A1' => {
	  				:Clave => 'Solo',
	  				:Nombre => 'Solo'
	  			},
	  			'A2' => {
	  				:Clave => 'Pareja',
	  				:Nombre => 'Pareja'
	  			},
	  			'A3' => {
	  				:Clave => 'Familia',
	  				:Nombre => 'Familia'
	  			},
	  			'A4' => {
	  				:Clave => 'Companeros',
	  				:Nombre => 'Compañeros de Trabajo'
	  			},
	  			'A5' => {
	  				:Clave => 'Amigos',
	  				:Nombre => 'Amigos'
	  			},
	  			'A6' => {
	  				:Clave => 'Grupo',
	  				:Nombre => 'Grupo'
	  			},
	  			'-oth-' => {
	  				:Clave => 'Otro',
	  				:Nombre => 'Otro'
	  			},
	  		},
	  		'ocupacion' => {
	  			'A1' => {
	  				:Clave => 'Estudiante',
	  				:Nombre => 'Estudiante'
	  			},
	  			'A2' => {
	  				:Clave => 'EmpIP',
	  				:Nombre => 'Empleado IP'
	  			},
	  			'A3' => {
	  				:Clave => 'EmpGob',
	  				:Nombre => 'Empleado de Gobierno'
	  			},
	  			'A4' => {
	  				:Clave => 'ProfTec',
	  				:Nombre => 'Profesionista / Técnico'
	  			},
	  			'A5' => {
	  				:Clave => 'AmaCasa',
	  				:Nombre => 'Ama de Casa'
	  			},
	  			'A6' => {
	  				:Clave => 'DirEje',
	  				:Nombre => 'Director / Ejecutivo'
	  			},
	  			'A7' => {
	  				:Clave => 'DueNeg',
	  				:Nombre => 'Dueño de Negocio'
	  			},
	  			'A8' => {
	  				:Clave => 'Retirado',
	  				:Nombre => 'Retirado'
	  			},
	  			'-oth-' => {
	  				:Clave => 'Otro',
	  				:Nombre => 'Otro'
	  			},
	  		}
	  	}

		scores = {
			'muy_baja' => {
				:Clave => "MB",
				:Nombre => "Muy Baja",
			},
			'baja' => {
				:Clave => "B",
				:Nombre => "Baja",
			},
			'media' => {
				:Clave => "M",
				:Nombre => "Media",
			},
			'alta' => {
				:Clave => "A",
				:Nombre => "Alta",
			},
			'muy_alta' => {
				:Clave => "MA",
				:Nombre => "Muy Alta",
			}
		}

	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN \"A2(A201)\" >= 1 AND \"A2(A201)\" <= 2 THEN \"muy_baja\"
	           	WHEN \"A2(A201)\" >= 3 AND \"A2(A201)\" <= 4 THEN \"baja\"
	           	WHEN \"A2(A201)\" >= 5 AND \"A2(A201)\" <= 6 THEN \"media\"
	           	WHEN \"A2(A201)\" >= 9 AND \"A2(A201)\" <= 10 THEN \"muy_alta\"
	           	WHEN \"A2(A201)\" >= 7 AND \"A2(A201)\" <= 8 THEN \"alta\"
	         END as calificacion,
	         #{columns[group_by]} as filtro
			 FROM \"tbl_Results_v1\"
			 GROUP BY calificacion, filtro"

	 	data = {}

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			unless row.filtro.nil?
				data[row.filtro] = data[row.filtro] || {
					:Clave => categories[group_by][row.filtro][:Clave],
					:Nombre => categories[group_by][row.filtro][:Nombre],
					:Datos => []
				}

				unless row.calificacion.nil? 
					data[row.filtro][:Datos] << {
						:Clave => scores[row.calificacion][:Clave],
						:Nombre => scores[row.calificacion][:Nombre],
						:Total => row.conteo
					}
				end
			end
		end

		data.values
	end
end