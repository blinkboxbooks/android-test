require 'cucumber/blinkbox/formatter/html'

# cucumber/blinkbox/formatter/html extended with support of taking browser screenshots on failures
module Cucumber
  module Blinkbox
    module Formatter
      class Html
        require 'base64'

        def save_screenshot_with_filename_based_on(filename_base)
          #figure out path to the report HtmlFile (@io will contain filepath - see Cucumber::Formatter::Html)
          #we will put "screenshots" folder in the same location.
          screen_dir = File.join(File.dirname(@io.path), 'screenshots')
          Dir::mkdir(screen_dir) unless File.directory?(screen_dir)
          file = File.join(screen_dir, "FAILED_#{filename_base.to_s.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png")
          begin
            driver = Capybara.page.driver
            if driver.respond_to?(:save_screenshot)
              driver.save_screenshot(file)
            elsif driver.respond_to?(:browser) && driver.browser.respond_to?(:save_screenshot)
              driver.browser.save_screenshot(file)
            else
              driver.render(file)
            end
            image = Base64.encode64(open(file).to_a.join)
            embed image, 'image/png', 'CLICK TO VIEW/HIDE SCREENSHOT'
          rescue Exception => e
            puts 'TAKING SCREENSHOT FAILED'
            puts e.message
            puts e.backtrace
          end
        end

        def after_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
          super(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)

          if status == :failed
            save_screenshot_with_filename_based_on(step_match.step_definition)
          end
        end

        #override to set color of pending exceptions backtraces to Yellow instead of Red (and thus not make the whole scenario Red)
        def after_table_row(table_row)
          return if @hide_this_step
          print_table_row_messages
          @builder << '</tr>'
          if table_row.exception
            if table_row.exception.instance_of?(Cucumber::Pending)
              @builder.tr do
                @builder.td(:colspan => @col_index.to_s, :class => 'pending') do
                  @builder.pre do |pre|
                    pre << h(format_exception(table_row.exception))
                  end
                end
              end
              set_scenario_color_pending
            else
              @builder.tr do
                @builder.td(:colspan => @col_index.to_s, :class => 'failed') do
                  @builder.pre do |pre|
                    pre << h(format_exception(table_row.exception))
                  end
                end
              end
              save_screenshot_with_filename_based_on(table_row)
              set_scenario_color_failed
            end
          end
          if @outline_row
            @outline_row += 1
          end
          @step_number += 1
          move_progress
        end

        #TODO: add logger to the framework
        #output framework start up logs before all executed features are listed
        #def before_features(features)
        #  super(features)
        #
        #  @builder.div(:id => 'cucumber_log') do
        #    @builder.h3(:id => 'scenario_cucumber_log', :style => 'cursor: pointer; ') do
        #      @builder.text!('  CLICK TO VIEW/HIDE CUCUMBER START UP LOG')
        #    end
        #    @builder.ol() do
        #      $logger.results[:all].each do |message|
        #        @builder.li() { @builder.text! message }
        #      end
        #    end
        #  end
        #end
        #
        #output execution log messages after each scenario or scenario outline
        #def after_feature_element(feature_element)
        #  @builder.div(:id => "cucumber_log_#{@scenario_number}", :class => 'log') do
        #    @builder.ol() do
        #      @builder.li() do
        #
        #        @builder.h3(:id => "scenario__#{@scenario_number}_cucumber_log", :style => 'cursor: pointer; ') do
        #          @builder.text!('CLICK TO VIEW/HIDE EXECUTION LOG FOR THIS SCENARIO')
        #        end
        #        @builder.ol() do
        #          $logger.results[:all].slice(@scenario_log_counter..-1).each do |message|
        #            @builder.li() { @builder.text! message }
        #          end
        #        end
        #
        #      end
        #    end
        #  end
        #
        #  super(feature_element)
        #end

      end
    end
  end
end