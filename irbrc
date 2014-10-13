#content was copied from https://github.com/calabash/calabash-android/blob/master/ruby-gem/irbrc

require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
require 'awesome_print'
AwesomePrint.irb!

ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]

# 50 entries in the list
IRB.conf[:SAVE_HISTORY] = 50

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = ".irb-history"

require 'calabash-android/operations'
extend Calabash::Android::Operations

def embed(*args)
  puts "Embed is a Cucumber method and is not available in this console."
end

#Virker det her?
module Calabash
  module Android
    module Operations
      class Cucumber
        def self.wants_to_quit
          false
        end
      end
    end
  end
end


#blinkbox book custom code
require 'require_all'

#load support code of the framework
def load_support_code
    puts 'Loading blinkbox Books support code...'
    load_rel 'features/support/modules'
    load_rel 'features/pages/model'
    load_rel 'features/pages'
end
load_support_code
