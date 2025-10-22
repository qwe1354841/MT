--任务415回调
Quest_415 = {}

function Quest_415.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_415.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_415.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_415.accomplish(player, quest_id ,ring_num)
    if Achievement then
        Achievement.Mind_line_complete(player,quest_id,ring_num)
    end
end
--多次击杀同一个npc回调
function Quest_415.on_kill_boss(player, quest_id, cnt)
end

function Quest_415.ready(player,quest_id , ring_num)
end

function Quest_415.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_415.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_415.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_415.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_415.OnResult(player, type, victory, custom)
end