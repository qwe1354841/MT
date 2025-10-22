--筋斗云
JinDouYun = {}

--筋斗云的物品id
JinDouYun.Id = 31022

--筋斗云传送的随机范围
JinDouYun.range = 3

--使用筋斗云的最小距离
JinDouYun.MinDis = 50

--任务目标类型
JinDouYun.QuestType = {
    [0] = "无目标",
    [1] = "特殊拜访",
    [2] = "杀死BOSS",
    [3] = "交随机道具",
    [4] = "交指定道具",
    [5] = "交随机宠物",
    [6] = "交指定宠物",
    [7] = "护卫NPC",
    [8] = "到达指定地点",
    [9] = "指定地图战斗",
    [10]= "指定地图战斗（多个）",
    [11]= "指定地图杀怪",
    [12]= "指定地图杀怪（多个）",
    [13]= "遇怪",
    [14]= "使用物品",
    [15]= "捕获宠物",
    [16]= "押镖任务",
    [17]= "PVE任务",
}

function JinDouYun.Main(player,quest_id)
    if not player or not quest_id then
        return
    end
    --队伍判断
    if player:GetTeam() then
        if player:IsTeamLeader() == false and player:IsTempLeave() == false then
            return
        end
    end

    --押镖判断
    if player:GetAttr(ROLE_ATTR_IS_CONVOY) ~= 0 then
        local quest_type = sQuestSystem:GetGoalType(quest_id)
        if JinDouYun.QuestType[quest_type] == "押镖任务" then
            JinDouYun.CommonFindWay(player,quest_id)
        else
            sLuaApp:NotifyTipsMsg(player, "押镖时无法传送")
        end
        JinDouYun.CommonFindWay(player,quest_id)
        return
    end

    --是否可以跳地图判断
    if player:GetAttr(ROLE_ATTR_IS_FORBID_JUMP) ~= 0 then
        sLuaApp:NotifyTipsMsg(player, "当前状态无法传送")
        JinDouYun.CommonFindWay(player,quest_id)
        return
    end

    --物品判断
    if JinDouYun.HaveItem(player) == false then
        return
    end
    local quest_type = sQuestSystem:GetGoalType(quest_id)
    if JinDouYun.QuestType[quest_type] == "无目标" or JinDouYun.QuestType[quest_type] == "特殊拜访" or JinDouYun.QuestType[quest_type] == "杀死BOSS" or JinDouYun.QuestType[quest_type] == "护卫NPC" then
        local npc_id = JinDouYun.GetQuestNPCId(player,quest_id)
        local npc = sQuestSystem:GetNpcByNpcId(player,quest_id,npc_id)
        if not npc then
            JinDouYun.CommonFindWay(player,quest_id)
            return
        end
        if player:GetMap() == npc:GetMap() then
            if JinDouYun.GetDis(player,npc) <= JinDouYun.MinDis then
                JinDouYun.CommonFindWay(player,quest_id)
                return
            end
        end
        if sItemSystem:ConsumeItemWithId(player,JinDouYun.Id,1,3,"system","筋斗云","任务跳转") == 0 then
            --sLuaApp:LuaDbg("任务id:"..quest_id..",消耗筋斗云,传送至NPC:"..npc_id)
            JinDouYun.Transmit(player,npc)
        end
    elseif JinDouYun.QuestType[quest_type] == "交随机道具" or JinDouYun.QuestType[quest_type] == "交指定道具" then
        local quest_state = sQuestSystem:GetQuestState(player,quest_id)
        local npc_id = 0
        if NpcPathfinding then
            if quest_state == 1 or quest_state == 2 then
                npc_id = sQuestSystem:GetAcceptNpc(player,quest_id)
            elseif quest_state == 3 then
                local item_id = sQuestSystem:GetCommitItem(player,quest_id)
                local shop_id = NpcPathfinding.itemList[item_id]
                npc_id = NpcPathfinding.ShopList[shop_id]
            elseif quest_state == 4 then
                npc_id = sQuestSystem:GetCommitNpc(player,quest_id)
            end
            local npc = sQuestSystem:GetNpcByNpcId(player,quest_id,npc_id)
            if not npc then
                JinDouYun.CommonFindWay(player,quest_id)
                return
            end
            if player:GetMap() == npc:GetMap() then
                if JinDouYun.GetDis(player,npc) <= JinDouYun.MinDis then
                    JinDouYun.CommonFindWay(player,quest_id)
                    return
                end
            end
            if sItemSystem:ConsumeItemWithId(player,JinDouYun.Id,1,3,"system","筋斗云","任务跳转") == 0 then
                --sLuaApp:LuaDbg("任务id:"..quest_id..",消耗筋斗云,传送至NPC:"..npc_id)
                if quest_state == 4 then
                    JinDouYun.Transmit(player,npc)
                else
                    JinDouYun.Transmit(player,npc,sQuestSystem:GetCommitItem(player,quest_id))
                end
            end
        end
    elseif JinDouYun.QuestType[quest_type] == "交随机宠物" or JinDouYun.QuestType[quest_type] == "交指定宠物" then
        local quest_state = sQuestSystem:GetQuestState(player,quest_id)
        local npc_id = 0
        if NpcPathfinding then
            if quest_state == 1 or quest_state == 2 then
                npc_id = sQuestSystem:GetAcceptNpc(player,quest_id)
            elseif quest_state == 3 then
                local pet_id = sQuestSystem:GetCommitPet(player,quest_id)
                local shop_id = NpcPathfinding.petList[pet_id]
                npc_id = NpcPathfinding.ShopList[shop_id]
            elseif quest_state == 4 then
                npc_id = sQuestSystem:GetCommitNpc(player,quest_id)
            end
            local npc = sQuestSystem:GetNpcByNpcId(player,quest_id,npc_id)
            if not npc then
                JinDouYun.CommonFindWay(player,quest_id)
                return
            end
            if player:GetMap() == npc:GetMap() then
                if JinDouYun.GetDis(player,npc) <= JinDouYun.MinDis then
                    JinDouYun.CommonFindWay(player,quest_id)
                    return
                end
            end
            if sItemSystem:ConsumeItemWithId(player,JinDouYun.Id,1,3,"system","筋斗云","任务跳转") == 0 then
                --sLuaApp:LuaDbg("任务id:"..quest_id..",消耗筋斗云,传送至NPC:"..npc_id)
                if quest_state == 4 then
                    JinDouYun.Transmit(player,npc)
                else
                    JinDouYun.Transmit(player,npc,sQuestSystem:GetCommitPet(player,quest_id))
                end
            end
        end
    elseif JinDouYun.QuestType[quest_type] == "押镖任务" then
        local quest_state = sQuestSystem:GetQuestState(player,quest_id)
        if quest_state == 1 or quest_state == 2 then
            local npc_id = JinDouYun.GetQuestNPCId(player,quest_id)
            local npc = sQuestSystem:GetNpcByNpcId(player,quest_id,npc_id)
            if not npc then
                JinDouYun.CommonFindWay(player,quest_id)
                return
            end
            if player:GetMap() == npc:GetMap() then
                if JinDouYun.GetDis(player,npc) <= JinDouYun.MinDis then
                    JinDouYun.CommonFindWay(player,quest_id)
                    return
                end
            end
            if sItemSystem:ConsumeItemWithId(player,JinDouYun.Id,1,3,"system","筋斗云","任务跳转") == 0 then
                --sLuaApp:LuaDbg("任务id:"..quest_id..",消耗筋斗云,传送至NPC:"..npc_id)
                JinDouYun.Transmit(player,npc)
            end
        else
            JinDouYun.CommonFindWay(player,quest_id)
        end
    else
        JinDouYun.CommonFindWay(player,quest_id)
    end
