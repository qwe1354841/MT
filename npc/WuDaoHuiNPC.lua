--武道大会NPC
WuDaoHuiNPC = {}

WuDaoHuiNPC.ActID = 68

function WuDaoHuiNPC.main(npc,player)
    if npc:GetKeyName() == Act_WuDaoHui.OutsideNPCData[1]["key"] then
        local level = player:GetAttr(ROLE_ATTR_LEVEL)
        local activityData = ActivityConfig.GetById(WuDaoHuiNPC.ActID)
        if activityData == nil then
            sLuaApp:LuaDbg("activity表配置错误")
            return ""
        end
        if level < activityData.LevelMin then
            return "你的等级还不够，历练一段时间达到"..activityData.LevelMin.."级再来参加武道大会吧。"
        end

        if player:GetTeam() then
            return "武道大会是单人活动，无法组队参加"
        end

        if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
            if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then
                if not WuDaoHuiNPC.IsRegister(player) then
                    player:AddNpcOption(npc, 0, "参加武道会", "option1", "")
                    player:AddNpcOption(npc, 0, "活动帮助", "option2", "")
                    return "武道大会每周六、日"..activityData.TimeStart.."开始。"
                elseif WuDaoHuiNPC.IsRegister(player) then
                    player:AddNpcOption(npc, 0, "回到战场", "option4", "")
                    return "武道大会每周六、日"..activityData.TimeStart.."开始。"
                end
            elseif sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then
                if player:GetDayInt("WuDaoHui_Deaths") > 0 and player:GetDayInt("WuDaoHui_Deaths") <= 3 then
                    player:AddNpcOption(npc, 0, "武道会战况", "option3", "")
                    return "你已无法再次进入战场！"
                elseif player:GetDayInt("WuDaoHui_Deaths") == -1 then
                    player:AddNpcOption(npc, 0, "武道会战况", "option3", "")
                    return "你已无法再次进入战场！"
                elseif player:GetDayInt("WuDaoHui_Deaths") == 0 then
                    player:AddNpcOption(npc, 0, "武道会战况", "option3", "")
                    return "活动已经开始，你已无法进入战场！"
                end
            else
                player:AddNpcOption(npc, 0, "上次武道会战况", "option3", "")
                player:AddNpcOption(npc, 0, "活动帮助", "option2", "")
                return "武道大会每周六、日"..activityData.TimeStart.."开始。"
            end
        else
            player:AddNpcOption(npc, 0, "上次武道会战况", "option3", "")
            player:AddNpcOption(npc, 0, "活动帮助", "option2", "")
            return "武道大会每周六、日"..activityData.TimeStart.."开始。"
        end
    elseif npc:GetKeyName() == Act_WuDaoHui.InsideNPCData[1]["key"] then
        if sVarSystem:GetInt("WuDaoHui_Stage") ~= Act_WuDaoHui.Act_Stage.close then
            player:AddNpcOption(npc, 0, "活动帮助", "option5", "")
            return "我还没出力，你就倒下了。"
        else
            return "我还没出力，你就倒下了。"
        end
    elseif npc:GetKeyName() == Act_WuDaoHui.InsideNPCData[2]["key"] then
        if sVarSystem:GetInt("WuDaoHui_Stage") ~= Act_WuDaoHui.Act_Stage.close then
            player:AddNpcOption(npc, 0, "传送至战场", "option6", "")
            player:AddNpcOption(npc, 0, "活动帮助", "option5", "")
            return "我还没出力，你就倒下了。"
        else
            return "我还没出力，你就倒下了。"
        end
    elseif npc:GetKeyName() == Act_WuDaoHui.InsideNPCData[3]["key"] then
        if sVarSystem:GetInt("WuDaoHui_Stage") ~= Act_WuDaoHui.Act_Stage.close then
            player:AddNpcOption(npc, 0, "传送至战场", "option6", "")
            player:AddNpcOption(npc, 0, "活动帮助", "option5", "")
            return "我还没出力，你就倒下了。"
        else
            return "我还没出力，你就倒下了。"
        end
    end
    return ""
end

function WuDaoHuiNPC.option1(npc,player)
    if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
        local str = [[GlobalUtils.ShowServerBoxMessage("参加武道大会需要缴纳]]..Act_WuDaoHui.ApplyMoney..[[银币,是否参加武道大会？")]]
        player:SetString("SYSTEM_ConfirmBox_Function", "Act_WuDaoHui.Join_WuDaoHui("..player:GetGUID()..")")
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
    return ""
end

function WuDaoHuiNPC.option2(npc,player)
    return [[
1.参加活动需要缴纳]]..Act_WuDaoHui.ApplyMoney..[[银币。
2.参加活动后，参与者会被传送至战场地图，随机分为两个阵营进行战斗。
3.参与者拥有]]..Act_WuDaoHui.Deaths..[[次失败次数，消耗完即被传送出战场。
3.活动结束后，阵营胜负奖励通过邮件发放，提前出局但参与战斗的玩家也能获得。
    ]]
end

function WuDaoHuiNPC.option3(npc,player)
    local str = [[
        GUI.OpenWnd("WuDaoHuiUI")
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)
    return ""
end

function WuDaoHuiNPC.option4(npc,player)
    Act_WuDaoHui.EnterSafeArea(player)
    return ""
end

function WuDaoHuiNPC.option5(npc,player)
    return [[
1.战场入口开启后，有5分钟的准备时间，期间可以随意出入战场，但玩家间不能组队。
2.战场开启后，入场选手将随机分成青龙、朱雀2个阵营。
3.在比武期间内，玩家可通过碰撞对方阵营的玩家进入战斗，若玩家未进入战斗，系统会每隔一段时间为玩家匹配到合适的对手。
4.每次战斗结束，根据双方胜败得到一定积分和物品奖励，并有30秒的休息无敌时间，期间不会进行匹配对手；战斗失败]]..Act_WuDaoHui.Deaths..[[次后将被送出战场。
5.当有一方队员均被击败出场，则判另一方获胜；如果比赛结束时双方都有队员在场，那么判断场内积分较高的阵营胜利。
6.最后存活的玩家，可以在战场结束后5分钟内点击地上的宝箱领取存活奖励，每个存活玩家只能领取一个宝箱。
    ]]
end

function WuDaoHuiNPC.option6(npc,player)
    if player == nil then
        return ""
    end
    local Map = player:GetMap()
    if Map:GetKeyName() == "对战地图" then
        local CanMovePoint = sMapSystem:GetRandomPoint(Map,182,145,40)
        sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
    end
    return ""
end

--是否报名
function WuDaoHuiNPC.IsRegister(player)
    if Data then
        if Data["WuDaoHui"]["Player_List"] == nil then
            return false
        end
        for k, v in pairs(Data["WuDaoHui"]["Player_List"]) do
            if v.GUID == player:GetGUID() then
                return true
            end
        end
        return false
    else
        sLuaApp:LuaErr("缺少Data文件")
        return false
    end
end