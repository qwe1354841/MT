--侍从阵容
Guard_BattleArray = {}

--得到使用阵容的侍从guid表
--function Guard_BattleArray.GetUseBattleArray(player)
--    if player == nil then
--        return ""
--    end
--    local lineupContainer = player:GetLineupContainer()
--    local UseArrayIndex = lineupContainer:GetCurrentLineup()
--    local GuardGUIDList = Guard_BattleArray.GetBattleArrayByIndex(player,UseArrayIndex)
--    local str = [[
--        if GuardUI then
--            GuardUI.UseBattleArrayList = ]]..Lua_tools.serialize(GuardGUIDList)..[[
--            GuardUI.RefreshTeamTable()
--        end
--    ]]
--
--    sLuaApp:ShowForm(player, "脚本表单", str)
--end

--得到全部阵容的侍从guid表
function Guard_BattleArray.GetBattleArray(player)
    if player == nil then
        return ""
    end

    local GuardGUIDList = {}

    for i = 1, 3 do
        GuardGUIDList["guard_array_"..i] = Guard_BattleArray.GetBattleArrayByIndex(player,i)
    end

    local nameList = {}
    for i = 1, 3 do
        table.insert(nameList,player:GetString("ArrayName"..i))
    end

    local lineupContainer = player:GetLineupContainer()
    local UseArrayIndex = lineupContainer:GetCurrentLineup() + 1

    local str = [[
        if GuardUI then
            GuardUI.UseGuardArray = ]]..UseArrayIndex..[[
            GuardUI.BattleArrayList = ]]..Lua_tools.serialize(GuardGUIDList)..[[
            GuardUI.GuardArrayName = ]]..Lua_tools.serialize(nameList)..[[
        end
    ]]
    --sLuaApp:LuaDbg("-------------"..Lua_tools.serialize(Guard_BattleArray.List))
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--得到当前阵容的侍从guid列表
function Guard_BattleArray.GetUseGuardList(player)
    if player == nil then
        return ""
    end
    local lineupContainer = player:GetLineupContainer()
    local index = lineupContainer:GetCurrentLineup()+1
    local GuardList = Guard_BattleArray.GetBattleArrayByIndex(player,index)
    return GuardList
end
--得到指定阵容的侍从guid列表
function Guard_BattleArray.GetBattleArrayByIndex(player,index)
    if player == nil or index == nil then
        return ""
    end
    local lineupContainer = player:GetLineupContainer()
    local GuardList = lineupContainer:GetLineup(tonumber(index) - 1)

    local GuardGUIDList = {}
    for i = 1, 4 do
        if GuardList[i] ~= nil then
            GuardGUIDList[i] = tostring(GuardList[i]:GetGUID())
        else
            GuardGUIDList[i] = "0"
        end
    end
    return GuardGUIDList
end

