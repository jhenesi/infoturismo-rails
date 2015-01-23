class AuthController < ApplicationController
    include AuthHelper

  	skip_before_action :authenticate_request 

    def index
    end

  	def authenticate
      puts 'auth'
    	user = User.find_by_credentials(params[:username], params[:password])
    	if user
          puts 'generate'
      		render json: { auth_token: user.generate_auth_token }
    	else
      		render json: { error: 'Invalid username or password' }, status: 401
    	end
  	end
end