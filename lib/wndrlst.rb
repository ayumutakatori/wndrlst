require "wndrlst/version"
require 'yaml'
require 'json'
require 'open-uri'

module Wndrlst
  class API

    BASE_ENDPOINT = "https://a.wunderlist.com/api/v1"
    attr_reader :params

    def initialize(client_id, access_token)
      @client_id     = client_id
      @access_token  = access_token
      @params = {
        'client_id' => @client_id,
        'access_token' => @access_token
      }
    end

    def user
      get(generate_url('user', params))
    end

    def lists
      get(generate_url('lists', params))
    end

    def list(id)
      get(generate_url('lists', params, id))
    end

    def list_titles
      lists.collect{|list| list["title"]}
    end

    def tasks(list_id, completed=false)
      params = @params
      params['list_id'] = list_id
      params['completed'] = completed

      get(generate_url('tasks', params, params))
    end

    def task_titles(list_id, completed=false)
      tasks(list_id, completed).collecct {|task| task["title"]}
    end

    def tasks_by_list_name(title, completed=false)
      tasks(list_id(title), completed)
    end

    def task_title_by_list_name(title, completed=false)
      tasks_by_list_name(title, completed).collect{|task| task["title"]}
    end

    def task(id)
      get(generate_url('tasks', params, id))
    end

    def subtasks(task_id, completed=false)
      params = @params
      params['task_id'] = task_id
      params['completed'] = completed

      get(generate_url('subtasks', params))
    end

    def subtasks_from_list(list_id, completed=false)
      params = @params
      params['list_id'] = list_id
      params['completed'] = completed

      get(generate_url('subtasks', params))
    end

    private

    def generate_url(resource, params, target_id=nil)
      req_params = params.collect {|p, v| "#{p}=#{v}&"}.join("")
      req_params.slice!(-1)

      if target_id
        "#{BASE_ENDPOINT}/#{resource}/#{target_id}?#{req_params}"
      else
        "#{BASE_ENDPOINT}/#{resource}?#{req_params}"
      end
    end

    def get(url)
      response = open(url)

      unless response.status[0] == '200'
        puts "response is #{response.status[0]}"
      end

      JSON.parse(response.read)
    end

    def list_id(title)
      list_id = ""
      lists.each do |list|
        if list["title"] == title
          list_id = list["id"]
        end
      end
      list_id
    end
  end
end
