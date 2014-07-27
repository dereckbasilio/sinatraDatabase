get '/movieList' do
	isLogedIn()

	$currentTab = 'movies'
	$action = 'addMovie'
	session[:movies] ||= []
	@movies = session[:movies]
	erb :movieList
end

get '/newMovie' do
	isLogedIn()

	erb :movieForm
end

post '/addMovie' do
	movie = Movie.new params[:movieTitle], params[:rating], params[:stars], true
	session[:movies].push movie
	redirect to('/movieList')
end

get '/deleteMovie' do
	session[:movies].delete_if {|movie| movie.id.to_s == params[:id]}

	redirect to ('/movieList')
end

get '/editMovie' do
	isLogedIn()
	
	$action = 'updateMovie'	
	$movieToEdit = session[:movies][session[:movies].index {|movie| movie.id.to_s == params[:id]}]
	erb :movieForm
end

post '/updateMovie' do
	movie = session[:movies][session[:movies].index {|movie| movie.id == $movieToEdit.id}]

	movie.movieTitle = params[:movieTitle]
	movie.rating = params[:rating]
	movie.stars = params[:stars]

	$movieToEdit = Movie.new

	redirect to ('/movieList')
end