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

	def enter
		@quiz = Quiz.find(params[:id])
	end

	def submit_entry
		@quiz = Quiz.find(params[:id])
		@result = current_user.results.build(quiz: @quiz)

		incomplete_form = false

		@quiz.questions.each_with_index do |question, index|
			if params[:questions].nil? || params[:questions][index.to_s].nil?
				incomplete_form = true
			end
		end

		if incomplete_form
			redirect_to enter_quiz_path(@quiz)
			flash[:alert] = "Please answer incomplete questions."
		else
			@quiz.questions.each_with_index do |question, index|
				chosen_answer_id = params[:questions][index.to_s][:answer]
				choice = SubmittedChoice.create(result: @result, answer: Answer.find(chosen_answer_id))
			end
			if @result.save
				redirect_to @result and return
				flash[:notice] = "You got #{@result.score} out of #{@quiz.questions.count} correct!"
			else
				render 'new'
			end
		end
	end

	private
		def quiz_params
			params.require(:quiz).permit(:name, :description, questions_attributes: [:id, :title, :quiz_id, :_destroy, answers_attributes: [:id, :title, :correct, :question_id, :_destroy]])
		end
end