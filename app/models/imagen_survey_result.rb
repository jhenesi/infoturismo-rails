class ImagenSurveyResult < ActiveRecord::Base
		
include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

  def self.get_data
  		  	sql = 'SELECT 
			ROUND(AVG(CAST([F16(F1601)] AS INT)), 1) as percepcion_average,
			ROUND(AVG(CAST([F16(F1602)] AS INT)), 1) as sitios_average,
			ROUND(AVG(CAST([F16(F1603)] AS INT)), 1) as vendedores_average,
			ROUND(AVG(CAST([F16(F1604)] AS INT)), 1) as transito_average,
			ROUND(AVG(CAST([F16(F1605)] AS INT)), 1) as limpieza_average
				FROM "tbl_Results_v1"'

	

	data = []

	ImagenSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("percepcion", "Percepcion de seguridad", row.percepcion_average)
		data << ReactivoOverviewData.new("sitios", "Imagen de los sitios naturales o culturales", row.sitios_average)
		data << ReactivoOverviewData.new("vendedores", "Vendedores ambulantes", row.vendedores_average)
		data << ReactivoOverviewData.new("transito", "Transito vehicular", row.transito_average)
		data << ReactivoOverviewData.new("limpieza", "Limpieza de calles y areas publicas", row.limpieza_average)
	end
	data
  end

