require 'cucumber'
require 'cucumber/formatter/io'
require 'cucumber/formatter/html'
require_relative 'env.rb'
class LoggedFormatter < Cucumber::Formatter::Html
	include UtilityObjects
	def initialize(step_mother, path_or_io, options)
		super(step_mother,File.open(conf_data['project']['log_html_path'],"w+"),options)
	end
	def before_steps(steps)
		  @builder << '<ol style="display:none">'
	end
end
