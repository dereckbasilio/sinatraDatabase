get '/personList' do
	isLogedIn()

	$personToEdit = Person.new
	$male = ''
	$female = ''

	$currentTab = 'people'
	$action = 'addPerson'
	session[:people] ||= []
	@people = session[:people]
	erb :personList
end

get '/newPerson' do
	isLogedIn()

	erb :personForm
end

post '/addPerson' do
	hobbyList = params[:hobby] || {}
	hobbies = [hobbyList[:videoGames], hobbyList[:skateboarding], hobbyList[:reading], hobbyList[:stampCollecting]]
	person = Person.new params[:firstName], params[:lastName], params[:sex], params[:phoneNumber], hobbies, true
	session[:people].push person
	redirect to('/personList')
end

get '/delete' do
	session[:people].delete_if {|person| person.id.to_s == params[:id]}

	redirect to('/personList')
end

get '/edit' do
	isLogedIn()

	$action = 'update'	
	$personToEdit = session[:people][session[:people].index {|person| person.id.to_s == params[:id]}]
	$personToEdit.sex == 'male' ? $male = 'checked' : $female = 'checked'
	erb :personForm
end

post '/update' do
	person = session[:people][session[:people].index {|person| person.id == $personToEdit.id}]

	person.firstName = params[:firstName]
	person.lastName = params[:lastName]
	person.sex = params[:sex]
	person.phoneNumber = params[:phoneNumber]

	redirect to('/personList')
end