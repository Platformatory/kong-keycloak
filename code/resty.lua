local http = require "resty.http"
local cjson_safe = require "cjson.safe"

local full_url = "http://localhost:8080/realms/master/.well-known/openid-configuration"
local httpc = http.new()
local res, err

res, err = httpc:request_uri(full_url, {
    method = "GET"
})

if not res then
    print('Failed calling url ' .. full_url .. ': ' .. err)
end

if res.status ~= 200 then
    print('Failed calling url ' .. full_url .. ' response status ' .. res.status)
end

local body, err = cjson_safe.decode(res.body)
if not body then
    print('Failed to parse json response')
end

print(res.body)
