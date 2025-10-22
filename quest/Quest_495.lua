--任务495回调
Quest_495 = {}

--接任务回调
function Quest_495.accept(player, quest_id ,ring_num)
    --触发剧情动画
    Movie_system.QuestCallMovie(player, 0 , quest_id)
end
--放弃任务回调
function Quest_495.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_495.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_495.accomplish(player, quest_id ,ring_num)
    sQuestSystem:Accept(player,496)
end
--多次击杀同一个npc回调
function Quest_495.on_kill_boss(player, quest_id, cnt)
end 

function Quest_495.ready(player,quest_id , ring_num)
end

function Quest_495.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_495.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_495.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_495.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_495.OnResult(player, type, victory, custom)
end