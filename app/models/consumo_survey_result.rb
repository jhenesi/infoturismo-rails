class ConsumoSurveyResult < ActiveRecord::Base
	include InfoturismoData

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'

	def self.get_overview_data
		sql = 'SELECT 
			CAST(ROUND(((AVG([C5(C501)]) + 
			  	AVG([C5(C502)]) + 
			  	AVG([C5(C503)]) + 
			  	AVG([C5(C504)]))/(4*1.0)), 1) AS FLOAT) as hospedaje_average,
			CAST(ROUND(((AVG([C7(C701)]) + 
			  	AVG([C7(C702)]) + 
			  	AVG([C7(C703)]))/(3*1.0)), 1) AS FLOAT) as alimentacion_average,
			CAST(ROUND(((AVG(CAST([C9(C901)] AS INT)) + 
			  	AVG(CAST([C9(C902)] AS INT)) + 
			  	AVG(CAST([C9(C903)] AS INT)))/(3*1.0)), 1) AS FLOAT) as servicios_excursion_average,
			CAST(ROUND(((AVG([C11A(C1102)]) +
			  	AVG([C11A(C1103)]) +
            	AVG([C11A(C1104)]) +
		  		AVG([C12(C1201)]))/(4*1.0)), 1) AS FLOAT) as transporte_estacionamiento_average
			FROM tbl_Results_v1'

			data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			data << ReactivoOverviewData.new("Hospedaje", "Hospedaje", row.hospedaje_average)
			data << ReactivoOverviewData.new("Alimentacion", "Alimentación", row.alimentacion_average)
			data << ReactivoOverviewData.new("ServicioExcursion", "Servicios de Excursión", row.servicios_excursion_average)
			data << ReactivoOverviewData.new("TransporteEstacionamiento", "Transporte y Estacionamiento", row.transporte_estacionamiento_average)
		end

		data
	end

	def self.get_Hospedaje_data
  		  	sql = 'SELECT 
			ROUND(AVG(CAST([C5(C501)] AS INT)), 1) as percepcion_average,
			ROUND(AVG(CAST([C5(C502)] AS INT)), 1) as limpieza_average,
			ROUND(AVG(CAST([C5(C503)] AS INT)), 1) as atencion_average,
			ROUND(AVG(CAST([C5(C504)] AS INT)), 1) as eleccion_average
			
		 FROM "tbl_Results_v1"'

	data = []

	ConsumoSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("percepcion", "Percepción General", row.percepcion_average)
		data << ReactivoOverviewData.new("limpieza", "Limpieza", row.limpieza_average)
		data << ReactivoOverviewData.new("atencion", "Atención del personal", row.atencion_average)
		data << ReactivoOverviewData.new("facilidadeleccion", "Facilidad de Elección de Opción de Hospedaje", row.eleccion_average)
	
	end

	data
  end


