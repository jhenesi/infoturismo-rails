class CostoSurveyResult < ActiveRecord::Base
	include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

  	def self.get_data
  	sql = 
	  	'SELECT 
	  		ROUND(AVG(CAST([D13(D1301)] AS INT)), 1) as general_average,
			ROUND(AVG(CAST([D13(D1302)] AS INT)), 1) as transportacion_average,
			ROUND(AVG(CAST([D13(D1303)] AS INT)), 1) as hospedaje_average,
			ROUND(AVG(CAST([D13(D1305)] AS INT)), 1) as transporte_average,
			ROUND(AVG(CAST([D13(D1307)] AS INT)), 1) as alimentos_average,
			ROUND(AVG(CAST([D13(D1304)] AS INT)), 1) as excursion_average,
			ROUND(AVG(CAST([D13(D1306)] AS INT)), 1) as estacionamiento_average
		 FROM "tbl_Results_v1"'

	data = []

	CostoSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("General", "General", row.general_average)
		data << ReactivoOverviewData.new("Transportacion", "Transportacion", row.transportacion_average)
		data << ReactivoOverviewData.new("Hospedaje", "Hospedaje", row.hospedaje_average)
		data << ReactivoOverviewData.new("Transporte", "Transporte", row.transporte_average)
		data << ReactivoOverviewData.new("Alimentos", "Alimentos y bebidas", row.alimentos_average)
		data << ReactivoOverviewData.new("Excursion", "Excursion/turistico", row.excursion_average)
		data << ReactivoOverviewData.new("Estacionamiento", "Estacionamiento", row.estacionamiento_average)
	end

	data
  end

  ############################ GENERAL
  def self.get_general_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1301)] AS INT) >= 1 AND CAST([D13(D1301)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 3 AND CAST([D13(D1301)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 5 AND CAST([D13(D1301)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1301)] AS INT) >= 7 AND CAST([D13(D1301)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1301)] AS INT) >= 9 AND CAST([D13(D1301)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1301)] AS INT) >= 1 AND CAST([D13(D1301)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 3 AND CAST([D13(D1301)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 5 AND CAST([D13(D1301)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1301)] AS INT) >= 7 AND CAST([D13(D1301)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1301)] AS INT) >= 9 AND CAST([D13(D1301)] AS INT) <= 10 THEN 'muy_alta'
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

  	def self.get_general_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1301)] AS INT) >= 1 AND CAST([D13(D1301)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 3 AND CAST([D13(D1301)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 5 AND CAST([D13(D1301)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1301)] AS INT) >= 9 AND CAST([D13(D1301)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1301)] AS INT) >= 7 AND CAST([D13(D1301)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1301)] AS INT) >= 1 AND CAST([D13(D1301)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 3 AND CAST([D13(D1301)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1301)] AS INT) >= 5 AND CAST([D13(D1301)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1301)] AS INT) >= 9 AND CAST([D13(D1301)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1301)] AS INT) >= 7 AND CAST([D13(D1301)] AS INT) <= 8 THEN 'alta'
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




  ############################# TRANSPORTACION
  def self.get_transportacion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1302)] AS INT) >= 1 AND CAST([D13(D1302)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 3 AND CAST([D13(D1302)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 5 AND CAST([D13(D1302)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1302)] AS INT) >= 7 AND CAST([D13(D1302)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1302)] AS INT) >= 9 AND CAST([D13(D1302)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1302)] AS INT) >= 1 AND CAST([D13(D1302)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 3 AND CAST([D13(D1302)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 5 AND CAST([D13(D1302)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1302)] AS INT) >= 7 AND CAST([D13(D1302)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1302)] AS INT) >= 9 AND CAST([D13(D1302)] AS INT) <= 10 THEN 'muy_alta'
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

  	def self.get_transportacion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1302)] AS INT) >= 1 AND CAST([D13(D1302)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 3 AND CAST([D13(D1302)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 5 AND CAST([D13(D1302)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1302)] AS INT) >= 9 AND CAST([D13(D1302)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1302)] AS INT) >= 7 AND CAST([D13(D1302)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1302)] AS INT) >= 1 AND CAST([D13(D1302)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 3 AND CAST([D13(D1302)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1302)] AS INT) >= 5 AND CAST([D13(D1302)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1302)] AS INT) >= 9 AND CAST([D13(D1302)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1302)] AS INT) >= 7 AND CAST([D13(D1302)] AS INT) <= 8 THEN 'alta'
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




  ############################## HOSPEDAJE
  def self.get_hospedaje_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1303)] AS INT) >= 1 AND CAST([D13(D1303)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 3 AND CAST([D13(D1303)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 5 AND CAST([D13(D1303)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1303)] AS INT) >= 7 AND CAST([D13(D1303)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1303)] AS INT) >= 9 AND CAST([D13(D1303)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1303)] AS INT) >= 1 AND CAST([D13(D1303)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 3 AND CAST([D13(D1303)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 5 AND CAST([D13(D1303)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1303)] AS INT) >= 7 AND CAST([D13(D1303)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1303)] AS INT) >= 9 AND CAST([D13(D1303)] AS INT) <= 10 THEN 'muy_alta'
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

  	def self.get_hospedaje_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1303)] AS INT) >= 1 AND CAST([D13(D1303)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 3 AND CAST([D13(D1303)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 5 AND CAST([D13(D1303)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1303)] AS INT) >= 9 AND CAST([D13(D1303)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1303)] AS INT) >= 7 AND CAST([D13(D1303)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1303)] AS INT) >= 1 AND CAST([D13(D1303)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 3 AND CAST([D13(D1303)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1303)] AS INT) >= 5 AND CAST([D13(D1303)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1303)] AS INT) >= 9 AND CAST([D13(D1303)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1303)] AS INT) >= 7 AND CAST([D13(D1303)] AS INT) <= 8 THEN 'alta'
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



	##################################### TRANSPORTE
	def self.get_transporte_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1305)] AS INT) >= 1 AND CAST([D13(D1305)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 3 AND CAST([D13(D1305)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 5 AND CAST([D13(D1305)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1305)] AS INT) >= 7 AND CAST([D13(D1305)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1305)] AS INT) >= 9 AND CAST([D13(D1305)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1305)] AS INT) >= 1 AND CAST([D13(D1305)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 3 AND CAST([D13(D1305)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 5 AND CAST([D13(D1305)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1305)] AS INT) >= 7 AND CAST([D13(D1305)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1305)] AS INT) >= 9 AND CAST([D13(D1305)] AS INT) <= 10 THEN 'muy_alta'
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

  	def self.get_transporte_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1305)] AS INT) >= 1 AND CAST([D13(D1305)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 3 AND CAST([D13(D1305)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 5 AND CAST([D13(D1305)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1305)] AS INT) >= 9 AND CAST([D13(D1305)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1305)] AS INT) >= 7 AND CAST([D13(D1305)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1305)] AS INT) >= 1 AND CAST([D13(D1305)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 3 AND CAST([D13(D1305)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1305)] AS INT) >= 5 AND CAST([D13(D1305)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1305)] AS INT) >= 9 AND CAST([D13(D1305)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1305)] AS INT) >= 7 AND CAST([D13(D1305)] AS INT) <= 8 THEN 'alta'
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



	##################################### ALIMENTOS
	def self.get_alimentos_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1307)] AS INT) >= 1 AND CAST([D13(D1307)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 3 AND CAST([D13(D1307)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 5 AND CAST([D13(D1307)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1307)] AS INT) >= 7 AND CAST([D13(D1307)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1307)] AS INT) >= 9 AND CAST([D13(D1307)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1307)] AS INT) >= 1 AND CAST([D13(D1307)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 3 AND CAST([D13(D1307)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 5 AND CAST([D13(D1307)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1307)] AS INT) >= 7 AND CAST([D13(D1307)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1307)] AS INT) >= 9 AND CAST([D13(D1307)] AS INT) <= 10 THEN 'muy_alta'
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

  	def self.get_alimentos_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1307)] AS INT) >= 1 AND CAST([D13(D1307)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 3 AND CAST([D13(D1307)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 5 AND CAST([D13(D1307)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1307)] AS INT) >= 9 AND CAST([D13(D1307)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1307)] AS INT) >= 7 AND CAST([D13(D1307)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1307)] AS INT) >= 1 AND CAST([D13(D1307)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 3 AND CAST([D13(D1307)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1307)] AS INT) >= 5 AND CAST([D13(D1307)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1307)] AS INT) >= 9 AND CAST([D13(D1307)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1307)] AS INT) >= 7 AND CAST([D13(D1307)] AS INT) <= 8 THEN 'alta'
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





	##################################### EXCURSION
	def self.get_excursion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1304)] AS INT) >= 1 AND CAST([D13(D1304)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 3 AND CAST([D13(D1304)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 5 AND CAST([D13(D1304)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1304)] AS INT) >= 7 AND CAST([D13(D1304)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1304)] AS INT) >= 9 AND CAST([D13(D1304)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1304)] AS INT) >= 1 AND CAST([D13(D1304)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 3 AND CAST([D13(D1304)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 5 AND CAST([D13(D1304)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1304)] AS INT) >= 7 AND CAST([D13(D1304)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1304)] AS INT) >= 9 AND CAST([D13(D1304)] AS INT) <= 10 THEN 'muy_alta'
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

  	def self.get_excursion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1304)] AS INT) >= 1 AND CAST([D13(D1304)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 3 AND CAST([D13(D1304)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 5 AND CAST([D13(D1304)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1304)] AS INT) >= 9 AND CAST([D13(D1304)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1304)] AS INT) >= 7 AND CAST([D13(D1304)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1304)] AS INT) >= 1 AND CAST([D13(D1304)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 3 AND CAST([D13(D1304)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1304)] AS INT) >= 5 AND CAST([D13(D1304)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1304)] AS INT) >= 9 AND CAST([D13(D1304)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1304)] AS INT) >= 7 AND CAST([D13(D1304)] AS INT) <= 8 THEN 'alta'
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




	##################################### ESTACIONAMIENTO
	def self.get_estacionamiento_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1306)] AS INT) >= 1 AND CAST([D13(D1306)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 3 AND CAST([D13(D1306)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 5 AND CAST([D13(D1306)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1306)] AS INT) >= 7 AND CAST([D13(D1306)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1306)] AS INT) >= 9 AND CAST([D13(D1306)] AS INT) <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1306)] AS INT) >= 1 AND CAST([D13(D1306)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 3 AND CAST([D13(D1306)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 5 AND CAST([D13(D1306)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1306)] AS INT) >= 7 AND CAST([D13(D1306)] AS INT) <= 8 THEN 'alta'
	           	WHEN CAST([D13(D1306)] AS INT) >= 9 AND CAST([D13(D1306)] AS INT) <= 10 THEN 'muy_alta'
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

  	def self.get_estacionamiento_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN CAST([D13(D1306)] AS INT) >= 1 AND CAST([D13(D1306)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 3 AND CAST([D13(D1306)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 5 AND CAST([D13(D1306)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1306)] AS INT) >= 9 AND CAST([D13(D1306)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1306)] AS INT) >= 7 AND CAST([D13(D1306)] AS INT) <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN CAST([D13(D1306)] AS INT) >= 1 AND CAST([D13(D1306)] AS INT) <= 2 THEN 'muy_baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 3 AND CAST([D13(D1306)] AS INT) <= 4 THEN 'baja'
	           	WHEN CAST([D13(D1306)] AS INT) >= 5 AND CAST([D13(D1306)] AS INT) <= 6 THEN 'media'
	           	WHEN CAST([D13(D1306)] AS INT) >= 9 AND CAST([D13(D1306)] AS INT) <= 10 THEN 'muy_alta'
	           	WHEN CAST([D13(D1306)] AS INT) >= 7 AND CAST([D13(D1306)] AS INT) <= 8 THEN 'alta'
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