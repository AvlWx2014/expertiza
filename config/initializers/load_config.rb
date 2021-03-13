GOOGLE_CONFIG = YAML.load_file("#{Rails.root}/config/google_auth.yml")[Rails.env]
WEBSERVICE_CONFIG = YAML.load_file("#{Rails.root}/config/webservices.yml")[Rails.env]
PLAGIARISM_CHECKER_CONFIG = YAML.load_file("#{Rails.root}/config/plagiarism_checker.yml")[Rails.env]

# Just because it took me forever to figure this out, I want to write it
# down for whoever comes next.
# It's good practice to break your YAML config file in to 3 main sections,
# one each for development, test, and production environments. This allows
# different configuration values per environment without having to change code.
# Psych.load_file (or Gem.load_config or YAML.load_file) first parses your config
# file to a hash.
# Rails.env is a string denoting the current environment for the app e.g. development.
# So what's happening here is that we're first parsing the config file and then
# picking out just the chunk pertaining to the current environment.
# Hope this helps!
REDIS_CONFIG = Psych.load_file(Rails.root.join('config', 'redis.yml'))[Rails.env]