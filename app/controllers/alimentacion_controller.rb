class AlimentacionController < ApplicationController
	def index
		render json: ConsumoSurveyResult.get_Alimentacion_data, status: 200
	end

	def experiencia
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_AlimentacionExperiencia_data
		else
			data = ConsumoSurveyResult.get_AlimentacionExperiencia_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def calidad
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_AlimentacionCalidad_data
		else
			data = ConsumoSurveyResult.get_AlimentacionCalidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	
	def limpieza
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_AlimentacionLimpieza_data
		else
			data = ConsumoSurveyResult.get_AlimentacionLimpieza_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end