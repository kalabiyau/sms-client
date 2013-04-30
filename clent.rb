require 'rest-client'

notify_url = 'localhost:9292/enqueue'
username = "scc"
password = "admin"

request = RestClient.post "http://#{username}:#{password}@#{notify_url}", { :type => "Error", :text => "An unexpected error occurred" }
