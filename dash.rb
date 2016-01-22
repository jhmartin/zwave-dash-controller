#!/home/pi/.rbenv/shims/ruby
require 'socket'
require 'net/http'
require 'pp'

#Close the port after connect as the dash will retry the connection a few times.
loop do
  server = TCPServer.new 8081
  client = server.accept # Wait for a client to connect
  system('/home/pi/zwave-dash-controller/leaving.sh')
  client.close
  server.close
  sleep 10
end
