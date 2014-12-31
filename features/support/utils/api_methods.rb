module APIMethods
  require 'httpclient'
  require 'multi_json'
  require_relative 'utilities'

  class User
    include Utilities
    include UtilityObjects

    def initialize(auth, api)
      @auth_uri = "#{auth}/oauth2/token"
      @credit_card_uri = "#{api}/service/my/creditcards"
    end

    def create_new_user! (options ={})
      with_client = options[:with_client]
      @email_address = generate_random_email_address
      @password = 'test1234'
      @first_name = generate_random_first_name
      params = {
          grant_type: 'urn:blinkbox:oauth:grant-type:registration',
          first_name: @first_name,
          last_name: generate_random_last_name,
          username: @email_address,
          password: @password,
          accepted_terms_and_conditions: true,
          allow_marketing_communications: false
      }
      if with_client
        @device_name = 'Web Site Test Client'
        params.merge!({
                          client_name: @device_name,
                          client_brand: 'Tesco',
                          client_model: 'Hudl',
                          client_os: 'Android'})
      end
      headers = {'Content-Type' => 'application/x-www-form-urlencoded', 'Accept' => 'application/json'}

      ### initial try at some retry handling code.
      tries = 10
      begin
       response = http_client.post(@auth_uri, body: params, header: headers)
      rescue Exception => e
        puts "Connection broke, when trying to create user!"
        tries -= 1
        if tries > 0
          retry
        else
          abort 'Test Error: Failed to register new user'
        end
      end
      abort 'Test Error: Failed to register new user' unless response.status == 200
      user_props = MultiJson.load(response.body)
      @access_token = user_props['access_token']
      return @first_name, @email_address, @password, @device_name
    end

    def add_credit_card(access_token = @access_token)
      current_env = ENV['environment']
      params = {
          default: true,
          number: test_conf_data[current_env]['encrypted_card_details']['number'],
          cvv: test_conf_data[current_env]['encrypted_card_details']['cvv'],
          expirationMonth: test_conf_data[current_env]['encrypted_card_details']['expirationMonth'],
          expirationYear: test_conf_data[current_env]['encrypted_card_details']['expirationYear'],
          cardholderName: 'jamie jones',
          billingAddress: {line1: '123 my street', line2: '', locality: 'mytown', postcode: 'wc1x8aq'}
      }
      headers = {'Content-Type' => 'application/vnd.blinkboxbooks.data.v1+json', 'Authorization' => "Bearer #{access_token}"}
      body = {'type' => 'urn:blinkboxbooks:schema:creditcard'}.merge(params)

      tries = 10
      begin
        response = http_client.post(@credit_card_uri, body: format_body(body), header: headers)
      rescue Exception => e
        puts "Connection broke, when trying to add card!"
        tries -= 1
        if tries > 0
          retry
        else
          abort 'Adding credit card failed'
        end
      end
      abort 'Adding credit card failed' unless response.status == 201
      params[:cardholderName]
    end

