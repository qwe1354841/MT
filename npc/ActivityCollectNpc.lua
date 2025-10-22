--集印章赢大礼npc
ActivityCollectNpc = {}

ActivityCollectNpc.KeyNameList = {
    {"印章-谪剑仙","谪剑仙"}, {"印章-飞翼姬","飞翼姬"}, {"印章-烟云客","烟云客"}, {"印章-冥河使","冥河使"}, {"印章-阎魔令","阎魔令"}, {"印章-雨师君","雨师君"},
    {"印章-神霄卫","神霄卫"}, {"印章-傲红莲","傲红莲"}, {"印章-花弄影","花弄影"}, {"印章-青丘狐","青丘狐"}, {"印章-海鲛灵","海鲛灵"}, {"印章-凤凰仙","凤凰仙"},
}

ActivityCollectNpc.FightTag = 10086

function ActivityCollectNpc.main(npc,player)
    --local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
    local NpcName = npc:GetKeyName()
    for k,v in pairs(ActivityCollectNpc.KeyNameList) do
        if NpcName == v[1] then
            if ActivityCollectNpc.GetTaskNpc(NpcName,player) then
                local Type = tonumber(ActivityCollectNpc.GetTaskType(NpcName,player))
                if Type == 1 then
                    player:AddNpcOption(npc, 0, "拜访"..v[2], "option1", "")
                    return "你好，好久不见。"
                elseif Type == 2 then
                    player:AddNpcOption(npc, 0, "送礼", "option2", "")
                    return "辛苦你了，东西带来了吗。"
                elseif Type == 3 then
                    player:AddNpcOption(npc, 0, "援助", "option3", "")
                    return "少侠我遇到了点麻烦，请你帮帮我。"
                end
            end
        end
    end
    return ""
end

function ActivityCollectNpc.GetTaskNpc(NpcName,player)
    local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
    for k,v in pairs(Task_List) do
        if v.NPC == NpcName then
            return true
        end
    end
    return false
end

function ActivityCollectNpc.GetTaskType(NpcName,player)
    local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
    for k,v in pairs(Task_List) do
        if v.NPC == NpcName then
            return v.Type
        end
    end
end

function ActivityCollectNpc.FindItem(NpcName,player)
    local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
    for k,v in pairs(Task_List) do
        if v.NPC == NpcName then
            return v.HandItemId,v.HandItemNum
        end
    end
end

function ActivityCollectNpc.option1(npc,player)
    if ActivityCollect then
        ActivityCollect.FinishTask(npc,player)
    end
    return ""
end

function ActivityCollectNpc.option2(npc,player)
    local NpcName = npc:GetKeyName()
    local ItemId,ItemNum = ActivityCollectNpc.FindItem(NpcName,player)
    player:SetDayInt("ActivityCollectHandNpc",tonumber(npc:GetGUID()))
    local str = [[
    GUI.OpenWnd("ActivityCollectHandInUI")
    if ActivityCollectHandInUI then
        ActivityCollectHandInUI.ItemId = ]]..ItemId..[[
        ActivityCollectHandInUI.ItemNum = ]]..ItemNum..[[
        ActivityCollectHandInUI.OnShow()
    end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

function ActivityCollectNpc.option3(npc,player)
    --开启一场pve战斗
    --战斗结束回调到ActivityCollect.FightOver
    if sFightSystem:StartTagPVE(player, 20001, ActivityCollectNpc.FightTag, "ActivityCollectNpc", "FightOver", "") then
        player:SetDayInt("ActivityCollectFightNpc",tonumber(npc:GetGUID()))
        sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "ActivityCollect", "FightOver")
    end
    return ""
end

function ActivityCollectNpc.FightOver(typ, tag, custom)
    if tag ~= ActivityCollectNpc.FightTag then
        sLuaApp:LuaErr("ActivityCollect.FightTag回调错误")
        return
    end
end



