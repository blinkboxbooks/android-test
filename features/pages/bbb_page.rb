require 'calabash-android/abase'

class BBBPage < Calabash::ABase

  def wait_element_to_exist(element)
    wait_for_elements_exist([element], :timeout => @testdata['test']['timers']['await_timeout'])
  end

  def assert_element_contains_text(element, text)
    query(element).first['text'].should include(text)
  end

  def click_text_button(text)
    performAction('click_on_text', "#{text}")
  end

  def click_element_with_id(id)
    touch("* id:'#{id}'")
  end

  def click_view_id(id)
    performAction('click_on_view_by_id', "#{id}")
  end

  def select_from_spinner(text, description)
    performAction('select_item_from_named_spinner', description, text)
  end

  def click_on_screen(x,y)
    performAction('click_on_screen', x, y)
  end

  def click_on_element_with_desc(description, type = nil, index = 0)
    touch("#{type} contentDescription:'#{description}' index:#{index}")
  end

  def has_text?(text)
    !query("* marked:'#{text}'").empty?
  end

  def has_element_with_id?(id)
    wait_element_to_exist("* id:'#{id}'")
  rescue
    !query("* id:'#{id}'").empty?
  end

  def has_element_with_content_desc?(desc)
    !query("* contentDescription:'#{desc}'").empty?
  end

  def books_to_downloaded
    wait_element_to_exist("* contentDescription:'Tap to download'")
    query("* contentDescription:'Tap to download'")
  end


  def has_error_messages_displayed?(error)
    wait_element_to_exist("* marked:'#{error}'")
    !query("* marked:'#{error}'").empty?
  end

  def back_button
    touch("* id:'layout_back'")
  end

  def scroll_down(elem)
    while !element_exists(elem) do
      performAction('scroll_down')
    end
  end

  def scroll_up(elem)
    while !element_exists(elem) do
      performAction('scroll_up')
    end
  end

end
