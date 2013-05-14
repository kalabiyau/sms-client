module SMS
  class Client
    def self.notify(sender, message, type=nil)
      begin
        notification = { :sender => sender, :text => message }
        notification[:type] = type if type

        sms_server_url = self.construct_url
        request = RestClient.post sms_server_url, notification
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

    def self.read_config

      config_file = File.expand_path("~/.sms/config.yml")

      if File.exist? config_file
        config = Psych.load_file(config_file)
        @protocol = config["sms-server"]["protocol"]
        @host     = config["sms-server"]["host"]
        @port     = config["sms-server"]["port"]
        @path     = config["sms-server"]["path"]
        @username = config["sms-server"]["username"]
        @password = config["sms-server"]["password"]

        return true
      else
        raise "\033[33mERROR: Config file not found!\033[0m" and return false
      end
    end

    def self.construct_url
      self.read_config
      "#{@protocol}://#{@username}:#{@password}@#{@host}:#{@port}#{@path}"
    end
  end
end
