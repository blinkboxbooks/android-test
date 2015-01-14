module PageObjectModel
  module ReaderAsserts
    def assert_end_of_book
      expect_activity("EndOfBookActivity")
    end

    def assert_end_of_sample_book
      expect_activity("EndOfSampleActivity")
    end

  end
end

World(PageObjectModel::ReaderAsserts)
