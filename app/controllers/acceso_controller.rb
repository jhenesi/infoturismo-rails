class AccesoController < ApplicationController
	def index
		render json: AccesoSurveyResult.get_data, status: 200
	end

	def senalamiento
		if params[:group_by].nil?
			data = AccesoSurveyResult.get_senalamiento_data
		else
			data = AccesoSurveyResult.get_senalamiento_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def opciones
		if params[:group_by].nil?
			data = AccesoSurveyResult.get_opciones_data
		else
			data = AccesoSurveyResult.get_opciones_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def calidad
		if params[:group_by].nil?
			data = AccesoSurveyResult.get_calidad_data
		else
			data = AccesoSurveyResult.get_calidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def mantenimiento
		if params[:group_by].nil?
			data = AccesoSurveyResult.get_mantenimiento_data
		else
			data = AccesoSurveyResult.get_mantenimiento_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def atencion
		if params[:group_by].nil?
			data = AccesoSurveyResult.get_atencion_data
		else
			data = AccesoSurveyResult.get_atencion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def test
		data = AccesoSurveyResult.where('A2(A201)' => 8)
		render json: data, status: 200
	end
end