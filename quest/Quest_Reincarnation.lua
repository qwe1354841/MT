--转生相关
Quest_Reincarnation = {}

--接任务回调
function Quest_Reincarnation.accept(player, quest_id ,ring_num)
	
end
--放弃任务回调
function Quest_Reincarnation.abandon(player,quest_id , ring_num)

end
--任务失败回调
function Quest_Reincarnation.failed(player,quest_id , ring_num)

end
--完成任务回调
function Quest_Reincarnation.accomplish(player, quest_id ,ring_num)
	player:SetInt("FreeChangeOccu",1)
end
--多次击杀同一个npc回调
function Quest_Reincarnation.on_kill_boss(player, quest_id, cnt)

end 

function Quest_Reincarnation.ready(player,quest_id , ring_num)

end

function Quest_Reincarnation.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_Reincarnation.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_Reincarnation.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_Reincarnation.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end