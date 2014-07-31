require 'httparty'
module LibraryService
  def add_sample_book( host, body = {}, headers = {} )
    @response = HTTParty.post(host, :body => body.to_json , :headers => headers )
  end
end
