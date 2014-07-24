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

get '/' do
	$action = 'login'
	erb :loginPage
end

post '/login' do
	if params[:user] == $user && params[:password] == $password
		redirect to('/index')
	else
		redirect to('/')
	end
end

get '/index' do
	$currentTab = ''
	erb :index
end