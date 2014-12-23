module PageObjectModel
  class UserLibrarySavedCardPopupSection < PageObjectModel::Page
    trait "* id:'customPanel' android.widget.Textview text:'How would you like to pay?'"
    element :how_would_you_like_to_pay, "* id:'textview_title' text:'How would you like to pay?'"
    element :saved_card_info, "* id:'textview_subtext'"
    element :payment_card_image, "* id:'imageview_cc_image'"
    element :payment_card_type, "* id:'textview_cc_type'"
    element :payment_card_number, "* id:'textview_cc_number'"
    element :add_new_card_button, "* id:'button_add_new_card' text:'Add a new card'"
  end
end