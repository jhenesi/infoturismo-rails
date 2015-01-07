class ExperienciaViajeController < ApplicationController
	def index
		render json: ExperienciaSurveyResult.get_ExperienciaViaje_data, status: 200
	end

	def obregon
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_ViajeObregon_data
		else
			data = ExperienciaSurveyResult.get_ViajeObregon_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def hospitalidad
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_ViajeHospitalidad_data
		else
			data = ExperienciaSurveyResult.get_ViajeHospitalidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def naturales
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_ViajeNaturales_data
		else
			data = ExperienciaSurveyResult.get_ViajeNaturales_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def actividades
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_ViajeActividades_data
		else
			data = ExperienciaSurveyResult.get_ViajeActividades_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def emocion
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_ViajeEmocion_data
		else
			data = ExperienciaSurveyResult.get_ViajeEmocion_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def diferente
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_ViajeDiferente_data
		else
			data = ExperienciaSurveyResult.get_ViajeDiferente_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end

	def disponibilidad
		if params[:group_by].nil?
			data = ExperienciaSurveyResult.get_ViajeDisponibilidad_data
		else
			data = ExperienciaSurveyResult.get_ViajeDisponibilidad_data_grouped(params[:group_by])
		end

		render json: data, status: 200
	end
end