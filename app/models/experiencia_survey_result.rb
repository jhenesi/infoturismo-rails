class ExperienciaSurveyResult < ActiveRecord::Base
	include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

  	#,
	#		CAST(ROUND(((AVG([E15(SQ001)]) + 
	#		  	AVG([E15(SQ002)]) + 
	#		  	AVG([E15(SQ003)]) + 
	#		  	AVG([E15(SQ004)]) +
	#		  	AVG([E15(SQ005)]) +
	#		  	AVG([E15(SQ006)]) +
	#		  	AVG([E15(SQ007)]) +
	#		  	AVG([E15(SQ008)]) +
	#		  	AVG([E15(SQ009)]))/(10*1.0)), 1) AS FLOAT) as factores_average

  	def self.get_overview_data
		sql = 'SELECT 
			CAST(ROUND(((AVG(CAST([E14(E1401)] AS INT)) + 
			  	AVG(CAST([E14(E1402)] AS INT)) + 
			  	AVG(CAST([E14(E1403)] AS INT)) + 
			  	AVG(CAST([E14(E1404)] AS INT)) +
			  	AVG(CAST([E14(E1405)] AS INT)) +
			  	AVG(CAST([E14(E1406)] AS INT)) +
			  	AVG(CAST([E14(E1407)] AS INT)))/(7*1.0)), 1) AS FLOAT) as experiencia_average,
				COUNT([E15(SQ001)]) as factores_average
			FROM tbl_Results_v1'

			data = []

		ExperienciaSurveyResult.find_by_sql(sql).each do |row|
			data << ReactivoOverviewData.new("ExperienciaViaje", "Experiencia de Viaje", row.experiencia_average)
			data << ReactivoOverviewData.new("Factores", "Factores", "")
		end

		data
	end


	####################### EXPERIENCIA VIAJE
	def self.get_experienciaViaje_data
		sql = 'SELECT 
				ROUND(AVG(CAST([E14(E1401)] AS INT)), 1) as obregon_average,  
			  	ROUND(AVG(CAST([E14(E1402)] AS INT)), 1) as hospitalidad_average,
			  	ROUND(AVG(CAST([E14(E1403)] AS INT)), 1) as naturales_average, 
			  	ROUND(AVG(CAST([E14(E1404)] AS INT)), 1) as actividades_average,
			  	ROUND(AVG(CAST([E14(E1405)] AS INT)), 1) as emocion_average,
			  	ROUND(AVG(CAST([E14(E1406)] AS INT)), 1) as diferente_average,
			  	ROUND(AVG(CAST([E14(E1407)] AS INT)), 1) as disponibilidad_average
			FROM tbl_Results_v1'

			data = []

		ExperienciaSurveyResult.find_by_sql(sql).each do |row|
			data << ReactivoOverviewData.new("Obregon", "Experiencia de viaje a Cd. Obregon", row.obregon_average)
			data << ReactivoOverviewData.new("Hospitalidad", "Hospitalidad de los residentes que no trabajan en la industria", row.hospitalidad_average)
			data << ReactivoOverviewData.new("Naturales", "Visitar los sitios naturales/culturales", row.naturales_average)
			data << ReactivoOverviewData.new("Actividades", "Variedad de actividades recreativas", row.actividades_average)
			data << ReactivoOverviewData.new("Emocion", "Emocion de visitar este sitio", row.emocion_average)
			data << ReactivoOverviewData.new("Diferente", "Ofrece una experiencia diferente", row.diferente_average)
			data << ReactivoOverviewData.new("Disponibilidad", "Disponibilidad de informacion turistica", row.disponibilidad_average)
		end

		data
	end



	####################### FACTORES Consulta ??????
	def self.get_factores_data
		sql = "SELECT
			SUM(CASE WHEN [E15(SQ001)] = 'Y' THEN 1 END) AS recomendacion,
			SUM(CASE WHEN [E15(SQ002)] = 'Y' THEN 1 END) As conocimiento,
			SUM(CASE WHEN [E15(SQ003)] = 'Y' THEN 1 END) AS cercania,
			SUM(CASE WHEN [E15(SQ004)] = 'Y' THEN 1 END) AS precio,
			SUM(CASE WHEN [E15(SQ005)] = 'Y' THEN 1 END) AS tiempo,
			SUM(CASE WHEN [E15(SQ006)] = 'Y' THEN 1 END) AS actividades,
			SUM(CASE WHEN [E15(SQ007)] = 'Y' THEN 1 END) AS interes,
			SUM(CASE WHEN [E15(SQ008)] = 'Y' THEN 1 END) AS salud,
			SUM(CASE WHEN [E15(SQ009)] = 'Y' THEN 1 END) AS trabajo,
			SUM(CASE WHEN [E15(other)] IS NOT NULL THEN 1 END) AS otro
		FROM tbl_Results_v1"

		data = []

		ExperienciaSurveyResult.find_by_sql(sql).each do |row|
			data << ReactivoData.new("Recomendaciones", "Recomendaciones", row.recomendacion)
			data << ReactivoData.new("Conocimiento", "Conocimiento", row.conocimiento)
			data << ReactivoData.new("Cercania", "Cercanía", row.cercania)
			data << ReactivoData.new("Precios", "Precios", row.precio)
			data << ReactivoData.new("Disponibilidad", "Disponibilidad", row.tiempo)
			data << ReactivoData.new("Diversidad", "Actividades", row.actividades)
			data << ReactivoData.new("Interes", "Interes", row.interes)
			data << ReactivoData.new("Salud", "Salud", row.salud)
			data << ReactivoData.new("Trabajo", "Trabajo", row.trabajo)
			data << ReactivoData.new("Otro", "Otro", row.otro)
		end

		data
	end





	############################ OBREGON
    def self.get_EVobregon_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([E14(E1401)] AS INT) >= 1 AND CAST([E14(E1401)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 3 AND CAST([E14(E1401)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 5 AND CAST([E14(E1401)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([E14(E1401)] AS INT) >= 7 AND CAST([E14(E1401)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([E14(E1401)] AS INT) >= 9 AND CAST([E14(E1401)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([E14(E1401)] AS INT) >= 1 AND CAST([E14(E1401)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 3 AND CAST([E14(E1401)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 5 AND CAST([E14(E1401)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([E14(E1401)] AS INT) >= 7 AND CAST([E14(E1401)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([E14(E1401)] AS INT) >= 9 AND CAST([E14(E1401)] AS INT) <= 10 THEN 'muy_alta'
	         END"

		data = []

		CostoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_EVobregon_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([E14(E1401)] AS INT) >= 1 AND CAST([E14(E1401)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 3 AND CAST([E14(E1401)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 5 AND CAST([E14(E1401)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([E14(E1401)] AS INT) >= 9 AND CAST([E14(E1401)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([E14(E1401)] AS INT) >= 7 AND CAST([E14(E1401)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([E14(E1401)] AS INT) >= 1 AND CAST([E14(E1401)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 3 AND CAST([E14(E1401)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([E14(E1401)] AS INT) >= 5 AND CAST([E14(E1401)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([E14(E1401)] AS INT) >= 9 AND CAST([E14(E1401)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([E14(E1401)] AS INT) >= 7 AND CAST([E14(E1401)] AS INT) <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		CostoSurveyResult.find_by_sql(sql).each do |row|
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