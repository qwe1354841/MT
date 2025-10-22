--任务245回调
Quest_245 = {}

--接任务回调
function Quest_245.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_245.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_245.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_245.accomplish(player, quest_id ,ring_num)
	if Guidance then
		Guidance.main(player,"QuestEnd245")
	end
end
--多次击杀同一个npc回调
function Quest_245.on_kill_boss(player, quest_id, cnt)
end 

function Quest_245.ready(player,quest_id , ring_num)
end

function Quest_245.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_245.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_245.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_245.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_245.OnResult(player, type, victory, custom)
end