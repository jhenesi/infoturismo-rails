class AccesoSurveyResult < ActiveRecord::Base
	include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

  def self.get_data
  	sql = 
	  	'SELECT 
			ROUND(AVG(CAST([A2(A201)] AS INT)), 1) as senalamiento_average,
			ROUND(AVG(CAST([A2(A202)] AS INT)), 1) as opciones_average,
			ROUND(AVG(CAST([A2(A203)] AS INT)), 1) as calidad_average,
			ROUND(AVG(CAST([A2(A204)] AS INT)), 1) as mantenimiento_average,
			ROUND(AVG(CAST([A2(A205)] AS INT)), 1) as atencion_average
		 FROM "tbl_Results_v1"'

	data = []

	AccesoSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("Senalamiento","Señalamiento para Arribar", row.senalamiento_average)
		data << ReactivoOverviewData.new("Opciones","Opciones de Transporte para Arribar", row.opciones_average)
		data << ReactivoOverviewData.new("Calidad","Calidad de la Infraestructura de Acceso", row.calidad_average)
		data << ReactivoOverviewData.new("Mantenimiento","Mantenimiento y Calidad del Medio de Transporte", row.mantenimiento_average)
		data << ReactivoOverviewData.new("Atencion", "Atención del personal de Transporte", row.atencion_average)
	end

	data
  end

  	def self.get_senalamiento_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A201)] >= 1 AND [A2(A201)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A201)] >= 3 AND [A2(A201)] <= 4 THEN 'baja'
	           	WHEN [A2(A201)] >= 5 AND [A2(A201)] <= 6 THEN 'media'
	           	WHEN [A2(A201)] >= 7 AND [A2(A201)] <= 8 THEN 'alta'
	           	WHEN [A2(A201)] >= 9 AND [A2(A201)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A201)] >= 1 AND [A2(A201)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A201)] >= 3 AND [A2(A201)] <= 4 THEN 'baja'
	           	WHEN [A2(A201)] >= 5 AND [A2(A201)] <= 6 THEN 'media'
	           	WHEN [A2(A201)] >= 7 AND [A2(A201)] <= 8 THEN 'alta'
	           	WHEN [A2(A201)] >= 9 AND [A2(A201)] <= 10 THEN 'muy_alta'
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

  	def self.get_senalamiento_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A201)] >= 1 AND [A2(A201)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A201)] >= 3 AND [A2(A201)] <= 4 THEN 'baja'
	           	WHEN [A2(A201)] >= 5 AND [A2(A201)] <= 6 THEN 'media'
	           	WHEN [A2(A201)] >= 9 AND [A2(A201)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A201)] >= 7 AND [A2(A201)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A201)] >= 1 AND [A2(A201)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A201)] >= 3 AND [A2(A201)] <= 4 THEN 'baja'
	           	WHEN [A2(A201)] >= 5 AND [A2(A201)] <= 6 THEN 'media'
	           	WHEN [A2(A201)] >= 9 AND [A2(A201)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A201)] >= 7 AND [A2(A201)] <= 8 THEN 'alta'
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



def self.get_opciones_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A202)] >= 1 AND [A2(A202)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A202)] >= 3 AND [A2(A202)] <= 4 THEN 'baja'
	           	WHEN [A2(A202)] >= 5 AND [A2(A202)] <= 6 THEN 'media'
	           	WHEN [A2(A202)] >= 7 AND [A2(A202)] <= 8 THEN 'alta'
	           	WHEN [A2(A202)] >= 9 AND [A2(A202)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A202)] >= 1 AND [A2(A202)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A202)] >= 3 AND [A2(A202)] <= 4 THEN 'baja'
	           	WHEN [A2(A202)] >= 5 AND [A2(A202)] <= 6 THEN 'media'
	           	WHEN [A2(A202)] >= 7 AND [A2(A202)] <= 8 THEN 'alta'
	           	WHEN [A2(A202)] >= 9 AND [A2(A202)] <= 10 THEN 'muy_alta'
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


  	def self.get_opciones_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A202)] >= 1 AND [A2(A202)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A202)] >= 3 AND [A2(A202)] <= 4 THEN 'baja'
	           	WHEN [A2(A202)] >= 5 AND [A2(A202)] <= 6 THEN 'media'
	           	WHEN [A2(A202)] >= 9 AND [A2(A202)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A202)] >= 7 AND [A2(A202)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A202)] >= 1 AND [A2(A202)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A202)] >= 3 AND [A2(A202)] <= 4 THEN 'baja'
	           	WHEN [A2(A202)] >= 5 AND [A2(A202)] <= 6 THEN 'media'
	           	WHEN [A2(A202)] >= 9 AND [A2(A202)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A202)] >= 7 AND [A2(A202)] <= 8 THEN 'alta'
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


