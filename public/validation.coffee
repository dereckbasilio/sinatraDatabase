$ ->
	validateForm = ->
		firstName = document.forms["personForm"]["firstName"].value
		lastName = document.forms["personForm"]["lastName"].value
		sex = document.forms["personForm"]["sex"].value
		phoneNumber = document.forms["personForm"]["phoneNumber"].value

		phoneFormat = /^\(?\d\d\d\)?[-\s]?\d\d\d[-\s]?\d\d\d\d$/
		nameFormat = /[A-Z][a-z]+/

		validationErrorMessage = ""

		unless nameFormatIsInvalid nameFormat
			validationErrorMessage += "The name must only contain letters.<br>"
			$("#validationError").html validationErrorMessage
			return false
		unless phoneFormat.test phoneNumber
			validationErrorMessage += "Phone Numbers Must be in the following format: (xxx) xxx-xxxx"
			$("#validationError").html validationErrorMessage
			return false		

	showHobbies = ->
		if $("input[name='showHobbies']:checked").val() == "yes"
			$("#hobbies").removeClass 'hidden'
		else
			$("#hobbies").addClass 'hidden'

	$("input[name='showHobbies']").click ->
		showHobbies()

	$(".removeButton").click ->
		self = $(this)
		event.preventDefault()
		bootbox.confirm "Are you sure?", (result) ->
			window.location = self.attr('href') if result

	$(".starsRating").hover ->
		currentStar = parseInt $(@).attr("id").split("_")[1]
		$("input[name='stars']").val currentStar
		for i in [1..5]
			if i <= currentStar
				$("#star_#{i}").attr "src", "../star.gif"
			else
				$("#star_#{i}").attr "src", "../no-star.png"

	showHobbies()

nameFormatIsInvalid = (nameFormat) ->
	nameFormat.test(firstName) && nameFormat.test(lastName)