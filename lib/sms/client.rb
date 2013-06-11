require 'rest-client'
require 'psych'

require 'uri'
require 'socket'


module SMS
  class Client

    @@attributes = [:server, :username, :password]
    attr_accessor *@@attributes

    def initialize(args = {})
      if args.empty?
        config_file = File.expand_path("~/.sms/config.yml")

        if File.exist? config_file
          config = Psych.load_file(config_file)

          @server = config["sms-server"]["url"]
          @username = config["sms-server"]["username"]
          @password = config["sms-server"]["password"]
        else
          raise ArgumentError, "Missing required arguments"
        end
      else
        args.keys.each do |k|
          key = k.to_sym
          instance_variable_set("@#{key}", args[key]) if @@attributes.include?(key)
        end
      end
    end

    def notify(message, sender=nil, type=nil)
      begin
        sms_server_url = self.construct_url

        notification = Hash.new
        notification[:sender] = sender || Socket.gethostname
        notification[:text] = message
        notification[:type] = type || 'error'

        request = RestClient.post(sms_server_url, notification)
        request.code == 200
      rescue Errno::ECONNREFUSED => e
        puts "\033[33mERROR: SMS server is not running, please start sms-server\033[0m"
        puts "#{sms_server_url} #{e.message}"
        exit 1
      rescue URI::InvalidURIError, RestClient::ResourceNotFound => e
        puts "\033[33mERROR: The configuration is incorrect, please review the configuration file for possible errors\033[0m"
        puts "\033[33mSMS Server: #{e.message}\033[0m"
        exit 1
      end
    end

    def construct_url
      uri = URI(self.server)
      "#{uri.scheme}://#{self.username}:#{self.password}@#{uri.host}:#{uri.port}#{uri.path}"
    end

  end
end
