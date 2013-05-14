Gem::Specification.new do |s|
  s.name        = 'sms-client'
  s.version     = '1.0.2'
  s.date        = Time.now.strftime('%F')
  s.summary     = "SMS Client"
  s.description = "Client sends notifications to SCC Messaging Server"
  s.authors     = ["Vladislav Lewin"]
  s.email       = 'vlewin@suse.de'
  s.files       = Dir.glob("lib/*")
  s.executables << 'sms-client'
  s.homepage    = 'https://github.com/vlewin/sms-client'

  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'choice'
  s.add_runtime_dependency 'psych'
end
