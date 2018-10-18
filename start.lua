sudo_Titanic = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local Titanic_dev = io.open("Titanic_online.lua")
if Titanic_dev then
Titanic_on = {string.match(Titanic_dev:read('*all'), "^(.*)/(%d+)")}
local Titanic_file = io.open("sudo.lua", 'w')
Titanic_file:write("token = '" ..Titanic_on[1].."'\n\nsudo_add = "..Titanic_on[2].."" )
Titanic_file:close()
https.request("https://api.telegram.org/bot"..Titanic_on[1].."/sendMessage?chat_id="..Titanic_on[2].."&text=Bot_Titanic_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf Titanic_online.lua')  
os.execute('./tg -s ./Titanic.lua $@ --bot='..Titanic_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ تم\27[m \27[1;34m»»ارسل ايدي المبرمج الاساسي««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ تم\27[m")
local Titanic_file = io.open("sudo.lua", 'w')
Titanic_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
Titanic_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./Titanic.lua $@ --bot='..tokenCk)
else
print("\27[31m»»التوكن غير صحيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»ارسل توكن البوت««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_Titanic = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./Titanic.lua $@ --bot='..token)
else
print("\27[31mالتوكن غير صيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end
