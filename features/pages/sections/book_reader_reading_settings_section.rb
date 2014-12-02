module PageObjectModel
  class BookReaderReadingSettingsSection < PageObjectModel::Page
    trait "FrameLayout id:'content'"
    #https://github.com/calabash/calabash-android/blob/master/ruby-gem/lib/calabash-android/steps/spinner_steps.rb
    #tap_when_element_exists("android.widget.PopupWindow$PopupViewContainer * marked:'Justify'")
    element :font_dropdown, "android.widget.Spinner id:'spinner_font'"
    element :text_alignment_dropdown, "android.widget.Spinner id:'spinner_text_alignment'"
    element :light_button, "* id:'button_white'"
    element :sepia_button, "* id:'button_sepia'"
    element :dark_button, "* id:'button_black'"
    element :decrease_font_size, "id:'button_fontsize_decrease'"
    element :increase_font_size, "id:'button_fontsize_increase'"
    element :fontsize_label, "* id:'textview_fontsize'"
    element :styling_checkbox, "* id:'checkbox_styling'"

    #to set the checkbox...
    #query("* id:'checkbox_styling'", :setChecked=>true/false)
    #or styling_checkbox.set_checkbox(true)
  end
end