local http = require "http"
local shortport = require "shortport"

description = [[
Checks for <code>/.well-known/security.txt</code> on a web server.
]]

author = "raresteak"
categories = {"default", "discovery", "safe"}
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"

portrule = shortport.http

action = function(host, port)
  local answer = http.get(host, port, "/.well-known/security.txt" )
  if answer.status == 200 then
    if answer.body == "" then
      return "EMPTY"
    end
    return answer.body
  else
    return "NOT FOUND"
  end

end
