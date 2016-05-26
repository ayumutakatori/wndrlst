require "wndrlst/version"
require 'yaml'
require 'json'
require 'open-uri'

module Wndrlst
  class Wndrlst

    ###########################################
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

    def user
    end

    def lists(name)
    end

    def tasks(list_name, completed=false)
      list_id = ""
      search_lists.each do |list|
        if list['title'] == list_name
          list_id = list['id']
        end
      end

      if list_id
        tasks = search_tasks(list_id, completed).collect do |tasks|
          tasks['title']
        end
      else
        puts 'That name is not found.'
      end
    end

    def report(list_name, date=Date.today)
      puts "\n# 今日やったこと\n\n"
      tasks(list_name, true).each do |title|
        puts "- #{title}"
      end

      puts "\n# 残タスク\n\n"
      tasks(list_name, false).each do |title|
        puts "- #{title}"
      end
      true
    end

    def search(type)
    end

    def search_user
      params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
      params.slice!(-1)
      url = "#{API_URL}/user"
      response = open("#{url}?#{params}")
      unless response.status[0] == '200'
        puts "response is #{response.status[0]}"
      end
      JSON.parse(response.read)
    end

    def search_lists
      params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
      params.slice!(-1)
      url = "#{API_URL}/lists"
      response = open("#{url}?#{params}")
      unless response.status[0] == '200'
        puts "response is #{response.status[0]}"
      end
      JSON.parse(response.read)
    end

    def search_list(id)
      params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
      params.slice!(-1)
      url = "#{API_URL}/lists/#{id}"
      response = open("#{url}?#{params}")
      unless response.status[0] == '200'
        puts "response is #{response.status[0]}"
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
      unless response.status[0] == '200'
        puts "response is #{response.status[0]}"
      end
      JSON.parse(response.read)
    end

    def search_subtasks_from_list(list_id)
      @params['list_id'] = list_id
      params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
      params.slice!(-1)
      url = "#{API_URL}/subtasks"
      response = open("#{url}?#{params}")
      unless response.status[0] == '200'
        puts "response is #{response.status[0]}"
      end
      JSON.parse(response.read)
    end

    def search_subtasks_from_task(task_id)
      @params['task_id'] = task_id
      params = @params.collect {|p, v| "#{p}=#{v}&"}.join("")
      params.slice!(-1)
      url = "#{API_URL}/subtasks"
      response = open("#{url}?#{params}")
      unless response.status[0] == '200'
        puts "response is #{response.status[0]}"
      end
      JSON.parse(response.read)
    end
  end

end
