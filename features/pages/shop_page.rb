class ShopPage < Page
	trait "* id:'action_bar_title' marked:'Shop'"
	element :search_field, "* id:'search_src_text'"
	element :search_results, "*android.widget.ListPopupWindow$DropDownListView"
	element :fiction_button, "* text:'Fiction'"
	element :non_fiction_button, "* text:'Non-fiction'"
	element :categories_button, "* text:'Categories'"

	def search(string)
		enter_text search_field.selector,string
		touch(search_field.selector)
	end
	def goto_fiction
		touch(fiction_button.selector)
	end
	def goto_non_fiction
		touch(non_fiction_button.selector)
	end
	def goto_categories
		touch(categories_button.selector)
	end
	def has_search_results?
		wait_for(:timeout => 5) do
			if search_results.exists?
				return true
			end
		end
		return false
	end
end
