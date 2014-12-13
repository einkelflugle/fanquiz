class Answer < ActiveRecord::Base
	belongs_to :question

	default_scope { order("id ASC") } # Answers should be in correct order
end
