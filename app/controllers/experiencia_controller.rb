class ExperienciaController < ApplicationController
	def index
		render json: ExperienciaSurveyResult.get_overview_data, status: 200
	end

	def experienciaViaje
		render json: ExperienciaSurveyResult.get_experienciaViaje_data, status: 200
	end

	def factores
		render json: ExperienciaSurveyResult.get_factores_data, status: 200
	end


	def EVobregon
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_EVobregon_data
		else
			data = ExperienciaSurveyResult.get_EVobregon_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end