--天梯挑战
TianTi = {}

--天梯奖励分段设置（多少排名到多少排名获得什么奖励）,和天梯奖励相对应
TianTi.AwardSectionConfig = {
    [1] = {501,1000},
    [2] = {201,500},
    [3] = {101,200},
    [4] = {51,100},
    [5] = {21,50},
    [6] = {11,20},
    [7] = {4,10},
    [8] = {3,3},
    [9] = {2,2},
    [10] = {1,1},
}

--天梯奖励({AttrList = {荣誉值属性ID, 数量 , 银币属性ID , 数量} , itemList = {物品ID,数量,是否绑定} , Text = {在客户端显示的奖励文字}})
TianTi.AwardList = {
    [1] = {AttrList = {304, 100 , 300 , 50000} , itemList = {28056,1,1} , Text = {"天梯初级礼包×1","银币×50000","荣誉值×100"}},
    [2] = {AttrList = {304, 300 , 300 , 100000} , itemList = {28056,1,1} , Text = {"天梯初级礼包×1","银币×100000","荣誉值×300"}},
    [3] = {AttrList = {304, 500 , 300 , 100000} , itemList = {28056,1,1} , Text = {"天梯初级礼包×1","银币×100000","荣誉值×500"}},
    [4] = {AttrList = {304, 600 , 300 , 100000} , itemList = {28055,1,1} , Text = {"天梯中级礼包×1","银币×100000","荣誉值×600"}},
    [5] = {AttrList = {304, 700 , 300 , 100000} , itemList = {28055,1,1} , Text = {"天梯中级礼包×1","银币×100000","荣誉值×700"}},
    [6] = {AttrList = {304, 750 , 300 , 100000} , itemList = {28054,1,1} , Text = {"天梯高级礼包×1","银币×100000","荣誉值×750"}},
    [7] = {AttrList = {304, 800 , 300 , 200000} , itemList = {28054,1,1} , Text = {"天梯高级礼包×1","银币×200000","荣誉值×800"}},
    [8] = {AttrList = {304, 900 , 300 , 200000} , itemList = {28053,1,1} , Text = {"天梯至尊礼包×1","银币×200000","荣誉值×900"}},
    [9] = {AttrList = {304, 950 , 300 , 200000} , itemList = {28053,1,1} , Text = {"天梯至尊礼包×1","银币×200000","荣誉值×950"}},
    [10] = {AttrList = {304, 1000 , 300 , 300000} , itemList = {28052,1,1} , Text = {"天梯王者礼包×1","银币×300000","荣誉值×1000"}},
}

--天梯挑战玩家刷新设置
TianTi.RefreshConfig = {
    [{1000,500}] = 15,
	[{500,200}] = 10,
	[{200,50}] = 4,
	[{50,40}] = 2,
	[{40,20}] = 1,
}

--玩家最小参与等级
TianTi.MinLevel = 35

--单次参加获得的活跃值
TianTi.Active_Add = 1

--最大活跃值
TianTi.Active_Max = 10

--每日可挑战次数
TianTi.DayBattleNum = 10

--可挑战次数不足时可用的物品
TianTi.BattleItemList = {"挑战卷轴",1}

--可挑战玩家刷新CD
TianTi.RefreshCD = 10

--每天发放奖励时间
TianTi.AwardTime = "21:00:00"

--活动界面 展示奖励 物品id
TianTi.ShowItem = "61024,20350,28052,28053,28054,28055,28056"

--战斗标识
TianTi.FightTag = 10099

-- 活动开始前回调
function TianTi.OnDeclare(id, seconds)
end
 
-- 活动开始回调
function TianTi.OnStart(id, is_normal)
    if sLadderSystem:GetLadderCount() == 0 then --如果天梯排行榜玩家为零
        if TianTiRobotConfig then
            TianTiRobotConfig.CreateRobot()--创建假人
            --初始化天梯排行榜
            sLuaTimerSystem:AddTimer(5000,1,"TianTi.RefreshTianTiRank","")
        else
            sLuaApp:LuaDbg("天梯假人配置异常")
        end
    end
    if Data then
        if not Data["TianTiScheduleId"] then
            local TianTiScheduleId = sScheduleSystem:CreateSchedule(1,TianTi.AwardTime,"TianTi","SendAwardMail","")--创建计划回调
            Data["TianTiScheduleId"] = TianTiScheduleId
        end
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
end

