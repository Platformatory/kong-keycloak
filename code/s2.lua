local http = require "socket.http"
local url = require "socket.url"

local well_known_endpoint = "http://4f34-49-43-251-223.ngrok-free.app/realms/master/.well-known/openid-configuration"
-- local well_known_endpoint = "http://localhost:8080/realms/master/.well-known/openid-configuration"

local req = url.parse(well_known_endpoint)

print(req.scheme)
print(req.port)

local res
local status
local err
local chunks = {}
res, status = http.request{
    url = well_known_endpoint,
    port = port,
    sink = ltn12.sink.table(chunks)
}

print(status)
print(table.concat(chunks))
