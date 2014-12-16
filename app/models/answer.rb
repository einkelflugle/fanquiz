class Answer < ActiveRecord::Base
	belongs_to :question
	has_many :submitted_choices

	default_scope { order("id ASC") } # Answers should be in correct order
end
