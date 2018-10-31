tdbot_new = dofile('./tg/tdbot.lua')

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function dl_cb(arg, data)
	dump(arg)
	dump(data)
end

local function ArcaneTeam(msg, matches) 

 if matches[1]:lower() == 'getlink' or matches[1]:lower() == 'ساخت لینک' and is_owner(msg) then
	--tdcli3.getChannelFull(msg.to.id, dl_cb, nil)
	tdcli3.getChannelFull(msg.to.id, dl_cb, nil)
end
end 

return {  
patterns ={  
"^[!/#]([Dd]elmsg)$",
"^ساخت لینک$"
 }, 
 patterns_fa ={ }, 
  run = ArcaneTeam
}