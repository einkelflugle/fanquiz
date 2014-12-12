class AnswersController < ApplicationController
	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.create(answer_params)
	end

	private
		def answer_params
			params.require(:answer).permit(:title, :question_id, :_destroy)
		end
end