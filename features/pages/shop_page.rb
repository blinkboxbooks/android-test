class ShopPage < Page
	element :search_field, "* id:'search_src_text'"
	element :search_results, "*android.widget.ListPopupWindow$DropDownListView"
	element :fiction_button, "* text:'Fiction'"
	element :non_fiction_button, "* text:'Non-fiction'"
	element :categories_button, "* text:'Categories'"

	def trait
		"* id:'action_bar_title' marked:'Shop'"
	end
	def search(string)
		query(search_field.selector,{:setText => string})
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
	def search_has_results?
		wait_for(:timeout => 5) do
			if !query(search_results.selector).empty?
				return true
			end
		end
		return false
	end
end
