class SessionsController < ApplicationController
	before_action :require_login, only:[:destroy]
  def create
  	@status = User.check_session({"email" => params[:email], "password" => params[:password]})
		if @status
			session[:user_id] = @status[:id]
			redirect_to ideas_path
		else
			flash[:error] = "Invalid username or password"
			redirect_to root_path
		end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
