class ServiciosExcursionController < ApplicationController
	def index
		render json: ConsumoSurveyResult.get_Excursion_data, status: 200
	end

	def servicios
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_ExcursionServicios_data
		else
			data = ConsumoSurveyResult.get_ExcursionServicios_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def calidad
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_ExcursionCalidad_data
		else
			data = ConsumoSurveyResult.get_ExcursionCalidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def atencion
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_ExcursionAtencion_data
		else
			data = ConsumoSurveyResult.get_ExcursionAtencion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end