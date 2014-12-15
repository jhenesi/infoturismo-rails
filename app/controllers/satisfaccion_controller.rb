class SatisfaccionController < ApplicationController
	def index
		render json: SatisfaccionSurveyResult.get_data, status: 200
	end

	def nivel
		if params[:group_by].nil?
			data = SatisfaccionSurveyResult.get_nivel_data
		else
			data = SatisfaccionSurveyResult.get_nivel_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def expectativas
		if params[:group_by].nil?
			data = SatisfaccionSurveyResult.get_expectativas_data
		else
			data = SatisfaccionSurveyResult.get_expectativas_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end


	def disposicion
		if params[:group_by].nil?
			data = SatisfaccionSurveyResult.get_disposicion_data
		else
			data = SatisfaccionSurveyResult.get_disposicion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def recomendacion
		if params[:group_by].nil?
			data = SatisfaccionSurveyResult.get_recomendacion_data
		else
			data = SatisfaccionSurveyResult.get_recomendacion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end