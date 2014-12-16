class SubmittedChoice < ActiveRecord::Base
	belongs_to :result
	belongs_to :answer
end
