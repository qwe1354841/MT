--师门任务
Quest_ShiMen = {}

Quest_ShiMen.Config = {
	['Exp'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*level*100+500",
	['PetExp'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*level*50",
	['BindGold'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*(1+level*0.01)*5000+5000+(1+(math.fmod(ring_num-1,10)+1)*0.1)*(1+level*0.01)*2000+5000",
}


--接任务回调
function Quest_ShiMen.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_ShiMen.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_ShiMen.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_ShiMen.accomplish(player, quest_id ,ring_num)
	local exp = math.floor(Quest_ShiMen.get_exp(player,ring_num))
	local bindgold = math.floor(Quest_ShiMen.get_bgold(player,ring_num))
	local petexp = math.floor(Quest_ShiMen.get_petexp(player,ring_num))
	if bindgold > 0 then
		if not player:AddBindGold(bindgold, "Quest_ShiMen", "Quest_ShiMen", "nil") then
			sLuaApp:LuaDbg( "Quest_ShiMen.accomplish player:AddBindGold is err")
			return false
		else
			sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
		end
	end
	
	if not player:AddExp (exp, "Quest_ShiMen", "Quest_ShiMen", "nil") then
		sLuaApp:LuaDbg( "Quest_ShiMen.accomplish player:AddExp is err")
		--return false
	end
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(petexp, "Quest_ShiMen", "Quest_ShiMen", "nil") then
			sLuaApp:LuaDbg( "Quest_ShiMen.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end
	--player:SetDayInt("Quest_ShiMen_DayCount",player:GetDayInt("Quest_ShiMen_DayCount")+1)
	
	if VipIngotTrace then
		VipIngotTrace.GetReward(player, "师门任务")
	end
	if SevenDayCallBack then
		SevenDayCallBack.Quest(player)
	end
	local active_add = Act_Shimen1.Active_Add
	local active_max = Act_Shimen1.Active_Max
	local active = player:GetDayInt("Act_Shimen1_Active_Num"..Act_Shimen1.Active_ID)
	if active < active_max then
		local active_sum = active + active_add
		if active_sum > active_max then
			player:SetDayInt("Act_Shimen1_Active_Num"..Act_Shimen1.Active_ID, active_max)
			ActivitySystem.AddActiveVal(player, active_max - active)
		else
			player:SetDayInt("Act_Shimen1_Active_Num"..Act_Shimen1.Active_ID, active_sum)
			ActivitySystem.AddActiveVal(player, active_add)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
	end
	
	--if player:GetDayInt("Quest_ShiMen_DayCount") == 20 or player:GetDayInt("Quest_ShiMen_DayCount") == 10 then 
	--	local reward = Lua_tools.PlayerStartRandom(Quest_ShiMen.Config['Item'], "Gift_Quest_ShiMen", 1)
	--	if reward[1] ~= "Nil" then
	--		Lua_tools.AddItem(player, reward, "Quest_ShiMen", "Quest_ShiMen", "")
	--	else
	--		sLuaApp:LuaDbg("Quest_ShiMen.accomplish give item is fail")
	--	end
	--end
	if Achievement then
		Achievement.Mind_line_complete(player,quest_id,ring_num)
	end
end
--多次击杀同一个npc回调
function Quest_ShiMen.on_kill_boss(player, quest_id, cnt)
end 

function Quest_ShiMen.ready(player,quest_id , ring_num)
end

function Quest_ShiMen.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_ShiMen.get_reward_bgold(player, quest_id, ring_num)
    return Quest_ShiMen.get_bgold(player,ring_num)
end

function Quest_ShiMen.get_reward_exp(player, quest_id, ring_num)
    return Quest_ShiMen.get_exp(player,ring_num)
end

function Quest_ShiMen.get_reward_pet_exp(player, quest_id, ring_num)
    return Quest_ShiMen.get_petexp(player,ring_num)
end

function Quest_ShiMen.get_bgold(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ShiMen.Config['BindGold']))() or 0	
end

function Quest_ShiMen.get_exp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ShiMen.Config['Exp']))() or 0	
end

function Quest_ShiMen.get_petexp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ShiMen.Config['PetExp']))() or 0	
end