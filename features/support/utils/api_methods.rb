module APIMethods
  require 'httpclient'
  require 'multi_json'
  require_relative 'utilities'

  class User
    include Utilities

    def initialize(auth, api)
      @auth_uri = "#{auth}/oauth2/token"
      @credit_card_uri = "#{api}/service/my/creditcards"
    end

    def create_new_user! (options ={})
      with_client = options[:with_client]
      @email_address = generate_random_email_address
      @password = 'test1234'
      params = {
          grant_type: 'urn:blinkbox:oauth:grant-type:registration',
          first_name: generate_random_first_name,
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
      begin
        response = http_client.post(@auth_uri, body: params, header: headers)
      rescue Errno::EPIPE
        puts "Connection broke!"
      end
      raise 'Test Error: Failed to register new user' unless response.status == 200
      user_props = MultiJson.load(response.body)
      @access_token = user_props['access_token']
      return @email_address, @password, @device_name
    end

=begin
    def add_credit_card(access_token = @access_token)
      params = {
          default: true,
          # 4111 1111 1111 1111
          number: '$bt4|javascript_1_3_9$Qrai2HEKdt+NeE1vmgldgi9dR6FB/g1daeYVsFDAv1QP0j2zb5BCnsJlYd1C5/YCFP0H6WzRgRDYOGLtpQOUNdIkMhzWevHlAGcSk/6nIJ/xJR510cjCc9yW/SazCdoYZI3RRsGSwTpLyEgtWbbpQqURjfF3Cthsiw1OLe4xvVFZdY2w4d8jBZRNaq1BUSW2TOzy6N8DHjGAFS1VcXqVYBl5TTFB2luejMaufsd5O+XncVZDZ/xq+zKI3loTju7sh23+58AHsOSfql24Qh3L/2BleQn2kmoDNy36AN7XIGLyjr2aq9pAYN+FwFNVKbzDnlQB4slg7CqVlTucYKMfAQ==$x4/61cGZ0AXi0wX0+gvg17cmbMlLliiSbsrcsJEKlg0K1MuIFVxE/XNulj/zR43n$i/XZ5Eu0EKZYtznlOM9KeEM6bDlr+FkMkq9nOl4TNDQ=',
          # 123
          cvv: '$bt4|javascript_1_3_9$3haiYOneu3FWSGAE0hkbZIHuwxVi0b/IcACsE9n/xE5xI4ZjTP8hFY+gC/9P4OdY1oyYz6KrEn5/3fg1vTjZRtIxECmP6gB6V6FOW8RW737t5HBaHe2NePpT2dhiXLLhkyblBV9xQfOnR+GkWRvbNjsmoBFyYgZSkLVuV+BVVjnpmox/l+6yisrcTKaEGfBKgjw4yoogyMuesCS6DcPsQPjuEi6hjMYoQWp+9fwIG4xCoDBU1ypxLNBRrWtGVYHsQrwAYE/gYIeK+SmE1WSWXBjOziYV/I01nFPWcumrmm9gEryhMG3k6LbBYq2JW1hKXcWJtinfOhjvAh5RlEJi4A==$ZzvdJg5LaPaDvaHTHDQOnkN3iMgAhvINxxCWP6CUGII=$yb3ZE9dN///eWTspPlsf979XEaTyMV+KqYRgnApcn5g=',
          # 12
          expirationMonth: '$bt4|javascript_1_3_9$n2q6jmFvVafmdNfSfSU9MF3yPCqhwBBY82zuqs6XyX6aTfRa0oNfzZqUvT9anec50xxfDV0JaleHKPhMI7GMHGwCRlb+L2453iJLpEwOoDniQZPugup4kwGQ8nC8WWsCUsIM1nerCIhdXqM/z39YokLSTSTxdLr+3PNVsO4IpPimlMykHNNd1RDM4WFBnUD5BF4/wf3DdEsoiRtqqdQ/kodMghnoAXIdSEEAPksFU7D6qwzlIrmsH/5Q+JJthMHj/R9zUKnKgMwVju8eauxfPPSA3LiaJNectc/AiIljKy9KEoX8PHLVaLo3/iJN9Mi8E/qyFHhcXy+37rArQSt3LQ==$1jLFMrOV5mBs/n2EYMO9bHlDqd39z6vpzaAIBmvG7VU=$eWKOliParBgfOevW57CLi1Ygqca3n82MnrlgUlDIBRA=',
          # 2023
          expirationYear: '$bt4|javascript_1_3_9$x+84iiS/jkyEGFzM2rNlMefyeCsOYZAq5ZNR2r4sjEd9UqTlxQCLd+KOx9OetxNm8535vhNWpEX/p1xinRyt4kZ/nPyJZLBKY4jOMQIFijlJnJlf0gdOK47Za3scoU9T6+rzGSRzcyk5Y5Mmy1+P3srqhcAmrtXO66xGZV7qVgm1iL4wROyErTHOuED+Vsf3wsf2m3Bw4iwvUL25Deh76HCkvVXEYuMZXyyjjfjE7MoDlYAlVrTy153oN4Ftl5XGMmYW1fpjVI+qaqynl4YHsAdZS/WKxuyAMHpRFB4iqxKZKnVUYLBtlpwJzs+AgZdhhdcrvxPE7g1jZfDrMC457g==$OlcKDixSrSU2bh0fdPYHvIaFyIZU8YBZVAH1b1kz72A=$oPAHMTI5eBEYMXFlNVmdxTGkUM8ocs38gGroUM5GXSg=',
          cardholderName: 'jamie jones',
          billingAddress: {line1: '123 my street', line2: '', locality: 'mytown', postcode: 'wc1x8aq'}
      }
      headers = {'Content-Type' => 'application/vnd.blinkboxbooks.data.v1+json', 'Authorization' => "Bearer #{access_token}"}
      body = {'type' => 'urn:blinkboxbooks:schema:creditcard'}.merge(params)
      begin
        response = http_client.post(@@credit_card_uri, body: format_body(body), header: headers)
      rescue Errno::EPIPE
        puts "Connection broke!"
      end
      raise 'Adding credit card failed' unless response.status == 201
      params[:cardholderName]
    end
=end

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
      begin
        response = http_client.post(@credit_card_uri, body: format_body(body), header: headers)
      rescue Errno::EPIPE
        puts "Connection broke!"
      end
      raise 'Adding credit card failed' unless response.status == 201
      params[:cardholderName]
    end

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

