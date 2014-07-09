class WelcomePage < Page
  trait "BBBButton marked:'Try it out'"
	element :try_it_out_button, "BBBButton marked:'Try it out'"

	def goto_library
			touch(try_it_out_button.selector)
	end
end
