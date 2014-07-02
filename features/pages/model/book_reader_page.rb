class BookReaderPage < Page

  def initialize arg
  	@book_cover_first = Element.new("BookCover index:0")
		@bookmarker = Element.new("ImageView marked:'Reader bookmark'")
		@bookmark = Element.new("* id:'imageview_bookmark'")
	end
 	def open_first_book
		@book_cover_first.click
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
	def options_menu_button
		logger.debug "Opening options menu"
		display_reader_options
		sleep(2)
	end
	def add_bookmark
		wait_for(:timeout => 5) {
			@bookmarker.click
		}
	end
	def remove_bookmark
		wait_for(:timeout => 5) {
			@bookmarker.click
		}
	end
	def has_bookmark?
		@bookmark.exists?
	end
end
