module PageObjectModel
  module ReaderAsserts
    def assert_end_of_book
      expect_activity("EndOfBookActivity")
    end
  end
end

World(PageObjectModel::ReaderAsserts)