def self.get_HospedajePercepcion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C501)] >= 1 AND [C5(C501)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C501)] >= 3 AND [C5(C501)] <= 4 THEN 'baja'
	           	WHEN [C5(C501)] >= 5 AND [C5(C501)] <= 6 THEN 'media'
	           	WHEN [C5(C501)] >= 7 AND [C5(C501)] <= 8 THEN 'alta'
	           	WHEN [C5(C501)] >= 9 AND [C5(C501)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C501)] >= 1 AND [C5(C501)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C501)] >= 3 AND [C5(C501)] <= 4 THEN 'baja'
	           	WHEN [C5(C501)] >= 5 AND [C5(C501)] <= 6 THEN 'media'
	           	WHEN [C5(C501)] >= 7 AND [C5(C501)] <= 8 THEN 'alta'
	           	WHEN [C5(C501)] >= 9 AND [C5(C501)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end

  	def self.get_HospedajePercepcion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C501)] >= 1 AND [C5(C501)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C501)] >= 3 AND [C5(C501)] <= 4 THEN 'baja'
	           	WHEN [C5(C501)] >= 5 AND [C5(C501)] <= 6 THEN 'media'
	           	WHEN [C5(C501)] >= 9 AND [C5(C501)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C501)] >= 7 AND [C5(C501)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C501)] >= 1 AND [C5(C501)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C501)] >= 3 AND [C5(C501)] <= 4 THEN 'baja'
	           	WHEN [C5(C501)] >= 5 AND [C5(C501)] <= 6 THEN 'media'
	           	WHEN [C5(C501)] >= 9 AND [C5(C501)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C501)] >= 7 AND [C5(C501)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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


def self.get_HospedajeLimpieza_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C502)] >= 1 AND [C5(C502)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C502)] >= 3 AND [C5(C502)] <= 4 THEN 'baja'
	           	WHEN [C5(C502)] >= 5 AND [C5(C502)] <= 6 THEN 'media'
	           	WHEN [C5(C502)] >= 7 AND [C5(C502)] <= 8 THEN 'alta'
	           	WHEN [C5(C502)] >= 9 AND [C5(C502)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C502)] >= 1 AND [C5(C502)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C502)] >= 3 AND [C5(C502)] <= 4 THEN 'baja'
	           	WHEN [C5(C502)] >= 5 AND [C5(C502)] <= 6 THEN 'media'
	           	WHEN [C5(C502)] >= 7 AND [C5(C502)] <= 8 THEN 'alta'
	           	WHEN [C5(C502)] >= 9 AND [C5(C502)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_HospedajeLimpieza_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C502)] >= 1 AND [C5(C502)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C502)] >= 3 AND [C5(C502)] <= 4 THEN 'baja'
	           	WHEN [C5(C502)] >= 5 AND [C5(C502)] <= 6 THEN 'media'
	           	WHEN [C5(C502)] >= 9 AND [C5(C502)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C502)] >= 7 AND [C5(C502)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C502)] >= 1 AND [C5(C502)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C502)] >= 3 AND [C5(C502)] <= 4 THEN 'baja'
	           	WHEN [C5(C502)] >= 5 AND [C5(C502)] <= 6 THEN 'media'
	           	WHEN [C5(C502)] >= 9 AND [C5(C502)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C502)] >= 7 AND [C5(C502)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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

	def self.get_HospedajeAtencion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C503)] >= 1 AND [C5(C503)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C503)] >= 3 AND [C5(C503)] <= 4 THEN 'baja'
	           	WHEN [C5(C503)] >= 5 AND [C5(C503)] <= 6 THEN 'media'
	           	WHEN [C5(C503)] >= 7 AND [C5(C503)] <= 8 THEN 'alta'
	           	WHEN [C5(C503)] >= 9 AND [C5(C503)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C503)] >= 1 AND [C5(C503)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C503)] >= 3 AND [C5(C503)] <= 4 THEN 'baja'
	           	WHEN [C5(C503)] >= 5 AND [C5(C503)] <= 6 THEN 'media'
	           	WHEN [C5(C503)] >= 7 AND [C5(C503)] <= 8 THEN 'alta'
	           	WHEN [C5(C503)] >= 9 AND [C5(C503)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_HospedajeAtencion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C503)] >= 1 AND [C5(C503)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C503)] >= 3 AND [C5(C503)] <= 4 THEN 'baja'
	           	WHEN [C5(C503)] >= 5 AND [C5(C503)] <= 6 THEN 'media'
	           	WHEN [C5(C503)] >= 9 AND [C5(C503)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C503)] >= 7 AND [C5(C503)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C503)] >= 1 AND [C5(C503)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C503)] >= 3 AND [C5(C503)] <= 4 THEN 'baja'
	           	WHEN [C5(C503)] >= 5 AND [C5(C503)] <= 6 THEN 'media'
	           	WHEN [C5(C503)] >= 9 AND [C5(C503)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C503)] >= 7 AND [C5(C503)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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


	def self.get_HospedajeFacilidad_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C504)] >= 1 AND [C5(C504)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C504)] >= 3 AND [C5(C504)] <= 4 THEN 'baja'
	           	WHEN [C5(C504)] >= 5 AND [C5(C504)] <= 6 THEN 'media'
	           	WHEN [C5(C504)] >= 7 AND [C5(C504)] <= 8 THEN 'alta'
	           	WHEN [C5(C504)] >= 9 AND [C5(C504)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C504)] >= 1 AND [C5(C504)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C504)] >= 3 AND [C5(C504)] <= 4 THEN 'baja'
	           	WHEN [C5(C504)] >= 5 AND [C5(C504)] <= 6 THEN 'media'
	           	WHEN [C5(C504)] >= 7 AND [C5(C504)] <= 8 THEN 'alta'
	           	WHEN [C5(C504)] >= 9 AND [C5(C504)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_HospedajeFacilidad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C5(C504)] >= 1 AND [C5(C504)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C504)] >= 3 AND [C5(C504)] <= 4 THEN 'baja'
	           	WHEN [C5(C504)] >= 5 AND [C5(C504)] <= 6 THEN 'media'
	           	WHEN [C5(C504)] >= 9 AND [C5(C504)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C504)] >= 7 AND [C5(C504)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C5(C504)] >= 1 AND [C5(C504)] <= 2 THEN 'muy_baja'
	           	WHEN [C5(C504)] >= 3 AND [C5(C504)] <= 4 THEN 'baja'
	           	WHEN [C5(C504)] >= 5 AND [C5(C504)] <= 6 THEN 'media'
	           	WHEN [C5(C504)] >= 9 AND [C5(C504)] <= 10 THEN 'muy_alta'
	           	WHEN [C5(C504)] >= 7 AND [C5(C504)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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









  def self.get_Alimentacion_data
  		  	sql = 'SELECT 
			ROUND(AVG(CAST([C7(C701)] AS INT)), 1) as experiencia_average,
			ROUND(AVG(CAST([C7(C702)] AS INT)), 1) as calidad_average,
			ROUND(AVG(CAST([C7(C703)] AS INT)), 1) as limpieza_average
			
		 FROM "tbl_Results_v1"'

	data = []

	ConsumoSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("experiencia", "Experiencia del consumo de alimentos y bebidas", row.experiencia_average)
		data << ReactivoOverviewData.new("calidad", "Calidad de los alimentos y bebidas", row.calidad_average)
		data << ReactivoOverviewData.new("limpieza", "Limpieza/Higiene", row.limpieza_average)
		
	end

	data
  end

def self.get_AlimentacionExperiencia_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C7(C701)] >= 1 AND [C7(C701)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C701)] >= 3 AND [C7(C701)] <= 4 THEN 'baja'
	           	WHEN [C7(C701)] >= 5 AND [C7(C701)] <= 6 THEN 'media'
	           	WHEN [C7(C701)] >= 7 AND [C7(C701)] <= 8 THEN 'alta'
	           	WHEN [C7(C701)] >= 9 AND [C7(C701)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C7(C701)] >= 1 AND [C7(C701)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C701)] >= 3 AND [C7(C701)] <= 4 THEN 'baja'
	           	WHEN [C7(C701)] >= 5 AND [C7(C701)] <= 6 THEN 'media'
	           	WHEN [C7(C701)] >= 7 AND [C7(C701)] <= 8 THEN 'alta'
	           	WHEN [C7(C701)] >= 9 AND [C7(C701)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_AlimentacionExperiencia_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C7(C701)] >= 1 AND [C7(C701)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C701)] >= 3 AND [C7(C701)] <= 4 THEN 'baja'
	           	WHEN [C7(C701)] >= 5 AND [C7(C701)] <= 6 THEN 'media'
	           	WHEN [C7(C701)] >= 9 AND [C7(C701)] <= 10 THEN 'muy_alta'
	           	WHEN [C7(C701)] >= 7 AND [C7(C701)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C7(C701)] >= 1 AND [C7(C701)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C701)] >= 3 AND [C7(C701)] <= 4 THEN 'baja'
	           	WHEN [C7(C701)] >= 5 AND [C7(C701)] <= 6 THEN 'media'
	           	WHEN [C7(C701)] >= 9 AND [C7(C701)] <= 10 THEN 'muy_alta'
	           	WHEN [C7(C701)] >= 7 AND [C7(C701)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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

def self.get_AlimentacionCalidad_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C7(C702)] >= 1 AND [C7(C702)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C702)] >= 3 AND [C7(C702)] <= 4 THEN 'baja'
	           	WHEN [C7(C702)] >= 5 AND [C7(C702)] <= 6 THEN 'media'
	           	WHEN [C7(C702)] >= 7 AND [C7(C702)] <= 8 THEN 'alta'
	           	WHEN [C7(C702)] >= 9 AND [C7(C702)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C7(C702)] >= 1 AND [C7(C702)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C702)] >= 3 AND [C7(C702)] <= 4 THEN 'baja'
	           	WHEN [C7(C702)] >= 5 AND [C7(C702)] <= 6 THEN 'media'
	           	WHEN [C7(C702)] >= 7 AND [C7(C702)] <= 8 THEN 'alta'
	           	WHEN [C7(C702)] >= 9 AND [C7(C702)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_AlimentacionCalidad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C7(C702)] >= 1 AND [C7(C702)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C702)] >= 3 AND [C7(C702)] <= 4 THEN 'baja'
	           	WHEN [C7(C702)] >= 5 AND [C7(C702)] <= 6 THEN 'media'
	           	WHEN [C7(C702)] >= 9 AND [C7(C702)] <= 10 THEN 'muy_alta'
	           	WHEN [C7(C702)] >= 7 AND [C7(C702)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C7(C702)] >= 1 AND [C7(C702)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C702)] >= 3 AND [C7(C702)] <= 4 THEN 'baja'
	           	WHEN [C7(C702)] >= 5 AND [C7(C702)] <= 6 THEN 'media'
	           	WHEN [C7(C702)] >= 9 AND [C7(C702)] <= 10 THEN 'muy_alta'
	           	WHEN [C7(C702)] >= 7 AND [C7(C702)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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


def self.get_AlimentacionLimpieza_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C7(C703)] >= 1 AND [C7(C703)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C703)] >= 3 AND [C7(C703)] <= 4 THEN 'baja'
	           	WHEN [C7(C703)] >= 5 AND [C7(C703)] <= 6 THEN 'media'
	           	WHEN [C7(C703)] >= 7 AND [C7(C703)] <= 8 THEN 'alta'
	           	WHEN [C7(C703)] >= 9 AND [C7(C703)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C7(C703)] >= 1 AND [C7(C703)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C703)] >= 3 AND [C7(C703)] <= 4 THEN 'baja'
	           	WHEN [C7(C703)] >= 5 AND [C7(C703)] <= 6 THEN 'media'
	           	WHEN [C7(C703)] >= 7 AND [C7(C703)] <= 8 THEN 'alta'
	           	WHEN [C7(C703)] >= 9 AND [C7(C703)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_AlimentacionLimpieza_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C7(C703)] >= 1 AND [C7(C703)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C703)] >= 3 AND [C7(C703)] <= 4 THEN 'baja'
	           	WHEN [C7(C703)] >= 5 AND [C7(C703)] <= 6 THEN 'media'
	           	WHEN [C7(C703)] >= 9 AND [C7(C703)] <= 10 THEN 'muy_alta'
	           	WHEN [C7(C703)] >= 7 AND [C7(C703)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C7(C703)] >= 1 AND [C7(C703)] <= 2 THEN 'muy_baja'
	           	WHEN [C7(C703)] >= 3 AND [C7(C703)] <= 4 THEN 'baja'
	           	WHEN [C7(C703)] >= 5 AND [C7(C703)] <= 6 THEN 'media'
	           	WHEN [C7(C703)] >= 9 AND [C7(C703)] <= 10 THEN 'muy_alta'
	           	WHEN [C7(C703)] >= 7 AND [C7(C703)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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





















   def self.get_Excursion_data
  		  	sql = 'SELECT 
			ROUND(AVG(CAST([C9(C901)] AS INT)), 1) as servicios_average,
			ROUND(AVG(CAST([C9(C902)] AS INT)), 1) as calidad_average,
			ROUND(AVG(CAST([C9(C903)] AS INT)), 1) as atencion_average
			
		 FROM "tbl_Results_v1"'



	data = []

	ConsumoSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("servicios", "Servicios de excursion/turisticos", row.servicios_average)
		data << ReactivoOverviewData.new("calidad", "Calidad de los servicios de excursion/turisticos", row.calidad_average)
		data << ReactivoOverviewData.new("atencion", "Atencion del personal", row.atencion_average)
		
	end

	data
  end

def self.get_ExcursionServicios_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C9(C901)] >= 1 AND [C9(C901)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C901)] >= 3 AND [C9(C901)] <= 4 THEN 'baja'
	           	WHEN [C9(C901)] >= 5 AND [C9(C901)] <= 6 THEN 'media'
	           	WHEN [C9(C901)] >= 7 AND [C9(C901)] <= 8 THEN 'alta'
	           	WHEN [C9(C901)] >= 9 AND [C9(C901)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C9(C901)] >= 1 AND [C9(C901)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C901)] >= 3 AND [C9(C901)] <= 4 THEN 'baja'
	           	WHEN [C9(C901)] >= 5 AND [C9(C901)] <= 6 THEN 'media'
	           	WHEN [C9(C901)] >= 7 AND [C9(C901)] <= 8 THEN 'alta'
	           	WHEN [C9(C901)] >= 9 AND [C9(C901)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_ExcursionServicios_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C9(C901)] >= 1 AND [C9(C901)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C901)] >= 3 AND [C9(C901)] <= 4 THEN 'baja'
	           	WHEN [C9(C901)] >= 5 AND [C9(C901)] <= 6 THEN 'media'
	           	WHEN [C9(C901)] >= 9 AND [C9(C901)] <= 10 THEN 'muy_alta'
	           	WHEN [C9(C901)] >= 7 AND [C9(C901)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C9(C901)] >= 1 AND [C9(C901)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C901)] >= 3 AND [C9(C901)] <= 4 THEN 'baja'
	           	WHEN [C9(C901)] >= 5 AND [C9(C901)] <= 6 THEN 'media'
	           	WHEN [C9(C901)] >= 9 AND [C9(C901)] <= 10 THEN 'muy_alta'
	           	WHEN [C9(C901)] >= 7 AND [C9(C901)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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

def self.get_ExcursionCalidad_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C9(C902)] >= 1 AND [C9(C902)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C902)] >= 3 AND [C9(C902)] <= 4 THEN 'baja'
	           	WHEN [C9(C902)] >= 5 AND [C9(C902)] <= 6 THEN 'media'
	           	WHEN [C9(C902)] >= 7 AND [C9(C902)] <= 8 THEN 'alta'
	           	WHEN [C9(C902)] >= 9 AND [C9(C902)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C9(C902)] >= 1 AND [C9(C902)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C902)] >= 3 AND [C9(C902)] <= 4 THEN 'baja'
	           	WHEN [C9(C902)] >= 5 AND [C9(C902)] <= 6 THEN 'media'
	           	WHEN [C9(C902)] >= 7 AND [C9(C902)] <= 8 THEN 'alta'
	           	WHEN [C9(C902)] >= 9 AND [C9(C902)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_ExcursionCalidad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C9(C902)] >= 1 AND [C9(C902)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C902)] >= 3 AND [C9(C902)] <= 4 THEN 'baja'
	           	WHEN [C9(C902)] >= 5 AND [C9(C902)] <= 6 THEN 'media'
	           	WHEN [C9(C902)] >= 9 AND [C9(C902)] <= 10 THEN 'muy_alta'
	           	WHEN [C9(C902)] >= 7 AND [C9(C902)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C9(C902)] >= 1 AND [C9(C902)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C902)] >= 3 AND [C9(C902)] <= 4 THEN 'baja'
	           	WHEN [C9(C902)] >= 5 AND [C9(C902)] <= 6 THEN 'media'
	           	WHEN [C9(C902)] >= 9 AND [C9(C902)] <= 10 THEN 'muy_alta'
	           	WHEN [C9(C902)] >= 7 AND [C9(C902)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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

def self.get_ExcursionAtencion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C9(C903)] >= 1 AND [C9(C903)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C903)] >= 3 AND [C9(C903)] <= 4 THEN 'baja'
	           	WHEN [C9(C903)] >= 5 AND [C9(C903)] <= 6 THEN 'media'
	           	WHEN [C9(C903)] >= 7 AND [C9(C903)] <= 8 THEN 'alta'
	           	WHEN [C9(C903)] >= 9 AND [C9(C903)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C9(C903)] >= 1 AND [C9(C903)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C903)] >= 3 AND [C9(C903)] <= 4 THEN 'baja'
	           	WHEN [C9(C903)] >= 5 AND [C9(C903)] <= 6 THEN 'media'
	           	WHEN [C9(C903)] >= 7 AND [C9(C903)] <= 8 THEN 'alta'
	           	WHEN [C9(C903)] >= 9 AND [C9(C903)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_ExcursionAtencion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C9(C903)] >= 1 AND [C9(C903)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C903)] >= 3 AND [C9(C903)] <= 4 THEN 'baja'
	           	WHEN [C9(C903)] >= 5 AND [C9(C903)] <= 6 THEN 'media'
	           	WHEN [C9(C903)] >= 9 AND [C9(C903)] <= 10 THEN 'muy_alta'
	           	WHEN [C9(C903)] >= 7 AND [C9(C903)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C9(C903)] >= 1 AND [C9(C903)] <= 2 THEN 'muy_baja'
	           	WHEN [C9(C903)] >= 3 AND [C9(C903)] <= 4 THEN 'baja'
	           	WHEN [C9(C903)] >= 5 AND [C9(C903)] <= 6 THEN 'media'
	           	WHEN [C9(C903)] >= 9 AND [C9(C903)] <= 10 THEN 'muy_alta'
	           	WHEN [C9(C903)] >= 7 AND [C9(C903)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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



	def self.get_TransporteEstacionamiento_data
  		  	sql = 'SELECT 
				ROUND(AVG(CAST([C11A(C1102)] AS INT)), 1) as transporteCalidad_average,
				ROUND(AVG(CAST([C11A(C1103)] AS INT)), 1) as transporteAtencion_average,
				ROUND(AVG(CAST([C11A(C1104)] AS INT)), 1) as transporteDisponibilidad_average,
				ROUND(AVG(CAST([C12(C1201)] AS INT)), 1) as transporteDisponibilidadEstacionamiento_average
			
		 FROM "tbl_Results_v1"'

	data = []

	ConsumoSurveyResult.find_by_sql(sql).each do |row|
		data << ReactivoOverviewData.new("calidad", "Calidad el trasporte local", row.transporteCalidad_average)
		data << ReactivoOverviewData.new("atencion", "Atencion del personal del servicio", row.transporteAtencion_average)
		data << ReactivoOverviewData.new("disponibilidadTransporte", "Disponibilidad del trasporte", row.transporteDisponibilidad_average)
	    data << ReactivoOverviewData.new("disponibiliadEstacionamiento", "Disponibilidad de estacionamiento", row.transporteDisponibilidadEstacionamiento_average)
	end
	data
  end

  def self.get_TransporteCalidad_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C11A(C1102)] >= 1 AND [C11A(C1102)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1102)] >= 3 AND [C11A(C1102)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1102)] >= 5 AND [C11A(C1102)] <= 6 THEN 'media'
	           	WHEN [C11A(C1102)] >= 7 AND [C11A(C1102)] <= 8 THEN 'alta'
	           	WHEN [C11A(C1102)] >= 9 AND [C11A(C1102)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C11A(C1102)] >= 1 AND [C11A(C1102)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1102)] >= 3 AND [C11A(C1102)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1102)] >= 5 AND [C11A(C1102)] <= 6 THEN 'media'
	           	WHEN [C11A(C1102)] >= 7 AND [C11A(C1102)] <= 8 THEN 'alta'
	           	WHEN [C11A(C1102)] >= 9 AND [C11A(C1102)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_TransporteCalidad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C11A(C1102)] >= 1 AND [C11A(C1102)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1102)] >= 3 AND [C11A(C1102)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1102)] >= 5 AND [C11A(C1102)] <= 6 THEN 'media'
	           	WHEN [C11A(C1102)] >= 9 AND [C11A(C1102)] <= 10 THEN 'muy_alta'
	           	WHEN [C11A(C1102)] >= 7 AND [C11A(C1102)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C11A(C1102)] >= 1 AND [C11A(C1102)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1102)] >= 3 AND [C11A(C1102)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1102)] >= 5 AND [C11A(C1102)] <= 6 THEN 'media'
	           	WHEN [C11A(C1102)] >= 9 AND [C11A(C1102)] <= 10 THEN 'muy_alta'
	           	WHEN [C11A(C1102)] >= 7 AND [C11A(C1102)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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


def self.get_TransporteAtencion_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C11A(C1103)] >= 1 AND [C11A(C1103)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1103)] >= 3 AND [C11A(C1103)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1103)] >= 5 AND [C11A(C1103)] <= 6 THEN 'media'
	           	WHEN [C11A(C1103)] >= 7 AND [C11A(C1103)] <= 8 THEN 'alta'
	           	WHEN [C11A(C1103)] >= 9 AND [C11A(C1103)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C11A(C1103)] >= 1 AND [C11A(C1103)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1103)] >= 3 AND [C11A(C1103)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1103)] >= 5 AND [C11A(C1103)] <= 6 THEN 'media'
	           	WHEN [C11A(C1103)] >= 7 AND [C11A(C1103)] <= 8 THEN 'alta'
	           	WHEN [C11A(C1103)] >= 9 AND [C11A(C1103)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_TransporteAtencion_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C11A(C1103)] >= 1 AND [C11A(C1103)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1103)] >= 3 AND [C11A(C1103)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1103)] >= 5 AND [C11A(C1103)] <= 6 THEN 'media'
	           	WHEN [C11A(C1103)] >= 9 AND [C11A(C1103)] <= 10 THEN 'muy_alta'
	           	WHEN [C11A(C1103)] >= 7 AND [C11A(C1103)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C11A(C1103)] >= 1 AND [C11A(C1103)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1103)] >= 3 AND [C11A(C1103)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1103)] >= 5 AND [C11A(C1103)] <= 6 THEN 'media'
	           	WHEN [C11A(C1103)] >= 9 AND [C11A(C1103)] <= 10 THEN 'muy_alta'
	           	WHEN [C11A(C1103)] >= 7 AND [C11A(C1103)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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




def self.get_TransporteDisponibilidad_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C11A(C1104)] >= 1 AND [C11A(C1104)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1104)] >= 3 AND [C11A(C1104)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1104)] >= 5 AND [C11A(C1104)] <= 6 THEN 'media'
	           	WHEN [C11A(C1104)] >= 7 AND [C11A(C1104)] <= 8 THEN 'alta'
	           	WHEN [C11A(C1104)] >= 9 AND [C11A(C1104)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C11A(C1104)] >= 1 AND [C11A(C1104)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1104)] >= 3 AND [C11A(C1104)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1104)] >= 5 AND [C11A(C1104)] <= 6 THEN 'media'
	           	WHEN [C11A(C1104)] >= 7 AND [C11A(C1104)] <= 8 THEN 'alta'
	           	WHEN [C11A(C1104)] >= 9 AND [C11A(C1104)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_TransporteDisponibilidad_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C11A(C1104)] >= 1 AND [C11A(C1104)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1104)] >= 3 AND [C11A(C1104)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1104)] >= 5 AND [C11A(C1104)] <= 6 THEN 'media'
	           	WHEN [C11A(C1104)] >= 9 AND [C11A(C1104)] <= 10 THEN 'muy_alta'
	           	WHEN [C11A(C1104)] >= 7 AND [C11A(C1104)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C11A(C1104)] >= 1 AND [C11A(C1104)] <= 2 THEN 'muy_baja'
	           	WHEN [C11A(C1104)] >= 3 AND [C11A(C1104)] <= 4 THEN 'baja'
	           	WHEN [C11A(C1104)] >= 5 AND [C11A(C1104)] <= 6 THEN 'media'
	           	WHEN [C11A(C1104)] >= 9 AND [C11A(C1104)] <= 10 THEN 'muy_alta'
	           	WHEN [C11A(C1104)] >= 7 AND [C11A(C1104)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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



def self.get_TransporteDisponibilidadEstacionamiento_data()
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C12(C1201)] >= 1 AND [C12(C1201)] <= 2 THEN 'muy_baja'
	           	WHEN [C12(C1201)] >= 3 AND [C12(C1201)] <= 4 THEN 'baja'
	           	WHEN [C12(C1201)] >= 5 AND [C12(C1201)] <= 6 THEN 'media'
	           	WHEN [C12(C1201)] >= 7 AND [C12(C1201)] <= 8 THEN 'alta'
	           	WHEN [C12(C1201)] >= 9 AND [C12(C1201)] <= 10 THEN 'muy_alta'
	         END as calificacion
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C12(C1201)] >= 1 AND [C12(C1201)] <= 2 THEN 'muy_baja'
	           	WHEN [C12(C1201)] >= 3 AND [C12(C1201)] <= 4 THEN 'baja'
	           	WHEN [C12(C1201)] >= 5 AND [C12(C1201)] <= 6 THEN 'media'
	           	WHEN [C12(C1201)] >= 7 AND [C12(C1201)] <= 8 THEN 'alta'
	           	WHEN [C12(C1201)] >= 9 AND [C12(C1201)] <= 10 THEN 'muy_alta'
	         END"

		data = []

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
			if SCORES.has_key?(row.calificacion)
				score = SCORES[row.calificacion];
				data << ReactivoData.new(score.clave, score.nombre, row.conteo)
			end	
		end

		data
  	end



  	def self.get_TransporteDisponibilidadEstacionamineto_data_grouped(group_by)
  		
	  	sql = 
	  		"SELECT COUNT(*) as conteo,
	  		 CASE
	      		WHEN [C12(C1201)] >= 1 AND [C12(C1201)] <= 2 THEN 'muy_baja'
	           	WHEN [C12(C1201)] >= 3 AND [C12(C1201)] <= 4 THEN 'baja'
	           	WHEN [C12(C1201)] >= 5 AND [C12(C1201)] <= 6 THEN 'media'
	           	WHEN [C12(C1201)] >= 9 AND [C12(C1201)] <= 10 THEN 'muy_alta'
	           	WHEN [C12(C1201)] >= 7 AND [C12(C1201)] <= 8 THEN 'alta'
	         END as calificacion,
	         #{FILTER_COLUMNS[group_by]} as filtro
			 FROM tbl_Results_v1
			 GROUP BY CASE
	      		WHEN [C12(C1201)] >= 1 AND [C12(C1201)] <= 2 THEN 'muy_baja'
	           	WHEN [C12(C1201)] >= 3 AND [C12(C1201)] <= 4 THEN 'baja'
	           	WHEN [C12(C1201)] >= 5 AND [C12(C1201)] <= 6 THEN 'media'
	           	WHEN [C12(C1201)] >= 9 AND [C12(C1201)] <= 10 THEN 'muy_alta'
	           	WHEN [C12(C1201)] >= 7 AND [C12(C1201)] <= 8 THEN 'alta'
	         END, #{FILTER_COLUMNS[group_by]}"

	 	data = {}

		ConsumoSurveyResult.find_by_sql(sql).each do |row|
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



