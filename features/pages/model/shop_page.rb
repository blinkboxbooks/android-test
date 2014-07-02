class ShopPage < Page
	element :search_field, "* id:'search_src_text'"
	element :search_results, "* android.widget.ListPopupWindow$DropDownListView"

	def trait
		"* id:'action_bar_title' marked:'Shop'"
	end
	def search(string)
		search_field.enter_text(string)
		search_field.click
	end
	def search_has_results?
		wait_for(:timeout => 5) do
			if search_results.exists?
				return true
			end
		end
		return false
	end
end
