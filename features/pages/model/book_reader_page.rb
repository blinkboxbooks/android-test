class BookReaderPage < Page
	def open_first_book
		wait_for(:timeout => 10){
			touch("BookCover index:0")
		}
	end
	def trait
		"FrameLayout id:'content'"
	end
	def display_reader_options
		performAction('click_on_screen', 50, 50)
	end

	def remove_reader_options
		performAction('click_on_screen', 50, 50)
	end

	def turn_page_forward(number_of_pages)
		number_of_pages.to_i.times do
			performAction('click_on_screen', 90, 50)
		end
	end

	def turn_page_backward(number_of_pages)
		number_of_pages.to_i.times do
			performAction('click_on_screen', 10, 50)
		end
	end

	def get_current_reading_percentage
		reading_pos ||= 0
		query("BBBTextView id:'textview_progress'")[0]['text'].split.each do |elem|
			if elem.include?("%")
				reading_pos = elem.scan(/\d+%/)[0].to_i
			end
		end
		reading_pos
	end

	def reading_position(option)
		unless query("Button id:'button1'").empty?
			performAction('click_on_text', option)
		end
	end

	def dismiss_help_overlay
		unless query("ImageView id:'imageview_overlay'").empty?
			performAction('click_on_text', "Got it!")
		end
	end

	def options_menu_button
		logger.debug "Opening options menu"
		display_reader_options
		sleep(2)
	end

	def list_of_bookmarks
		touch("TextView marked:'My bookmarks'")
		wait_element_to_exist("* marked:'Your Bookmarks'")
	end

	def number_of_bookmarks
		wait_element_to_exist("* id:'action_bar_container'")
		query("BBBTextView id:'textview_bookmark_title'").length
	end

	def clear_all_bookmarks
		query("ImageButton id:'imagebutton_delete'").length.times do
			touch("ImageButton id:'imagebutton_delete'")
			wait_element_to_exist("Button marked:'Delete'")
			touch("Button marked:'Delete'")
			wait_element_to_exist("BBBTextView marked:'Your Bookmarks'")
		end
	end

	def exit_bookmark_list_screen
		wait_element_to_exist("* id:'layout_back'")
		touch("* id:'layout_back'")
	end

	def go_to_bookmarked_page(index = 0)
		wait_element_to_exist("* id:'textview_bookmark_title' index:#{index}")
		touch("* id:'textview_bookmark_title' index:#{index}")
	end

	def add_bookmark
		wait_for(:timeout => 5) {
			touch("ImageView marked:'Reader bookmark'")	
		}
	end

	def remove_bookmark
		wait_for(:timeout => 5) {
			touch("ImageView marked:'Reader bookmark'")	
		}
	end

	def save_last_position(option = "button2")
		wait_element_to_exist("* id:'#{option}'")
		touch("* id:'#{option}'")
		wait_element_to_exist("FrameLayout id:'content'")
	end

	def has_bookmark?
		if query("* id:'imageview_bookmark'").empty?
			return false
		end
		return true
	end
end
