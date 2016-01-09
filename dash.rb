#!/home/pi/.rbenv/shims/ruby
require 'socket'
require 'net/http'
require 'pp'

server = TCPServer.new 8081

loop do
  client = server.accept # Wait for a client to connect
  system('/home/pi/leaving.sh')
  client.close
end
