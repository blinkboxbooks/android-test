module ShopActions
	def search(string)
		query("* id:'search_src_text'",{:setText => string})
		touch("* id:'search_src_text'")
	end
	def search_has_results?
		if !query("* android.widget.ListPopupWindow$DropDownListView").empty?
		return true
		end
	return false	
	end
end
