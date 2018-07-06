# import module from wsgifref
from wsgiref.simple_server import make_server
# import our application
from hello import application

# create a server,IP NULL, port 8000
httpd = make_server('', 8000, application)
print "Serving HTTP on port 8000..."

# start listening HTTP request
httpd.serve_forever()