=begin
    #qa
    def add_credit_card(access_token = @access_token)
      params = test_data(['qa-debug']['encrypted_card_details'])
      #params = {
      #    default: true,
      #    # 4111 1111 1111 1111
      #    number: '$bt4|javascript_1_3_9$UKu5OQaEdqxzY2K/RFKqFc+7wJjjbhIiq3T0fNnu/JyAhe/WzEevAYejVubwAKJ4k0ftmFmYB2qvxVSMCat50Src8VnTybU5bWzaEyPZnKTV0YVaOOpYdEkT7dAx3bqGbmHvKh2YMo0mB0EZgD0bom6ti/ANOszyslwRuNC9/LX7NURpXVy/UwjTAKDvOTNFl+C/rYykygaOhRuk45lvKV6roJUi2++TDPhWWXc9guQZh10pTng5nzYwxS7OqvaEsmY6ord6K2Yh38opp//q6uTGJqxOl0cTTs36i6lYiTeJgiRP8BIPq1iMaFbTgjRTwTX7fKWtK0GlwBQfg27AkQ==$IUMEI4k/dxXKDqbl6BQbR+kVyyQtMLV3uDviXiFhwkQG/F5IiEAt5IwgmHUpTsTv$N0zI+s3CDBqdHqG8v79I25ldgi2B0iAL1oM4FGblnQU=',
      #    # 123
      #    cvv: '$bt4|javascript_1_3_9$dBma/4JOk2iuA24vVaTCjpHaAVLkfY6I3a2hEvF2+ulQcew6sh8f0NkSfpMeIi9vJTmR/0Vt6GMyrAolZYT5U341zQpJR3HVB3o5ZchiZ10sTk3Ddv6dxLe/YY3+8mFpALKRWrzn7bqYbQIXDn6FsQuNihx0oAD2TYoWOQ/XRILWGacb9D17TC3MIVINQpsiBjf1ojkSvqLAiCwjrK9eW++ZHuqvtLGFC8CS6I+1iccULvjw0Gi7FID2353Z2AUHTGy/pHOqbXyTpetexKBt/P0ePvC/QNDItro86t9Mk4CliShInO/+uh8yaLVNj+A0LD46IWUWShKMxKiqD35r2A==$vFKasTC82c/wGuwmCcT0MYRssCWWq3PVVi00m8xT25Q=$d1/DpRLio64HCLlwBMiXSQECGbPhqF+caTbLneMXrRI=',
      #    # 12
      #    expirationMonth: '$bt4|javascript_1_3_9$d2Lg1CR/whPsgT0GkIq58wy4npDR9233wrDSW1haN7V1xuYosrHHtyCxESEsdfcvrVMgeZOpihf5Ia7ZtR+ZG5fO51cU0+aOWthvTCG/sMi6Wan9xHKNaCdEVDqSAgP6LDctHuZz6RRghNeIY3Vd4vbe5UCKQSZeM8RnWIrNiRKwREFDd+jS4hHgumuCXafHnGhhwWKFcmCpHhnwc0DiMtpz3OKLof7MLzhcZI8uuIcmTmKMqR9eLuzGW72/V3WEC3DrXumspQhYK/XsWpYLRbOQ/A/JZxfGd4k0jyktREefwh1wWxe3YP6dl1zovitF554U6BGPoRCFz9WccExyhA==$kdANOxNFicySPt4E8nGpHj9pMlXgTE/m6MUnK46LEXg=$azyfsPSgNmr5/ZWvE6nQJOcARlyOl4eg7Oz4hv8btLk=',
      #    # 2023
      #    expirationYear: '$bt4|javascript_1_3_9$ITZqKHcpoeleHUGBOnjrYMZy4uhahUpcbY50dcD2f9BYir/wzczc6GZsYSYStsSzU1ygNavG7yiAcL7zpc+nTZuR3nPi/Fru2iCuWmZ31fXpxrSW5iPkstu8EWCL6VlVSaVIRKZndki14+22aQt6wGnEL4F0xMyi+Lgp5ruqKAZJn5B2sak3VPOAsruMst1/RyoqnXH1ENlHaFQdGjNWqoc8glBzUGw+GBAzF6sB8f/Hjx2m7pCkEELuD5Xd8GUHACGKnN+16ZrNEojMnYCjtEsvfgaBCeVEKZul+7fOqkUn9MMljLfBrDFD881F1u80dXkWF+gIA6++BO8dGfeIpg==$Tt3r3zw5GGbql+IB1rv77hXXG8O5+4HovJvhb8TYvQA=$nxr03lZvlhMT5X8dmIAQLD4HIf24PZWX0jRl9sjM3m4=',
      #    cardholderName: 'jamie jones',
      #    billingAddress: {line1: '123 my street', line2: '', locality: 'mytown', postcode: 'wc1x8aq'}
      #}
      headers = {'Content-Type' => 'application/vnd.blinkboxbooks.data.v1+json', 'Authorization' => "Bearer #{access_token}"}
      body = {'type' => 'urn:blinkboxbooks:schema:creditcard'}.merge(params)

      tries = 10
      begin
        response = http_client.post(@credit_card_uri, body: format_body(body), header: headers)
      rescue Errno::EPIPE => e
        puts "Connection broke!"
        tries -= 1
        if tries > 0
          retry
        else
          abort 'Adding credit card failed'
        end
      end
      abort 'Adding credit card failed' unless response.status == 201
      params[:cardholderName]
    end
=end

