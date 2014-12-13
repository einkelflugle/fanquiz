module QuizzesHelper
	def belongs_to_user
		@quiz = Quiz.find(params[:id])
		unless current_user == @quiz.user
			flash[:alert] = "You cannot modify this quiz."
			redirect_to quizzes_path
		end
	end
end