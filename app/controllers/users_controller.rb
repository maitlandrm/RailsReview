class UsersController < ApplicationController
	before_action :require_login, except: [:create, :index]
	# before_action :require_correct_user, only:
	def index
	end

	def show 
		@user = User.find(params[:id])
		@idea_count = @user.ideas.count
		@like_count = @user.likes.count
	end

	def create
		@user = User.create ( user_params )
		if @user.save
			session[:user_id] = @user.id
			redirect_to ideas_path
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to root_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	end
end
