--区域任务NPC
RegionTaskNPC = {}

function RegionTaskNPC.main(npc, player)
    --判断等级
    local act_id = sVarSystem:GetInt("RegionTask_ActID")
	if act_id == 0 or (not sLuaApp:IsActivityRunning(act_id)) then
		return "活动未开启"
	end
	local act_data = ActivityConfig.GetById(act_id)
    local level_min = act_data.LevelMin
    local player_tb = Lua_tools.GetPlayerTb(player)
    for _,v in ipairs(player_tb) do
        if v:GetAttr(ROLE_ATTR_LEVEL) < level_min then
            return v:GetName().."等级小于"..level_min.."级，再去历练下吧"
        end
    end

    local status = RegionTask.GetStatus(npc)
    local type = RegionTask.GetType(npc)
    if status == RegionTask.StatusReady then
        if type == RegionTask.TypeEscort then
            player:AddNpcOption(npc, 0, "开始护送", "option1", "")
            -- return "接受任务"
        elseif type == RegionTask.TypeCollect then
            player:AddNpcOption(npc, 0, "收集道具", "option4", "")
        elseif type == RegionTask.TypeConquest then
            player:AddNpcOption(npc, 0, "开始讨伐", "option8", "")    
        end     
    elseif status == RegionTask.StatusInProgress then
        if type == RegionTask.TypeEscort then
            player:AddNpcOption(npc, 0, "加入护送", "option2", "")
            -- player:AddNpcOption(npc, 0, "销毁", "option10", "")
            -- return "接受任务"
        elseif type == RegionTask.TypeEscortMonster then
            player:AddNpcOption(npc, 0, "战斗", "option3", "")
            -- return ""
        end

        if type == RegionTask.TypeCollect then
            local player_guid = tostring(player:GetGUID())
            if RegionTask.IsInParticipant(player_guid, npc) then
                player:AddNpcOption(npc, 0, "参与收集", "option5", "")
                player:AddNpcOption(npc, 0, "提交道具", "option7", "")
            else
                player:AddNpcOption(npc, 0, "参与收集", "option5", "")
            end
        elseif type == RegionTask.TypeCollectBox then
            RegionTask.OpenBox(player, npc)
            return ""
        elseif type == RegionTask.TypeCollectMonster then
            player:AddNpcOption(npc, 0, "战斗", "option6", "")
        end

        if type == RegionTask.TypeConquest then
            player:AddNpcOption(npc, 0, "加入讨伐", "option9", "")    
        elseif type == RegionTask.TypeConquestBOSS then
            local player_guid = tostring(player:GetGUID())
            if RegionTask.IsInParticipant(player_guid, npc) ~= nil then
                player:AddNpcOption(npc, 0, "讨伐BOSS", "option10", "")    
            else
                player:AddNpcOption(npc, 0, "加入讨伐", "option9", "")    
            end
        elseif type == RegionTask.TypeConquestMonster then
            player:AddNpcOption(npc, 0, "清理小怪", "option11", "") 
        end 
    elseif status == RegionTask.StatusFinish then
        if type == RegionTask.TypeCollect then
            local player_guid = tostring(player:GetGUID())
            if RegionTask.IsInParticipant(player_guid, npc) then
                player:AddNpcOption(npc, 0, "提交道具", "option7", "")
            end
        end
    end

    local msg = npc:GetString("RegionTask_TalkMsg")
    if msg == "" then
        msg = "0"
    end
    return msg
end

--检查玩家上一个接取的任务NPC是否还存在
function RegionTaskNPC.CheckTaskNPC(player, npc)
    local task_npc_guid = player:GetInt("RegionTask_NPCGUID")
    local task_npc = sNpcSystem:GetNpcByGUID(task_npc_guid)
    if task_npc and task_npc ~= npc then
        return true
    end
    return false
end

