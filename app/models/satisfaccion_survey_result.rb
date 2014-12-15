class SatisfaccionSurveyResult < ActiveRecord::Base
	include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

  def self.get_data
  	sql = 
	  	'SELECT 
			ROUND(AVG(CAST([G17(G1701)] AS INT)), 1) as nivel_average,
			ROUND(AVG(CAST([G17(G1702)] AS INT)), 1) as expectativas_average,
			ROUND(AVG(CAST([G17(G1704)] AS INT)), 1) as disposicion_average,
			ROUND(AVG(CAST([G17(G1705)] AS INT)), 1) as recomendacion_average
			
		 FROM "tbl_Results_v1"'

	data = []

	SatisfaccionSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("nivel", "Nivel de satisfaccion", row.nivel_average)
		data << ReactivoOverviewData.new("expectativas", "Cumplimiento de expectativas", row.expectativas_average)
		data << ReactivoOverviewData.new("disposicion", "Disposicion de visitarnos nuevamente", row.disposicion_average)
		data << ReactivoOverviewData.new("recomendacion", "Recomendaria a su amigos y familares visitarnos", row.recomendacion_average)
	
	end

	data
  end




def self.get_nivel_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1701)] >= 1 AND [G17(G1701)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1701)] >= 3 AND [G17(G1701)] <= 4 THEN 'baja'
	           	WHEN [G17(G1701)] >= 5 AND [G17(G1701)] <= 6 THEN 'media'
	           	WHEN [G17(G1701)] >= 7 AND [G17(G1701)] <= 8 THEN 'alta'
	           	WHEN [G17(G1701)] >= 9 AND [G17(G1701)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1701)] >= 1 AND [G17(G1701)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1701)] >= 3 AND [G17(G1701)] <= 4 THEN 'baja'
	           	WHEN [G17(G1701)] >= 5 AND [G17(G1701)] <= 6 THEN 'media'
	           	WHEN [G17(G1701)] >= 7 AND [G17(G1701)] <= 8 THEN 'alta'
	           	WHEN [G17(G1701)] >= 9 AND [G17(G1701)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end


  	def self.get_nivel_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1701)] >= 1 AND [G17(G1701)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1701)] >= 3 AND [G17(G1701)] <= 4 THEN 'baja'
	           	WHEN [G17(G1701)] >= 5 AND [G17(G1701)] <= 6 THEN 'media'
	           	WHEN [G17(G1701)] >= 9 AND [G17(G1701)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1701)] >= 7 AND [G17(G1701)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1701)] >= 1 AND [G17(G1701)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1701)] >= 3 AND [G17(G1701)] <= 4 THEN 'baja'
	           	WHEN [G17(G1701)] >= 5 AND [G17(G1701)] <= 6 THEN 'media'
	           	WHEN [G17(G1701)] >= 9 AND [G17(G1701)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1701)] >= 7 AND [G17(G1701)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

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

def self.get_expectativas_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1702)] >= 1 AND [G17(G1702)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1702)] >= 3 AND [G17(G1702)] <= 4 THEN 'baja'
	           	WHEN [G17(G1702)] >= 5 AND [G17(G1702)] <= 6 THEN 'media'
	           	WHEN [G17(G1702)] >= 7 AND [G17(G1702)] <= 8 THEN 'alta'
	           	WHEN [G17(G1702)] >= 9 AND [G17(G1702)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1702)] >= 1 AND [G17(G1702)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1702)] >= 3 AND [G17(G1702)] <= 4 THEN 'baja'
	           	WHEN [G17(G1702)] >= 5 AND [G17(G1702)] <= 6 THEN 'media'
	           	WHEN [G17(G1702)] >= 7 AND [G17(G1702)] <= 8 THEN 'alta'
	           	WHEN [G17(G1702)] >= 9 AND [G17(G1702)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end


  	def self.get_expectativas_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1702)] >= 1 AND [G17(G1702)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1702)] >= 3 AND [G17(G1702)] <= 4 THEN 'baja'
	           	WHEN [G17(G1702)] >= 5 AND [G17(G1702)] <= 6 THEN 'media'
	           	WHEN [G17(G1702)] >= 9 AND [G17(G1702)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1702)] >= 7 AND [G17(G1702)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1702)] >= 1 AND [G17(G1702)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1702)] >= 3 AND [G17(G1702)] <= 4 THEN 'baja'
	           	WHEN [G17(G1702)] >= 5 AND [G17(G1702)] <= 6 THEN 'media'
	           	WHEN [G17(G1702)] >= 9 AND [G17(G1702)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1702)] >= 7 AND [G17(G1702)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

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




	def self.get_disposicion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1703)] >= 1 AND [G17(G1703)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1703)] >= 3 AND [G17(G1703)] <= 4 THEN 'baja'
	           	WHEN [G17(G1703)] >= 5 AND [G17(G1703)] <= 6 THEN 'media'
	           	WHEN [G17(G1703)] >= 7 AND [G17(G1703)] <= 8 THEN 'alta'
	           	WHEN [G17(G1703)] >= 9 AND [G17(G1703)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1703)] >= 1 AND [G17(G1703)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1703)] >= 3 AND [G17(G1703)] <= 4 THEN 'baja'
	           	WHEN [G17(G1703)] >= 5 AND [G17(G1703)] <= 6 THEN 'media'
	           	WHEN [G17(G1703)] >= 7 AND [G17(G1703)] <= 8 THEN 'alta'
	           	WHEN [G17(G1703)] >= 9 AND [G17(G1703)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end


  	def self.get_disposicion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1703)] >= 1 AND [G17(G1703)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1703)] >= 3 AND [G17(G1703)] <= 4 THEN 'baja'
	           	WHEN [G17(G1703)] >= 5 AND [G17(G1703)] <= 6 THEN 'media'
	           	WHEN [G17(G1703)] >= 9 AND [G17(G1703)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1703)] >= 7 AND [G17(G1703)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1703)] >= 1 AND [G17(G1703)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1703)] >= 3 AND [G17(G1703)] <= 4 THEN 'baja'
	           	WHEN [G17(G1703)] >= 5 AND [G17(G1703)] <= 6 THEN 'media'
	           	WHEN [G17(G1703)] >= 9 AND [G17(G1703)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1703)] >= 7 AND [G17(G1703)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

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


def self.get_recomendacion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1704)] >= 1 AND [G17(G1704)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1704)] >= 3 AND [G17(G1704)] <= 4 THEN 'baja'
	           	WHEN [G17(G1704)] >= 5 AND [G17(G1704)] <= 6 THEN 'media'
	           	WHEN [G17(G1704)] >= 7 AND [G17(G1704)] <= 8 THEN 'alta'
	           	WHEN [G17(G1704)] >= 9 AND [G17(G1704)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1704)] >= 1 AND [G17(G1704)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1704)] >= 3 AND [G17(G1704)] <= 4 THEN 'baja'
	           	WHEN [G17(G1704)] >= 5 AND [G17(G1704)] <= 6 THEN 'media'
	           	WHEN [G17(G1704)] >= 7 AND [G17(G1704)] <= 8 THEN 'alta'
	           	WHEN [G17(G1704)] >= 9 AND [G17(G1704)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		AccesoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end


  	def self.get_recomendacion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [G17(G1704)] >= 1 AND [G17(G1704)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1704)] >= 3 AND [G17(G1704)] <= 4 THEN 'baja'
	           	WHEN [G17(G1704)] >= 5 AND [G17(G1704)] <= 6 THEN 'media'
	           	WHEN [G17(G1704)] >= 9 AND [G17(G1704)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1704)] >= 7 AND [G17(G1704)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [G17(G1704)] >= 1 AND [G17(G1704)] <= 2 THEN 'muy_baja'
	           	WHEN [G17(G1704)] >= 3 AND [G17(G1704)] <= 4 THEN 'baja'
	           	WHEN [G17(G1704)] >= 5 AND [G17(G1704)] <= 6 THEN 'media'
	           	WHEN [G17(G1704)] >= 9 AND [G17(G1704)] <= 10 THEN 'muy_alta'
	           	WHEN [G17(G1704)] >= 7 AND [G17(G1704)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

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