--忏悔任务
Quest_Confession = {}

--计算公式(暂时无用)
Quest_Confession.Config = {
	['Exp'] = "return math.floor((0.02*(8+reincarnation)*level*level*level)*(0.91+0.02*math.floor(10*(ring_num-1)/100))*(0.95+0.01*math.fmod(ring_num-1,10)))",
	['PetExp'] = "return math.floor((0.02*(8+reincarnation)*level*level*level)*(0.91+0.02*math.floor(10*(ring_num-1)/100))*(0.95+0.01*math.fmod(ring_num-1,10)))",
	['BindGold'] = "return math.floor(0.1*(0.02*(8+reincarnation)*level*level*level)*(0.91+0.02*math.floor(10*(ring_num-1)/100))*(0.95+0.01*math.fmod(ring_num-1,10)))",
	['PKValue'] = "return math.floor(0.1*(0.02*(8+reincarnation)*level*level*level)*(0.91+0.02*math.floor(10*(ring_num-1)/100))*(0.95+0.01*math.fmod(ring_num-1,10)))",
}

--接任务回调
function Quest_Confession.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_Confession.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_Confession.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_Confession.accomplish(player, quest_id ,ring_num)
	--local exp = Quest_Confession.get_exp(player,ring_num)
	--local bindgold = Quest_Confession.get_bgold(player,ring_num)
	--local petexp = Quest_Confession.get_petexp(player,ring_num)
	local PKValue = Quest_Confession.get_PKvalue(player,ring_num)
	--
	--if not player:AddBindGold(bindgold, "Quest_Confession", "Quest_Confession", "nil") then
	--	sLuaApp:LuaDbg("Quest_Confession.accomplish player:AddBindGold is err")
	--	return false
	--else
	--	sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	--end
	--if not player:AddExp(exp, "Quest_Confession", "Quest_Confession", "nil") then
	--	sLuaApp:LuaDbg( "Quest_Confession.accomplish player:AddExp is err")
	--	return false
	--end
	--local pet = sPetSystem:GetLineupPet(player)
	--if pet then
	--	if not pet:AddExp(exp, "Quest_Confession", "Quest_Confession", "nil") then
	--		sLuaApp:LuaDbg( "Quest_Confession.accomplish pet:AddExp is err")
	--		return false
	--	end
	--end
	if not player:AddPk(PKValue, "Quest_Confession", "Quest_Confession", "nil") then
		sLuaApp:LuaDbg( "Quest_Confession.accomplish player:AddPk is err")
		return false
	end
end
--多次击杀同一个npc回调
function Quest_Confession.on_kill_boss(player, quest_id, cnt)
end 

function Quest_Confession.ready(player,quest_id , ring_num)
end

function Quest_Confession.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_Confession.get_reward_bgold(player, quest_id, ring_num)
    --return Quest_Confession.get_bgold(player,ring_num)
	return 0
end

function Quest_Confession.get_reward_exp(player, quest_id, ring_num)
    --return Quest_Confession.get_exp(player,ring_num)
	return 0
end

function Quest_Confession.get_reward_pet_exp(player, quest_id, ring_num)
    --return Quest_Confession.get_petexp(player,ring_num)
	return 0
end

function Quest_Confession.get_bgold(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		]]
	return assert(load(GongShi..Quest_Confession.Config['BindGold']))() or 0	
end

function Quest_Confession.get_exp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		]]
	return assert(load(GongShi..Quest_Confession.Config['Exp']))() or 0	
end

function Quest_Confession.get_petexp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		]]
	return assert(load(GongShi..Quest_Confession.Config['PetExp']))() or 0	
end

--PK值计算(暂无公式, 取常数)
function Quest_Confession.get_PKvalue(player,ring_num)
	return 1 
end