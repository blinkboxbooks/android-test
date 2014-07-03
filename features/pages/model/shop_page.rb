class ShopPage < Page
	custom_action = Proc.new do | *args |
		query("* id:'search_src_text'",{:setText => args.first})
	end
	custom_element :search_field, "* id:'search_src_text'","custom_text",custom_action
	element :search_results, "*android.widget.ListPopupWindow$DropDownListView"	
	def trait
		"* id:'action_bar_title' marked:'Shop'"
	end
	def search(string)
		search_field_custom_text string
		search_field_click
	end
	def search_has_results?
		wait_for(:timeout => 5) do
			if search_results_exists?
				return true
			end
		end
		return false
	end	
end
