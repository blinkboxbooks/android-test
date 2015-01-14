module Utilities
  def generate_random_email_address
    first_part = 'cucumber_test'
    last_part = '@mobcastdev.com'
    middle_part = rand(1..9999).to_s + (0...10).map { ('a'..'z').to_a[rand(26)] }.join
    first_part+middle_part+last_part
  end

  def generate_random_first_name
    first_part = 'firstname-autotest-'
    last_part=(0...10).map { ('a'..'z').to_a[rand(26)] }.join
    first_part + last_part
  end

  def generate_random_last_name
    first_part = 'lastname-autotest-'
    last_part=(0...10).map { ('a'..'z').to_a[rand(26)] }.join
    first_part + last_part
  end
end

World(Utilities)