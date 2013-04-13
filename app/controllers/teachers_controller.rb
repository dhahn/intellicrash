class TeachersController < ApplicationController
	def index
		@teacher1 = Teacher.offset(rand(Teacher.count)).limit(1).first()
		@teacher2 = Teacher.offset(rand(Teacher.count)).where("id != ?", @teacher1.id).limit(1).first()
	end

	def update_scores
		t1 = Teacher.find(params[:id])
		t2 = Teacher.find(params[:id2])
		teacher1 = Elo::Player.new(:games_played => t1.games_played, :rating => t1.rating, :pro => t1.pro)
		teacher2 = Elo::Player.new(:games_played => t2.games_played, :rating => t2.rating, :pro => t2.pro)

		# Register a game where teacher1 wins against teacher2
		if(params[:winner] == "t1")
			game = teacher1.wins_from(teacher2)
		else
			game = teacher2.wins_from(teacher1)
		end

		t1.update_attributes(rating: teacher1.rating, games_played: teacher1.games_played, pro: teacher1.pro?)
		t2.update_attributes(rating: teacher2.rating, games_played: teacher2.games_played, pro: teacher2.pro?)

		@teacher1 = Teacher.offset(rand(Teacher.count)).limit(1).first()
		@teacher2 = Teacher.offset(rand(Teacher.count)).where("id != ?", @teacher1.id).limit(1).first()
		respond_to do |format|
			format.html { raise "Unsupported" }
			format.js
		end
	end

	def show
		@teachers = Teacher.order("rating desc").limit(15)
	end
end
