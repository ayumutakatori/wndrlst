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
    @params = {
      'client_id' => @client_id,
      'access_token' => @access_token
    }

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

  def search_user
    params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
    params.slice!(-1)
    url = "#{API_URL}/user"
    response = open("#{url}?#{params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end

  def search_lists
    params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
    params.slice!(-1)
    url = "#{API_URL}/lists"
    response = open("#{url}?#{params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end

  def search_list(id)
    params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
    params.slice!(-1)
    url = "#{API_URL}/lists/#{id}"
    response = open("#{url}?#{params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end

  def search_tasks(list_id, completed=false)
    @params['list_id'] = list_id
    @params['completed'] = completed
    params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
    params.slice!(-1)
    url = "#{API_URL}/tasks"
    response = open("#{url}?#{params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end

  def search_subtasks_from_list(list_id)
    @params['list_id'] = list_id
    params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
    params.slice!(-1)
    url = "#{API_URL}/subtasks"
    response = open("#{url}?#{params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end

  def search_subtasks_from_task(task_id)
    @params['task_id'] = task_id
    params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
    params.slice!(-1)
    url = "#{API_URL}/subtasks"
    response = open("#{url}?#{params}")
    unless response.status == 200
      puts "response is #{response.status}"
    end
    JSON.parse(response.read)
  end
end