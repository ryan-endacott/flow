
require 'yaml'
require 'github_api'

# Set up configuration
config = YAML.load_file('application.yml')

github = Github.new do |config|
  config.endpoint    = 'https://github.company.com/api/v3'
  config.site        = 'https://github.company.com'
  config.oauth_token = 'token'
  config.adapter     = :net_http
  config.ssl         = {:verify => false}
end


