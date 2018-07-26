
tdcli_v3 = dofile('./tg/tdcli_v3.lua')
local function GetDeleted(BD)
       print("People:", dump(BD))
end



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
local function run(msg, matches)

    if matches[1]:lower() == 'علی' then
	-- local id_channel_ali = tdcli.searchPublicChat("golden3_ir",GetDeleted,{username="golden3_ir"})
    local res = tdcli_v3.getChatMember(msg.to.id, msg.from.id, dl_cb, nil)
	 print("People:", dump(res))
		--if not res or (res.result.status == 'left' or res.result.status == 'kicked') then
			--	tdcli.sendMessage(msg.to.id, 0, 1, 'yes\n\n' .. id_channel_ali , 1, "html")
				
				--return
		--end
			
    end
	
	
end
return {
    patterns = { 
		'^(علی)$'
    },
    run = run
}