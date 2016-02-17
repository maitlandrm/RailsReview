class IdeasController < ApplicationController
	before_action :require_login

	def index
		@user = User.find(session[:user_id])
		@ideas = Idea.joins("LEFT JOIN users ON ideas.user_id = users.id").select("users.alias AS alias, ideas.user_id AS user_id, ideas.conent AS content, ideas.id, ideas.likes_count").order("ideas.likes_count DESC")

	end
	def show
		@idea = Idea.find(params[:id])
		@user = @idea.user
		@likes = @idea.likes.joins("JOIN users ON users.id = likes.user_id").select("users.alias AS alias, users.name AS name, users.id as user_id").distinct
	end

	def create
		current_user.ideas.create( idea_params )
		redirect_to ideas_path
	end

	def destroy
		Idea.destroy(params[:id])
		redirect_to ideas_path
	end

	private
	def idea_params
		params.require(:idea).permit(:conent)
	end
end
