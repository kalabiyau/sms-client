#!/usr/bin/ruby
require 'rubygems'
require 'rest-client'

protocol = 'http'
sms_url = 'localhost:9292/enqueue'
username = "scc"
password = "admin"

request = RestClient.post "#{protocol}://#{username}:#{password}@#{sms_url}", { :type => "Error", :text => "An unexpected error occurred" }
