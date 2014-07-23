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
	$("input[name='showHobbies']").click ->
		if $(this).val() == 'yes'
			$("#hobbies").removeClass 'hidden'
		else
			$("#hobbies").addClass 'hidden'

	$(".removeButton").click ->
		self = $(this)
		event.preventDefault()
		bootbox.confirm "Are you sure?", (result) ->
			window.location = self.attr('href') if result

nameFormatIsInvalid = (nameFormat) ->
	nameFormat.test(firstName) && nameFormat.test(lastName)