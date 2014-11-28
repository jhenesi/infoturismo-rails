class ExperienciaSurveyResult < ActiveRecord::Base
	include ApplicationHelper

  	self.table_name = 'tbl_Results_v1'
  	self.primary_key = 'id'
end