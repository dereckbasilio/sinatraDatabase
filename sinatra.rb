require 'rubygems'
require 'sinatra'
require './person'
require './personController'
require './movie'
require './movieController'

enable :sessions
$action = 'login'
$personToEdit = Person.new
$male = ''
$female = ''

$movieToEdit = Movie.new

$currentTab = ''

$user = 'sdb'
$password = 'scoobydoo'

$currentUser = ''
$curentPassword = ''

get '/' do
	$action = 'login'
	erb :loginPage
end

post '/login' do
	$currentUser = params[:user]
	$curentPassword = params[:password]

	redirect to('/') if not($currentUser == $user and $curentPassword == $password)

	redirect to('/index')
end

get '/index' do
	redirect to('/') if not($currentUser == $user and $curentPassword == $password)
	$currentTab = ''
	erb :index
end

module Rating
	G = "G"
	PG = "PG"
	PG_13 = "PG-13"
	R = "R"
end