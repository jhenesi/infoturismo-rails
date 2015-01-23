class AuthController < ApplicationController
    include AuthHelper

  	skip_before_action :authenticate_request 

    def index
      decoded_auth_token = AuthToken.decode(cookies[:auth_token])
      
      if decoded_auth_token != nil && !decoded_auth_token.expired?
        puts 'token'
        redirect_to :controller => 'home', :action => 'index'
      end

      rescue
    end

  	def authenticate
      puts 'auth'
    	user = User.find_by_credentials(params[:username], params[:password])
    	if user
          puts 'generate'
      		render json: { auth_token: user.generate_auth_token }, status: 200
    	else
      		render json: { error: 'Invalid username or password' }, status: 401
    	end
  	end
end