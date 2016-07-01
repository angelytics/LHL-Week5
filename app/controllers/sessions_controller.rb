class SessionsController < ApplicationController

  include ActiveModel::ForbiddenAttributesProtection
   
  def new
  end

  def create
    user = User.where(:email => params[:email]).first 
	if user && user.authenticate(params[:password])
	  session[:user_id] = user.id
	  redirect_to movies_path, notice: "Welcome back, #{user.firstname}"
	else
	  flash.now[:alert] = "Log in failed"
	  render :new
	end
  end
  
  def destroy
    session[:user_id] = nil
	redirect_to movies_path, notice: "Adios muchacho"
  end
end
