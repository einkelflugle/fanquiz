class Result < ActiveRecord::Base
	belongs_to :user
	belongs_to :quiz
	has_many :submitted_choices

	def score
		the_score = 0
		self.submitted_choices.each do |choice|
			if choice.answer.correct?
				the_score += 1
			end
		end
		the_score
	end
end
