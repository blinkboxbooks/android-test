module PageOperations
  include Logging

  def try action, withelement, should_produce, with
    logger.debug "Trying... #{withelement.selector}"
    action.call(withelement)
    t1 = Time.now
    max_time = 5.0
    current_time = 0.0
    hasCompleted = false
    while (current_time < max_time) && !hasCompleted
      hasCompleted = should_produce.call(with)
      current_time = Time.now - t1
      return
    end
    if !hasCompleted
      raise "Timed out waiting for should_produce => #{with.to_s}"
    end
  end

  def tap x, y
    perform_action('click_on_screen', x, y)
  end
end