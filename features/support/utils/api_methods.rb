module APIMethods
  require 'httpclient'
  require 'multi_json'
  require_relative 'utilities'

  class User
    include Utilities

    @@auth_uri = 'https://auth.dev.bbbtest2.com/oauth2/token'
    @@credit_card_uri = 'https://api.dev.bbbtest2.com/service/my/creditcards'

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
        response = http_client.post(@@auth_uri, body: params, header: headers)
      rescue Errno::EPIPE
        puts "Connection broke!"
      end
      raise 'Test Error: Failed to register new user' unless response.status == 200
      user_props = MultiJson.load(response.body)
      @access_token = user_props['access_token']
      return @email_address, @password, @device_name
    end

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

    def buy_a_book

    end

    def add_a_device

    end

    def http_client
      @http = HTTPClient.new
      @http.ssl_config.options |= OpenSSL::SSL::OP_NO_SSLv3
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
    @api_helper||=APIMethods::User.new
  end
end

World(APIMethods)

