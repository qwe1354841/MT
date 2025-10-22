--天河牧场相关NPC
TianHeNPC = {}

function TianHeNPC.main(npc, player)
    local activityData = ActivityConfig.GetById(60)
    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < activityData.LevelMin then
        return "等少侠等级超过"..activityData.LevelMin.."级再来放牧吧"
    else
        if npc:GetKeyName() == "御马监管事" then
            player:AddNpcOption(npc, 0, "前往初级天河牧场", "option1", "")
            player:AddNpcOption(npc, 0, "前往中级天河牧场", "option2", "")
            player:AddNpcOption(npc, 0, "前往高级天河牧场", "option3", "")
            player:AddNpcOption(npc, 0, "活动说明", "option5", "")
            return "大圣大闹天宫后，御马监最近空闲不少，少侠们可在天河牧场用宠物放牧"
        
        elseif npc:GetKeyName() == "御马监管事1" then
            player:AddNpcOption(npc, 0, "前往西梁女国", "option4", "")
            player:AddNpcOption(npc, 0, "前往中级天河牧场", "option2", "")
            player:AddNpcOption(npc, 0, "前往高级天河牧场", "option3", "")
            player:AddNpcOption(npc, 0, "活动说明", "option5", "")
            return "大圣大闹天宫后，御马监最近空闲不少，少侠们可在天河牧场用宠物放牧"
        
        elseif npc:GetKeyName() == "御马监管事2" then
            player:AddNpcOption(npc, 0, "前往西梁女国", "option4", "")
            player:AddNpcOption(npc, 0, "前往初级天河牧场", "option1", "")
            player:AddNpcOption(npc, 0, "前往高级天河牧场", "option3", "")
            player:AddNpcOption(npc, 0, "活动说明", "option5", "")
            return "大圣大闹天宫后，御马监最近空闲不少，少侠们可在天河牧场用宠物放牧"
        
        elseif npc:GetKeyName() == "御马监管事3" then
            player:AddNpcOption(npc, 0, "前往西梁女国", "option4", "")
            player:AddNpcOption(npc, 0, "前往初级天河牧场", "option1", "")
            player:AddNpcOption(npc, 0, "前往中级天河牧场", "option2", "")
            player:AddNpcOption(npc, 0, "活动说明", "option5", "")
            return "大圣大闹天宫后，御马监最近空闲不少，少侠们可在天河牧场用宠物放牧"
        end
    end
end

function TianHeNPC.option1(npc,player)
    if player then
        local map = sMapSystem:GetMapByKey("天河牧场1")
        if map then
            sMapSystem:Jump(player,map,108,81,1)
            if TianHeMuChang.MapPetNumRefresh then
                TianHeMuChang.MapPetNumRefresh(player,map:GetId())
            end
        end
    end
    return ""
end

function TianHeNPC.option2(npc,player)
    if player then
        local map = sMapSystem:GetMapByKey("天河牧场2")
        if map then
            sMapSystem:Jump(player,map,108,81,1)
            if TianHeMuChang.MapPetNumRefresh then
                TianHeMuChang.MapPetNumRefresh(player,map:GetId())
            end
        end
    end
    return ""
end

function TianHeNPC.option3(npc,player)
    if player then
        local map = sMapSystem:GetMapByKey("天河牧场3")
        if map then
            sMapSystem:Jump(player,map,108,81,1)
            if TianHeMuChang.MapPetNumRefresh then
                TianHeMuChang.MapPetNumRefresh(player,map:GetId())
            end
        end
    end
    return ""
end

function TianHeNPC.option4(npc,player)
    if player then
        local map = sMapSystem:GetMapByKey("西梁女国")
        if map then
            sMapSystem:Jump(player,map,125,75,1)
        end
    end
    return ""
end

function TianHeNPC.option5(npc,player)
    return [[
1.宠物在牧场中放牧可获得银币及随机道具奖励，奖励半小时结算一次
2.天河牧场共有3块牧场，放牧奖励根据地图等级提升，每块牧场有放置数量限制
3.宠物放牧后30分钟内不可收回，之后可随时收回获得奖励，但最多放牧8小时
4.当攻击他人宠物时，若胜利则宠物会取代他人的放牧位置，对方宠物则会结束放牧
    ]]
end