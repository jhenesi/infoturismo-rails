class TransporteEstacionamientoController < ApplicationController
	def index
		render json: ConsumoSurveyResult.get_TransporteEstacionamiento_data, status: 200
	end
	def calidad
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_TransporteCalidad_data
		else
			data = ConsumoSurveyResult.get_TransporteCalidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def atencion
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_TransporteAtencion_data
		else
			data = ConsumoSurveyResult.get_TransporteAtencion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def disponibilidad
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_TransporteDisponibilidad_data
		else
			data = ConsumoSurveyResult.get_TransporteDisponibilidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def disponibilidad_estacionamiento
		if params[:group_by].nil?
			data = ConsumoSurveyResult.get_TransporteDisponibilidadEstacionamiento_data
		else
			data = ConsumoSurveyResult.get_TransporteDisponibilidadEstacionamiento_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end