--修改阵容名称
function Guard_BattleArray.ChangeArrayName(player,index,name)
    if player == nil or name == nil then
        return ""
    end
    if index == nil or index == 0 then
        return ""
    end
    if sLuaApp:GetUTF8Bytes(name) > 10 then
        sLuaApp:NotifyTipsMsg(player, "名称长度过长")
        return ""
    end
    if sLuaApp:IsUtf8Str(name) then
        player:SetString("ArrayName"..index,name)
        local Str = [[
            GUI.DestroyWnd("RoleRenameUI")
        ]]
        sLuaApp:ShowForm(player, "脚本表单", Str)
    else
        sLuaApp:NotifyTipsMsgEx(player ,"该名称编码格式不支持！")
        local str = [[GuardUI.Team_Member_Refresh_Method()]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        return
    end
end

--设置使用阵容
function Guard_BattleArray.SetUseArray(player,index)
    if player == nil or index == nil then
        return ""
    end
    local lineupContainer = player:GetLineupContainer()
    lineupContainer:SetCurrentLineup(index-1)

    local GuardGUIDList = {}

    for i = 1, 3 do
        GuardGUIDList["guard_array_"..i] = Guard_BattleArray.GetBattleArrayByIndex(player,i)
    end

    local nameList = {}
    for i = 1, 3 do
        table.insert(nameList,player:GetString("ArrayName"..i))
    end

    local lineupContainer = player:GetLineupContainer()
    local UseArrayIndex = lineupContainer:GetCurrentLineup() + 1

    local str = [[
        if GuardUI then
            GuardUI.UseGuardArray = ]]..UseArrayIndex..[[
            GuardUI.BattleArrayList = ]]..Lua_tools.serialize(GuardGUIDList)..[[
            GuardUI.GuardArrayName = ]]..Lua_tools.serialize(nameList)..[[
            GuardUI.TeamTab_CheckBox_Click_Finish(]]..index..[[)
            GuardUI.Team_Member_Refresh_Method()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    SeatSystem.SetSeatNameLevel(player)
end

--当前阵容侍从上阵
--function Guard_BattleArray.UseLineupUp(player,guard_guid)
--    if player == nil or index == nil or guard_guid == nil then
--        return ""
--    end
--    local lineupContainer = player:GetLineupContainer()
--    local UseArrayIndex = lineupContainer:GetCurrentLineup()
--    if lineupContainer:PushLineup(UseArrayIndex,guard_guid) == false then
--        sLuaApp:LuaDbg("设置阵容侍从上阵错误")
--    end
--    Guard_BattleArray.RefreshLineupPanel(player)
--end

--指定阵容侍从上阵
function Guard_BattleArray.LineupUp(player,index,guard_guid)
    guard_guid = tonumber(guard_guid)
    if player == nil or index == nil or guard_guid == nil then
        return ""
    end
   
    local lineupContainer = player:GetLineupContainer()
    if lineupContainer:PushLineup(index-1,guard_guid) == false then
        sLuaApp:LuaDbg("设置阵容侍从上阵错误")
    end

    Guard_BattleArray.RefreshLineupPanel(player)
end

--当前阵容侍从下阵
--function Guard_BattleArray.UseLineupDown(player,guard_guid)
--    if player == nil or index == nil or guard_guid == nil then
--        return ""
--    end
--    local lineupContainer = player:GetLineupContainer()
--    local UseArrayIndex = lineupContainer:GetCurrentLineup()
--    if lineupContainer:PopLineup(UseArrayIndex,guard_guid) == false then
--        sLuaApp:LuaDbg("设置阵容侍从下阵错误")
--    end
--    Guard_BattleArray.RefreshLineupPanel(player)
--end

--指定阵容侍从下阵
function Guard_BattleArray.LineupDown(player,index,guard_guid)
    guard_guid = tonumber(guard_guid)
    if player == nil or index == nil or guard_guid == nil then
        return ""
    end
    local lineupContainer = player:GetLineupContainer()
    if lineupContainer:PopLineup(index-1,guard_guid) == false then
        sLuaApp:LuaDbg("设置阵容侍从下阵错误")
    end
    Guard_BattleArray.RefreshLineupPanel(player)
end

--指定阵容交换侍从
function Guard_BattleArray.LineupExchange(player,index,site1,site2)
    if player == nil or index == nil or site1 == nil or site2 == nil then
        return ""
    end
    local lineupContainer = player:GetLineupContainer()
    local UseArrayIndex = lineupContainer:GetCurrentLineup()
    local Team = player:GetTeam()
    if Team and (index-1) == UseArrayIndex then
        if player:IsTeamLeader() then
            local GuardList = lineupContainer:GetLineup(index - 1)
            sTeamSystem:SwapTeamMember(player,GuardList[site1+1]:GetGUID(),GuardList[site2+1]:GetGUID())
        end
    else
        if lineupContainer:SwapLineup(index - 1 ,site1,site2) then
            local SeatGUIDList = SeatSystem.GetSeatGUIDList(player,index)
            local str = [[
                if TeamPanelUI then
                    TeamPanelUI.guardsPosition = ]]..Lua_tools.serialize(SeatGUIDList)..[[
                    TeamPanelUI.OnTeamInfoUpdate(8)
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单", str)

        else
            sLuaApp:LuaDbg("交换阵容侍从位置错误")
        end
    end
    Guard_BattleArray.RefreshLineupPanel(player)
end

--指定阵容侍从上阵交换
function Guard_BattleArray.LineupUpAndExchange(player,index,guard_guid1,guard_guid2)
    --guard_guid1 已上阵侍从guid
    --guard_guid1 未上阵侍从guid
    guard_guid1 = tonumber(guard_guid1)
    guard_guid2 = tonumber(guard_guid2)
    if player == nil or index == nil or guard_guid1 == nil or guard_guid2 == nil then
        return ""
    end
    --侍从1下阵
    Guard_BattleArray.LineupDown(player,index,guard_guid1)
    --侍从2上阵
    Guard_BattleArray.LineupUp(player,index,guard_guid2)
    Guard_BattleArray.RefreshLineupPanel(player)
end

--清空指定侍从阵容弹窗
function Guard_BattleArray.ClearLineup_Index(player,index)
    if player == nil or index == nil then
        return
    end
    local str = [[GlobalUtils.ShowServerBoxMessage("清空配置后无法找回，确定要清空吗？")]]
    player:SetString("SYSTEM_ConfirmBox_Function", "Guard_BattleArray.ClearLineup("..player:GetGUID()..",1,"..index..")")
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--清空所有侍从阵容弹窗
function Guard_BattleArray.ClearLineup_All(player)
    if player == nil then
        return
    end
    local str = [[GlobalUtils.ShowServerBoxMessage("清空配置后无法找回，确定要清空吗？")]]
    player:SetString("SYSTEM_ConfirmBox_Function", "Guard_BattleArray.ClearLineup("..player:GetGUID()..",2)")
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--清空阵容
function Guard_BattleArray.ClearLineup(player_guid,type,index)
    if not tonumber(player_guid) or not type then
        return
    end
    local NumToVChinese = {
        [1] = "一",
        [2] = "二",
        [3] = "三",
    }
    local player = sPlayerSystem:GetPlayerByGUID(tonumber(player_guid))
    local lineupContainer = player:GetLineupContainer()
    if type == 1 then
        if index then
            Guard_BattleArray.ChangeArrayName(player,index,"阵容"..NumToVChinese[index])
            lineupContainer:ClearLineup(index-1)
            lineupContainer:SetSeatId(index-1,1)
        else
            sLuaApp:LuaErr("清空阵容index为空")
        end
    elseif type == 2 then
        for i = 1, 3 do
            Guard_BattleArray.ChangeArrayName(player,i,"阵容"..NumToVChinese[i])
            lineupContainer:ClearLineup(i-1)
            lineupContainer:SetSeatId(i-1,1)
        end
    end
    Guard_BattleArray.RefreshLineupPanel(player)
end

--刷新阵容界面
function Guard_BattleArray.RefreshLineupPanel(player)
    if player == nil then
        return ""
    end

    local GuardGUIDList = {}

    for i = 1, 3 do
        GuardGUIDList["guard_array_"..i] = Guard_BattleArray.GetBattleArrayByIndex(player,i)
    end

    local nameList = {}
    for i = 1, 3 do
        table.insert(nameList,player:GetString("ArrayName"..i))
    end

    local lineupContainer = player:GetLineupContainer()
    local UseArrayIndex = lineupContainer:GetCurrentLineup() + 1

    local SeatList = {}
    for i = 1, 3 do
        local seatid = lineupContainer:GetSeatId(i-1)
        
        if seatid == 0 then
            seatid = 1
        end

        local seatData = SeatConfig.GetByIdLevel(seatid,1)
        SeatList[i] = {}
        SeatList[i]['name'] = seatData.Name
        local SeatContainer = player:GetSeatContainer()
        local Seat = SeatContainer:GetSeat(seatid)
        SeatList[i]['level'] = Seat.Level
    end

    local str = [[
        if GuardUI then
            GuardUI.UseGuardArray = ]]..UseArrayIndex..[[
            GuardUI.BattleArrayList = ]]..Lua_tools.serialize(GuardGUIDList)..[[
            GuardUI.GuardArrayName = ]]..Lua_tools.serialize(nameList)..[[
            GuardUI.LineupSeatList = ]]..Lua_tools.serialize(SeatList)..[[
            GuardUI.Team_Member_Refresh_Method()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end