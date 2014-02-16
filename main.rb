
require 'yaml'
require 'hue'
require 'github_api'
require 'active_support/all'

MAX_HUE = 65535
MAX_BRIGHT = 255
MAX_SAT = 255

# Set up configuration
config = YAML.load_file('application.yml')

github = Github.new login: config['GITHUB_USERNAME'], password: config['GITHUB_PASSWORD']

recent_repos = github.repos.all.sort_by {|r| Date.parse(r.updated_at) }

recent_repos.reverse!

twentyfour_hours_ago = Time.new.utc.advance(hours: -24).iso8601

flow_points = 0

recent_repos[0..6].each do |repo|
  commits = github.repos.commits.all(repo.owner.login, repo.name, since: twentyfour_hours_ago)
  flow_points += commits.count
end

puts flow_points

hue = Hue::Client.new

hue.lights.each do |light|
  light.on = true
  light.hue = flow_points * (MAX_HUE / 10) #Random.new.rand(0..MAX_HUE)
end


