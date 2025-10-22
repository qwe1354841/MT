--神兽挑战任务
Quest_ShenShou = {}

Quest_ShenShou.Config = {
	['Exp'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*level*150",
	['PetExp'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*level*150",
	['BindGold'] = "return (1+(math.fmod(ring_num-1,10)+1)*0.1)*(1+level*0.01)*10000",
}


--接任务回调
function Quest_ShenShou.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_ShenShou.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_ShenShou.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_ShenShou.accomplish(player, quest_id ,ring_num)
	local exp = math.floor(Quest_ShenShou.get_exp(player,ring_num))
	local bindgold = math.floor(Quest_ShenShou.get_bgold(player,ring_num))
	local petexp = math.floor(Quest_ShenShou.get_petexp(player,ring_num))
	if bindgold > 0 then
		if not player:AddBindGold(bindgold, "Quest_ShenShou", "Quest_ShenShou", "nil") then
			sLuaApp:LuaDbg( "Quest_ShenShou.accomplish player:AddBindGold is err")
			return false
		else
			sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
		end
	end
	if not player:AddExp (exp, "Quest_ShenShou", "Quest_ShenShou", "nil") then
		sLuaApp:LuaDbg( "Quest_ShenShou.accomplish player:AddExp is err")
		return false
	end
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(petexp, "Quest_ShenShou", "Quest_ShenShou", "nil") then
			sLuaApp:LuaDbg( "Quest_ShenShou.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end


	if VipIngotTrace then
		VipIngotTrace.GetReward(player, "挑战神兽")
	end
	if Assist then
		Assist.ActivityGetPoint(player, "挑战神兽")
	end
	local active_add = Act_ShenShouTiaoZhan.Active_Add
	local active_max = Act_ShenShouTiaoZhan.Active_Max
	local active = player:GetDayInt("Act_ShenShouTiaoZhan_Active_Num"..Act_ShenShouTiaoZhan.Active_ID)
	if active < active_max then
		local active_sum = active + active_add
		if active_sum > active_max then
			player:SetDayInt("Act_ShenShouTiaoZhan_Active_Num"..Act_ShenShouTiaoZhan.Active_ID, active_max)
			ActivitySystem.AddActiveVal(player, active_max - active)
		else
			player:SetDayInt("Act_ShenShouTiaoZhan_Active_Num"..Act_ShenShouTiaoZhan.Active_ID, active_sum)
			ActivitySystem.AddActiveVal(player, active_add)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
	end
	
	--local reward = Lua_tools.PlayerStartRandom(Quest_ShenShou.Config['Item'], "Quest_ShenShou", 1)
	--if reward[1] ~= "Nil" then
	--	Lua_tools.AddItem(player, reward, "Quest_ShenShou", "Quest_ShenShou", "")
	--else
	--	sLuaApp:LuaDbg("Quest_ShenShou.accomplish give item is fail")
	--end
end
--多次击杀同一个npc回调
function Quest_ShenShou.on_kill_boss(player, quest_id, cnt)
end 

function Quest_ShenShou.ready(player,quest_id , ring_num)
end

function Quest_ShenShou.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_ShenShou.get_reward_bgold(player, quest_id, ring_num)
    return Quest_ShenShou.get_bgold(player,ring_num)
end

function Quest_ShenShou.get_reward_exp(player, quest_id, ring_num)
    return Quest_ShenShou.get_exp(player,ring_num)
end

function Quest_ShenShou.get_reward_pet_exp(player, quest_id, ring_num)
    return Quest_ShenShou.get_petexp(player,ring_num)
end

function Quest_ShenShou.get_bgold(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ShenShou.Config['BindGold']))() or 0	
end

function Quest_ShenShou.get_exp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ShenShou.Config['Exp']))() or 0	
end

function Quest_ShenShou.get_petexp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	return assert(load(GongShi..Quest_ShenShou.Config['PetExp']))() or 0	
end