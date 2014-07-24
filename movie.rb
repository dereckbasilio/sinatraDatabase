class Movie
	attr_accessor :id, :movieTitle, :rating, :stars
	@@lastId = 0;

	def initialize movieTitle='', rating='', stars='', increaseId=false
		if increaseId
			@@lastId += 1
			@id = @@lastId
		end
		@movieTitle = movieTitle
		@rating = rating
		@stars = stars
	end
end