function RegionTaskNPC.option1(npc, player, content)
    if RegionTaskNPC.CheckTaskNPC(player, npc) then
        sLuaApp:NotifyTipsMsg(player, "完成上一个任务才可接取其他任务")
        return ""
    end

    local res = RegionTask.CheckJoinNum(player)
    if res[1] then
        RegionTask.EscortStart(player, npc)
        RegionTask.ChangeJoinNum(player, 1)
    else
        return res[2]
    end
	return ""
end

function RegionTaskNPC.option2(npc, player, content)
    if RegionTaskNPC.CheckTaskNPC(player, npc) then
        sLuaApp:NotifyTipsMsg(player, "请先完成上一个任务才可接取其他任务")
        return ""
    end
    local res = RegionTask.CheckJoinNum(player)
    if res[1] then
        RegionTask.EscortJoin(player, npc)
        RegionTask.ChangeJoinNum(player, 1)
    else
        return res[2]
    end
	return ""
end

function RegionTaskNPC.option3(npc, player, content)
    RegionTask.EscortFight(player, npc)
	return ""
end

function RegionTaskNPC.option10(npc, player, content)
    sNpcSystem:DestroyNpc(npc)
	return ""
end


--开始收集
function RegionTaskNPC.option4(npc, player, content)
    if RegionTaskNPC.CheckTaskNPC(player, npc) then
        sLuaApp:NotifyTipsMsg(player, "请先完成上一个任务才可接取其他任务")
        return ""
    end
    local res = RegionTask.CheckJoinNum(player)
    if res[1] then
        RegionTask.CollectStart(player, npc)
        RegionTask.ChangeJoinNum(player, 1)
    else
        return res[2]
    end
	return ""
end

--参与收集
function RegionTaskNPC.option5(npc, player, content)
    if RegionTaskNPC.CheckTaskNPC(player, npc) then
        sLuaApp:NotifyTipsMsg(player, "请先完成上一个任务才可接取其他任务")
        return ""
    end
    local res = RegionTask.CheckJoinNum(player)
    if res[1] then
        RegionTask.CollectJoin(player, npc)
        RegionTask.ChangeJoinNum(player, 1)
    else
        return res[2]
    end
	return ""
end

--收集战斗
function RegionTaskNPC.option6(npc, player, content)
    RegionTask.CollectFight(player, npc)
	return ""
end

--提交道具
function RegionTaskNPC.option7(npc, player, content)
    RegionTask.SubmitItem(player, npc)
	return ""
end

--检查玩家上一个接取的任务NPC是否还存在
function RegionTaskNPC.CheckTaskNPC(player, npc)
    local task_npc_guid = player:GetInt("ConquestNPC_NPCGUID")
    local task_npc = sNpcSystem:GetNpcByGUID(task_npc_guid)
    if task_npc and task_npc ~= npc then
        return true
    end
    return false
end

--开始讨伐
function RegionTaskNPC.option8(npc, player, content)
    if RegionTaskNPC.CheckTaskNPC(player, npc) then
        sLuaApp:NotifyTipsMsg(player, "请先完成上一个任务才可接取其他任务")
        return ""
    end
    local res = RegionTask.CheckJoinNum(player)
    if res[1] then
        RegionTask.ConquestStart(player, npc)
        RegionTask.ChangeJoinNum(player, 1)
    else
        return res[2]
    end
    return ""
end

--参与讨伐
function RegionTaskNPC.option9(npc, player, content)
    if RegionTaskNPC.CheckTaskNPC(player, npc) then
        sLuaApp:NotifyTipsMsg(player, "请先完成上一个任务才可接取其他任务")
        return ""
    end
    local res = RegionTask.CheckJoinNum(player)
    if res[1] then
        RegionTask.ConquestJoin(player, npc)
        RegionTask.ChangeJoinNum(player, 1)
    else
        return res[2]
    end
	return ""
end

--开始BOSS战斗
function RegionTaskNPC.option10(npc, player, content)
    RegionTask.ConquestFight(player, npc)
	return ""
end

--开始小怪战斗
function RegionTaskNPC.option11(npc, player, content)
    RegionTask.ConquestFight(player, npc)
	return ""
end

