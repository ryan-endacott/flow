
github = Github.new do |config|
  config.endpoint    = 'https://github.company.com/api/v3'
  config.site        = 'https://github.company.com'
  config.oauth_token = 'token'
  config.adapter     = :net_http
  config.ssl         = {:verify => false}
end


