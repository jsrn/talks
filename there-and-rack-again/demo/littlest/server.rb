require 'socket'
# Bind our TCP server to a socket
server = TCPServer.new(5678)

# Take the next connection
while session = server.accept
  # Read the request
  request = session.gets

  # Respond
  session.print "HTTP/1.1 200\r\n"
  session.print "Content-Type: text/html\r\n"
  session.print "\r\n"
  session.print "Hello world!"


  session.close
end
