--除暴安良任务
Quest_ChuBaoAnLiang = {}

Quest_ChuBaoAnLiang.Config = {
	['Exp'] = "return math.floor(math.min(level*1000+10000,math.floor(level*level*400/9)))",
	['PetExp'] = "return math.floor(math.min(level*1000+10000,math.floor(level*level*400/9)))",
	['BindGold'] = "return math.floor(200*level + 80000)",
}


--接任务回调
function Quest_ChuBaoAnLiang.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_ChuBaoAnLiang.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_ChuBaoAnLiang.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_ChuBaoAnLiang.accomplish(player, quest_id ,ring_num)
	local exp = Quest_ChuBaoAnLiang.get_exp(player,ring_num)
	local bindgold = Quest_ChuBaoAnLiang.get_bgold(player,ring_num)
	local petexp = Quest_ChuBaoAnLiang.get_petexp(player,ring_num)
	
	if not player:AddBindGold(bindgold, "Quest_ChuBaoAnLiang", "Quest_ChuBaoAnLiang", "nil") then
		sLuaApp:LuaDbg( "Quest_ChuBaoAnLiang.accomplish player:AddBindGold is err")
		return false
	else
		sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	end
	if not player:AddExp (exp, "Quest_ChuBaoAnLiang", "Quest_ChuBaoAnLiang", "nil") then
		sLuaApp:LuaDbg( "Quest_ChuBaoAnLiang.accomplish player:AddExp is err")
		return false
	end
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(petexp, "Quest_ChuBaoAnLiang", "Quest_ChuBaoAnLiang", "nil") then
			sLuaApp:LuaDbg( "Quest_ChuBaoAnLiang.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end
	player:SetDayInt("Quest_ChuBaoAnLiang",1)
	local active_add = Act_ChuBao.Active_Add
	local active_max = Act_ChuBao.Active_Max
	local active = player:GetDayInt("Act_ChuBao_Active_Num"..Act_ChuBao.Active_ID)
	if active < active_max then
		local active_sum = active + active_add
		if active_sum > active_max then
			player:SetDayInt("Act_ChuBao_Active_Num"..Act_ChuBao.Active_ID, active_max)
			ActivitySystem.AddActiveVal(player, active_max - active)
		else
			player:SetDayInt("Act_ChuBao_Active_Num"..Act_ChuBao.Active_ID, active_sum)
			ActivitySystem.AddActiveVal(player, active_add)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
	end
	
	player:SetDayInt("Act_ChuBao_Count",1)
end
--多次击杀同一个npc回调
function Quest_ChuBaoAnLiang.on_kill_boss(player, quest_id, cnt)
end 

function Quest_ChuBaoAnLiang.ready(player,quest_id , ring_num)
end

function Quest_ChuBaoAnLiang.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_ChuBaoAnLiang.get_reward_bgold(player, quest_id, ring_num)
    return Quest_ChuBaoAnLiang.get_bgold(player,ring_num)
end

function Quest_ChuBaoAnLiang.get_reward_exp(player, quest_id, ring_num)
    return Quest_ChuBaoAnLiang.get_exp(player,ring_num)
end

function Quest_ChuBaoAnLiang.get_reward_pet_exp(player, quest_id, ring_num)
    return Quest_ChuBaoAnLiang.get_petexp(player,ring_num)
end

function Quest_ChuBaoAnLiang.get_bgold(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ChuBaoAnLiang.Config['BindGold']))() or 0	
end

function Quest_ChuBaoAnLiang.get_exp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ChuBaoAnLiang.Config['Exp']))() or 0	
end

function Quest_ChuBaoAnLiang.get_petexp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ChuBaoAnLiang.Config['PetExp']))() or 0	
end

function Quest_ChuBaoAnLiang.On_Login(player)
	if player:GetAttr(ROLE_ATTR_LEVEL) < 37 then
		return
	end
	if player:GetDayInt("Quest_ChuBaoAnLiang") == 0 then	
		if sQuestSystem:GetQuestState(player,143) ~= 3 and sQuestSystem:GetQuestState(player,143) ~= 4 then
			sQuestSystem:ForceDelete(player,143)
			sQuestSystem:ForceAccept(player,143)
		end
	end
end

function Quest_ChuBaoAnLiang.On_Time()
	for k,v in pairs(sPlayerSystem:GetAllPlayers()) do
		if v:GetAttr(ROLE_ATTR_LEVEL) >= 37 then
			if v:GetDayInt("Quest_ChuBaoAnLiang") == 0 then
				if sQuestSystem:GetQuestState(v,143) ~= 3 and sQuestSystem:GetQuestState(v,143) ~= 4 then
					sQuestSystem:ForceDelete(v,143)
					sQuestSystem:ForceAccept(v,143)
				end
			end
		end
	end	
end
function Quest_ChuBaoAnLiang.On_Level_Up(player,level)
	if level == 37 then
		sQuestSystem:ForceDelete(player,143)
		sQuestSystem:ForceAccept(player,143)
	end
end