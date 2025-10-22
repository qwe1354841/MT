--攻守之道任务
Quest_GongShou = {}

Quest_GongShou.Config = {
	['Exp'] = "return math.floor(50000+1000*level)",
}

--接任务回调
function Quest_GongShou.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_GongShou.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_GongShou.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_GongShou.accomplish(player, quest_id ,ring_num)
	local exp = Quest_GongShou.get_exp(player,ring_num)
	sLuaApp:LuaDbg( "exp = "..exp)
	if not player:AddExp (exp, "Quest_GongShou", "Quest_GongShou", "nil") then
		sLuaApp:LuaDbg( "Quest_GongShou.accomplish player:AddExp is err")
		return false
	end
end
--多次击杀同一个npc回调
function Quest_GongShou.on_kill_boss(player, quest_id, cnt)
end 

function Quest_GongShou.ready(player,quest_id , ring_num)
end

function Quest_GongShou.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_GongShou.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_GongShou.get_reward_exp(player, quest_id, ring_num)
    return Quest_GongShou.get_exp(player,ring_num)
end

function Quest_GongShou.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_GongShou.get_exp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		]]
	return assert(load(GongShi..Quest_GongShou.Config['Exp']))() or 0	
end