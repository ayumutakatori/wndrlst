require 'spec_helper'
require 'yaml'
require 'pry'

describe Wndrlst do
  it 'has a version number' do
    expect(Wndrlst::VERSION).not_to be nil
  end

  describe Wndrlst::API do
    it 'has a base_endpoint' do
      expect(Wndrlst::API::BASE_ENDPOINT).not_to be nil
    end

    before do
      @client_id = '1234'
      @access_token = '567890'
      @wl = Wndrlst::API.new(@client_id, @access_token)
    end

    it 'can initialize' do
      expect(@wl.class).to eq(Wndrlst::API)
    end

    it 'can generate endpoint url' do
      params = @wl.params

      params['list_id'] = 'abc'
      params['completed'] = true

      url = "#{Wndrlst::API::BASE_ENDPOINT}/tasks?client_id=#{@client_id}&access_token=#{@access_token}&list_id=abc&completed=true"
      expect(@wl.send(:generate_url, "tasks", params)).to eq(url)
    end
  end
end
