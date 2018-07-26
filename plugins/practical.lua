--Begin practical.lua By @SoLiD
function BeyondTeam(msg, Beyond)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local Chash = "cmd_lang:"..msg.to.id
local Clang = redis:get(Chash)
	if ((Beyond[1]:lower() == 'clean' and not Clang) or (Beyond[1]:lower() == 'پاک کردن' and Clang)) and is_owner(msg) then 
if ((Beyond[2]:lower() == 'blacklist' and not Clang) or (Beyond[2]:lower() == 'لیست سیاه' and Clang)) and msg.to.type == "channel" then
local function GetRestricted(TM, BD)
if BD.members then
for k,v in pairs (BD.members) do
   tdbot.changeChatMemberStatus(msg.to.id, v.user_id, 'Restricted', {1,0,1,1,1,1}, dl_cb, nil)
      end
   end
end
local function GetBlackList(TM, BD)
        if BD.members then
  for k,v in pairs (BD.members) do
channel_unblock(msg.to.id, v.user_id)
   end
   end
end
for i = 1, 2 do
tdbot.getChannelMembers(msg.to.id, 0, 100000, 'Restricted', GetRestricted, {msg=msg})
end
for i = 1, 2 do
tdbot.getChannelMembers(msg.to.id, 0, 100000, 'Banned', GetBlackList, {msg=msg})
end
   if not lang then
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "*Black* _List Has Been_ *Cleaned*", 0, "md")
  else
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "_لیست سیاه گروه پاک سازی شد_", 0, "md")
      end
      end
if ((Beyond[2]:lower() == 'bots' and not Clang) or (Beyond[2]:lower() == 'ربات ها' and Clang)) and msg.to.type == "channel" then
local function GetBots(TM, BD)
        if BD.members then
  for k,v in pairs (BD.members) do
	if not is_mod1(msg.to.id, v.user_id) then
		kick_user(v.user_id, msg.to.id)
		 end
   end
   end
end
for i = 1, 5 do
tdbot.getChannelMembers(msg.to.id, 0, 100000, 'Bots', GetBots, {msg=msg})
end
   if not lang then
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "*All Bots* _has been_ *removed* _from Group_", 0, "md")
  else
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "_تمام ربات ها از گروه حذف شدند_", 0, "md")
      end
      end
if ((Beyond[2]:lower() == 'deleted' and not Clang) or (Beyond[2]:lower() == 'اکانت های دلیت شده' and Clang)) and msg.to.type == "channel" then
local function GetDeleted(TM, BD)
        if BD.members then
  for k,v in pairs (BD.members) do
local function GetUser(TM, BD)
	if BD.type and BD.type._ == "userTypeDeleted" then
		kick_user(BD.id, msg.to.id)
		 end
   end
tdbot.getUser(v.user_id, GetUser, {msg=TM.msg})
      end
   end
end
for i = 1, 2 do
tdbot.getChannelMembers(msg.to.id, 0, 100000, 'Recent', GetDeleted, {msg=msg})
end
for i = 1, 1 do
tdbot.getChannelMembers(msg.to.id, 0, 100000, 'Search', GetDeleted, {msg=msg})
end
   if not lang then
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "*All Delete Account* _has been_ *removed* _from Group_", 0, "md")
  else
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "_تمام اکانت های دلیت ‌شده از گروه حذف شدند_", 0, "md")
   end
      end
 if ((Beyond[2]:lower() == 'members' and not Clang) or (Beyond[2]:lower() == 'کاربر ها' and Clang)) and msg.to.type == "channel" and is_admin(msg) then
local function GetMembers(TM, BD)  
		if BD.members then
	for k, v in pairs(BD.members) do 
		if not is_mod1(msg.to.id, v.user_id) and tonumber(v.user_id) ~= tonumber(our_id)  then
	     kick_user(v.user_id, msg.to.id) 
		end
	end
	 end
end
for i = 1, 5 do
tdbot.getChannelMembers(msg.to.id, 0, 100000, 'Recent', GetMembers, {msg=msg})
end
for i = 1, 5 do
tdbot.getChannelMembers(msg.to.id, 0, 100000, 'Search', GetMembers, {msg=msg})
end
   if not lang then
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "*All Members* _has been_ *removed* _from Group_", 0, "md")
  else
		return tdbot.sendMessage(msg.to.id, msg.id, 0, "_تمام کاربر ها از گروه حذف شدند_", 0, "md")
      end
      end
   end
end
return {
patterns={
'^[/!#](clean) (.*)$',
'^(پاک کردن) (.*)$',

},
run = BeyondTeam
}
--practical.lua V1 By @SoLiD
