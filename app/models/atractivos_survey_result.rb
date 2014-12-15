class AtractivosSurveyResult < ActiveRecord::Base
		include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

  def self.get_data
  		  	sql = 'SELECT 
			ROUND(AVG(CAST([B3(B301)] AS INT)), 1) as servicios_average,
			ROUND(AVG(CAST([B3(B301)] AS INT)), 1) as conservacion_average,
			ROUND(AVG(CAST([B3(B301)] AS INT)), 1) as variedad_average,
			ROUND(AVG(CAST([B3(B301)] AS INT)), 1) as calidad_average,
			ROUND(AVG(CAST([B3(B301)] AS INT)), 1) as culturales_average,
			ROUND(AVG(CAST([B3(B301)] AS INT)), 1) as naturales_average
		 FROM "tbl_Results_v1"'

	data = []

	AtractivosSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("atractivosServicios", "Atractivos y los Servicios", row.servicios_average)
		data << ReactivoOverviewData.new("atractivosConcervacion", "Conservacion de los atractivos", row.conservacion_average)
		data << ReactivoOverviewData.new("atractivosVariedad", "Variedad de los atractivos", row.variedad_average)
		data << ReactivoOverviewData.new("atractivosCalidad", "Calidad de los atractivos", row.calidad_average)
		data << ReactivoOverviewData.new("atractivosCulturales", "Conservacion de los atractivos culturales", row.culturales_average)
		data << ReactivoOverviewData.new("atractivosNaturales", "Conservacion de los atractivos naturales", row.naturales_average)
	end

	data
  end