-- 活动结束回调
function TianTi.OnStop(id)
    
end

function TianTi.on_system_start() --系统开启回调
    if RankingListSystem.Config then
        sRanklistSystem:SetRanklistOrder(RankingListSystem.Config["天梯榜"],false)--设置排行榜排序方式
    else
        return
    end
end
--玩家点击参与回调
function TianTi.OnJoin(id, player)

    if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
        return
    end

    local team = player:GetTeam()
    if team then
        sLuaApp:NotifyTipsMsg(player, "天梯挑战是单人活动，无法组队参加")
        return
    end

	local activityData = ActivityConfig.GetById(id)
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(activityData.LevelMin) then
        sLuaApp:NotifyTipsMsg(player, "达到"..activityData.LevelMin.."级才能参加")
        return
    end

    local str = [[
        GUI.CloseWnd("ActivityPanelUI")
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
	--引导玩家到活动npc
    Lua_tools.MoveToNpc(player, 10220)

end

--玩家客户端查询数据回调
function TianTi.OnQuery(id, player)
    local join_num = player:GetDayInt("TianTi_JoinNum")
    local active_num = player:GetDayInt("TianTi_Active_Num")
    local str = join_num..":"..TianTi.DayBattleNum..":"..active_num..":"..TianTi.Active_Max..":"..TianTi.ShowItem..":2:"..(ActivitySystem.Act_GetClassify("TianTi")or'2,3,5')
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--打开主界面
function TianTi.OpenMainWnd(player)
    
    local str = [[
        GUI.OpenWnd("LadderUI")
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
    
end

--打开荣誉商店
function TianTi.OpenHonorShop(player)
    local str = [[
        GUI.OpenWnd("ShopStoreUI", "2")
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end

--打开天梯排行榜
function TianTi.OpenTianTiRank(player)
    local str = [[
        GUI.OpenWnd("RankUI", "4,1")
        ]]
    
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--打开战报窗口
function TianTi.OpenBattleRecord(player)
    local LadderRecordList = sLadderSystem:GetLadderRecordsByGUID(player:GetGUID())
    local RecordList = {}
    for k, v in pairs(LadderRecordList) do
        if v:GetTargetGUID() ~= nil then
            local list = {}
            list["InitiatorName"] = v:GetPlayerName()--发起挑战玩家名称
            if string.sub(v:GetTargetName(),-1) == "_" then--被挑战玩家名称
                list["TargetName"] = string.sub(v:GetTargetName(),1,-2)
            else
                list["TargetName"] = v:GetTargetName()
            end
            if v:GetAction() == 2 then--如果动作为替换
                if  v:GetPlayerGUID() == player:GetGUID() then--挑战者为玩家，替换说明胜利
                    list["iswin"] = true
                    list["Rank"] = v:GetPlayerRank()--战斗胜利，排名上升至XX
                elseif v:GetTargetGUID() == player:GetGUID() then--被挑战者为玩家，替换说明失败
                    list["iswin"] = false
                    list["Rank"] = v:GetTargetRank()--战斗失败，排名下降至XX
                end
            elseif v:GetAction() == 3 then --战斗胜利但是敌人排名比自己低
                list["iswin"] = true
                list["Rank"] = 0
            elseif v:GetAction() == 4 then --如果动作失败
                if  v:GetPlayerGUID() == player:GetGUID() then--挑战者为玩家，说明玩家失败
                    list["iswin"] = false
                    list["Rank"] = 0
                elseif v:GetTargetGUID() == player:GetGUID() then--被挑战者为玩家，说明玩家胜利
                    list["iswin"] = true
                    list["Rank"] = 0
                end
            end
            list["time"] = v:GetTime()
            table.insert(RecordList,list)
        end
    end

    local str = [[
        LadderUI.GetRecordData(]]..Lua_tools.serialize(RecordList)..[[)
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    --sLuaApp:LuaDbg("RecordList"..Lua_tools.serialize(RecordList))
end

--主界面刷新
function TianTi.RefreshMainWnd(player)
    --当前名次
    local rankNum = sLadderSystem:GetRankByGUID(player:GetGUID())
    --当前可得奖励
    local Awardstr = ""
    if rankNum == 0 then
        Awardstr = [[排名奖励每日晚]]..TianTi.AwardTime..[[通过邮件发送\n当前奖励为：\n没有奖励]]
    else
        local TextList = TianTi.GetAwardText(rankNum)
        Awardstr = [[排名奖励每日晚]]..TianTi.AwardTime..[[通过邮件发送\n当前奖励为：\n]]..TextList[1]..[[\n]]..TextList[2]..[[\n]]..TextList[3]
    end
    --玩家列表
    local RefreshList = TianTi.CanBattleRefresh(player)
    --可挑战次数
    local DayBattleNum = TianTi.DayBattleNum
    --剩余可挑战次数
    local JoinNum = DayBattleNum - player:GetDayInt("TianTi_JoinNum")
    --总战力
    local FightScore = player:RecalcTotalFightValue()
    local str = [[
        LadderUI.RefreshData(
        ]]..rankNum..[[,
        "]]..Awardstr..[[",
        ]]..JoinNum..[[,
        ]]..DayBattleNum..[[,
        ]]..Lua_tools.serialize(RefreshList)..[[,
        ]]..FightScore..[[
        )
    ]]
    --sLuaApp:LuaDbg(str)
    sLuaApp:ShowForm(player, "脚本表单", str)
end
 
--可挑战玩家列表
function TianTi.CanBattleRefresh(player)
    if player == nil then
        return
    end
    local rankNum = sLadderSystem:GetRankByGUID(player:GetGUID())
    local RefreshRankList = TianTi.RefreshRanklist(rankNum)
    local RefreshList = {}
    for k, v in pairs(RefreshRankList) do
        if v == 0 then
            local lineupContainer = player:GetLineupContainer()
            local NowLineup = lineupContainer:GetCurrentLineup()
            local SeatID = lineupContainer:GetSeatId(NowLineup)
            local SeatContainer = player:GetSeatContainer()
            local SeatData = SeatContainer:GetSeat(SeatID)

            --玩家侍从ID
            local GuardIdList = {}
            local GuardGUIDList = Guard_BattleArray.GetBattleArrayByIndex(player,NowLineup+1)
            for k, v in pairs(GuardGUIDList) do
                v = tonumber(v)
                if v ~= 0 then
                    local guard = sGuardSystem:GetGuardByGUID(v)
                    table.insert(GuardIdList,guard:GetId())
                else
                    table.insert(GuardIdList,0)
                end
            end
            RefreshList[k] = {}
            RefreshList[k]["Guid"] = tostring(player:GetGUID())
            RefreshList[k]["Name"] = player:GetName()
            RefreshList[k]["Rank"] = v
            RefreshList[k]["SeatId"] = SeatData.Id
            RefreshList[k]["SeatLevel"] = SeatData.Level
            RefreshList[k]["GuardIdList"] = GuardIdList
            RefreshList[k]["Score"] = player:RecalcTotalFightValue()
            RefreshList[k]["RoleID"] = player:GetAttr(ROLE_ATTR_ROLE)
            RefreshList[k]["Color1"] = player:GetAttr(ROLE_ATTR_COLOR_1)
            RefreshList[k]["Color2"] = player:GetAttr(ROLE_ATTR_COLOR_2)
            RefreshList[k]["WeaponId"] = player:GetAttr(ROLE_ATTR_WEAPON_ID)
            RefreshList[k]["EffectId"] = player:GetAttr(ROLE_ATTR_EFFECT_1)
            RefreshList[k]["VIPLevel"] = player:GetAttr(ROLE_ATTR_VIP)
        else
            local Ladder = sLadderSystem:GetLadderByRank(v)
            RefreshList[k] = {}
            RefreshList[k]["Guid"] = tostring(Ladder:GetPlayerGUID())
            if Ladder:GetType() == 17 then
                RefreshList[k]["Name"] = Ladder:GetPlayerName()
            else
                RefreshList[k]["Name"] = Ladder:GetPlayerName()
            end
            RefreshList[k]["Rank"] = Ladder:GetRank()
            RefreshList[k]["SeatId"] = Ladder:GetSeatId()
            RefreshList[k]["SeatLevel"] = Ladder:GetSeatLevel()
            RefreshList[k]["GuardIdList"] = Ladder:GetGuards()
            if Ladder:GetType() == 17 then
                --RefreshList[k]["Score"] = 40000 + (1001-Ladder:GetRank()) * sLuaApp:RandInteger(20,50)
                RefreshList[k]["Score"] = Ladder:GetTotalFightValue()*11
            else
                RefreshList[k]["Score"] = Ladder:GetTotalFightValue()
            end
            RefreshList[k]["RoleID"] = Ladder:GetAttr(ROLE_ATTR_ROLE)
            RefreshList[k]["Color1"] = Ladder:GetAttr(ROLE_ATTR_COLOR_1)
            RefreshList[k]["Color2"] = Ladder:GetAttr(ROLE_ATTR_COLOR_2)
            RefreshList[k]["WeaponId"] = Ladder:GetAttr(ROLE_ATTR_WEAPON_ID)
            RefreshList[k]["EffectId"] = Ladder:GetAttr(ROLE_ATTR_EFFECT_1)
            RefreshList[k]["VIPLevel"] = Ladder:GetAttr(ROLE_ATTR_VIP)
        end
    end
    return RefreshList
end

--开始战斗判断
function TianTi.StartBattleJudge(player,EnemyGUID)
    --可挑战次数判断
    if player:GetDayInt("TianTi_JoinNum") < TianTi.DayBattleNum then--可挑战次数足够
        TianTi.StartBattle(player,EnemyGUID)--开始战斗
    else--可挑战次数不够
        local DefectList = Lua_tools.GetDefectList(player , TianTi.BattleItemList)
        if #DefectList ~= 0 then
            sLuaApp:NotifyTipsMsg(player,"挑战卷轴不足")--挑战卷轴数量判断
            local str = [[
                if LadderBattleConfirmUI then
                    LadderBattleConfirmUI.ChallengeScrollTips()
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单",str)
        else

            local str = [[
                GlobalUtils.ShowServerBoxMessage("是否消耗<color=#FF0000ff>挑战卷轴</color>*<color=#FF0000ff>1</color>进行挑战？")
            ]]
            player:SetString("SYSTEM_ConfirmBox_Function", "TianTi.BuyItemBattle("..player:GetGUID()..","..EnemyGUID..")")

            sLuaApp:ShowForm(player, "脚本表单",str)
        end
    end

end

--开始战斗
function TianTi.StartBattle(player,EnemyGUID)
    --开始战斗
    local res = sLadderSystem:FightLadder(player,sLadderSystem:GetRankByGUID(EnemyGUID) , TianTi.FightTag , "","","")
    if res == 0 then
        --将敌方guid和敌方当前排名存在玩家身上
        player:SetString("EnemyGUID",""..tostring(EnemyGUID))
        player:SetInt("EnemyRank",sLadderSystem:GetRankByGUID(EnemyGUID))
        --添加战斗回调
        sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "TianTi", "BattleCallBack")
    end
end

--消耗挑战卷轴开始战斗
function TianTi.BuyItemBattle(playerGUID,EnemyGUID)
    local player = sPlayerSystem:GetPlayerByGUID(playerGUID)
    if Lua_tools.SubItem(player, TianTi.BattleItemList, "system", "天梯挑战", "挑战卷轴") == false then
        sLuaApp:NotifyTipsMsg(player, "道具不足")
        return
    end
    TianTi.StartBattle(player,EnemyGUID)
end

--战斗结束回调
function TianTi.BattleCallBack(player, typ, is_win, custom)
    sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "TianTi", "BattleCallBack")--删除战斗回调

    --得到自己与敌方的排名
    local PlayerRank = sLadderSystem:GetRankByGUID(player:GetGUID())
    local EnemyGUID = tonumber(player:GetString("EnemyGUID"))
    local EnemyRank = player:GetInt("EnemyRank")
    if EnemyGUID <= 0 then
        return ""
    end
    local NewEnemyRank = sLadderSystem:GetRankByGUID(EnemyGUID)
    --根据战斗结果以及双方排名刷新玩家排名（自己排名低于敌方：输排名不变，赢排名交换。自己排名高于敌方：输赢排名都不变）
    if is_win == 2 then
        if EnemyRank ~= NewEnemyRank then--敌方排名在战斗期间发生变化
            sLuaApp:NotifyTipsMsg(player, "战斗期间对方排名变动，根据对方当前排名进行本次战斗结算")
        end

        if PlayerRank > 0 and PlayerRank > NewEnemyRank then
            if sLadderSystem:ReplaceLadder(NewEnemyRank,player) == 0 then--替换玩家排名（与对方当前排名）
                if NewEnemyRank <= 100 and PlayerRank > 100 then--刷新天梯榜
                    sRanklistSystem:RemoveRank(RankingListSystem.Config["天梯榜"],EnemyGUID)
                    sRanklistSystem:UpdateRanklist(RankingListSystem.Config["天梯榜"] , player:GetGUID() , sLadderSystem:GetRankByGUID(player:GetGUID()) , player:GetName() , player:GetAttr(ROLE_ATTR_TOTAL_FIGHT_VALUE))
                elseif PlayerRank <= 100 and NewEnemyRank <= 100 then
                    local Enemy = sLadderSystem:GetLadderByGUID(EnemyGUID)
                    sRanklistSystem:RemoveRank(RankingListSystem.Config["天梯榜"],EnemyGUID)
                    sRanklistSystem:UpdateRanklist(RankingListSystem.Config["天梯榜"] , player:GetGUID() , sLadderSystem:GetRankByGUID(player:GetGUID()) , player:GetName() , player:GetAttr(ROLE_ATTR_TOTAL_FIGHT_VALUE))
                    if Enemy:GetType() == 17 then
                        sRanklistSystem:UpdateRanklist(RankingListSystem.Config["天梯榜"] , EnemyGUID , sLadderSystem:GetRankByGUID(EnemyGUID) , Enemy:GetPlayerName() , Enemy:GetTotalFightValue()*11)
                    else
                        sRanklistSystem:UpdateRanklist(RankingListSystem.Config["天梯榜"] , EnemyGUID , sLadderSystem:GetRankByGUID(EnemyGUID) , Enemy:GetPlayerName() , Enemy:GetTotalFightValue())
                    end
                end
            else
                sLuaApp:LuaDbg("玩家排名替换失败")
            end
        elseif PlayerRank == 0 then
            if sLadderSystem:ReplaceLadder(NewEnemyRank,player) ~= 0 then
                sLuaApp:LuaDbg("玩家排名替换失败")
            end
        else
            sLadderSystem:AddLadderRecordRankUnChange(NewEnemyRank,player,true)
        end
        --记下活跃度 参与次数
		local active_add = TianTi.Active_Add
		local active_max = TianTi.Active_Max
		local active = player:GetDayInt("TianTi_Active_Num")
		if active < active_max then
			local active_sum = active + active_add
			if active_sum > active_max then
				player:SetDayInt("TianTi_Active_Num", active_max)
				ActivitySystem.AddActiveVal(player, active_max - active)
			else
				player:SetDayInt("TianTi_Active_Num", active_sum)
				ActivitySystem.AddActiveVal(player, active_add)
			end
		else
			sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
		end
    else
        sLadderSystem:AddLadderRecordRankUnChange(NewEnemyRank,player,false)
    end

    --已挑战次数+1
    local JoinNum = player:GetDayInt("TianTi_JoinNum")
    if JoinNum < TianTi.DayBattleNum then
        player:SetDayInt("TianTi_JoinNum",player:GetDayInt("TianTi_JoinNum") + 1)
    end
    

    --清空存在玩家身上的敌方guid
    player:SetString("EnemyGUID","")

    --刷新挑战界面
    TianTi.RefreshMainWnd(player)

    local str = [[
        if LadderUI then
            GUI.OpenWnd("LadderUI")
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单",str)

    --拼图活动发拼图碎片
    if PinTu then
        PinTu.getPuzzleItem(player,"tianTi")
    end
    --活动战令任务
    if Act_HuoDongZhanLing then
        Act_HuoDongZhanLing.TaskFinishBack(player,"天梯")
    end
end

--发送奖励邮件
function TianTi.SendAwardMail()
    for k , v in pairs(TianTi.AwardSectionConfig) do
        local RankList = {}
        for i = v[1] , v[2] do
            table.insert(RankList,i)
        end
        local PlayerList = sLadderSystem:GetLadders(RankList)
        for key, value in pairs(PlayerList) do
            if value:GetType() ~= 17 then
                sMailSystem:SendMailEx(0, "天梯管理员" , value:GetPlayerGUID(), 1, "天梯排名奖励" , "您在天梯中排名第"..value:GetRank().."名,恭喜您获得天梯排名奖励！", TianTi.AwardList[k].AttrList, TianTi.AwardList[k].itemList,{})
            end
        end
    end
end

--根据排名获得当前奖励文字
function TianTi.GetAwardText(rank)
    local index = 0
    for k, v in pairs(TianTi.AwardSectionConfig) do
        if rank >= v[1] and rank <= v[2] then
            index = k
            break
        end
    end
    local list = TianTi.AwardList[index].Text
    return list
end

--根据玩家排名得到可挑战玩家排名列表
function TianTi.RefreshRanklist(rank)
    rank = tonumber(rank)
    local list = {}
    if rank == 0 then --排名为0（即未上榜）
		for i = 1 , 4 do
			list[5-i] = 1000-i*(15 + sLuaApp:RandInteger(3,5))
		end
		list[5] = 1000
		list[6] = rank
    elseif rank == 1000 then --排名为1000
		for i = 1 , 5 do
			list[6-i] = 1000-i*(15 + sLuaApp:RandInteger(3,5))
		end
		list[6] = rank
    elseif rank < 1000 and rank >= 20 then --排名为1000-20之间
        for k,v in pairs(TianTi.RefreshConfig) do
            if rank < k[1] and rank >= k[2] then
                for i = 1 , 4 do
		        	local randomNum = sLuaApp:RandInteger(math.ceil(v*0.2),math.ceil(v*0.4))
		        	list[5-i] = rank - i*(v + randomNum)
                end
                break
            end
        end
		list[5] = rank
		list[6] = rank + sLuaApp:RandInteger(3,5)
    elseif rank < 20 and rank >= 6 then --排名为20-6之间
		for i = 1 , 4 do
			list[5-i] = rank - i
		end
		list[5] = rank
		list[6] = rank + sLuaApp:RandInteger(3,5)
    elseif rank <= 5 and rank >=1 then --排名为6-1之间
		for i = 1 , 6 do
			if rank ~= i then
				list[i] = i
			else
				list[rank] = rank
			end
		end
	end
    return list
    
end

--天梯排行榜初始化
function TianTi.RefreshTianTiRank()
    sRanklistSystem:ClearRanklist(RankingListSystem.Config["天梯榜"])
    local rankList = {}
    for i = 1, 100 do
        rankList[i] = i
    end
    local LadderList = sLadderSystem:GetLadders(rankList)
    for k, v in pairs(LadderList) do
        if v:GetType() == 17 then
            --sRanklistSystem:UpdateRanklist(RankingListSystem.Config["天梯榜"] , v:GetPlayerGUID() , k , string.sub(v:GetPlayerName(),1,9) , v:GetAttr(ROLE_ATTR_FIGHT_VALUE))
            sRanklistSystem:UpdateRanklist(RankingListSystem.Config["天梯榜"] , v:GetPlayerGUID() , k , v:GetPlayerName() , v:GetTotalFightValue()*11)
        else
            sRanklistSystem:UpdateRanklist(RankingListSystem.Config["天梯榜"] , v:GetPlayerGUID() , k , v:GetPlayerName() , v:GetTotalFightValue())
        end
    end
end