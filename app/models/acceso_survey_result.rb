class AccesoSurveyResult < ActiveRecord::Base
	include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

  def self.get_data
  	sql = 
	  	'SELECT 
			ROUND(AVG("A2(A201)"), 1) as senalamiento_average,
			ROUND(AVG("A2(A202)"), 1) as opciones_average,
			ROUND(AVG("A2(A203)"), 1) as calidad_average,
			ROUND(AVG("A2(A204)"), 1) as mantenimiento_average,
			ROUND(AVG("A2(A205)"), 1) as atencion_average
		 FROM "tbl_Results_v1"'

	data = []

	AccesoSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("Senalamiento", "Señalamiento para Arribar", row.senalamiento_average)
		data << ReactivoOverviewData.new("Opciones", "Opciones de Transporte para Arribar", row.opciones_average)
		data << ReactivoOverviewData.new("Calidad", "Calidad de la Infraestructura de Acceso", row.calidad_average)
		data << ReactivoOverviewData.new("Mantenimiento", "Mantenimiento y Calidad del Medio de Transporte", row.mantenimiento_average)
		data << ReactivoOverviewData.new("Atencion", "Atención del personal de Transporte", row.atencion_average)
	end

	data
  end

  	def self.get_senalamiento_data()
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

		data = []

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_senalamiento_data_grouped(group_by)
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN \"A2(A201)\" >= 1 AND \"A2(A201)\" <= 2 THEN \"muy_baja\"
	           	WHEN \"A2(A201)\" >= 3 AND \"A2(A201)\" <= 4 THEN \"baja\"
	           	WHEN \"A2(A201)\" >= 5 AND \"A2(A201)\" <= 6 THEN \"media\"
	           	WHEN \"A2(A201)\" >= 9 AND \"A2(A201)\" <= 10 THEN \"muy_alta\"
	           	WHEN \"A2(A201)\" >= 7 AND \"A2(A201)\" <= 8 THEN \"alta\"
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM \"tbl_Results_v1\"
			 GROUP BY calificacion, filtro"

	 	data = {}

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			if CATEGORIES[group_by].has_key?(row.filtro)
				data[row.filtro] = data[row.filtro] || ReactivoGroupedData.new(
					CATEGORIES[group_by][row.filtro].clave,
					CATEGORIES[group_by][row.filtro].nombre
				)

				unless row.calificacion.nil? 
					data[row.filtro].Datos << ReactivoData.new(
						SCORES[row.calificacion].clave,
						SCORES[row.calificacion].nombre,
						row.conteo
					)
				end
			end
		end

		data.values
	end
end