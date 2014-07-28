module PageObjectModel
	class BookReaderPage < PageObjectModel::Page
		trait "FrameLayout id:'content'"
		element :bookmarker, "ImageView marked:'Reader bookmark'"
		element :bookmark, "* id:'imageview_bookmark'"
		def toggle_reader_options
			tap 50, 50
		end
		def turn_page(number_of_pages)
			direction = :right
			if number_of_pages.to_i < 0
				direction = :left
			end
			(number_of_pages.to_i).abs.times do
				case direction
				when :left
					tap 10,50
				when :right
					tap 90,50
				end
			end
		end
		def options_menu_button
			logger.debug "Opening options menu"
			wait_for(:timeout => 5) {
				toggle_reader_options
			}
		end
		def toggle_bookmark
			wait_for(:timeout => 5) {
				bookmarker.click
			}
		end
		def has_bookmark?
			bookmark.exists?
		end
	end

	def book_reader_page
		@_book_reader_page ||= page(BookReaderPage)
	end
end
