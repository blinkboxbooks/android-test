class WelcomePage < Page
  trait "BBBButton marked:'Try it out'"
	element :try_it_out_button, "BBBButton marked:'Try it out'"

	def goto_library
		if try_it_out_button.exists?
			touch(try_it_out_button.selector)
		else
			logger.alert "Element missing #{try_it_out_button.el}"
		end
	end
end
