class Person
	attr_accessor :id, :firstName, :lastName, :sex, :phoneNumber, :hobbies
	@@lastId = 0
	def initialize firstName='', lastName='', sex='', phoneNumber='', hobbies=[''], increaseId=false
		if increaseId
			@@lastId += 1
			@id = @@lastId
		end	
		@firstName = firstName
		@lastName = lastName
		@sex = sex
		@phoneNumber = phoneNumber
		@hobbies = hobbies
	end
end