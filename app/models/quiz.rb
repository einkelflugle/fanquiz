class Quiz < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :results, dependent: :destroy
	belongs_to :user
	accepts_nested_attributes_for :questions, reject_if: lambda { |a| a[:title].blank? }, allow_destroy: true
	validates :name, length: { minimum: 5 }
	validates :description, length: { minimum: 10 }
end