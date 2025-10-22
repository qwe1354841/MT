--门派历练任务
Quest_ZhongZu = {}

Quest_ZhongZu.Config = {
	['Exp'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*level*150",
	['PetExp'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*level*150",
	['BindGold'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*(1+level*0.01)*10000",
}


--接任务回调
function Quest_ZhongZu.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_ZhongZu.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_ZhongZu.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_ZhongZu.accomplish(player, quest_id ,ring_num)
	local exp = math.floor(Quest_ZhongZu.get_exp(player,ring_num))
	local bindgold = math.floor(Quest_ZhongZu.get_bgold(player,ring_num))
	local petexp = math.floor(Quest_ZhongZu.get_petexp(player,ring_num))
	if bindgold > 0 then
		if not player:AddBindGold(bindgold, "Quest_ZhongZu", "Quest_ZhongZu", "nil") then
			sLuaApp:LuaDbg( "Quest_ZhongZu.accomplish player:AddBindGold is err")
			return false
		else
			sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
		end
	end
	if not player:AddExp (exp, "Quest_ZhongZu", "Quest_ZhongZu", "nil") then
		sLuaApp:LuaDbg( "Quest_ZhongZu.accomplish player:AddExp is err")
		return false
	end
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(petexp, "Quest_ZhongZu", "Quest_ZhongZu", "nil") then
			sLuaApp:LuaDbg( "Quest_ZhongZu.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end

	if VipIngotTrace then
		VipIngotTrace.GetReward(player, "门派历练")
	end
	if Assist then
		Assist.ActivityGetPoint(player, "门派历练")
	end
	local active_add = Act_ZhongZuShiLian.Active_Add
	local active_max = Act_ZhongZuShiLian.Active_Max
	local active = player:GetDayInt("Act_ZhongZuShiLian_Active_Num"..Act_ZhongZuShiLian.Active_ID)
	if active < active_max then
		local active_sum = active + active_add
		if active_sum > active_max then
			player:SetDayInt("Act_ZhongZuShiLian_Active_Num"..Act_ZhongZuShiLian.Active_ID, active_max)
			ActivitySystem.AddActiveVal(player, active_max - active)
		else
			player:SetDayInt("Act_ZhongZuShiLian_Active_Num"..Act_ZhongZuShiLian.Active_ID, active_sum)
			ActivitySystem.AddActiveVal(player, active_add)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
	end
	
	--local reward = Lua_tools.PlayerStartRandom(Quest_ZhongZu.Config['Item'], "Quest_ZhongZu", 1)
	--if reward[1] ~= "Nil" then
	--	Lua_tools.AddItem(player, reward, "Quest_ZhongZu", "Quest_ZhongZu", "")
	--else
	--	sLuaApp:LuaDbg("Quest_ZhongZu.accomplish give item is fail")
	--end
end
--多次击杀同一个npc回调
function Quest_ZhongZu.on_kill_boss(player, quest_id, cnt)
end 

function Quest_ZhongZu.ready(player,quest_id , ring_num)
end

function Quest_ZhongZu.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_ZhongZu.get_reward_bgold(player, quest_id, ring_num)
    return Quest_ZhongZu.get_bgold(player,ring_num)
end

function Quest_ZhongZu.get_reward_exp(player, quest_id, ring_num)
    return Quest_ZhongZu.get_exp(player,ring_num)
end

function Quest_ZhongZu.get_reward_pet_exp(player, quest_id, ring_num)
    return Quest_ZhongZu.get_petexp(player,ring_num)
end

function Quest_ZhongZu.get_bgold(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ZhongZu.Config['BindGold']))() or 0	
end

function Quest_ZhongZu.get_exp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ZhongZu.Config['Exp']))() or 0	
end

function Quest_ZhongZu.get_petexp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ZhongZu.Config['PetExp']))() or 0	
end