--任务238回调弹出首充界面
Quest_FirstRecharge = {}

--接任务回调
function Quest_FirstRecharge.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_FirstRecharge.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_FirstRecharge.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_FirstRecharge.accomplish(player, quest_id ,ring_num)
end
--多次击杀同一个npc回调
function Quest_FirstRecharge.on_kill_boss(player, quest_id, cnt)
    if player == nil then
        return
    end
    if player:GetInt("GotFirstRecharge") == 2 then
        return 0
    end
    local str = [[
        GUI.OpenWnd("FirstRechargeUI")
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function Quest_FirstRecharge.ready(player,quest_id , ring_num)
end

function Quest_FirstRecharge.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_FirstRecharge.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_FirstRecharge.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_FirstRecharge.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_FirstRecharge.OnResult(player, type, victory, custom)
end