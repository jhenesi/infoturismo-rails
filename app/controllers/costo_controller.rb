class CostoController < ApplicationController
	def index
		render json: CostoSurveyResult.get_data, status: 200
	end

	def general
		if params[:group_by].nil?
			data = CostoSurveyResult.get_general_data
		else
			data = CostoSurveyResult.get_general_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def transportacion
		if params[:group_by].nil?
			data = CostoSurveyResult.get_transportacion_data
		else
			data = CostoSurveyResult.get_transportacion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def hospedaje
		if params[:group_by].nil?
			data = CostoSurveyResult.get_hospedaje_data
		else
			data = CostoSurveyResult.get_hospedaje_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def transporte
		if params[:group_by].nil?
			data = CostoSurveyResult.get_transporte_data
		else
			data = CostoSurveyResult.get_transporte_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def alimentos
		if params[:group_by].nil?
			data = CostoSurveyResult.get_alimentos_data
		else
			data = CostoSurveyResult.get_alimentos_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def excursion
		if params[:group_by].nil?
			data = CostoSurveyResult.get_excursion_data
		else
			data = CostoSurveyResult.get_excursion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def estacionamiento
		if params[:group_by].nil?
			data = CostoSurveyResult.get_estacionamiento_data
		else
			data = CostoSurveyResult.get_estacionamiento_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end