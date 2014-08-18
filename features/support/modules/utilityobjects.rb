require 'yaml'
module UtilityObjects
  def conf_data
    @conf_data ||= YAML.load_file("config/project_settings.yml")
  end
  def test_conf_data
    @test_conf_data ||= YAML.load_file("config/test_settings.yml")
  end
  def test_data
    @test_data ||= YAML.load_file("config/test_data.yml")
  end
end
