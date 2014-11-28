class AccesoController < ApplicationController
	include ApplicationHelper

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

	def test
		data = SCORES
		render json: data, status: 200
	end
end