=begin
    #dev
    def add_credit_card(access_token = @access_token)
      params = {
          default: true,
          # 4111 1111 1111 1111
          number: '$bt4|javascript_1_3_9$QDozr2WDjVUvw7cXPZynCux85VIX+D2nmVB4lg9W4byjlJQ9x6kPsGmeTtaK6lNS8sjafJe7GuSHkiWD4n5K7+E45PyTVXeIuQAdvJavarUnR4xEII2ejPZ3i9MB2L0ZdWdGMzM9wcI70mwFMAXfW3yZlflmXuc9DbFnH47gJySBQMAPm/mRswvaOriCWpEEWXQuIP4FvGh5f2ktRl+D0aa1OtU/kESYE26YM0eE6GbGxFQGkICjrqxi8daxuENE8O4ouQHJ2sTbR8EMHVUK29HV0tJ5wNQmbhvw5e9gOw7Ssf8aG1eOFuDEtgHBxHalR6NthfLWUM8JO7J/bzOR/w==$/wDjiFVC/bXAgN+5pMqJI7DZpNJkO8gltKkgG1CmIjT2p22v4C1Do4bYtWaLQ8Ab$m/JFIUnuFnJpNjQhGv2BGkfLzAl7gT7+FgNd+ENRwIw=',
          # 123
          cvv: '$bt4|javascript_1_3_9$W+QdRvldVyaGBH+VOGAP2HAmB58tpe8iuH4XChDlS98WYHWqCGGx/Q0Qmt4ZdEWceuL5I+e6t/WmvVQWNEqrbk2gfTdTVbJO5DZYi5Jo+3Pr6/kOnCV7ny+04gmr9s2XURHPiOXK7+0X0Pf0VaDAGGFzz7x6WOsWxmi107WdfZXbtcl+1mpb9QUvIYJDzqj6ETBZOHiXIDot3nkr6KxIJJ7vKg3Nx9njINn7YDI56mly/1m5hemzeqduDKqdR9Q8JXByk9CuBf7afdso12R+R1lZ0WhDTQhbw07JPrLnhKKdFQ9nZrl6NwSGI90aE40cqJq8V8OuP7rC/2/177yd6w==$DR5Rh9Xj59YVZIU5D91wxwl7uqZjvdBaIZ1AWVcn4HU=$gYksRVJGTufUXeZbEWEjeCBrQ1ZJLxpzBdjaXfso08E=',
          # 12
          expirationMonth: '$bt4|javascript_1_3_9$iUJvknE9NIp+hJZ/082j1b8a+4Ih5kF2YLY+M078EbxEvqrd0nPJaD3ahsaYQt6YtX/lseLQE/kEBy6u2P2lbgw1hsncYP8Cu57J05KWKK0ligggTMBaPUv6RSSSceCbMwr4jW9MvP+tcfkRYKD29xCr4lV2Hd6JZPhtzYlbxkAgOQa4rrx4yMe0rnmDndZjnQ6mQufT+ea/HoN4bQA6NOhuiH3XPeCAqfcV9EmTd0LPaIyAC9fpOq2llyEzu2Vb+J9f91eiZb0XUxB56UOH3h2Vs+u5yaSm3sY08VOxG02XLaB2eKqI5FDK3y7cQzsMHgZxqwUlvB3R62jzw3o5lA==$nTrYl17a06JhZNswnlyOiRY1uG0vGQgyyDaV8dxi5Ck=$i4q070EWiiA/o6yZYElIH8vVaBla5bl1SKaCjtHYnYM=',
          # 2023
          expirationYear: '$bt4|javascript_1_3_9$QnOYWCJPyFrp8Q8DUhDXOLxugBiDx2VK/85PbO1xF8QoYNN58pUeyCVdzrRYOQrzEbZ15zSac9PLUEnVntLLCa+shnpV4sRaX0QwbLEhbFr/jY3207z9Dh4twd+JZLJYekAIEw6Xaci4s7BIsGOsuDcaUozlANsGv0LMUYlFXUeg5mtcjsuutEA6bLp4N05R4P4+cbtE1P6J4coQmRc99FGcwltiu96B9/dhb22AKwXk1JOmL93o8zGx94zS2Q5VITqRDE8a5ccE2WIhbovScLrpG86VtTydXdUQb3A3bmWIDLHmJxfRy7fTal6w0ct7AH+PnMDwyDxMxqP96mbFgg==$/e1q7kLEnirDN45sQRuZ6116hMCgYe4QgciKrPL0uSI=$Q3Q3bznNhuo2UOoIYoPTj9nTSpM9Ul/K2A7DKeUFRAw=',
          cardholderName: 'jamie jones',
          billingAddress: {line1: '123 my street', line2: '', locality: 'mytown', postcode: 'wc1x8aq'}
      }
      headers = {'Content-Type' => 'application/vnd.blinkboxbooks.data.v1+json', 'Authorization' => "Bearer #{access_token}"}
      body = {'type' => 'urn:blinkboxbooks:schema:creditcard'}.merge(params)

      tries = 10
      begin
        response = http_client.post(@credit_card_uri, body: format_body(body), header: headers)
      rescue Errno::EPIPE => e
        puts "Connection broke!"
        tries -= 1
        if tries > 0
          retry
        else
          abort 'Test Error: Failed to register new user'
        end
      end
      abort 'Adding credit card failed' unless response.status == 201
      params[:cardholderName]
    end
=end
    def buy_a_book

    end

    def add_a_device

    end

    def http_client
      @http = HTTPClient.new
      @http.ssl_config.options |= OpenSSL::SSL::OP_NO_SSLv3
      @http.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @http.ssl_config.ssl_version = :SSLv23#:TLSv1_1
      @http
    end

    def format_body(body)
      if body.is_a?(Hash)
        MultiJson.dump(body)
      else
        body
      end
    end
  end

  def api_helper
    current_env = ENV['environment']
    @api_helper||=APIMethods::User.new(test_conf_data['environments'][current_env]['auth_url'],
                                       test_conf_data['environments'][current_env]['api_url'])

  end
end

World(APIMethods)

