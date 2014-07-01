class ShopPage < Page
	@search_field = Element.new("* id:'search_src_text'")
	@search_results = Element.new("* android.widget.ListPopupWindow$DropDownListView")
	def trait
		"* id:'action_bar_title' marked:'Shop'"
	end
	def search(string)
		@search_field.enter_text(string)
		@search_field.click
	end
	def search_has_results?
		if @search_has_results.exists?
			return true
		end
		return false
	end	
end
