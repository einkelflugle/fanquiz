class Question < ActiveRecord::Base
	belongs_to :quiz
	has_many :answers, dependent: :destroy
	accepts_nested_attributes_for :answers, reject_if: lambda { |a| a[:title].blank? }, allow_destroy: true

	default_scope { order("id ASC") } # Questions should be in correct order

	def correct_answer
		self.answers.find_by(correct: true)
	end
end
