module PageOperations
  include Logging

  def try action, withelement, should_produce, with
    logger.debug "Trying... #{withelement.selector}"
    action.call(withelement)
    start_time = Time.now
    timeout = 5.0
    while(Time.now - start_time < timeout)
      return if should_produce.call(with)
      sleep(0.1)
    end
    raise "Timed out waiting for should_produce => #{with.to_s}"
  end

  def tap x, y
    perform_action('click_on_screen', x, y)
  end
end