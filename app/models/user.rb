class User < ActiveRecord::Base
	include AuthHelper
	
	def self.find_by_credentials(username, password)
		User.find_by(username: username, password: password)
	end

	def generate_auth_token
  		payload = { user_id: self.id }
  		AuthToken.encode(payload)
	end
end