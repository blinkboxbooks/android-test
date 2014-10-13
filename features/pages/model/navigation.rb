module PageOperations
  include Logging

  def tap(x, y)
    perform_action('click_on_screen', x, y)
  end
end
