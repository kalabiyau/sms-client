sms-client
==========

This gem provides a very simple command line tool to send notifications to the [SCC Messaging Service](https://github.com/vlewin/sms-server) using the SMS Protocol.
Be sure to have a config.yml with proper sms-server settings inside a ~/.sms directory.

Rubygem usage:  
`sms-client -m "message" -s "host-/sender name" -t "info" | "error"`

Ruby usage:
`client = SMS::Client.new(:server => 'http://localhost:9292/enqueue', :username => 'user', :password => 'pass')`
`client.notify('message', 'sender', 'type')`
