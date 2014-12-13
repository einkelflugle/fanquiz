class AddUserIdToQuizzes < ActiveRecord::Migration
  def change
    add_reference :quizzes, :user, index: true
  end
end
