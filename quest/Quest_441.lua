--任务441回调
Quest_441 = {}

function Quest_441.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_441.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_441.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_441.accomplish(player, quest_id ,ring_num)
    if Achievement then
        Achievement.Mind_line_complete(player,quest_id,ring_num)
    end
end
--多次击杀同一个npc回调
function Quest_441.on_kill_boss(player, quest_id, cnt)
end

function Quest_441.ready(player,quest_id , ring_num)
end

function Quest_441.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_441.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_441.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_441.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_441.OnResult(player, type, victory, custom)
end