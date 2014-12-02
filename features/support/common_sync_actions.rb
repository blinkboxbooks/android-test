#from https://gist.github.com/jnicklas/4129937, https://gist.github.com/jnicklas/d8da686061f0a59ffdf7
require 'timeout'
require 'rspec/expectations'

module WaitSteps
  extend RSpec::Matchers::DSL

  #stolen from: https://gist.github.com/tgaff/5094609

  # Ex. expect {logged_in_session?}.to become_true, "User is not logged in as expected"
  matcher :become_true do
    supports_block_expectations
    match do |block|
      begin
        Timeout.timeout(5) do
          sleep(0.1) until value = block.call
          value
        end
      rescue TimeoutError
        false
      end
    end
  end

  matcher :become_false do
    match do |block|
      begin
        Timeout.timeout(5) do
          sleep(0.1) until value = !block.call
          value
        end
      rescue TimeoutError
        false
      end
    end
  end

  # Ex. expect { page.current_url }.to become( '/#/something_or_other' )
  matcher :become do |expected|
    match do |block|
      begin
        Timeout.timeout(5) do
          sleep(0.1) until value = (block.call == expected)
          value
        end
      rescue TimeoutError
        false
      end
    end
  end

  #made it up myself, blame @aliaksandr
  def wait_until(timeout=5)
    require 'timeout'
    Timeout.timeout(timeout) do
      sleep(0.1) until value = yield
      value
    end
  end
end

World(WaitSteps)