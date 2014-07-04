class WelcomePage < Page

	element :try_it_out_button, "BBBButton marked:'Try it out'"

	def trait
		"BBBButton marked:'Try it out'"
	end
	def goto_library
		if try_it_out_button_exists?
			try_it_out_button_click
		else
			logger.alert "Element missing #{try_it_out_button.el}"
		end
	end
end
