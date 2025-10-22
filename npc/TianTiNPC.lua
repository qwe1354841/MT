--天梯挑战NPC
TianTiNPC = {}

function TianTiNPC.main(npc,player)
    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < TianTi.MinLevel then
        return "你的等级还不够，历练一段时间达到"..TianTi.MinLevel.."级再来参加天梯挑战吧。"
    elseif not sLuaApp:IsActivityRunning(66) then
        return "天梯还未开启，请继续准备。"
    elseif player:GetTeam() then
        return "天梯挑战是单人活动，无法组队参加"
    elseif sLuaApp:IsActivityRunning(66) then
        player:AddNpcOption(npc, 0, "天梯挑战", "option1", "")
        player:AddNpcOption(npc, 0, "天梯说明", "option2", "")
        player:AddNpcOption(npc, 0, "荣誉商店", "option3", "")
        return "天梯是通往强者的路，而且可以获得丰厚的奖励。"
    end
end

function TianTiNPC.option1(npc,player)
    if TianTi then
        TianTi.OpenMainWnd(player)
    end
    return ""
end

function TianTiNPC.option2(npc,player)
    return [[
        1.天梯需要]]..TianTi.MinLevel..[[级以上才能挑战
        2.天梯每天晚21:00根据当前排名发送每日排名奖励
    ]]
end

function TianTiNPC.option3(npc,player)--打开荣誉商店
    if TianTi then
        TianTi.OpenHonorShop(player)
    end
    return ""
end