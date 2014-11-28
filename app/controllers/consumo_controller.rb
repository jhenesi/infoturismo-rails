class ConsumoController < ApplicationController
	def index
		render json: ConsumoSurveyResult.get_overview_data, status: 200
	end
end