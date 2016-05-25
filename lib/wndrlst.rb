require 'yaml'
require 'json'

module Wndrlst
  VERSION = '0.0.1'
  CONFIG = if File.exist?('config.yml')
    YAML.load_file('config.yml')
  else
    {
      client_id:     'XXXXXXXXXXXXXXXXX',
      client_secret: 'c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c',
      access_token:  'a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a',
    }
  end
  API_URL = "https://a.wunderlist.com/api/v1"
end