def self.get_calidad_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A203)] >= 1 AND [A2(A203)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A203)] >= 3 AND [A2(A203)] <= 4 THEN 'baja'
	           	WHEN [A2(A203)] >= 5 AND [A2(A203)] <= 6 THEN 'media'
	           	WHEN [A2(A203)] >= 7 AND [A2(A203)] <= 8 THEN 'alta'
	           	WHEN [A2(A203)] >= 9 AND [A2(A203)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A203)] >= 1 AND [A2(A203)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A203)] >= 3 AND [A2(A203)] <= 4 THEN 'baja'
	           	WHEN [A2(A203)] >= 5 AND [A2(A203)] <= 6 THEN 'media'
	           	WHEN [A2(A203)] >= 7 AND [A2(A203)] <= 8 THEN 'alta'
	           	WHEN [A2(A203)] >= 9 AND [A2(A203)] <= 10 THEN 'muy_alta'
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

  	def self.get_calidad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A203)] >= 1 AND [A2(A203)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A203)] >= 3 AND [A2(A203)] <= 4 THEN 'baja'
	           	WHEN [A2(A203)] >= 5 AND [A2(A203)] <= 6 THEN 'media'
	           	WHEN [A2(A203)] >= 9 AND [A2(A203)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A203)] >= 7 AND [A2(A203)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A203)] >= 1 AND [A2(A203)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A203)] >= 3 AND [A2(A203)] <= 4 THEN 'baja'
	           	WHEN [A2(A203)] >= 5 AND [A2(A203)] <= 6 THEN 'media'
	           	WHEN [A2(A203)] >= 9 AND [A2(A203)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A203)] >= 7 AND [A2(A203)] <= 8 THEN 'alta'
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


def self.get_mantenimiento_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A204)] >= 1 AND [A2(A204)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A204)] >= 3 AND [A2(A204)] <= 4 THEN 'baja'
	           	WHEN [A2(A204)] >= 5 AND [A2(A204)] <= 6 THEN 'media'
	           	WHEN [A2(A204)] >= 7 AND [A2(A204)] <= 8 THEN 'alta'
	           	WHEN [A2(A204)] >= 9 AND [A2(A204)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A204)] >= 1 AND [A2(A204)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A204)] >= 3 AND [A2(A204)] <= 4 THEN 'baja'
	           	WHEN [A2(A204)] >= 5 AND [A2(A204)] <= 6 THEN 'media'
	           	WHEN [A2(A204)] >= 7 AND [A2(A204)] <= 8 THEN 'alta'
	           	WHEN [A2(A204)] >= 9 AND [A2(A204)] <= 10 THEN 'muy_alta'
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

  	def self.get_mantenimiento_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A204)] >= 1 AND [A2(A204)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A204)] >= 3 AND [A2(A204)] <= 4 THEN 'baja'
	           	WHEN [A2(A204)] >= 5 AND [A2(A204)] <= 6 THEN 'media'
	           	WHEN [A2(A204)] >= 9 AND [A2(A204)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A204)] >= 7 AND [A2(A204)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A204)] >= 1 AND [A2(A204)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A204)] >= 3 AND [A2(A204)] <= 4 THEN 'baja'
	           	WHEN [A2(A204)] >= 5 AND [A2(A204)] <= 6 THEN 'media'
	           	WHEN [A2(A204)] >= 9 AND [A2(A204)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A204)] >= 7 AND [A2(A204)] <= 8 THEN 'alta'
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

def self.get_atencion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A205)] >= 1 AND [A2(A205)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A205)] >= 3 AND [A2(A205)] <= 4 THEN 'baja'
	           	WHEN [A2(A205)] >= 5 AND [A2(A205)] <= 6 THEN 'media'
	           	WHEN [A2(A205)] >= 7 AND [A2(A205)] <= 8 THEN 'alta'
	           	WHEN [A2(A205)] >= 9 AND [A2(A205)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A205)] >= 1 AND [A2(A205)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A205)] >= 3 AND [A2(A205)] <= 4 THEN 'baja'
	           	WHEN [A2(A205)] >= 5 AND [A2(A205)] <= 6 THEN 'media'
	           	WHEN [A2(A205)] >= 7 AND [A2(A205)] <= 8 THEN 'alta'
	           	WHEN [A2(A205)] >= 9 AND [A2(A205)] <= 10 THEN 'muy_alta'
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

  	def self.get_atencion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [A2(A205)] >= 1 AND [A2(A205)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A205)] >= 3 AND [A2(A205)] <= 4 THEN 'baja'
	           	WHEN [A2(A205)] >= 5 AND [A2(A205)] <= 6 THEN 'media'
	           	WHEN [A2(A205)] >= 9 AND [A2(A205)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A205)] >= 7 AND [A2(A205)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [A2(A205)] >= 1 AND [A2(A205)] <= 2 THEN 'muy_baja'
	           	WHEN [A2(A205)] >= 3 AND [A2(A205)] <= 4 THEN 'baja'
	           	WHEN [A2(A205)] >= 5 AND [A2(A205)] <= 6 THEN 'media'
	           	WHEN [A2(A205)] >= 9 AND [A2(A205)] <= 10 THEN 'muy_alta'
	           	WHEN [A2(A205)] >= 7 AND [A2(A205)] <= 8 THEN 'alta'
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