# Assignment2 Question2: HTTP Telnet
# Author: Pei-Lun Hsu

# (a) Telnet into a Web server and send a valid HTTP/ 1.1 request message!4 Include in the request
# message the If-modified-since: header line to force a response message with the 304 Not
# Modified status code. Include a full log of the telnet session in your solution.
telnet example.com 80

# log of telnet session:
Trying 93.184.216.34...
Connected to example.com.
Escape character is '^]'.
GET / HTTP/1.1
Host: example.com
If-Modified-Since: Thu, 17 Oct 2019 07:18:26 GMT
 
HTTP/1.1 304 Not Modified
Age: 506506
Cache-Control: max-age=604800
Date: Mon, 23 Nov 2020 11:27:52 GMT
ETag: "3147526947+ident"
Expires: Mon, 30 Nov 2020 11:27:52 GMT
Last-Modified: Thu, 17 Oct 2019 07:18:26 GMT
Server: ECS (nyb/1D0C)
Vary: Accept-Encoding
X-Cache: HIT
X-Cache: MISS from server.frederix-hotspot.de
X-Cache-Lookup: MISS from server.frederix-hotspot.de:8080
Connection: keep-alive

Connection closed by foreign host.

# (b) Telnet into the same or a different Web server and send a valid HTTP / 1.1 request message!
# Construct your request in a way to force a response message with the 404 Not Found status
# code. Include a log of the telnet session in your solution. Do not include the body
# of the response!
telnet example.com 80

# log of telnet session:
Trying 93.184.216.34...
Connected to example.com.
Escape character is '^]'.
GET /file-not-exist.html HTTP/1.1
Host: example.com

HTTP/1.1 404 Not Found
Cache-Control: max-age=604800
Content-Type: text/html; charset=UTF-8
Date: Mon, 23 Nov 2020 11:59:45 GMT
Expires: Mon, 30 Nov 2020 11:59:45 GMT
Server: EOS (vny/0453)
Vary: Accept-Encoding
Content-Length: 1256
X-Cache: MISS from server.frederix-hotspot.de
X-Cache-Lookup: MISS from server.frederix-hotspot.de:8080
Connection: keep-alive

# (c) Assume that a Web server at http://example.org hosts a file called index.html, which is
# a Web page with two pictures: http://images.example.org/logo.png and http://images.
# example.org/hello.jpg. The pictures are hosted on another server than the index page. One
# day, the admin accidentally deletes hello.jpg.
# Now, a Web client loads this page, using persistent HTTP/1.1. What HTTP messages does
# the client send and receive? Provide at least the methods, necessary headers, and status
# codes.

