local function getChatId(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
    local channel_id = chat_id:gsub('-100', '')
    chat = {ID = channel_id, type = 'channel'}
  else
    local group_id = chat_id:gsub('-', '')
    chat = {ID = group_id, type = 'group'}
  end
  return chat
end
-----------------------------------------
local function delmsg (GetAndroid,Tarfand)
    msgs = GetAndroid.msgs 
    for k,v in pairs(Tarfand.messages_) do
        msgs = msgs - 1
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            tdcli.deleteMessages(Tarfand.messages_[0].chat_id_,{[0] = Tarfand.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tdcli.getChatHistory(Tarfand.messages_[0].chat_id_, Tarfand.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end
-----------------------------------------

local function info_by_reply(arg, data)
    if tonumber(data.sender_user_id_) then
local function info_cb(arg, data)
---tdcli.sendMessage(arg.chat_id, arg.msgid, 0, "ID" .. data.id_ .. "\n\n", 0, "md")
   tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, cmd)
		if not lang then   
			tdcli.sendMessage(arg.chat_id,arg.msgid, 1, '*Done :)*', 1, 'md')
		else
			tdcli.sendMessage(arg.chat_id, arg.msgid, 1, '_انجام شد :)_', 1, 'md')
		end
   
  --text = text..'@ArcaneTeam'
  --tdcli.sendMessage(arg.chat_id, arg.msgid, 0, text, 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, info_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_,msgid=data.id_})
    else
tdcli.sendMessage(data.chat_id_, "", 0, "*User not found*", 0, "md")
   end
end

-----------------------------------------
local function MrTarfand(msg)
if ((matches[1] == 'پاکسازی همه' and not Clang) or (matches[1] == "پاک همه" and Clang)) and is_mod(msg) then
  local function pro(extra,result,success)
             local roo = result.members_        
               for i=0 , #roo do
                  tdcli.deleteMessagesFromUser(msg.chat_id_, roo[i].user_id_)
               end
end
local function cb(arg,data)
for k,v in pairs(data.messages_) do
          tdcli.deletemessages(msg.chat_id_,{[0] = v.id_})
end
end
  tdcli.getChatHistory(msg.chat_id_, msg.id_,0 , 100,cb)
      tdcli.sendMessage(msg.chat_id_, msg.id_, 1,  '*🚮درحال پاک کردن کل پیام های گروه*', 1,'md')      
  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, pro, nil)
end
------------------------------------------
    if ((matches[1]:lower() == "پاکسازی" and not Clang) or (matches[1] == "پاکسازی" and Clang)) and is_mod(msg) then
        if tostring(msg.to.id):match("^-100") then 
            if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
                return  '🚫 *1000*> _تعداد پیام های قابل پاک سازی در هر دفعه_ >*1* 🚫'
            else
			if not lang then  
				tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
				return "`"..matches[2].." `*پیام اخیر پاکسازی شد*"
				else
				tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
				return "`"..matches[2].." `*پیام اخیر پاکسازی شد*"
				end
            end
        else
            return '⚠️ _این قابلیت فقط در سوپرگروه ممکن است_ ⚠️'
			
        end
    end
------------------------------------------
if ((matches[1]:lower() == "حذف" and not Clang) or (matches[1] == "حذف" and Clang))  and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then
        tdcli.deleteMessages(msg.to.id,{[0] = tonumber(msg.reply_id),msg.id})
end
------------------------------------------
if (matches[1]:lower() == "پاکسازی پیام های من" and not Clang) or (matches[1] == "پاکسازی پیام های من" and Clang) then  
tdcli.deleteMessagesFromUser(msg.to.id, msg.sender_user_id_, dl_cb, cmd)
     if not lang then   
           tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '*Done :)*', 1, 'md')
		   else
		   tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '_انجام شد :)_', 1, 'md')
	 end
end
------------------------------------------
--[[
if (matches[1]:lower() == "پاکسازی پیام" and not Clang) or (matches[1] == "پاکسازی پیام" and Clang)  and not matches[2] then 
	if msg.reply_id then 
		tdcli.deleteMessagesFromUser(msg.to.id, msg.reply_id.from, dl_cb, cmd)
		if not lang then   
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '*Done :)*' .. msg.from.id .. ' ** ' .. msg.from.reply_id, 1, 'md')
		else
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '_انجام شد :)_', 1, 'md')
		end
	end
end--]]
if (matches[1]:lower() == "پاکسازی پیام" and not Clang) or (matches[1] == "پاکسازی پیام" and Clang)  and not matches[2] then 
	if msg.reply_id then 
		tdcli_function ({
			ID = "GetMessage",
			chat_id_ = msg.chat_id_,
			message_id_ = msg.reply_to_message_id_
		}, info_by_reply, {chat_id=msg.chat_id_})
	end
 end
  
------------------------------------------
end

return {  
patterns ={  
"^(پاکسازی) (%d*)$",
"^(پاکسازی همه)$",
"^(پاکسازی پیام های من)$",
"^(حذف)$",
"^(پاکسازی) (%d*)$",
"^(پاک همه)$",
"^(پاکسازی پیام های من)$",
"^(حذف)$",
"^(پاکسازی پیام)$"
 }, 
  run = MrTarfand
}