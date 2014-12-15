class HospedajeController < ApplicationController
	def index
		render json: ConsumoSurveyResult.get_Hospedaje_data, status: 200
	end

	def percepcion
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_HospedajePercepcion_data
		else
			data = ConsumoSurveyResult.get_HospedajePercepcion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def limpieza
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_HospedajeLimpieza_data
		else
			data = ConsumoSurveyResult.get_HospedajeLimpieza_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def atencion
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_HospedajeAtencion_data
		else
			data = ConsumoSurveyResult.get_HospedajeAtencion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def facilidadeleccion
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_HospedajeFacilidad_data
		else
			data = ConsumoSurveyResult.get_HospedajeFacilidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end