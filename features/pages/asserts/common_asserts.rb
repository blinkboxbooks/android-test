module PageObjectModel
  module PageAsserts
    def expect_toolbar_title_to_equal(toolbar_title)
      toolbar = "* id:'toolbar' android.widget.TextView"
      wait_for_elements_exist(toolbar,timeout: 5)
      title = query(toolbar,:text).first
      expect(title).to include(toolbar_title)
    end
  end
end
