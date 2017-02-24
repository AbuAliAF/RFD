--[[
#
#
#                 Allen - GPMod
#               Expire Time plugin
#               Editor: @AbuAliAF
#
]]

local function pre_process(msg)
 msg.text = msg.content_.text
	local timetoexpire = 'unknown'
	local expiretime = redis:hget ('expiretime', msg.chat_id_)
	local now = tonumber(os.time())
	if expiretime then    
		timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
		if tonumber("0") > tonumber(timetoexpire) and not is_sudo(msg) then
		if msg.text:match('/') or msg.text:match('!') or msg.text:match('#') then
			return tdcli.sendMessage(msg.chat_id_, 0, 1, '*تاریخ انقضا ربات به اتمام رسیده است*', 1, 'md')
		else
			return
		end
	end
	if tonumber(timetoexpire) == 0 and is_mod (msg) then
		if redis:hget('expires0',msg.chat_id_) then end
		tdcli.sendMessage(msg.chat_id_, 0, 1, 'مهلت مدیریت گروه شما توسط ربات فقط پنج روز مانده است لطفا تمدید کنید\n*channel* @ChRFD\n@AbuAliAF', 1, 'md')
		redis:hset('expires0',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 1 and is_mod (msg) then
		if redis:hget('expires1',msg.chat_id_) then end
		tdcli.sendMessage(msg.chat_id_, 0, 1, 'مهلت مدیریت گروه شما توسط ربات فقط یک روز مانده است لطفا تمدید کنید\n*channel* @ChRFD\n@AbuAliAF', 1, 'md')
		redis:hset('expires1',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 2 and is_mod (msg) then
		if redis:hget('expires2',msg.chat_id_) then end
		tdcli.sendMessage(msg.chat_id_, 0, 1, 'مهلت مدیریت گروه شما توسط ربات فقط دو روز مانده است لطفا تمدید کنید\n*channel* @ChRFD\n@AbuAliAF', 1, 'md')
		redis:hset('expires2',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 3 and is_mod (msg) then
		if redis:hget('expires3',msg.chat_id_) then end
		tdcli.sendMessage(msg.chat_id_, 0, 1, 'مهلت مدیریت گروه شما توسط ربات فقط سه روز مانده است لطفا تمدید کنید\n*channel* @ChRFD\n@AbuAliAF', 1, 'md')
		redis:hset('expires3',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 4 and is_mod (msg) then
		if redis:hget('expires4',msg.chat_id_) then end
		tdcli.sendMessage(msg.chat_id_, 0, 1, 'مهلت مدیریت گروه شما توسط ربات فقط چهار روز مانده است لطفا تمدید کنید\n*channel* @ChRFD\n@AbuAliAF', 1, 'md')
		redis:hset('expires4',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 5 and is_mod (msg) then
		if redis:hget('expires5',msg.chat_id_) then end
		tdcli.sendMessage(msg.chat_id_, 0, 1, 'مهلت مدیریت گروه شما توسط ربات فقط پنج روز مانده است لطفا تمدید کنید\n*channel* @ChRFD\n@AbuAliAF .', 1, 'md')
		redis:hset('expires5',msg.chat_id_,'5')
	end
end
end
function run(msg, matches)
	if matches[1]:lower() == 'setexpire' then
		if not is_sudo(msg) then return end
		local time = os.time()
		local buytime = tonumber(os.time())
		local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
		redis:hset('expiretime',msg.chat_id_,timeexpire)
		return "*Expire Time Set* _"..matches[2].. "_ *Days* "
	end
	if matches[1]:lower() == 'expire' then
		local expiretime = redis:hget ('expiretime', msg.chat_id_)
		if not expiretime then return '*Unlimited*' else
			local now = tonumber(os.time())
			return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) .. " *Days*"
		end
	end

end
return {
  patterns = {
    "^[!/]([Ss]etexpire) (.*)$",
	"^[!/]([Ee]xpire)$",
  },
  run = run,
  pre_process = pre_process
}
