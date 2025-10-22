--大话任务引导
Quest_78 = {}

--接任务回调
function Quest_78.accept(player, quest_id ,ring_num)
	if #player:GetGuardContainer():GetGuards() > 0 then
		if sQuestSystem:GetQuestState(player,78) == 3 then
			if not sQuestSystem:ForceReady(player,78) then
				sLuaApp:LuaDbg("ForceReady 78 is err")
			end
		end
	end
end
--放弃任务回调
function Quest_78.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_78.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_78.accomplish(player, quest_id ,ring_num)
end
--多次击杀同一个npc回调
function Quest_78.on_kill_boss(player, quest_id, cnt)
end 

function Quest_78.ready(player,quest_id , ring_num)
end

function Quest_78.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_78.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_78.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_78.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end