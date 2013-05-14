require 'choice'

module SMS
  class Parser
    def self.parse(args)
      Choice.options do
        header 'Application options:'

        separator 'Required:'

        option :sender do
          short '-s'
          long '--sender=SENDER'
          desc 'The notification sender (e.g. hostname)'
        end

        option :message, :required => true do
          short '-m'
          long '--message=MESSAGE'
          desc 'The notification message'
        end

        separator 'Optional:'

        option :type do
          short '-t'
          long '--type=Type'
          desc 'The notification type (e.g. Info, Error, Success, Warning)'
          default 'error'
        end

        separator 'Common:'

        option :help do
          short '-h'
          long '--help'
          desc 'Show this message.'
        end

        option :version do
          short '-v'
          long '--version'
          desc 'Show version.'
          action do
            puts 'Client for SCC Messaging Service version 1.0 [vlewin(at)suse.de]'
            exit
          end
        end
      end

      Choice.choices
    end
  end
end
