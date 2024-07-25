local http = require "socket.http"
local ltn12 = require "ltn12"
local cjson_safe = require "cjson.safe"
local url = require "socket.url"

local function get_request(req_url, scheme, port)
    local chunks = {}
    local res, status, headers, status_line = http.request {
        url = req_url,
        port = port,
        sink = ltn12.sink.table(chunks)
    }

    if status ~= 200 then
        return nil, 'Failed calling url ' .. req_url .. ' response status ' .. status
    end

    local body, err = cjson_safe.decode(table.concat(chunks))
    if not body then
        return nil, 'Failed to parse json response'
    end

    return body, nil
end

print("aaa")

local req = url.parse("http://localhost:8080/realms/master/.well-known/openid-configuration")
print(req.scheme)
print(req.port)
print(req.host)
print(req.path)

-- Example usage

local result, err = get_request("http://4f34-49-43-251-223.ngrok-free.app/realms/master/.well-known/openid-configuration", "http", 8080)
if result then
    print(require('cjson').encode(result))
else
    print(err)
end
