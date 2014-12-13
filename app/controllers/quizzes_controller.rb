class QuizzesController < ApplicationController
	include QuizzesHelper

	before_action :belongs_to_user, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@quizzes = Quiz.all
	end

	def new
		@quiz = Quiz.new
		3.times do
			question = @quiz.questions.build
			4.times { question.answers.build }
		end
	end

	def create
		@quiz = current_user.quizzes.build(quiz_params)
		if @quiz.save
			redirect_to @quiz
		else
			render 'new'
		end
	end

	def show
		@quiz = Quiz.find(params[:id])
		@questions = @quiz.questions
	end

	def edit
		@quiz = Quiz.find(params[:id])
		@questions = @quiz.questions
	end

	def update
		@quiz = Quiz.find(params[:id])
		if @quiz.update_attributes(quiz_params)
			flash[:notice] = "Successfully updated quiz."
			redirect_to @quiz
		else
			render 'edit'
		end
	end

		@quiz = Quiz.find(params[:id])

		
	end

	private
		def quiz_params
			params.require(:quiz).permit(:name, :description, questions_attributes: [:id, :title, :quiz_id, :_destroy, answers_attributes: [:id, :title, :question_id, :_destroy]])
		end
end