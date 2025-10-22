--阵法系统
SeatSystem = {}

--同一阵法的阵法书增加阵法经验的增值（例如白虎阵使用白虎阵法术提升时的经验会增加400）
SeatSystem.SameSeatBook_AddScore = 400

SeatSystem.Item_AddScore = {
    ["阵法书残卷"] = 200,
    ["阵法书1"] = 600,
    ["阵法书2"] = 600,
    ["阵法书3"] = 600,
    ["阵法书4"] = 600,
    ["阵法书5"] = 600,
    ["阵法书6"] = 600,
    ["阵法书7"] = 600,
    ["阵法书8"] = 600,
    ["阵法书9"] = 600,
    ["阵法书10"] = 600,
}

SeatSystem.LearnSeat_Item = {
    [1000] = "阵法书1",
    [2000] = "阵法书2",
    [3000] = "阵法书3",
    [4000] = "阵法书4",
    [5000] = "阵法书5",
    [6000] = "阵法书6",
    [7000] = "阵法书7",
    [8000] = "阵法书8",
    [9000] = "阵法书9",
    [10000] = "阵法书10",
}

SeatSystem.ScoreItem_Config = {
    {id = 20961 , key = '阵法书残卷', addscore = 200},
    {id = 31101 , key = '阵法书1'  , addscore = 600},
    {id = 31102 , key = '阵法书2'  , addscore = 600},
    {id = 31103 , key = '阵法书3'  , addscore = 600},
    {id = 31104 , key = '阵法书4'  , addscore = 600},
    {id = 31105 , key = '阵法书5'  , addscore = 600},
    {id = 31106 , key = '阵法书6'  , addscore = 600},
    {id = 31107 , key = '阵法书7'  , addscore = 600},
    {id = 31108 , key = '阵法书8'  , addscore = 600},
    {id = 31109 , key = '阵法书9'  , addscore = 600},
    {id = 31110 , key = '阵法书10' , addscore = 600},
}

