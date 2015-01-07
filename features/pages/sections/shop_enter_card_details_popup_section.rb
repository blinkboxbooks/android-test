module PageObjectModel
  class ShopEnterCardDetailsPopupSection < PageObjectModel::Page
    trait "* id:'customPanel' android.widget.Textview text:'Enter your card details'"
    element :save_details_switch, "* id:'switch_save_details'"
    element :card_number_field, "* id:'edittext_cardnumber'"
    element :card_image_visa, "* id:'imageview_visa'"
    element :card_image_mastercard, "* id:'imageview_mastercard'"
    element :expiry_month_field, "* id:'edittext_month'"
    element :expiry_year_field, "* id:'edittext_year'"
    element :security_code_field, "* id:'edittext_cvv'"
    element :name_on_card_field, "* id:'edittext_name_on_card'"
    element :address_line_one_field, "* id:'edittext_address_line_1'"
    element :address_line_two_field, "* id:'edittext_address_line_2'"
    element :town_or_city_field, "* id:'edittext_locality'"
    element :postcode_field, "* id:'edittext_postcode'"
    element :cannot_add_card_link, "* id:'textview_card_overseas'"
    element :next_button, "* id:'button_continue'"
  end
end