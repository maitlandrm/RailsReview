class LikesController < ApplicationController
	def create
		idea = Idea.find(params[:idea])
		Like.create(idea: idea, user: User.find(session[:user_id]))
		redirect_to ideas_path
	end
end
