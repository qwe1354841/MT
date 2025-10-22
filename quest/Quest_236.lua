--任务236回调
Quest_236 = {}

--接任务回调
function Quest_236.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_236.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_236.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_236.accomplish(player, quest_id ,ring_num)
    --触发剧情动画
    sLuaTimerSystem:AddTimerEx (player, 500, 1, "Movie_system.QuestCallMovie", "237")
end
--多次击杀同一个npc回调
function Quest_236.on_kill_boss(player, quest_id, cnt)
end 

function Quest_236.ready(player,quest_id , ring_num)
end

function Quest_236.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_236.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_236.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_236.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_236.OnResult(player, type, victory, custom)
end