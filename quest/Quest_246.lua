--任务246回调
Quest_246 = {}

function Quest_246.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_246.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_246.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_246.accomplish(player, quest_id ,ring_num)
    if Achievement then
        Achievement.Mind_line_complete(player,quest_id,ring_num)
    end
end
--多次击杀同一个npc回调
function Quest_246.on_kill_boss(player, quest_id, cnt)
end

function Quest_246.ready(player,quest_id , ring_num)
end

function Quest_246.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_246.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_246.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_246.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_246.OnResult(player, type, victory, custom)
end