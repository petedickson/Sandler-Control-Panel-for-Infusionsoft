class SessionsController < ApplicationController
  include ApiInfusionsoft
  
  def numeric?(object)
    true if Float(object) rescue false
  end
  
  def authenticate(username, password)
    infusionsoft_user_id = api_data_authenticate_user(username, password)
  end
  
  def new
  end
  
  def create
    user = authenticate(params[:session][:username],
                        params[:session][:password])
    if numeric?(user)
      # Log the user in
    else
      flash.now[:error] = "Please try again. The username/password combination is not correct."
      # @title = "Sign in"
      render 'new'    
    end
  end
end
