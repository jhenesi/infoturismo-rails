class ImagenController < ApplicationController
	def index
		render json: ImagenSurveyResult.get_data, status: 200
	end

	def percepcion
		if params[:group_by].nil?
			data = ImagenSurveyResult.get_percepcion_data
		else
			data = ImagenSurveyResult.get_percepcion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def sitios
		if params[:group_by].nil?
			data = ImagenSurveyResult.get_sitios_data
		else
			data = ImagenSurveyResult.get_sitios_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def ambulantes
		if params[:group_by].nil?
			data = ImagenSurveyResult.get_vendedores_data
		else
			data = ImagenSurveyResult.get_vendedores_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def transito
		if params[:group_by].nil?
			data = ImagenSurveyResult.get_transito_data
		else
			data = ImagenSurveyResult.get_transito_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	def limpieza
		if params[:group_by].nil?
			data = ImagenSurveyResult.get_limpieza_data
		else
			data = ImagenSurveyResult.get_senalamiento_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
	
end