def self.get_percepcion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1601)] >= 1 AND [F16(F1601)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1601)] >= 3 AND [F16(F1601)] <= 4 THEN 'baja'
	           	WHEN [F16(F1601)] >= 5 AND [F16(F1601)] <= 6 THEN 'media'
	           	WHEN [F16(F1601)] >= 7 AND [F16(F1601)] <= 8 THEN 'alta'
	           	WHEN [F16(F1601)] >= 9 AND [F16(F1601)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1601)] >= 1 AND [F16(F1601)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1601)] >= 3 AND [F16(F1601)] <= 4 THEN 'baja'
	           	WHEN [F16(F1601)] >= 5 AND [F16(F1601)] <= 6 THEN 'media'
	           	WHEN [F16(F1601)] >= 7 AND [F16(F1601)] <= 8 THEN 'alta'
	           	WHEN [F16(F1601)] >= 9 AND [F16(F1601)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ImagenSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_percepcion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1601)] >= 1 AND [F16(F1601)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1601)] >= 3 AND [F16(F1601)] <= 4 THEN 'baja'
	           	WHEN [F16(F1601)] >= 5 AND [F16(F1601)] <= 6 THEN 'media'
	           	WHEN [F16(F1601)] >= 9 AND [F16(F1601)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1601)] >= 7 AND [F16(F1601)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1601)] >= 1 AND [F16(F1601)]<= 2 THEN 'muy_baja'
	           	WHEN [F16(F1601)] >= 3 AND [F16(F1601)] <= 4 THEN 'baja'
	           	WHEN [F16(F1601)] >= 5 AND [F16(F1601)] <= 6 THEN 'media'
	           	WHEN [F16(F1601)] >= 9 AND [F16(F1601)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1601)] >= 7 AND [F16(F1601)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ImagenSurveyResult.find_by_sql(sql).each do |row|
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



	def self.get_sitios_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1602)] >= 1 AND [F16(F1602)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1602)] >= 3 AND [F16(F1602)] <= 4 THEN 'baja'
	           	WHEN [F16(F1602)] >= 5 AND [F16(F1602)] <= 6 THEN 'media'
	           	WHEN [F16(F1602)] >= 7 AND [F16(F1602)] <= 8 THEN 'alta'
	           	WHEN [F16(F1602)] >= 9 AND [F16(F1602)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1602)] >= 1 AND [F16(F1602)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1602)] >= 3 AND [F16(F1602)] <= 4 THEN 'baja'
	           	WHEN [F16(F1602)] >= 5 AND [F16(F1602)] <= 6 THEN 'media'
	           	WHEN [F16(F1602)] >= 7 AND [F16(F1602)] <= 8 THEN 'alta'
	           	WHEN [F16(F1602)] >= 9 AND [F16(F1602)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ImagenSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_sitios_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1602)] >= 1 AND [F16(F1602)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1602)] >= 3 AND [F16(F1602)] <= 4 THEN 'baja'
	           	WHEN [F16(F1602)] >= 5 AND [F16(F1602)] <= 6 THEN 'media'
	           	WHEN [F16(F1602)] >= 9 AND [F16(F1602)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1602)] >= 7 AND [F16(F1602)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1602)] >= 1 AND [F16(F1602)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1602)] >= 3 AND [F16(F1602)] <= 4 THEN 'baja'
	           	WHEN [F16(F1602)] >= 5 AND [F16(F1602)] <= 6 THEN 'media'
	           	WHEN [F16(F1602)] >= 9 AND [F16(F1602)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1602)] >= 7 AND [F16(F1602)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ImagenSurveyResult.find_by_sql(sql).each do |row|
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

	def self.get_vendedores_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1603)] >= 1 AND [F16(F1603)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1603)] >= 3 AND [F16(F1603)] <= 4 THEN 'baja'
	           	WHEN [F16(F1603)] >= 5 AND [F16(F1603)] <= 6 THEN 'media'
	           	WHEN [F16(F1603)] >= 7 AND [F16(F1603)] <= 8 THEN 'alta'
	           	WHEN [F16(F1603)] >= 9 AND [F16(F1603)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1603)] >= 1 AND [F16(F1603)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1603)] >= 3 AND [F16(F1603)] <= 4 THEN 'baja'
	           	WHEN [F16(F1603)] >= 5 AND [F16(F1603)] <= 6 THEN 'media'
	           	WHEN [F16(F1603)] >= 7 AND [F16(F1603)] <= 8 THEN 'alta'
	           	WHEN [F16(F1603)] >= 9 AND [F16(F1603)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ImagenSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_vendedores_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1603)] >= 1 AND [F16(F1603)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1603)] >= 3 AND [F16(F1603)] <= 4 THEN 'baja'
	           	WHEN [F16(F1603)] >= 5 AND [F16(F1603)] <= 6 THEN 'media'
	           	WHEN [F16(F1603)] >= 9 AND [F16(F1603)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1603)] >= 7 AND [F16(F1603)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1603)] >= 1 AND [F16(F1603)]<= 2 THEN 'muy_baja'
	           	WHEN [F16(F1603)] >= 3 AND [F16(F1603)] <= 4 THEN 'baja'
	           	WHEN [F16(F1603)] >= 5 AND [F16(F1603)] <= 6 THEN 'media'
	           	WHEN [F16(F1603)] >= 9 AND [F16(F1603)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1603)] >= 7 AND [F16(F1603)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ImagenSurveyResult.find_by_sql(sql).each do |row|
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


	def self.get_transito_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1604)] >= 1 AND [F16(F1604)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1604)] >= 3 AND [F16(F1604)] <= 4 THEN 'baja'
	           	WHEN [F16(F1604)] >= 5 AND [F16(F1604)] <= 6 THEN 'media'
	           	WHEN [F16(F1604)] >= 7 AND [F16(F1604)] <= 8 THEN 'alta'
	           	WHEN [F16(F1604)] >= 9 AND [F16(F1604)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1604)] >= 1 AND [F16(F1604)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1604)] >= 3 AND [F16(F1604)] <= 4 THEN 'baja'
	           	WHEN [F16(F1604)] >= 5 AND [F16(F1604)] <= 6 THEN 'media'
	           	WHEN [F16(F1604)] >= 7 AND [F16(F1604)] <= 8 THEN 'alta'
	           	WHEN [F16(F1604)] >= 9 AND [F16(F1604)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ImagenSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_transito_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1604)] >= 1 AND [F16(F1604)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1604)] >= 3 AND [F16(F1604)] <= 4 THEN 'baja'
	           	WHEN [F16(F1604)] >= 5 AND [F16(F1604)] <= 6 THEN 'media'
	           	WHEN [F16(F1604)] >= 9 AND [F16(F1604)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1604)] >= 7 AND [F16(F1604)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1604)] >= 1 AND [F16(F1604)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1604)] >= 3 AND [F16(F1604)] <= 4 THEN 'baja'
	           	WHEN [F16(F1604)] >= 5 AND [F16(F1604)] <= 6 THEN 'media'
	           	WHEN [F16(F1604)] >= 9 AND [F16(F1604)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1604)] >= 7 AND [F16(F1604)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ImagenSurveyResult.find_by_sql(sql).each do |row|
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


def self.get_limpieza_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1605)] >= 1 AND [F16(F1605)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1605)] >= 3 AND [F16(F1605)] <= 4 THEN 'baja'
	           	WHEN [F16(F1605)] >= 5 AND [F16(F1605)] <= 6 THEN 'media'
	           	WHEN [F16(F1605)] >= 7 AND [F16(F1605)] <= 8 THEN 'alta'
	           	WHEN [F16(F1605)] >= 9 AND [F16(F1605)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1605)] >= 1 AND [F16(F1605)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1605)] >= 3 AND [F16(F1605)] <= 4 THEN 'baja'
	           	WHEN [F16(F1605)] >= 5 AND [F16(F1605)] <= 6 THEN 'media'
	           	WHEN [F16(F1605)] >= 7 AND [F16(F1605)] <= 8 THEN 'alta'
	           	WHEN [F16(F1605)] >= 9 AND [F16(F1605)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ImagenSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_limpieza_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [F16(F1605)] >= 1 AND [F16(F1605)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1605)] >= 3 AND [F16(F1605)] <= 4 THEN 'baja'
	           	WHEN [F16(F1605)] >= 5 AND [F16(F1605)] <= 6 THEN 'media'
	           	WHEN [F16(F1605)] >= 9 AND [F16(F1605)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1605)] >= 7 AND [F16(F1605)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [F16(F1605)] >= 1 AND [F16(F1605)] <= 2 THEN 'muy_baja'
	           	WHEN [F16(F1605)] >= 3 AND [F16(F1605)] <= 4 THEN 'baja'
	           	WHEN [F16(F1605)] >= 5 AND [F16(F1605)] <= 6 THEN 'media'
	           	WHEN [F16(F1605)] >= 9 AND [F16(F1605)] <= 10 THEN 'muy_alta'
	           	WHEN [F16(F1605)] >= 7 AND [F16(F1605)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ImagenSurveyResult.find_by_sql(sql).each do |row|
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



