module PageOperations
  include Logging

  def tap(x, y)
    perform_action('click_on_screen', x, y)
  end

  def tap_top_right
    tap(90,10)
  end

  def tap_middle
    tap(50,50)
  end

=begin
I have decided to put this in as a 'generic' way of checking/waiting for popup and their elements.
will allow you to do...
def has_failure_to_launch_popup
  assert_popup([popup.title.selector, popup.text.selector, popup.button1.selector, popup.button2.selector])
end
then...
expect(some_page).should_have failure_to_launch_popup
the other big advantage to this is that there is a timeout of 5 seconds, as popups are often animated, may not appear instantly, etc.
=end
  def assert_popup(elements_array)
    begin
      wait_for_elements_exist(elements_array, timeout: 5)
      return true
    rescue
      false
    end
  end

  alias_method :assert_section, :assert_popup

  # wait for a tab/element to be seen as selected...
  def wait_for_mark_to_be_selected(mark)
    wait_for(:timeout => 5) do
      res = query("* marked:'#{mark}'", :isSelected)
      res.first == true
    end
  end

end
