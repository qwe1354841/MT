--任务533回调
Quest_533 = {}

--接任务回调
function Quest_533.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_533.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_533.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_533.accomplish(player, quest_id ,ring_num)
end
--多次击杀同一个npc回调
function Quest_533.on_kill_boss(player, quest_id, cnt)
    sQuestSystem:Finish(player,quest_id)
    --触发剧情动画
    sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", ""..quest_id)
end 

function Quest_533.ready(player,quest_id , ring_num)
end

function Quest_533.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_533.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_533.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_533.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_533.OnResult(player, type, victory, custom)
end