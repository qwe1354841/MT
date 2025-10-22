--任务210回调添加侍从
Quest_AddGuard = {}

Quest_AddGuard.GuardList = {
    [1] = {key = "水德真君",id = 110},
    [2] = {key = "地涌夫人",id = 116},
}

Quest_AddGuard.Interval_Time = 1000
--接任务回调
function Quest_AddGuard.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_AddGuard.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_AddGuard.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_AddGuard.accomplish(player, quest_id ,ring_num)
    --添加侍从
    for k, v in pairs(Quest_AddGuard.GuardList) do
        local guard = sGuardSystem:AddGuard(player,v.id,player:GetAttr(ROLE_ATTR_LEVEL),"system","主线","任务210")
        if not guard then
            sLuaApp:LuaDbg("添加侍从错误")
        end
    end
end
--多次击杀同一个npc回调
function Quest_AddGuard.on_kill_boss(player, quest_id, cnt)
end 

function Quest_AddGuard.ready(player,quest_id , ring_num)
end

function Quest_AddGuard.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_AddGuard.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_AddGuard.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_AddGuard.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_AddGuard.OnResult(player, type, victory, custom)
end