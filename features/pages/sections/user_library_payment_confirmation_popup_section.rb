module PageObjectModel
  class UserLibraryPaymentConfirmationPopupSection < PageObjectModel::Page
    trait "* id:'customPanel'"
    element :book_cover, "* id:'bookcover'"
    element :book_title, "* id:'textview_title'"
    element :payment_card_number, "* id:'textview_cc_number'"
    element :payment_card_type, "* id:'textview_cc_type'"
    element :book_price, "* id:'textview_price'"
    element :pay_now_button, "* id:'button_pay_now' text:'Pay now'"
    element :change_button, "* id:'button_change' text:'Change'"
  end
end