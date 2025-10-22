--修业任务
Quest_PaoHuan = {}
--接任务回调
function Quest_PaoHuan.accept(player, quest_id ,ring_num)

end
--放弃任务回调
function Quest_PaoHuan.abandon(player,quest_id , ring_num)

end
--任务失败回调
function Quest_PaoHuan.failed(player,quest_id , ring_num)

end
--完成任务回调
function Quest_PaoHuan.accomplish(player, quest_id ,ring_num)
	sLuaApp:LuaDbg("Quest_PaoHuan.accomplish: ring_num = "..ring_num)
	local exp = math.floor(Quest_PaoHuan.getexp(player,ring_num))
    local bindgold = math.floor(Quest_PaoHuan.getbindgold(player,ring_num))
    local petexp = math.floor(Quest_PaoHuan.getexp(player,ring_num))
	if bindgold > 0 then
		player:AddBindGold(bindgold, "任务系统", "环任务奖励", "nil")
		sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	end
	player:AddExp (exp, "任务系统", "环任务奖励", "nil")
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(petexp, "Quest_PaoHuan", "Quest_PaoHuan", "nil") then
			sLuaApp:LuaDbg( "Quest_PaoHuan.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.UpdateQuestProgress(player, 101)
	end
end
--多次击杀同一个npc回调
function Quest_PaoHuan.on_kill_boss(player, quest_id, cnt)

end 

function Quest_PaoHuan.ready(player,quest_id , ring_num)

end

function Quest_PaoHuan.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_PaoHuan.get_reward_bgold(player, quest_id, ring_num)
    return Quest_PaoHuan.getbindgold(player,ring_num)
end

function Quest_PaoHuan.get_reward_exp(player, quest_id, ring_num)
    return Quest_PaoHuan.getexp(player,ring_num)
end

function Quest_PaoHuan.get_reward_pet_exp(player, quest_id, ring_num)
    return Quest_PaoHuan.getexp(player,ring_num)
end

function Quest_PaoHuan.getbindgold(player,ring_num)
	
	return 0
end

function Quest_PaoHuan.getexp(player,ring_num)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	return (15+ring_num*0.5+(math.fmod(ring_num,10)+1)*6)*level + 5000
end