end

--获取任务NPCid
function JinDouYun.GetQuestNPCId(player,quest_id)
    if not player or not quest_id then
        return
    end
    local quest_state = sQuestSystem:GetQuestState(player,quest_id)
    local npc_id = 0
    if quest_state == 1 or quest_state == 2 then
        npc_id = sQuestSystem:GetAcceptNpc(player,quest_id)
    elseif quest_state == 3 then
        npc_id = sQuestSystem:GetTargetNpc(player,quest_id)
        if not npc_id or npc_id == 0 then
            npc_id = sQuestSystem:GetCommitNpc(player,quest_id)
        end
    elseif quest_state == 4 then
        npc_id = sQuestSystem:GetCommitNpc(player,quest_id)
    end
    return npc_id
end

--正常寻路
function JinDouYun.CommonFindWay(player,quest_id)
    local str = [[
		TrackUI.OnManualClickQuest(]]..tonumber(quest_id)..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--传送
function JinDouYun.Transmit(player,npc,param)
    if not player or not npc then
        return
    end

    local map = npc:GetMap()
    if map then
        local x = sMapSystem:GetPosX(npc)
        local y = sMapSystem:GetPosY(npc)
        if sMapSystem:Jump(player,map,x,y,JinDouYun.range) then
            if player:GetInt("Assist_GoOn") == 1 then
                sLuaTimerSystem:AddTimerEx(player, 200 ,1,"Assist.ToStartPathfinding", "")
                return
            end
            if param then
                sLuaTimerSystem:AddTimerEx (player, 400, 1, "JinDouYun.MoveToNpc", ""..npc:GetId().."_"..param)
            else
                sLuaTimerSystem:AddTimerEx (player, 400, 1, "JinDouYun.MoveToNpc", ""..npc:GetId())
            end
            --sLuaApp:LuaDbg("筋斗云目标NPC地图："..map:GetKeyName()..",坐标（"..x..","..y.."）")
        else
            sLuaApp:NotifyTipsMsg(player, "跳转地图失败")
        end
    end
end

--移动至NPC
function JinDouYun.MoveToNpc(player, timer_id , param)
    if not player or not param then
        return
    end
    local params = split(trim(param), "_")
    local npc_id = tonumber(params[1])
    local str = ""
    if params[2] then
        str = [[
	    	CL.StartMove(]]..npc_id..[[,true,eRoleHeadFlag.None,MoveEndAction.OpenShop,]]..params[2]..[[,0,eDirection8.None)
	    ]]
    else
        str = [[
	    	CL.StartMove(]]..npc_id..[[)
	    ]]
    end
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--物品判断
function JinDouYun.HaveItem(player)
    if not player then
        return
    end
    local ItemContainer = player:GetItemContainer(ITEM_CONTAINER_BAG)
    local itemnum = ItemContainer:GetItemAmountById(JinDouYun.Id,3)
    if itemnum > 0 then
        return true
    end
    return false
end

--获取距离
function JinDouYun.GetDis(player,npc)
    local player_x = sMapSystem:GetPosX(player)
    local player_y = sMapSystem:GetPosY(player)
    local npc_x = sMapSystem:GetPosX(npc)
    local npc_y = sMapSystem:GetPosY(npc)
    local dis = math.floor(math.sqrt((player_x-npc_x)^2+(player_y-npc_y)^2))
    return math.abs(dis)
end