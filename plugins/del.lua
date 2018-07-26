local function delmsg (K,del)
    msgs = K.msgs 
    for k,v in pairs(del.messages_) do
        msgs = msgs - 1
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            tdcli.deleteMessages(del.messages_[0].chat_id_,{[0] = del.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tdcli.getChatHistory(del.messages_[0].chat_id_, del.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end
local function run(msg, matches)
    if matches[1]:lower() == 'dell' or matches[1]:lower() == 'پاکسازی' and is_owner(msg) or is_mod(msg) and matches[2] then
        if tostring(msg.to.id):match("^-100") then 
            if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
                return  '🚫_The number of messages can be cleared_ *1* _>_ *1000* 🚫'
            else
				tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
				return "`"..matches[2].." `_Recent message has been deleted succeed_ 🚮"
            end
        else
            return '⚠️ _Just for SuperGroup_ ⚠️'
        end
    end
	if matches[1]:lower() == 'dell' or matches[1]:lower() == 'پاک' and is_owner(msg) or is_mod(msg) and not matches[2] then
		if msg.reply_id then
			--local text = msg.forward_info_.sender_user_id_
			del_msg(chat, tonumber(msg.reply_id))
			del_msg(chat, tonumber(msg.id))
		end
	end
end
return {
    patterns = {
        '^[!#/]([De]ell) (%d*)$',
		'^(پاکسازی) (%d*)$',
		'^(پاک)$'
    },
    run = run
}