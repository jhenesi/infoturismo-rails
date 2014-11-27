class OverviewController  < ApplicationController
  def index
  	render json: OverviewSurveyResult.get_data, status: 200
  end
end