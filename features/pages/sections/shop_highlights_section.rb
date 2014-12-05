module PageObjectModel
  class ShopHighlightsSection < PageObjectModel::Page
    trait "* id:'container_highlights' descendant android.widget.TextView text:'Highlights'"
    element :title, "* id:'container_highlights' descendant android.widget.TextView text:'Highlights'"
    element :left_selection, "* id:'left_selection'"
    element :right_selection, "* id:'right_selection'"
    element :carousel, "* id:'carousel_container'"
    element :book_title_text, "* id:'title_text'"
    element :author_name_text, "* id:'author_name'"
    element :clubcard_points, "id:'clubcard_points_text'"
    element :discount_text, "id:'discount_text'"
    element :price, "id:'price'"
    element :buy_button, "id:'button_buy'"
  end
end