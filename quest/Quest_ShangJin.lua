--赏金榜任务
Quest_ShangJin = {}
--接任务回调
function Quest_ShangJin.accept(player, quest_id ,ring_num)

end
--放弃任务回调
function Quest_ShangJin.abandon(player,quest_id , ring_num)
	if Act_ShangJinBang then
		Act_ShangJinBang.failed_or_abandon_quest(player,quest_id)
	end
end
--任务失败回调
function Quest_ShangJin.failed(player,quest_id , ring_num)
	if Act_ShangJinBang then
		Act_ShangJinBang.failed_or_abandon_quest(player,quest_id)
	end
end
--完成任务回调
function Quest_ShangJin.accomplish(player, quest_id ,ring_num)
	if Act_ShangJinBang then
		Act_ShangJinBang.accomplish(player,quest_id)
	end
end
--多次击杀同一个npc回调
function Quest_ShangJin.on_kill_boss(player, quest_id, cnt)

end 

function Quest_ShangJin.ready(player,quest_id , ring_num)

end

function Quest_ShangJin.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_ShangJin.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_ShangJin.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_ShangJin.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end