def self.get_servicios_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B301)] >= 1 AND [B3(B301)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B301)] >= 3 AND [B3(B301)] <= 4 THEN 'baja'
	           	WHEN [B3(B301)] >= 5 AND [B3(B301)] <= 6 THEN 'media'
	           	WHEN [B3(B301)] >= 7 AND [B3(B301)] <= 8 THEN 'alta'
	           	WHEN [B3(B301)] >= 9 AND [B3(B301)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B301)] >= 1 AND [B3(B301)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B301)] >= 3 AND [B3(B301)] <= 4 THEN 'baja'
	           	WHEN [B3(B301)] >= 5 AND [B3(B301)] <= 6 THEN 'media'
	           	WHEN [B3(B301)] >= 7 AND [B3(B301)] <= 8 THEN 'alta'
	           	WHEN [B3(B301)] >= 9 AND [B3(B301)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_servicios_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B301)] >= 1 AND [B3(B301)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B301)] >= 3 AND [B3(B301)] <= 4 THEN 'baja'
	           	WHEN [B3(B301)] >= 5 AND [B3(B301)] <= 6 THEN 'media'
	           	WHEN [B3(B301)] >= 9 AND [B3(B301)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B301)] >= 7 AND [B3(B301)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B301)] >= 1 AND [B3(B301)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B301)] >= 3 AND [B3(B301)] <= 4 THEN 'baja'
	           	WHEN [B3(B301)] >= 5 AND [B3(B301)] <= 6 THEN 'media'
	           	WHEN [B3(B301)] >= 9 AND [B3(B301)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B301)] >= 7 AND [B3(B301)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
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


def self.get_conservacion_data()
	  		sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B302)] >= 1 AND [B3(B302)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B302)] >= 3 AND [B3(B302)] <= 4 THEN 'baja'
	           	WHEN [B3(B302)] >= 5 AND [B3(B302)] <= 6 THEN 'media'
	           	WHEN [B3(B302)] >= 7 AND [B3(B302)] <= 8 THEN 'alta'
	           	WHEN [B3(B302)] >= 9 AND [B3(B302)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B302)] >= 1 AND [B3(B302)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B302)] >= 3 AND [B3(B302)] <= 4 THEN 'baja'
	           	WHEN [B3(B302)] >= 5 AND [B3(B302)] <= 6 THEN 'media'
	           	WHEN [B3(B302)] >= 7 AND [B3(B302)] <= 8 THEN 'alta'
	           	WHEN [B3(B302)] >= 9 AND [B3(B302)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_conservacion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B302)] >= 1 AND [B3(B302)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B302)] >= 3 AND [B3(B302)] <= 4 THEN 'baja'
	           	WHEN [B3(B302)] >= 5 AND [B3(B302)] <= 6 THEN 'media'
	           	WHEN [B3(B302)] >= 9 AND [B3(B302)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B302)] >= 7 AND [B3(B302)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B302)] >= 1 AND [B3(B302)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B302)] >= 3 AND [B3(B302)] <= 4 THEN 'baja'
	           	WHEN [B3(B302)] >= 5 AND [B3(B302)] <= 6 THEN 'media'
	           	WHEN [B3(B302)] >= 9 AND [B3(B302)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B302)] >= 7 AND [B3(B302)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
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



def self.get_variedad_data()
	  		sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B303)] >= 1 AND [B3(B303)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B303)] >= 3 AND [B3(B303)] <= 4 THEN 'baja'
	           	WHEN [B3(B303)] >= 5 AND [B3(B303)] <= 6 THEN 'media'
	           	WHEN [B3(B303)] >= 7 AND [B3(B303)] <= 8 THEN 'alta'
	           	WHEN [B3(B303)] >= 9 AND [B3(B303)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B303)] >= 1 AND [B3(B303)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B303)] >= 3 AND [B3(B303)] <= 4 THEN 'baja'
	           	WHEN [B3(B303)] >= 5 AND [B3(B303)] <= 6 THEN 'media'
	           	WHEN [B3(B303)] >= 7 AND [B3(B303)] <= 8 THEN 'alta'
	           	WHEN [B3(B303)] >= 9 AND [B3(B303)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_variedad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B303)] >= 1 AND [B3(B303)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B303)] >= 3 AND [B3(B303)] <= 4 THEN 'baja'
	           	WHEN [B3(B303)] >= 5 AND [B3(B303)] <= 6 THEN 'media'
	           	WHEN [B3(B303)] >= 9 AND [B3(B303)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B303)] >= 7 AND [B3(B303)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B303)] >= 1 AND [B3(B303)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B303)] >= 3 AND [B3(B303)] <= 4 THEN 'baja'
	           	WHEN [B3(B303)] >= 5 AND [B3(B303)] <= 6 THEN 'media'
	           	WHEN [B3(B303)] >= 9 AND [B3(B303)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B303)] >= 7 AND [B3(B303)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
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




def self.get_calidad_data()
	  		sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B304)] >= 1 AND [B3(B304)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B304)] >= 3 AND [B3(B304)] <= 4 THEN 'baja'
	           	WHEN [B3(B304)] >= 5 AND [B3(B304)] <= 6 THEN 'media'
	           	WHEN [B3(B304)] >= 7 AND [B3(B304)] <= 8 THEN 'alta'
	           	WHEN [B3(B304)] >= 9 AND [B3(B304)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B304)] >= 1 AND [B3(B304)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B304)] >= 3 AND [B3(B304)] <= 4 THEN 'baja'
	           	WHEN [B3(B304)] >= 5 AND [B3(B304)] <= 6 THEN 'media'
	           	WHEN [B3(B304)] >= 7 AND [B3(B304)] <= 8 THEN 'alta'
	           	WHEN [B3(B304)] >= 9 AND [B3(B304)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_calidad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B304)] >= 1 AND [B3(B304)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B304)] >= 3 AND [B3(B304)] <= 4 THEN 'baja'
	           	WHEN [B3(B304)] >= 5 AND [B3(B304)] <= 6 THEN 'media'
	           	WHEN [B3(B304)] >= 9 AND [B3(B304)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B304)] >= 7 AND [B3(B304)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B304)] >= 1 AND [B3(B304)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B304)] >= 3 AND [B3(B304)] <= 4 THEN 'baja'
	           	WHEN [B3(B304)] >= 5 AND [B3(B304)] <= 6 THEN 'media'
	           	WHEN [B3(B304)] >= 9 AND [B3(B304)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B304)] >= 7 AND [B3(B304)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
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



def self.get_culturales_data()
	  		sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B305)] >= 1 AND [B3(B305)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B305)] >= 3 AND [B3(B305)] <= 4 THEN 'baja'
	           	WHEN [B3(B305)] >= 5 AND [B3(B305)] <= 6 THEN 'media'
	           	WHEN [B3(B305)] >= 7 AND [B3(B305)] <= 8 THEN 'alta'
	           	WHEN [B3(B305)] >= 9 AND [B3(B305)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B305)] >= 1 AND [B3(B305)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B305)] >= 3 AND [B3(B305)] <= 4 THEN 'baja'
	           	WHEN [B3(B305)] >= 5 AND [B3(B305)] <= 6 THEN 'media'
	           	WHEN [B3(B305)] >= 7 AND [B3(B305)] <= 8 THEN 'alta'
	           	WHEN [B3(B305)] >= 9 AND [B3(B305)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_culturales_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B305)] >= 1 AND [B3(B305)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B305)] >= 3 AND [B3(B305)] <= 4 THEN 'baja'
	           	WHEN [B3(B305)] >= 5 AND [B3(B305)] <= 6 THEN 'media'
	           	WHEN [B3(B305)] >= 9 AND [B3(B305)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B305)] >= 7 AND [B3(B305)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B305)] >= 1 AND [B3(B305)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B305)] >= 3 AND [B3(B305)] <= 4 THEN 'baja'
	           	WHEN [B3(B305)] >= 5 AND [B3(B305)] <= 6 THEN 'media'
	           	WHEN [B3(B305)] >= 9 AND [B3(B305)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B305)] >= 7 AND [B3(B305)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
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





def self.get_naturales_data()
	  		sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B306)] >= 1 AND [B3(B306)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B306)] >= 3 AND [B3(B306)] <= 4 THEN 'baja'
	           	WHEN [B3(B306)] >= 5 AND [B3(B306)] <= 6 THEN 'media'
	           	WHEN [B3(B306)] >= 7 AND [B3(B306)] <= 8 THEN 'alta'
	           	WHEN [B3(B306)] >= 9 AND [B3(B306)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B306)] >= 1 AND [B3(B306)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B306)] >= 3 AND [B3(B306)] <= 4 THEN 'baja'
	           	WHEN [B3(B306)] >= 5 AND [B3(B306)] <= 6 THEN 'media'
	           	WHEN [B3(B306)] >= 7 AND [B3(B306)] <= 8 THEN 'alta'
	           	WHEN [B3(B306)] >= 9 AND [B3(B306)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_naturales_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [B3(B306)] >= 1 AND [B3(B306)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B306)] >= 3 AND [B3(B306)] <= 4 THEN 'baja'
	           	WHEN [B3(B306)] >= 5 AND [B3(B306)] <= 6 THEN 'media'
	           	WHEN [B3(B306)] >= 9 AND [B3(B306)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B306)] >= 7 AND [B3(B306)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [B3(B306)] >= 1 AND [B3(B306)] <= 2 THEN 'muy_baja'
	           	WHEN [B3(B306)] >= 3 AND [B3(B306)] <= 4 THEN 'baja'
	           	WHEN [B3(B306)] >= 5 AND [B3(B306)] <= 6 THEN 'media'
	           	WHEN [B3(B306)] >= 9 AND [B3(B306)] <= 10 THEN 'muy_alta'
	           	WHEN [B3(B306)] >= 7 AND [B3(B306)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		AtractivosSurveyResult.find_by_sql(sql).each do |row|
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