--发送经验物品Config给客户端
function SeatSystem.SendScoreItem_Config(player,SeatId)
    SeatId = tonumber(SeatId)
    if player == nil or SeatId == nil then
        return ""
    end
    local list = {}
    for k, v in pairs(SeatSystem.ScoreItem_Config) do
        list[k] = {}
        list[k]["id"] = v.id
        list[k]["key"] = v.key
        list[k]["addscore"] = v.addscore
    end

    for k, v in pairs(list) do
        if SeatSystem.LearnSeat_Item[SeatId] ~= nil and v.key == SeatSystem.LearnSeat_Item[SeatId] then
            v.addscore = v.addscore + SeatSystem.SameSeatBook_AddScore
        end
    end
    if SeatSystem.ScoreItem_Config then
        local str = [[
            if BattleSeatUI then
                ExpUpdateUI.ScoreItem_Config = ]]..Lua_tools.serialize(list)..[[
                ExpUpdateUI.InitData()
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--获取阵法界面信息
function SeatSystem.GetSeatData(player,index)
    if player == nil or index == nil then
        return ""
    end
    index = tonumber(index)-1
    local SeatContainer = player:GetSeatContainer()
    local lineupContainer = player:GetLineupContainer()
    local LineupUsingSeat = lineupContainer:GetSeatId(index)
    if LineupUsingSeat == 0 then
        LineupUsingSeat = 1
    end
    local SeatList = SeatContainer:GetSeats()
    local CanLearnSeatList = SeatSystem.CanLearnSeat(player)
    local str = [[
        if BattleSeatUI then
            BattleSeatUI.LineupUsingSeat = ]]..LineupUsingSeat..[[
            BattleSeatUI.CanLearnSeatList = ]]..Lua_tools.serialize(CanLearnSeatList)..[[
            BattleSeatUI.SeatListData = ]]..Lua_tools.serialize(SeatList)..[[
            BattleSeatUI.ShowSeatInfos()
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end

--获取阵容阵法
function SeatSystem.GetLineUpSeat(player,index)--index=当前打开的阵容界面index
    if player == nil or tonumber(index) == nil then
        return ""
    end
    index = tonumber(index)
    local lineupContainer = player:GetLineupContainer()
    local LineupIndex = lineupContainer:GetCurrentLineup()
    local LineupSeatId = lineupContainer:GetSeatId(index-1)

    local str = [[
        BattleSeatUI.EquippedCurSeatID = tonumber(]]..LineupSeatId..[[)
        BattleSeatUI.CurArrayID = tonumber(]]..(LineupIndex + 1)..[[)
        BattleSeatUI.GetServerData()
        BattleSeatUI.Switch_ActiveArrayBtn(tonumber(]]..index..[[))
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end

--设置阵容阵法
function SeatSystem.SetLineUpSeat(player,index,seatid)
    if player == nil or index == nil or seatid == nil then
        return ""
    end

    --if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法设置阵法！')
    --    return
    --end

    local lineupContainer = player:GetLineupContainer()
    if lineupContainer:SetSeatId(index-1,seatid) == true then
        sLuaApp:NotifyTipsMsg(player , '阵法设置成功')
        Guard_BattleArray.RefreshLineupPanel(player)
        
    --组队界面阵法名刷新
    local team = player:GetTeam()
    if team == nil then
        SeatSystem.SetSeatNameLevel(player)
    else
        local TeamMembers = team:GetTeamMembers(true)
        for k, v in pairs(TeamMembers) do
            SeatSystem.MembersSetSeatNameLevel(v)
        end
    end
    else
        sLuaApp:NotifyTipsMsg(player , '阵法设置失败')
    end
end

--启用阵容
function SeatSystem.SetUsingLineUp(player,index)
    if player == nil or index == nil then
        return ""
    end
    --if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
    local lineupContainer = player:GetLineupContainer()
    lineupContainer:SetCurrentLineup(index-1)
    --刷新
    SeatSystem.GetLineUpSeat(player,index)
    Guard_BattleArray.RefreshLineupPanel(player)

    --组队界面阵法名刷新
    local team = player:GetTeam()
    if team == nil then
        SeatSystem.SetSeatNameLevel(player)
    else
        local TeamMembers = team:GetTeamMembers(true)
        for k, v in pairs(TeamMembers) do
            SeatSystem.MembersSetSeatNameLevel(v)
        end
    end
end

--交换阵容侍从
function SeatSystem.LineupExchange(player,index,site1,site2)
    if player == nil or index == nil or site1 == nil or site2 == nil then
        return ""
    end
    --if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
    local str = ""
    local lineupContainer = player:GetLineupContainer()
    local team = player:GetTeam()
    if team then
        local memberlist = lineupContainer:GetTeamLineup(index-1)
        if memberlist[site1-1]:GetType() ~= memberlist[site2-1]:GetType() then
            sLuaApp:NotifyTipsMsg(player , '玩家无法和侍从交换位置！')
            return ""
        end
        FormTeam.SwapMember(player, memberlist[site1-1]:GetGUID(), memberlist[site2-1]:GetGUID())
    else
        if lineupContainer:SwapLineup(index-1 ,site1-2,site2-2) then --第一位是player并且接口下标从0开始，所以位置减2
            local SeatGUIDList = SeatSystem.GetSeatGUIDList(player,index)
            str = [[
                if TeamPanelUI then
                    TeamPanelUI.guardsPosition = ]]..Lua_tools.serialize(SeatGUIDList)..[[
                    TeamPanelUI.OnTeamInfoUpdate(8)
                end
            ]]
        else
            sLuaApp:LuaErr("交换阵容侍从位置错误")
        end
    end

    str = str..[[
        if BattleSeatUI and BattleSeatUI.lineupExchangeCallBack then
            BattleSeatUI.lineupExchangeCallBack()
        end
        ]]
    SeatSystem.SetSeatNameLevel(player)
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--可学习阵法
function SeatSystem.CanLearnSeat(player)
    if player == nil then
        return ""
    end
    local CanLearnSeatList = {}
    local SeatContainer = player:GetSeatContainer()
    if SeatSystem.LearnSeat_Item then
        for k, v in pairs(SeatSystem.LearnSeat_Item) do
            local ItemId = sItemSystem:GetItemIdByKeyname(v)
            local SeatList = SeatContainer:GetSeat(k)
            if sItemSystem:GetItemAmount(player,ItemId,3) >= 1 and Lua_tools.tablecount(SeatList) <= 0 then
                table.insert(CanLearnSeatList,k)
            end
        end
    end
    return CanLearnSeatList
end

--学习阵法（阵法界面学习）
function SeatSystem.LearnSeat(player,SeatId)
    if player == nil or SeatId == nil then
        return false
    end
    SeatId = tonumber(SeatId)
    local SeatContainer = player:GetSeatContainer()
    local NeedItemKey = SeatSystem.LearnSeat_Item[SeatId]
    local NeedItemId = sItemSystem:GetItemIdByKeyname(NeedItemKey)
    local seatData = SeatConfig.GetByIdLevel(SeatId,1)
    if sItemSystem:GetItemAmount(player,NeedItemId,3) >= 1 then
        if sItemSystem:ConsumeItemWithId(player,NeedItemId,1,3,"system","学习阵法","学习阵法消耗") == 0 then
            if SeatContainer:EnableSeat(SeatId) then
                sLuaApp:NotifyTipsMsg(player , '已习得阵法['..seatData.Name..']')
                local str = [[
                    if BattleSeatUI then
                        BattleSeatUI.SelectedSeatId = ]]..SeatId..[[
                        BattleSeatUI.GetServerData()
                    end
                ]]
    
                sLuaApp:ShowForm(player, "脚本表单", str)
                if Achievement then
                    Achievement.Achievement_Battle_Array(player,1)
                end
                return true
            else
                sLuaApp:NotifyTipsMsg(player , '激活阵法失败')
                return false
            end
        else
            sLuaApp:NotifyTipsMsg(player , '使用阵法残卷失败')
            return false
        end
    else
        sLuaApp:NotifyTipsMsg(player , '您的阵法书数量不足')
        return false
    end
    return false
end

--学习阵法(直接使用物品)
function SeatSystem.LearnSeatUseItem(player,SeatId)
    if player == nil or SeatId == nil then
        return false
    end
    SeatId = tonumber(SeatId)
    local SeatContainer = player:GetSeatContainer()
    local seatData = SeatConfig.GetByIdLevel(SeatId,1)
    if SeatContainer:EnableSeat(SeatId) then
        sLuaApp:NotifyTipsMsg(player , '已习得阵法['..seatData.Name..']')
        local str = [[
            if BattleSeatUI then
                BattleSeatUI.SelectedSeatId = ]]..SeatId..[[
                BattleSeatUI.GetServerData()
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        if Achievement then
            Achievement.Achievement_Battle_Array(player,1)
        end
        return true
    else
        return false
    end
end

--获取阵容侍从信息
function SeatSystem.GetGuardList(player,index)
    if player == nil or index == nil then
        return ""
    end
    local SeatGUIDList = SeatSystem.GetSeatGUIDList(player,index)
    local str = [[
        if BattleSeatUI then
            BattleSeatUI.GuardListData = ]]..Lua_tools.serialize(SeatGUIDList)..[[
            BattleSeatUI.ShowEffectInfos()
        end
    ]]
    --sLuaApp:LuaDbg(""..str)
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function SeatSystem.GetSeatGUIDList(player,index)
    if player == nil or index == nil then
        return ""
    end
    local team = player:GetTeam()
    local SeatGUIDList = {}
    if team == nil then
        table.insert(SeatGUIDList,tostring(player:GetGUID()))
        local GuardGUIDList = Guard_BattleArray.GetBattleArrayByIndex(player,index)
        for k, v in pairs(GuardGUIDList) do
            table.insert(SeatGUIDList,v)
        end 
    else
        local TeamLeaderGUID = team:GetTeamLeaderGUID()
        table.insert(SeatGUIDList,tostring(TeamLeaderGUID))
        local LineupContainer = player:GetLineupContainer()
        local GuardGUIDList = LineupContainer:GetTeamLineup()
        for i = 1, 4 do
            if GuardGUIDList[i] ~= nil then
                table.insert(SeatGUIDList,tostring(GuardGUIDList[i]:GetGUID()))
            else
                table.insert(SeatGUIDList,'0')
            end
        end 
    end
    return SeatGUIDList
end

--消耗物品增加阵法经验
function SeatSystem.AddSeatScore(player,SeatId,itemStr)
    if player == nil or SeatId == nil or itemStr == nil then
        return
    end
    SeatId = tonumber(SeatId)
    if SeatId <= 0 then
        return
    end
    local itemList_1 = sLuaApp:StrSplit(itemStr , '_')
    local itemList = {}
    --将itemList_1中的数字str进行tonumber
    for k, v in pairs(itemList_1) do
        if tonumber(v) == nil then
            itemList[k] = v
        else
            itemList[k] = tonumber(v)
        end
    end

    local item_score = 0

    local MaxLevel = SeatSystem.GetSeatMaxLevel(player,SeatId)
    local SeatContainer = player:GetSeatContainer()
    local old_Seat = SeatContainer:GetSeat(SeatId)

    if old_Seat.Level == MaxLevel then
        sLuaApp:NotifyTipsMsg(player , '此阵法已达到最大等级，无法继续升级')
        return
    end
    --扣除物品计算对应阵法经验
    if itemList then
        local IsSuccess = true
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							num = itemList[k+1]
						end
					end

                    local Seat = SeatContainer:GetSeat(SeatId)
                    local HaveScore = Seat.Score
                    --local NeedScore = seatData.UpExp
					if num > 0 then
                        --物品所含积分
                        local SeatBookScore = 0
                        if SeatSystem.LearnSeat_Item[SeatId] ~= nil and SeatSystem.LearnSeat_Item[SeatId] == item then
                            SeatBookScore = SeatSystem.Item_AddScore[item] + SeatSystem.SameSeatBook_AddScore
                        else
                            SeatBookScore = SeatSystem.Item_AddScore[item]
                        end

                        item_score = SeatBookScore * num
                        --升至满级所需积分
                        local seatData = SeatConfig.GetByIdLevel(SeatId,Seat.Level)
                        local MaxLevelNeedScore = seatData.UpExp - HaveScore
                        for i = (Seat.Level + 1), MaxLevel-1 do
                            local i_seatData = SeatConfig.GetByIdLevel(SeatId,i)
                            MaxLevelNeedScore = MaxLevelNeedScore + i_seatData.UpExp
                        end
                        if item_score < MaxLevelNeedScore then --如果物品包含积分小于升至满级所需经验
                            if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), num, 3, 'system', '阵法经验', '消耗物品增加阵法经验') ~= 0 then
                                sLuaApp:NotifyTipsMsg(player , '扣除物品失败')
                                return ""
                            else
                                IsSuccess = SeatSystem.SeatLevelup(player,SeatId,item_score,MaxLevel)
                            end
                        else   --如果物品包含积分大于等于升至满级所需经验
							if item_score-MaxLevelNeedScore < SeatBookScore then
								if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), num, 3, 'system', '阵法经验', '消耗物品增加阵法经验') ~= 0 then
									sLuaApp:NotifyTipsMsg(player , '扣除物品失败')
									return ""
								else
									IsSuccess = SeatSystem.SeatLevelup(player,SeatId,MaxLevelNeedScore,MaxLevel)
								end
							else
								--剩余物品数量
								local SurplusItemNum = math.floor((item_score - MaxLevelNeedScore) / SeatBookScore)
								local NeedItemNum = num - SurplusItemNum
								if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), NeedItemNum, 3, 'system', '阵法经验', '消耗物品增加阵法经验') ~= 0 then
									sLuaApp:NotifyTipsMsg(player , '扣除物品失败')
									return ""
								else
									IsSuccess = SeatSystem.SeatLevelup(player,SeatId,MaxLevelNeedScore,MaxLevel)
								end
							end
                        end
					end
				end
			end
		end
        if IsSuccess then
            local team = player:GetTeam()
            if team == nil then
                SeatSystem.SetSeatNameLevel(player)
            else
                local TeamMembers = team:GetTeamMembers(true)
                for k, v in pairs(TeamMembers) do
                    SeatSystem.MembersSetSeatNameLevel(v)
                end
            end
            sLuaApp:NotifyTipsMsg(player , '使用成功')
            --获取新的阵法数据发送给客户端刷新
            local SeatContainer = player:GetSeatContainer()
            local NewSeat = SeatContainer:GetSeat(SeatId)
            --sLuaApp:LuaDbg("NewSeat ============ "..Lua_tools.serialize(NewSeat))
            local str = [[
                if ExpUpdateUI then
                    ExpUpdateUI.BattleSeatInfo = ]]..Lua_tools.serialize(NewSeat)..[[
                    ExpUpdateUI.RefreshAllPage()
                    BattleSeatUI.GetServerData()
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
	end
end

--增加阵法经验以及升级
function SeatSystem.SeatLevelup(player,SeatId,AddScore,MaxLevel)
    if player == nil or SeatId == nil or AddScore == nil or MaxLevel == nil then
        return
    end
    local IsSuccess = true
    while AddScore > 0 do
        local SeatContainer = player:GetSeatContainer()
        local Seat = SeatContainer:GetSeat(SeatId)
        local seatData = SeatConfig.GetByIdLevel(SeatId,Seat.Level)
        local HaveScore = Seat.Score
        local NeedScore = seatData.UpExp
        if AddScore >= (NeedScore-HaveScore) then
            AddScore = AddScore - (NeedScore - HaveScore)
            if Seat.Level+1 <= MaxLevel then
                if SeatContainer:SetSeatLevel(SeatId,Seat.Level+1) and SeatContainer:SetSeatScore(SeatId,0) then
                    if Achievement then
                        Achievement.Achievement_Battle_Array(player,Seat.Level+1)
                    end
                else
                    IsSuccess = false
                end
            else
                IsSuccess = false
            end
        else
            if SeatContainer:SetSeatScore(SeatId,AddScore + HaveScore) then
                AddScore = 0
            else
                AddScore = 0
                IsSuccess = false
            end
        end
    end
    return IsSuccess
end

--获取阵法最大等级
function SeatSystem.GetSeatMaxLevel(player,SeatId)
    if player == nil or SeatId == nil then
        return
    end
    local MaxLevel = 0
    for i = 1, 50 do
        local seatData = SeatConfig.GetByIdLevel(SeatId,i)
        if seatData.LevelUp == 0 then
            MaxLevel = seatData.Level
            break
        end
    end
    return MaxLevel
end

--玩家登陆回调
function SeatSystem.on_player_login(player)
    if player == nil then
        return
    end
    local team = player:GetTeam()
    if team then
        SeatSystem.MembersSetSeatNameLevel(player)
    else
        SeatSystem.SetSeatNameLevel(player)
    end
end

--玩家加入队伍回调
function SeatSystem.on_join_team(player)
    if player == nil then
        return
    end
    SeatSystem.MembersSetSeatNameLevel(player)
end

--队伍队长变动回调
function SeatSystem.on_set_team_leader(player,team)
    if player == nil or team == nil then
        return
    end
    local TeamMembers = team:GetTeamMembers(true)
    for k, v in pairs(TeamMembers) do
        SeatSystem.MembersSetSeatNameLevel(v)
    end
end

--玩家退出队伍回调
function SeatSystem.on_leave_team(player)
    if player == nil then
        return
    end
    SeatSystem.SetSeatNameLevel(player)
end

--队员储存队长的阵法信息
function SeatSystem.MembersSetSeatNameLevel(player)
    if player == nil then
        return
    end

    local team = player:GetTeam()
    if team then
        local TeamLeader = team:GetTeamLeader()
        local lineupContainer = TeamLeader:GetLineupContainer()
        local SeatContainer = TeamLeader:GetSeatContainer()
        local NowLineup = lineupContainer:GetCurrentLineup()
        local SeatID = lineupContainer:GetSeatId(NowLineup)
        local seatData = SeatConfig.GetByIdLevel(SeatID,1)
        if seatData == nil then
            return
        end
        local seatName = seatData.Name
        local seatDataTable = SeatContainer:GetSeat(SeatID)
        local seatLevel = seatDataTable.Level
        if seatName == '普通阵' then
            seatLevel = 0
        end
        local str = [[
            if UIDefine then
                UIDefine.SeatName = "]]..seatName..[["
                UIDefine.SeatLevel = ]]..seatLevel..[[
                UIDefine.NowLineup = ]]..(NowLineup+1)..[[
                UIDefine.SeatID = ]]..SeatID..[[
                if MainUI then
                    MainUI.OnSynTeamSeatInfo()
                end
            end
        ]]
    
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--储存自己的阵法信息
function SeatSystem.SetSeatNameLevel(player)
    if player == nil then
        return
    end
    --local team = player:GetTeam()
    local lineupContainer = player:GetLineupContainer()
    local SeatContainer = player:GetSeatContainer()
    local NowLineup = lineupContainer:GetCurrentLineup()
    local SeatID = lineupContainer:GetSeatId(NowLineup)
    local seatData = SeatConfig.GetByIdLevel(SeatID,1)
    if seatData == nil then
        return
    end
    local seatName = seatData.Name
    local seatDataTable = SeatContainer:GetSeat(SeatID)
    local seatLevel = seatDataTable.Level
    if seatName == '普通阵' then
        seatLevel = 0
    end
    local str = [[
        if UIDefine then
            UIDefine.SeatName = "]]..seatName..[["
            UIDefine.SeatLevel = ]]..seatLevel..[[
            UIDefine.NowLineup = ]]..(NowLineup+1)..[[
            UIDefine.SeatID = ]]..SeatID..[[
            if MainUI then
                MainUI.OnSynTeamSeatInfo()
            end
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end

--判断已有阵法是否全部满级(队伍界面小红点显示)
function SeatSystem.IsAllSeatMaxLevel(player)
    if not player then
        return
    end
    local NotMaxLevel = false
    local SeatContainer = player:GetSeatContainer()
    local SeatList = SeatContainer:GetSeats()
    --local SeatNum = Lua_tools.tablecount(SeatSystem.LearnSeat_Item)+1
    --if #SeatList < SeatNum then
    --    IsAllMaxLevel = false
    --else
        for k, v in pairs(SeatList) do
            local MaxLevel = SeatSystem.GetSeatMaxLevel(player,v.Id)
            if v.Level < MaxLevel then
                NotMaxLevel = true
                break
            end
        end
    --end
    local Learned_SeatList = {}
    for k, v in pairs(SeatList) do
        table.insert(Learned_SeatList,v.Id)
    end
    local str = [[
        if GlobalProcessing then
            if GlobalProcessing.seat_register_message then
                GlobalProcessing.seat_register_message()
            end
            GlobalProcessing.learning_seat_list = ]]..Lua_tools.serialize(Learned_SeatList)..[[
            GlobalProcessing.battle_seat_red = ]]..tostring(NotMaxLevel)..[[
            if GlobalProcessing.is_show_battle_seat_red then
                GlobalProcessing.is_show_battle_seat_red()
            end
        end
        
        if TeamPanelUI then
            local wnd = GUI.GetWnd('TeamPanelUI')
            if GUI.GetVisible(wnd) then
                if TeamPanelUI.is_show_b_seat_red then
                    TeamPanelUI.is_show_b_seat_red()
                end
            end
        end 
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end