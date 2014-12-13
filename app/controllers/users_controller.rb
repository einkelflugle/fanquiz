class UsersController < ApplicationController
	def index
		@users = User.all
		@quizzes = Quiz.all
	end

	def show
		@user = User.find(params[:id])
	end
end