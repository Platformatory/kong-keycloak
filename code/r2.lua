local http = require "resty.http"
local cjson_safe = require "cjson.safe"

local httpc = http.new()

local ok, err, ssl_session = httpc:connect({
    scheme = "http",
    host = "localhost",
    port = 8080,
})

local res, err = httpc:request({
    path = "/realms/master/.well-known/openid-configuration",
})

if not res then
    print('Failed calling url ' .. full_url .. ': ' .. err)
end

if res.status ~= 200 then
    print('Failed calling url ' .. full_url .. ' response status ' .. res.status)
end

print(res.body)
