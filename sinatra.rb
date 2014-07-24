require 'rubygems'
require 'sinatra'
require './person'
require './personController'
require './movie'
require './movieController'

enable :sessions
$action = 'addPerson'
$personToEdit = Person.new
$male = ''
$female = ''

$movieToEdit = Movie.new

$currentTab = 'people'

get '/' do
	erb :index
end