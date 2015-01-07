class ExperienciaController < ApplicationController
	def index
		render json: ExperienciaSurveyResult.get_overview_data, status: 200
	end

	def factores
		render json: ExperienciaSurveyResult.get_factores_data, status: 200
	end
end