class AtractivosController < ApplicationController
	def index
		render json: AtractivosSurveyResult.get_data, status: 200
	end

	def atractivosServicios
		if params[:group_by].nil?
			data = AtractivosSurveyResult.get_servicios_data
		else
			data = AtractivosSurveyResult.get_servicios_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def atractivosConservacion
		if params[:group_by].nil?
			data = AtractivosSurveyResult.get_conservacion_data
		else
			data = AtractivosSurveyResult.get_conservacion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def atractivosVariedad
		if params[:group_by].nil?
			data = AtractivosSurveyResult.get_variedad_data
		else
			data = AtractivosSurveyResult.get_conservacion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def atractivosCalidad
		if params[:group_by].nil?
			data = AtractivosSurveyResult.get_calidad_data
		else
			data = AtractivosSurveyResult.get_calidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def atractivosCulturales
		if params[:group_by].nil?
			data = AtractivosSurveyResult.get_culturales_data
		else
			data = AtractivosSurveyResult.get_cuturales_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def atractivosNaturales
		if params[:group_by].nil?
			data = AtractivosSurveyResult.get_naturales_data
		else
			data = AtractivosSurveyResult.get_naturales_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

end