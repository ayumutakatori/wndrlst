require 'yaml'
require 'json'
require 'open-uri'

class Wndrlst

  ###########################################
  VERSION = '0.0.1'
  API_URL = "https://a.wunderlist.com/api/v1"
  CONFIG = if File.exist?('config.yml')
    YAML.load_file('config.yml')
  else
    {
      client_id:     'XXXXXXXXXXXXXXXXX',
      client_secret: 'c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c12c',
      access_token:  'a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a89a',
    }
  end
  ###########################################

  def initialize(client_id, client_secret, access_token)
    @client_id     = client_id
    @client_secret = client_secret
    @access_token  = access_token
    @params = "?client_id=#{@client_id}&access_token=#{@access_token}"
  end

  def name

  end

  def lists(name)
  end

  def tasks(status=:all)
    case status
    when :all?
    when :finished
    when :progress
    else
      puts 'argument status is invalid.'
    end
  end

  def search(type)
  end

  def search_name
    url = "#{API_URL}/name"
    response = open("#{url}?#{@params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end

  def search_lists
    url = "#{API_URL}/lists"
    response = open("#{url}?#{@params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end

  def search_list(id)
    url = "#{API_URL}/lists/#{id}"
    response = open("#{url}?#{@params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end
end