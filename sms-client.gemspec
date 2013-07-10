Gem::Specification.new do |s|
  s.name        = 'sms-client'
  s.version     = '1.0.6'
  s.date        = Time.now.strftime('%F')
  s.summary     = "SMS Client"
  s.description = "This gem provides a very simple command line tool to send notifications to the SCC Messaging Service"
  s.authors     = ["Vladislav Lewin"]
  s.email       = 'vlewin[at]suse.de'
  s.files       = Dir.glob("lib/**/*")
  s.executables << 'sms-client'
  s.homepage    = 'https://github.com/vlewin/sms-client'

  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'choice'
end
