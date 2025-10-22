-- 队伍相关函数
TeamHelper = {}
--禁止组队地图KeyName	(1禁止组队, 0或不写地图keyname代表不禁止)
TeamHelper.ForbidMap = {
	["鸡王争霸赛"] = 1,
}

TeamHelper.FunctionSwitchConfig = {
	["AutoApply"] = "off",
}

-- 获取玩家队伍
function GetTeamByPlayer(player)
    if player == nil then
        return nil
    end

    local team = player:GetTeam()
    if team == nil then
        return nil
    end
    return team
end

-- 是否允许创建队伍
function IsAllowedCreateTeam(player)
    if player == nil then
        return false
    end

    local team = player:GetTeam()
    if team ~= nil then
        return false
    end

    if player:GetAttr(ROLE_ATTR_IS_CONVOY) ~= 0 then
        return false
    end
    --武道大会
    if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
        if player:GetMapKeyName() == "对战地图" then
            if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then
                return false
            end
        end
    end

    -- todo:添加其他判断条件
    return true
end

-- 是否允许加入队伍
function IsAllowedJoinTeam(player)
    if player == nil then
        return false
    end

    local team = player:GetTeam()
    if team ~= nil then
        return false
    end

    if player:GetAttr(ROLE_ATTR_IS_CONVOY) ~= 0 then
        return false
    end

    --武道大会
    if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
        if player:GetMapKeyName() == "对战地图" then
            if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then
                return false
            end
        end
    end
    -- todo:添加其他判断条件
    return true
end