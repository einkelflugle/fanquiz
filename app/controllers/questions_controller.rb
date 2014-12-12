class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question = Question.create(question_params)
	end

	private
		def question_params
			params.require(:question).permit(:title, :quiz_id, :_destroy, answers_attributes: [:id, :title, :question_id, :_destroy])
		end
end