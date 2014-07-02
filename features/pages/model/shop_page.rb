class ShopElement < Element
	def enter_text(text)
		query("* id:'search_src_text'",{:setText => text})
	end	
end

class ShopPage < Page
	def initialize arg
		@search_field = ShopElement.new("* id:'search_src_text'")
		@search_results = Element.new("* android.widget.ListPopupWindow$DropDownListView")
	end
	def trait
		"* id:'action_bar_title' marked:'Shop'"
	end
	def search(string)
		@search_field.enter_text(string)
		@search_field.click
	end
	def search_has_results?
		wait_for(:timeout => 5) do
			if @search_results.exists?
				return true
			end
		end
		return false
	end	
end
