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
end