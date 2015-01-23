class HomeController < ApplicationController
  skip_before_action :authenticate_request 
  def index
  	decoded_auth_token = AuthToken.decode(cookies[:auth_token])

  	if decoded_auth_token == nil
		redirect_to :controller => 'auth', :action => 'index'
	end

	rescue
  		redirect_to :controller => 'auth', :action => 'index'
  end
end