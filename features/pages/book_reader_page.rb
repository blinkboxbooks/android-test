class BookReaderPage < Page
	trait "FrameLayout id:'content'"
	element :book_cover_first, "BookCover index:0"
	element :bookmarker, "ImageView marked:'Reader bookmark'"
	element :bookmark, "* id:'imageview_bookmark'"

	def open_first_book
		touch book_cover_first.selector
	end
	def display_reader_options
		perform_action('click_on_screen', 50, 50)
	end

	def remove_reader_options
		perform_action('click_on_screen', 50, 50)
	end
	def turn_page_forward(number_of_pages)
		number_of_pages.to_i.times do
			perform_action('click_on_screen', 90, 50)
		end
	end
	def turn_page_backward(number_of_pages)
		number_of_pages.to_i.times do
			perform_action('click_on_screen', 10, 50)
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
	def options_menu_button
		logger.debug "Opening options menu"
		display_reader_options
		sleep(2)
	end
	def add_bookmark
		wait_for(:timeout => 5) {
			touch bookmarker.selector
		}
	end
	def remove_bookmark
		wait_for(:timeout => 5) {
			touch bookmarker.selector
		}
	end
	def has_bookmark?
		bookmark.exists?
	end
end
