--武道大会
Act_WuDaoHui = {}

--报名费用
Act_WuDaoHui.ApplyMoney = 20000

--战斗标签
Act_WuDaoHui.FightTag = 15000

--玩家最大死亡（失败）次数
Act_WuDaoHui.Deaths = 3

--匹配战斗间隔（秒）
Act_WuDaoHui.ArrangeFight_interval = 20

--武道大会最大参与人数
Act_WuDaoHui.MaxJoinNum = 200

--地图Id
Act_WuDaoHui.MapID = 234

--战斗获得积分
Act_WuDaoHui.FightScore = {
    [1] = 20, --失败
    [2] = 100, --胜利
    [3] = 20, --逃跑
    [4] = 50, --平局
}

--武道大会活动状态
Act_WuDaoHui.Act_Stage ={
    close = 0, --关闭
    setout = 1, --准备
    fighting = 2, --战斗中
    finish = 3 --结束中
}

--武道大会活动状态持续时间（秒）
Act_WuDaoHui.Act_Stage_Time ={
    setout = 5*60, --准备
    fighting = 50*60, --战斗中
    finish = 5*60 --结束中
}

--战斗奖励
Act_WuDaoHui.Fight_Award = {
    item = {"修炼丹" , 5 , 0 , "装备强化石" , 10 , 0 , "高级宝石福袋" , 1 , 0 , "100奇遇值" , 3 , 0 },
    Exp = "level * 500",
    MoneyType = 5,
    MoneyVal = "level * 50",
    BuildNum = 20
}

--胜利奖励
Act_WuDaoHui.Win_Award = {
    ItemList = {"修炼丹" , 5 , 0 , "装备强化石" , 10 , 0 , "高级宝石福袋" , 1 , 0},
}

--存活奖励
Act_WuDaoHui.Alive_Award = {
    ItemList = {"修炼丹" , 5 , 0 , "装备强化石" , 10 , 0 , "高级宝石福袋" , 1 , 0},
}

--活动界面 展示奖励 物品id
Act_WuDaoHui.ShowItem = "61024,61025,61030,61029,61022"

--安全区域坐标及范围
Act_WuDaoHui.SafeArea = {
    Blue = {x = 38 , y = 240 , range = 20},
    Red = {x = 329 , y = 28 , range = 20},
}

--战场外NPC
Act_WuDaoHui.OutsideNPCData = {
    {id = 10243 , key = "战场传送员"}
}

--战场内NPC
Act_WuDaoHui.InsideNPCData = {
    {id = 10308 , key = "一棵树" , x = 182 , y = 145 , mapkey = "对战地图"},
    {id = 10244 , key = "红方传送员" , x = 329 , y = 28 , mapkey = "对战地图"},
    {id = 10245 , key = "蓝方传送员" , x = 38 , y = 240 , mapkey = "对战地图"},
}

-- 活动开始前回调
function Act_WuDaoHui.OnDeclare(id, seconds)
end
 
-- 活动开始回调
function Act_WuDaoHui.OnStart(id, is_normal)
    if Data then
        Data["WuDaoHui"] = {}
        Data["WuDaoHui"]["Player_List"] = {}
        Data["WuDaoHui"]["BlueTeam"] = {}
        Data["WuDaoHui"]["RedTeam"] = {}
        Data["WuDaoHui"]['Win_Team'] = 0
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
    --Act_WuDaoHui.CreateNPC()
    local Map = sMapSystem:GetMapByKey("对战地图")
    --添加触发器
    sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN , "Act_WuDaoHui", "on_player_login")
    sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PRE_JUMP_MAP , "Act_WuDaoHui", "on_pre_jump_map")
    if Map then
        sTriggerSystem:AddTrigger(Map, TRIGGER_ON_ENTER_MAP, "Act_WuDaoHui", "OnEnterMap")
        sTriggerSystem:AddTrigger(Map, TRIGGER_ON_ENCOUNTER, "Act_WuDaoHui", "on_encounter")
    end

    --设置阻挡点
    Map:SetDynBlockPts({70,275,100,255,265,40,298,60})
    
    ActOpenInformWnd.StartInform(id)
    Act_WuDaoHui.Act_Start(id)
end

-- 活动结束回调
function Act_WuDaoHui.OnStop(id)
    --移除触发器
    sTriggerSystem:DelTrigger(sSystem, TRIGGER_ON_LOGIN , "Act_WuDaoHui", "on_player_login")
    sTriggerSystem:DelTrigger(sSystem, TRIGGER_ON_PRE_JUMP_MAP , "Act_WuDaoHui", "on_pre_jump_map")
    local Map = sMapSystem:GetMapByKey("对战地图")
    if Map then
        sTriggerSystem:DelTrigger(Map, TRIGGER_ON_ENTER_MAP, "Act_WuDaoHui", "OnEnterMap")
        sTriggerSystem:DelTrigger(Map, TRIGGER_ON_ENCOUNTER, "Act_WuDaoHui", "on_encounter")
    end
    
end

--玩家点击参与回调
function Act_WuDaoHui.OnJoin(id, player)
    if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
        return
    end

    local team = player:GetTeam()
    if team then
        sLuaApp:NotifyTipsMsg(player, "武道大会是单人活动，无法组队参加！")
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
    Lua_tools.MoveToNpc(player, 10243)
end

function Act_WuDaoHui.OnQuery(id, player)
    local join_num = player:GetDayInt("WuDaoHui_JoinNum")

    local str = join_num..":1:0:0:"..Act_WuDaoHui.ShowItem..":2:"..ActivitySystem.Act_GetClassify("Act_WuDaoHui")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--活动开始
function Act_WuDaoHui.Act_Start(id)
    if id == nil then
        return
    end
    if sLuaApp:IsActivityRunning(id) then
        sVarSystem:SetInt("WuDaoHui_Stage",Act_WuDaoHui.Act_Stage.setout)
        local SetoutTime = sLuaApp:GetTimes() + Act_WuDaoHui.Act_Stage_Time.setout
        sVarSystem:SetInt("WuDaoHui_StageEndTime",SetoutTime)
        sLuaTimerSystem:AddTimer(Act_WuDaoHui.Act_Stage_Time.setout*1000, 1 ,"Act_WuDaoHui.Act_StageChange","")
    end
end

--活动状态改变
function Act_WuDaoHui.Act_StageChange()
    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then --当前状态为准备
        --分配阵营
        if Act_WuDaoHui.TeamAllocation() == false then
            return
        end
        sVarSystem:SetInt("WuDaoHui_Stage",Act_WuDaoHui.Act_Stage.fighting)
        local SetoutTime = sLuaApp:GetTimes() + Act_WuDaoHui.Act_Stage_Time.fighting
        sVarSystem:SetInt("WuDaoHui_StageEndTime",SetoutTime)
        local Stage_Timer = sLuaTimerSystem:AddTimer(Act_WuDaoHui.Act_Stage_Time.fighting*1000, 1 ,"Act_WuDaoHui.Act_StageChange","")--增加活动状态改变定时器
        local Fight_Timer = sLuaTimerSystem:AddTimer(Act_WuDaoHui.ArrangeFight_interval*1000, -1 ,"Act_WuDaoHui.ArrangeFight","")--增加匹配战斗定时器
        sVarSystem:SetInt("WuDaoHui_Stage_Timer",Stage_Timer)
        sVarSystem:SetInt("WuDaoHui_Fight_Timer",Fight_Timer)
        Act_WuDaoHui.RefreshUpUI() --刷新上方UI
        if Data then --传送入安全区域
            for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if player then
                    local CanMovePoint = sMapSystem:GetRandomPoint(sMapSystem:GetMapByKey("对战地图"),Act_WuDaoHui.SafeArea.Blue.x , Act_WuDaoHui.SafeArea.Blue.y , Act_WuDaoHui.SafeArea.Blue.range)
                    sMapSystem:Jump(player,sMapSystem:GetMapByKey("对战地图"),CanMovePoint['x'],CanMovePoint['y'],0)
                    --刷新右侧信息栏
                    local RightMsgList = Act_WuDaoHui.GetRightUIData(player)
                    local str = [[
                        TrackUI.RightMsgList = ]]..Lua_tools.serialize(RightMsgList)..[[
                        TrackUI.UpdateFightInfo3Data()
                    ]]
                    sLuaApp:ShowForm(player, "脚本表单", str)
                end
            end
            for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if player then
                    local CanMovePoint = sMapSystem:GetRandomPoint(sMapSystem:GetMapByKey("对战地图"),Act_WuDaoHui.SafeArea.Red.x , Act_WuDaoHui.SafeArea.Red.y , Act_WuDaoHui.SafeArea.Red.range)
                    sMapSystem:Jump(player,sMapSystem:GetMapByKey("对战地图"),CanMovePoint['x'],CanMovePoint['y'],0)
                    --刷新右侧信息栏
                    local RightMsgList = Act_WuDaoHui.GetRightUIData(player)
                    local str = [[
                        TrackUI.RightMsgList = ]]..Lua_tools.serialize(RightMsgList)..[[
                        TrackUI.UpdateFightInfo3Data()
                    ]]
                    sLuaApp:ShowForm(player, "脚本表单", str)
                end
            end
        else
            sLuaApp:LuaErr("缺少Data文件")
            return
        end
    elseif sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then--当前状态为战斗中
        sLuaTimerSystem:DisableTimer(sVarSystem:GetInt("WuDaoHui_Stage_Timer")) --删除活动状态定时器
        sLuaTimerSystem:DisableTimer(sVarSystem:GetInt("WuDaoHui_Fight_Timer")) --删除匹配战斗定时器
        sVarSystem:SetInt("WuDaoHui_Stage",Act_WuDaoHui.Act_Stage.finish)
        local SetoutTime = sLuaApp:GetTimes() + Act_WuDaoHui.Act_Stage_Time.finish
        sVarSystem:SetInt("WuDaoHui_StageEndTime",SetoutTime)
        sLuaTimerSystem:AddTimer(Act_WuDaoHui.Act_Stage_Time.finish*1000, 1 ,"Act_WuDaoHui.Act_Finish","")--增加活动状态改变定时器
        Act_WuDaoHui.RefreshUpUI() --刷新上方UI

        if Data["WuDaoHui"]['Win_Team'] == 0 or not Data["WuDaoHui"]['Win_Team'] then
            sFightSystem:StopTagFight(Act_WuDaoHui.FightTag,1) --强行结束所有进行中的战斗，都判负
            if Data then ---判断胜负
                local BlueScore = Data["WuDaoHui"]["BlueTeam"]["TeamScore"]
                local RedScore = Data["WuDaoHui"]["RedTeam"]["TeamScore"]
                if BlueScore > RedScore then
                    Data["WuDaoHui"]['Win_Team'] = 1
                elseif BlueScore < RedScore then
                    Data["WuDaoHui"]['Win_Team'] = 2
                elseif BlueScore == RedScore then
                    local Blue_PlayerNum = Data["WuDaoHui"]["BlueTeam"]["InMapPlayerNum"]
                    local Red_PlayerNum = Data["WuDaoHui"]["RedTeam"]["InMapPlayerNum"]
                    if Blue_PlayerNum > Red_PlayerNum then
                        Data["WuDaoHui"]['Win_Team'] = 1
                    elseif Blue_PlayerNum < Red_PlayerNum then
                        Data["WuDaoHui"]['Win_Team'] = 2
                    elseif Blue_PlayerNum == Red_PlayerNum then --平局
                        Data["WuDaoHui"]['Win_Team'] = 3
                    end
                end
            else
                sLuaApp:LuaErr("缺少Data文件")
                return
            end
        end

        --创建宝箱NPC
        Act_WuDaoHui.CreateBoxNPC()
        --删除buff
        if Data then
            for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if player then
                    local BuffContainer = player:GetBuffContainer()
                    local BlueBuff = BuffContainer:GetBuff(14)
                    if BlueBuff then
                        BuffContainer:DestroyBuff(BlueBuff)
                    end
                end
            end
            for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if player then
                    local BuffContainer = player:GetBuffContainer()
                    local RedBuff = BuffContainer:GetBuff(15)
                    if RedBuff then
                        BuffContainer:DestroyBuff(RedBuff)
                    end
                end
            end
        else
            sLuaApp:LuaErr("缺少Data文件")
            return
        end
    elseif sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.finish then--当前状态为结束中
        return
    end
end

--活动结束
function Act_WuDaoHui.Act_Finish()
    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.finish then--当前状态为结束中
        --sLuaApp:LuaDbg("活动状态变为关闭")
        sVarSystem:SetInt("WuDaoHui_Stage",Act_WuDaoHui.Act_Stage.close)
        --发送存活奖励和胜利奖励
        sLuaTimerSystem:AddDelayer(1000,"Act_WuDaoHui.SendAliveAward","")
        sLuaTimerSystem:AddDelayer(1000,"Act_WuDaoHui.SendWinAward","")
        --删除buff
        if Data then
            for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if player then
                    local BuffContainer = player:GetBuffContainer()
                    local BlueBuff = BuffContainer:GetBuff(14)
                    if BlueBuff then
                        BuffContainer:DestroyBuff(BlueBuff)
                    end
                    Act_WuDaoHui.ClearPlayerData(player)
                end
            end
            for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if player then
                    local BuffContainer = player:GetBuffContainer()
                    local RedBuff = BuffContainer:GetBuff(15)
                    if RedBuff then
                        BuffContainer:DestroyBuff(RedBuff)
                    end
                    Act_WuDaoHui.ClearPlayerData(player)
                end
            end
        else
            sLuaApp:LuaErr("缺少Data文件")
            return
        end
        sMapSystem:ForeachCall(sMapSystem:GetMapByKey("对战地图"),"Act_WuDaoHui","ExitToChangAn","")
        sVarSystem:SetInt("WuDaoHui_Stage",0)
        sVarSystem:SetInt("WuDaoHui_StageEndTime",0)
        sVarSystem:SetInt("WuDaoHui_Fight_Timer",0)
        sVarSystem:SetInt("WuDaoHui_Stage_Timer",0)
    end
end

--玩家参加活动
function Act_WuDaoHui.Join_WuDaoHui(PlayerGuid)
    if tonumber(PlayerGuid) == nil then
        return
    end
    local player = sPlayerSystem:GetPlayerByGUID(tonumber(PlayerGuid))

    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then
        sLuaApp:NotifyTipsMsg(player, "活动已经进入战斗阶段，无法参加。")
        return
    end

    if Lua_tools.tablecount(Data["WuDaoHui"]["Player_List"]) <= Act_WuDaoHui.MaxJoinNum then
        if player:SubBindGold(Act_WuDaoHui.ApplyMoney,"system","武道大会","武道大会参加消耗") then
            sLuaApp:NotifyTipsMsg(player, "已消耗"..Act_WuDaoHui.ApplyMoney.."银币")
            Act_WuDaoHui.ClearPlayerData(player)
            local BuffContainer = player:GetBuffContainer()
            local BlueBuff = BuffContainer:GetBuff(14)
            if BlueBuff then
                BuffContainer:DestroyBuff(BlueBuff)
            end
            local RedBuff = BuffContainer:GetBuff(15)
            if RedBuff then
                BuffContainer:DestroyBuff(RedBuff)
            end
            local Map = sMapSystem:GetMapById(Act_WuDaoHui.MapID)
            local CanMovePoint = sMapSystem:GetRandomPoint(Map,182,145,40)
            if sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0) then
                sLuaApp:NotifyTipsMsg(player, "进入战场！")
                player:SetDayInt("WuDaoHui_Deaths",Act_WuDaoHui.Deaths)
                player:SetDayInt("OpenWuDaoHuiBox_Num",0)
                player:SetDayInt("WuDaoHui_JoinNum",1)
                if Data then
                    if Data["WuDaoHui"]["Player_List"] == nil then
                        Data["WuDaoHui"]["Player_List"] = {}
                    end
                    local playerData = {}
                    playerData['FightScore'] = player:RecalcTotalFightValue()
                    playerData['GUID'] = player:GetGUID()
                    table.insert(Data["WuDaoHui"]["Player_List"],playerData)
                else
                    sLuaApp:LuaErr("缺少Data文件")
                    return
                end
            end
        else
            sLuaApp:NotifyTipsMsg(player, "你的银币不足！")
        end
    else
        sLuaApp:NotifyTipsMsg(player, "武道会参与人数已达上限，无法参加！")
    end
end

--进入安全区域
function Act_WuDaoHui.EnterSafeArea(player)
    if player == nil then
        return
    end
    local Map = sMapSystem:GetMapById(Act_WuDaoHui.MapID)
    local CanMovePoint = {}
    if player:GetDayInt("WuDaoHui_Team") == 1 then --蓝方
        CanMovePoint = sMapSystem:GetRandomPoint(Map,Act_WuDaoHui.SafeArea.Blue.x , Act_WuDaoHui.SafeArea.Blue.y , Act_WuDaoHui.SafeArea.Blue.range)
        sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
        --刷新上方UI
        Act_WuDaoHui.RefreshUpUI(player)
    elseif player:GetDayInt("WuDaoHui_Team") == 2 then--红方
        CanMovePoint = sMapSystem:GetRandomPoint(Map,Act_WuDaoHui.SafeArea.Red.x , Act_WuDaoHui.SafeArea.Red.y , Act_WuDaoHui.SafeArea.Red.range)
        sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
        --刷新上方UI
        Act_WuDaoHui.RefreshUpUI(player)
    elseif player:GetDayInt("WuDaoHui_Team") == 0 then --未分配阵营
        CanMovePoint = sMapSystem:GetRandomPoint(Map,182,145,40)
        sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
    end
end

--阵营分配
function Act_WuDaoHui.TeamAllocation()
    if Data then
        local PlayerList = {}
        if not Data["WuDaoHui"]["Player_List"] then
            return false 
        end
        if Lua_tools.tablecount(Data["WuDaoHui"]["Player_List"]) <= 1 then
            sVarSystem:SetInt("WuDaoHui_Stage",Act_WuDaoHui.Act_Stage.close)
            sMapSystem:ForeachCall(sMapSystem:GetMapByKey("对战地图"),"Act_WuDaoHui","ExitToChangAn","")
            for k, v in pairs(Data["WuDaoHui"]["Player_List"]) do
                local player = sPlayerSystem:GetPlayerByGUID(v.GUID)
                sLuaApp:NotifyTipsMsg(player, "武道会人数不足，活动无法开启。")
            end
            return false
        else
            for k, v in pairs(Data["WuDaoHui"]["Player_List"]) do
                local player = sPlayerSystem:GetPlayerByGUID(v.GUID)
                if player then
                   table.insert(PlayerList,v)
                end
            end
            if Lua_tools.tablecount(PlayerList) <= 1 then
                sVarSystem:SetInt("WuDaoHui_Stage",Act_WuDaoHui.Act_Stage.close)
                sMapSystem:ForeachCall(sMapSystem:GetMapByKey("对战地图"),"Act_WuDaoHui","ExitToChangAn","")
                for k, v in pairs(PlayerList) do
                    local player = sPlayerSystem:GetPlayerByGUID(v.GUID)
                    sLuaApp:NotifyTipsMsg(player, "武道会人数不足，活动无法开启。")
                end
                return false
            end

            --按FightScore降序排序
            table.sort(PlayerList, function(a, b)
                return a.FightScore > b.FightScore
            end)

            local BlueTeam = {}
            local RedTeam = {}
            for k, v in pairs(PlayerList) do
                if (k % 2) == 0 then
                    local PlayerData = {}
                    PlayerData['guid'] = tostring(v.GUID)
                    local player = sPlayerSystem:GetPlayerByGUID(v.GUID)
                    if player then
                        player:SetDayInt("WuDaoHui_Team",1)
                        PlayerData['name'] = player:GetName()
                        PlayerData['score'] = 0
                        if OfficialPosition.OfficalConfig then
                            PlayerData['officer'] = OfficialPosition.OfficalConfig[player:GetInt("NowPosition")][2]
                        end
                        PlayerData['InMap'] = 1
                        --创建阵营buff
                        local BuffContainer = player:GetBuffContainer()
                        BuffContainer:CreateBuff(14,60*60)
                        table.insert(BlueTeam,PlayerData)
                    end
                else
                    local PlayerData = {}
                    PlayerData['guid'] = tostring(v.GUID)
                    local player = sPlayerSystem:GetPlayerByGUID(v.GUID)
                    if player then
                        player:SetDayInt("WuDaoHui_Team",2)
                        PlayerData['name'] = player:GetName()
                        PlayerData['score'] = 0
                        if OfficialPosition.OfficalConfig then
                            PlayerData['officer'] = OfficialPosition.OfficalConfig[player:GetInt("NowPosition")][2]
                        end
                        PlayerData['InMap'] = 1
                        --创建阵营buff
                        local BuffContainer = player:GetBuffContainer()
                        BuffContainer:CreateBuff(15,60*60)
                        table.insert(RedTeam,PlayerData)
                    end
                end
            end
            Data["WuDaoHui"]["BlueTeam"]["PlayerList"] = BlueTeam
            Data["WuDaoHui"]["BlueTeam"]["TeamScore"] = 0
            Data["WuDaoHui"]["BlueTeam"]["InMapPlayerNum"] = Lua_tools.tablecount(BlueTeam)
            Data["WuDaoHui"]["RedTeam"]["PlayerList"] = RedTeam
            Data["WuDaoHui"]["RedTeam"]["TeamScore"] = 0
            Data["WuDaoHui"]["RedTeam"]["InMapPlayerNum"] = Lua_tools.tablecount(RedTeam)
            return true
        end
    else
		sLuaApp:LuaErr("缺少Data文件")
		return false
    end
end

--开始战斗判断
function Act_WuDaoHui.StartBattle(PlayerGuid_1,PlayerGUID_2)
    if tonumber(PlayerGuid_1) == nil or tonumber(PlayerGUID_2) == nil then
        return false
    end
    if sVarSystem:GetInt("WuDaoHui_Stage") ~= Act_WuDaoHui.Act_Stage.fighting then
        return false
    end
    local player_1 =  sPlayerSystem:GetPlayerByGUID(tonumber(PlayerGuid_1))
    local player_2 =  sPlayerSystem:GetPlayerByGUID(tonumber(PlayerGUID_2))
    if player_1 == nil or player_2 == nil then
        return false
    end
    --判断是否在战斗中
    if player_1:IsFightState() or player_2:IsFightState() then
        return false
    end

    --判断是否为无敌状态
    local playerBuffContainer_1 = player_1:GetBuffContainer()
    local playerBuffContainer_2 = player_2:GetBuffContainer()
    local playerbuff_1 = playerBuffContainer_1:GetBuff(7)
    local playerbuff_2 = playerBuffContainer_2:GetBuff(7)
    if playerbuff_1 ~= nil or playerbuff_2 ~= nil then
        return false
    end

    --判断剩余失败次数是否足够
    if player_1:GetDayInt("WuDaoHui_Deaths") < 1 or player_2:GetDayInt("WuDaoHui_Deaths") < 1 then
        return false
    end
    --判断是否已分配阵营
    if player_1:GetDayInt("WuDaoHui_Team") == 0 or player_2:GetDayInt("WuDaoHui_Team") == 0 then
        return false
    end
    --判断是否为同一阵营
    if player_1:GetDayInt("WuDaoHui_Team") == player_2:GetDayInt("WuDaoHui_Team") then
        return false
    end
    local Player_1_Map = player_1:GetMap()
    local Player_2_Map = player_2:GetMap()
    --判断玩家地图
    if Player_1_Map:GetKeyName() ~= Player_2_Map:GetKeyName() or Player_1_Map:GetKeyName() ~= "对战地图" or Player_2_Map:GetKeyName() ~= "对战地图" then
        return false
    end

    --开始战斗
    if sFightSystem:StartTagPVP(player_1,player_2,Act_WuDaoHui.FightTag,"","","") then
        return true
    end
end

--战斗结束回调
function Act_WuDaoHui.FightCallBack(fighter,is_win)
    if fighter == nil or is_win == nil then
        return
    end
    --判断剩余失败次数是否足够
    if fighter:GetDayInt("WuDaoHui_Deaths") < 1 then
        return false
    end
    --将fighter转为player
    local FighterGuid = fighter:GetGUID()
    local player = sPlayerSystem:GetPlayerByGUID(FighterGuid)
    local Map = sMapSystem:GetMapByKey("对战地图")
    player:SetDayInt("WuDaoHui_FightNum",player:GetDayInt("WuDaoHui_FightNum") + 1) --战斗场次
    --根据胜负判断积分
    if is_win == 1 or is_win == 3 then
        if player:GetDayInt("WuDaoHui_Deaths") - 1 == 0 then
            player:SetDayInt("WuDaoHui_Deaths",-1)
            --传入安全区域
            --if player:GetDayInt("WuDaoHui_Team") == 1 then --蓝方
            --    CanMovePoint = sMapSystem:GetRandomPoint(Map,Act_WuDaoHui.SafeArea.Blue.x , Act_WuDaoHui.SafeArea.Blue.y , Act_WuDaoHui.SafeArea.Blue.range)
            --    sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
            --elseif player:GetDayInt("WuDaoHui_Team") == 2 then--红方
            --    CanMovePoint = sMapSystem:GetRandomPoint(Map,Act_WuDaoHui.SafeArea.Red.x , Act_WuDaoHui.SafeArea.Red.y , Act_WuDaoHui.SafeArea.Red.range)
            --    sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
            --end
            --local str = [[
            --    GlobalUtils.ShowServerBoxMessage1Btn("战斗失败已达]]..Act_WuDaoHui.Deaths..[[场，]]..Act_WuDaoHui.MaxDeathsTime..[[秒后您将被传送出活动场地。",]]..Act_WuDaoHui.MaxDeathsTime..[[)
            --]]
            --sLuaApp:ShowForm(player, "脚本表单", str)
            --sLuaTimerSystem:AddDelayerEx(player,Act_WuDaoHui.MaxDeathsTime*1000,"Act_WuDaoHui.ExitToChangAn","")
            if sMapSystem:Jump(player,sMapSystem:GetMapByKey("长安城"),325,201,4) then
                sLuaApp:NotifyTipsMsg(player, "您的复活次数用完，已自动退出武道会")
                --删除buff
                local buff_id = 0
                if player:GetDayInt("WuDaoHui_Team") == 1 then --蓝方
                    buff_id = 14
                elseif player:GetDayInt("WuDaoHui_Team") == 2 then--红方
                    buff_id = 15
                end
                local BuffContainer = player:GetBuffContainer()
                local Buff = BuffContainer:GetBuff(buff_id)
                if Buff then
                    BuffContainer:DestroyBuff(Buff)
                end

                for k, v in pairs(Data["WuDaoHui"]["Player_List"]) do
                    if v.GUID == player:GetGUID() then
                        table.remove(Data["WuDaoHui"]["Player_List"],k)
                        break
                    end
                end
            end
            --记录日志
            if player:GetDayInt("WuDaoHui_Team") == 1 then --蓝方
                sLogServerSystem:LogToServer(0, player, "武道会复活次数", player:GetDayInt("WuDaoHui_Deaths") , -1 , "战斗失败", "阵营：青龙")
            elseif player:GetDayInt("WuDaoHui_Team") == 2 then--红方
                sLogServerSystem:LogToServer(0, player, "武道会复活次数", player:GetDayInt("WuDaoHui_Deaths") , -1 , "战斗失败", "阵营：朱雀")
            end
        else
            player:SetDayInt("WuDaoHui_Deaths",player:GetDayInt("WuDaoHui_Deaths") - 1) --剩余失败次数
            --传入安全区域
            if player:GetDayInt("WuDaoHui_Team") == 1 then --蓝方
                CanMovePoint = sMapSystem:GetRandomPoint(Map,Act_WuDaoHui.SafeArea.Blue.x , Act_WuDaoHui.SafeArea.Blue.y , Act_WuDaoHui.SafeArea.Blue.range)
                sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
            elseif player:GetDayInt("WuDaoHui_Team") == 2 then--红方
                CanMovePoint = sMapSystem:GetRandomPoint(Map,Act_WuDaoHui.SafeArea.Red.x , Act_WuDaoHui.SafeArea.Red.y , Act_WuDaoHui.SafeArea.Red.range)
                sMapSystem:Jump(player,Map,CanMovePoint['x'],CanMovePoint['y'],0)
            end
            --记录日志
            if player:GetDayInt("WuDaoHui_Team") == 1 then --蓝方
                sLogServerSystem:LogToServer(0, player, "武道会复活次数", player:GetDayInt("WuDaoHui_Deaths") , -1 , "战斗失败", "阵营：青龙")
            elseif player:GetDayInt("WuDaoHui_Team") == 2 then--红方
                sLogServerSystem:LogToServer(0, player, "武道会复活次数", player:GetDayInt("WuDaoHui_Deaths") , -1 , "战斗失败", "阵营：朱雀")
            end
            player:SetDayInt("WuDaoHui_Score",player:GetDayInt("WuDaoHui_Score") + Act_WuDaoHui.FightScore[is_win])
        end
    else
        if is_win == 2  then
            player:SetDayInt("WuDaoHui_WinNum",player:GetDayInt("WuDaoHui_WinNum") + 1) --胜利场次
        end
        player:SetDayInt("WuDaoHui_Score",player:GetDayInt("WuDaoHui_Score") + Act_WuDaoHui.FightScore[is_win])
    end
    --添加无敌buff
    local BuffContainer = player:GetBuffContainer()
    if BuffContainer:CreateBuff(7,30) == nil then
        sLuaApp:LuaErr("添加无敌buff失败")
    end

    --战斗结束奖励
    if Act_WuDaoHui.Fight_Award then
        local reward = Act_WuDaoHui.Fight_Award
        -- +物品
        Lua_tools.AddItem(player,reward.item,"武道会","武道会奖励","武道会战斗奖励")
        -- +经验
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = BangPaiQiangDao.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, "武道会","武道会奖励","武道会战斗奖励")
            local pets = Lua_tools.GetFightPets(player)
            for k, v in pairs(pets) do
                if v then
                    v:AddExp(res_exp, "武道会","武道会奖励","武道会战斗奖励")
                end
            end
		end
		--+money
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = BangPaiQiangDao.RewardConfigToNmber(player, add_money_val)
			Lua_tools.AddMoney(player, add_money_type, res_money, "武道会","武道会银币奖励","武道会战斗结束银币奖励")
			sLuaApp:NotifyTipsMsg(player, "您获得了"..res_money.."银币")
		end
    end

    --判断玩家队伍中玩家的剩余次数，踢出不足的玩家
    local Team = player:GetTeam()
    if Team then
        if sTeamSystem:IsTeamLeader(Team,player) then
            Act_WuDaoHui.KickTeamPlayer(player)
        end
    end

    if Data then
        if player:GetDayInt("WuDaoHui_Team") == 1 then--蓝方
            for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                if tonumber(v.guid) == player:GetGUID() then
                    v['name'] = player:GetName()
                    v['score'] = player:GetDayInt("WuDaoHui_Score")
                    if OfficialPosition.OfficalConfig then
                        v['officer'] = OfficialPosition.OfficalConfig[player:GetInt("NowPosition")][2]
                    else
                        v['officer'] = "暂无"
                    end
                    v['WinNum'] = player:GetDayInt("WuDaoHui_WinNum")
                    v['FightNum'] = player:GetDayInt("WuDaoHui_FightNum")
                end
            end
            Data["WuDaoHui"]["BlueTeam"]["TeamScore"] = Act_WuDaoHui.GetTeamScore(1)
            Data["WuDaoHui"]["BlueTeam"]["InMapPlayerNum"] = Act_WuDaoHui.GetTeamPlayerNum(1)
        elseif player:GetDayInt("WuDaoHui_Team") == 2 then--红方
            for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                if tonumber(v.guid) == player:GetGUID() then
                    v['name'] = player:GetName()
                    v['score'] = player:GetDayInt("WuDaoHui_Score")
                    if OfficialPosition.OfficalConfig then
                        v['officer'] = OfficialPosition.OfficalConfig[player:GetInt("NowPosition")][2]
                    else
                        v['officer'] = "暂无"
                    end
                    v['WinNum'] = player:GetDayInt("WuDaoHui_WinNum")
                    v['FightNum'] = player:GetDayInt("WuDaoHui_FightNum")
                end
            end
            Data["WuDaoHui"]["RedTeam"]["TeamScore"] = Act_WuDaoHui.GetTeamScore(2)
            Data["WuDaoHui"]["RedTeam"]["InMapPlayerNum"] = Act_WuDaoHui.GetTeamPlayerNum(2)
        end
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end

    --刷新右侧信息栏
    local RightMsgList = Act_WuDaoHui.GetRightUIData(player)
    local str = [[
        TrackUI.RightMsgList = ]]..Lua_tools.serialize(RightMsgList)..[[
        TrackUI.UpdateFightInfo3Data()
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)

    Act_WuDaoHui.RefreshUpUI() --刷新上方UI

    --活动结束判断
    if Data then
        local BlueTeamPlayerNum = Act_WuDaoHui.GetTeamPlayerNum(1)
        local RedTeamPlayerNum = Act_WuDaoHui.GetTeamPlayerNum(2)
        if BlueTeamPlayerNum == 0 then
            Data["WuDaoHui"]['Win_Team'] = 2
            Act_WuDaoHui.Act_StageChange()
            return
        elseif RedTeamPlayerNum == 0 then
            Data["WuDaoHui"]['Win_Team'] = 1
            Act_WuDaoHui.Act_StageChange()
            return
        end
    else
        sLuaApp:LuaErr("缺少Data文件")
        return
    end
end

--获取队伍中的玩家，判断剩余次数
function Act_WuDaoHui.KickTeamPlayer(player)
    if player == nil then
        return
    end
    local Team = player:GetTeam()
    if Team then
        local PlayerList = Team:GetTeamMembers(true)
        for k, v in pairs(PlayerList) do
            if v:GetDayInt("WuDaoHui_Deaths") == -1 then
                FormTeam.KickMember(player, v:GetGUID())
                sLuaApp:NotifyTipsMsg(v, "您失败次数已用完，自动将您移出队伍。")
            end
        end
    end
end

--得到右侧信息栏数据
function Act_WuDaoHui.GetRightUIData(player)
    if player == nil then
        return
    end
    local RightMsgList = {}
    RightMsgList["TeamPlayerNum"] = Act_WuDaoHui.GetTeamPlayerNum(player:GetDayInt("WuDaoHui_Team"))

    if player:GetDayInt("WuDaoHui_Team") == 1 then
        RightMsgList["EnemyTeamPlayerNum"] = Act_WuDaoHui.GetTeamPlayerNum(2)
    elseif player:GetDayInt("WuDaoHui_Team") == 2 then
        RightMsgList["EnemyTeamPlayerNum"] = Act_WuDaoHui.GetTeamPlayerNum(1)
    elseif player:GetDayInt("WuDaoHui_Team") == 0 then
        RightMsgList["EnemyTeamPlayerNum"] = 0
    end

    RightMsgList["PlayerScore"] = player:GetDayInt("WuDaoHui_Score")
    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then --当前状态为准备
        RightMsgList["SurplusDeaths"] = Act_WuDaoHui.Deaths
    else
        if player:GetDayInt("WuDaoHui_Deaths") ~= -1 then
            RightMsgList["SurplusDeaths"] = player:GetDayInt("WuDaoHui_Deaths")
        else
            RightMsgList["SurplusDeaths"] = 0
        end
    end
    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then
        RightMsgList["FightEndTime"] = sVarSystem:GetInt("WuDaoHui_StageEndTime")
    else
        RightMsgList["FightEndTime"] = 0
    end

    return RightMsgList
end

--匹配战斗
function Act_WuDaoHui.ArrangeFight()
    if Data then
        --活动结束判断 
        local BlueTeamPlayerNum = Act_WuDaoHui.GetTeamPlayerNum(1)
        local RedTeamPlayerNum = Act_WuDaoHui.GetTeamPlayerNum(2)
        if BlueTeamPlayerNum == 0 then
            Data["WuDaoHui"]['Win_Team'] = 2
            Act_WuDaoHui.Act_StageChange()
            return
        elseif RedTeamPlayerNum == 0 then
            Data["WuDaoHui"]['Win_Team'] = 1
            Act_WuDaoHui.Act_StageChange()
            return
        end

        local PlayerGuid_1 = 0
        local PlayerGuid_2 = 0
        for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
            local player_1 = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
            if player_1 then
                if not player_1:IsFightState() then
                    PlayerGuid_1 = tonumber(v.guid)
                    for i = 1, 20 do
                        local RandNum = sLuaApp:RandInteger(1,Lua_tools.tablecount(Data["WuDaoHui"]["RedTeam"]["PlayerList"]))
                        local PlayerData = Data["WuDaoHui"]["RedTeam"]["PlayerList"][RandNum]
                        if PlayerData then
                            local player_2 = sPlayerSystem:GetPlayerByGUID(tonumber(PlayerData.guid))
                            if player_2 then
                                if not player_2:IsFightState() then
                                    PlayerGuid_2 = tonumber(PlayerData.guid)
                                    if Act_WuDaoHui.StartBattle(PlayerGuid_1,PlayerGuid_2) then
                                        break
                                    end
                                end
                            end 
                        end
                    end
                end 
            end
        end
    else
        sLuaApp:LuaErr("缺少Data文件")
        return
    end
end

--刷新上方UI
function Act_WuDaoHui.RefreshUpUI(player)
    local BlueTeamNum = 0
    local BlueTeamSurNum  = 0
    local RedTeamNum = 0
    local RedTeamSurNum = 0
    local WuDaoHui_Stage = sVarSystem:GetInt("WuDaoHui_Stage")
    if Data then
        if Data["WuDaoHui"]["BlueTeam"]["PlayerList"] == nil or Data["WuDaoHui"]["RedTeam"]["PlayerList"] == nil then
            return
        end
        BlueTeamNum = Lua_tools.tablecount(Data["WuDaoHui"]["BlueTeam"]["PlayerList"])*Act_WuDaoHui.Deaths
        RedTeamNum = Lua_tools.tablecount(Data["WuDaoHui"]["RedTeam"]["PlayerList"])*Act_WuDaoHui.Deaths
        if BlueTeamNum == 0 then
            BlueTeamNum = 1
        end
        if RedTeamNum == 0 then
            RedTeamNum = 1
        end
        for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
            local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
            if player then
                local Num = player:GetDayInt("WuDaoHui_Deaths")
                if Num == -1 then
                    Num = 0
                end
                BlueTeamSurNum = BlueTeamSurNum + Num
            end
        end
        for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
            local player = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
            if player then
                local Num = player:GetDayInt("WuDaoHui_Deaths")
                if Num == -1 then
                    Num = 0
                end
                RedTeamSurNum = RedTeamSurNum + Num
            end
        end
    else
        sLuaApp:LuaErr("缺少Data文件")
        return
    end
    local str = [[
        GUI.OpenWnd("WuDaoHuiUpperTipsUI")
        if WuDaoHuiUpperTipsUI then
            WuDaoHuiUpperTipsUI.State = ]]..WuDaoHui_Stage..[[
            WuDaoHuiUpperTipsUI.Timer = ]]..sVarSystem:GetInt("WuDaoHui_StageEndTime")..[[
            WuDaoHuiUpperTipsUI.BlueTeamNum = ]]..BlueTeamNum..[[
            WuDaoHuiUpperTipsUI.BlueTeamSurNum  = ]]..BlueTeamSurNum..[[
            WuDaoHuiUpperTipsUI.RedTeamNum = ]]..RedTeamNum..[[
            WuDaoHuiUpperTipsUI.RedTeamSurNum = ]]..RedTeamSurNum..[[
            WuDaoHuiUpperTipsUI.Refresh()
        end
    ]]
    if player then
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        sLuaApp:ShowFormToMap(sMapSystem:GetMapByKey("对战地图"),"脚本表单", str)
    end
    
end

--得到最新队伍玩家数据表
function Act_WuDaoHui.GetTeamPlayerData(player)
    if player == nil then
        return ""
    end
    local TeamPlayerData = {}
    if Data then
        if Data["WuDaoHui"] == nil then
            return
        end
        if Data["WuDaoHui"]["BlueTeam"]["PlayerList"] == nil or Data["WuDaoHui"]["RedTeam"]["PlayerList"] == nil then
            return
        end
        local BlueTeamScore = 0
        local RedTeamScore = 0
        for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
            BlueTeamScore = BlueTeamScore + v['score']
            local role = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
            if role then
                if role:GetMap():GetKeyName() == "对战地图" then
                    v['InMap'] = 1
                else
                    v['InMap'] = 0
                end
            else
                v['InMap'] = 0
            end
        end
        for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
            RedTeamScore = RedTeamScore + v['score']
            local role = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
            if role then
                if role:GetMap():GetKeyName() == "对战地图" then
                    v['InMap'] = 1
                else
                    v['InMap'] = 0
                end
            else
                v['InMap'] = 0
            end
        end
        Data["WuDaoHui"]["BlueTeam"]["TeamScore"] = BlueTeamScore
        Data["WuDaoHui"]["RedTeam"]["TeamScore"] = RedTeamScore
        TeamPlayerData['BlueTeam'] = Data["WuDaoHui"]["BlueTeam"]
        --按score降序排序
        table.sort(TeamPlayerData['BlueTeam']["PlayerList"], function(a, b)
            return a.score > b.score
        end)
    
        TeamPlayerData['RedTeam'] = Data["WuDaoHui"]["RedTeam"]
        --按score降序排序
        table.sort(TeamPlayerData['RedTeam']["PlayerList"], function(a, b)
            return a.score > b.score
        end)
        TeamPlayerData['Win_Team'] = Data["WuDaoHui"]['Win_Team']
    else
        sLuaApp:LuaErr("缺少Data文件")
        return
    end 
    local str = [[
        WuDaoHuiUI.FightInfo = ]]..Lua_tools.serialize(TeamPlayerData)..[[
        WuDaoHuiUI.Refresh()
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--得到队伍积分
function Act_WuDaoHui.GetTeamScore(TeamId)
    if Data then
        if Data["WuDaoHui"]["BlueTeam"] == nil or Data["WuDaoHui"]["RedTeam"] == nil then
            return
        end
        local TeamScore = 0
        if TeamId == 1 then
            for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                TeamScore = TeamScore + v.score
            end 
        elseif TeamId == 2 then
            for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                local role = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if role then
                    TeamScore = TeamScore + v.score
                end
            end
        end
        return TeamScore
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
end

--得到队伍人数
function Act_WuDaoHui.GetTeamPlayerNum(TeamId)
    if Data then
        if Data["WuDaoHui"]["BlueTeam"]["PlayerList"] == nil or Data["WuDaoHui"]["RedTeam"]["PlayerList"] == nil then
            return
        end
        local InMapPlayerNum = 0
        if TeamId == 1 then
            for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                local role = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if role then
                    if role:GetMap():GetKeyName() == "对战地图" and role:GetDayInt("WuDaoHui_Deaths") ~= -1 then
                        InMapPlayerNum = InMapPlayerNum + 1
                    end
                end
            end
        elseif TeamId == 2 then
            for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                local role = sPlayerSystem:GetPlayerByGUID(tonumber(v.guid))
                if role then
                    if role:GetMap():GetKeyName() == "对战地图" and role:GetDayInt("WuDaoHui_Deaths") ~= -1 then
                        InMapPlayerNum = InMapPlayerNum + 1
                    end
                end
            end
        end
        return InMapPlayerNum
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
end

--玩家加入队伍判断
function Act_WuDaoHui.JoinTeamJudge(player,leader)
    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then
        if player:GetDayInt("WuDaoHui_Team") ~= leader:GetDayInt("WuDaoHui_Team") then
            sLuaApp:NotifyTipsMsg(player, "活动进行中，无法与敌对阵营的玩家组队。")
            return false
        end
        if player:GetDayInt("WuDaoHui_Deaths") <= 0 then
            sLuaApp:NotifyTipsMsg(player, "您已无可用失败次数，无法加入队伍。")
            return false
        end
        if leader:GetDayInt("WuDaoHui_Deaths") <= 0 then
            sLuaApp:NotifyTipsMsg(player, "该队伍队长已无可用失败次数，无法加入队伍。")
            return false
        end
    end
end

--邀请玩家加入队伍判断
function Act_WuDaoHui.InvitePlayerJudge(player,target)
    if player:GetMapKeyName() ~= "对战地图" and target:GetMapKeyName() ~= "对战地图" then
        return true
    end
    if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
        if player:GetMapKeyName() == "对战地图" then
            if target:GetMapKeyName() ~= "对战地图" then
                sLuaApp:NotifyTipsMsgEx(player, "对方未在活动地图中，无法邀请。")
                return false
            end
        end
    end

    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then
        if player:GetDayInt("WuDaoHui_Team") ~= target:GetDayInt("WuDaoHui_Team") then
            sLuaApp:NotifyTipsMsg(player, "活动进行中，无法与敌对阵营的玩家组队。")
            return false
        end
        if target:GetDayInt("WuDaoHui_Deaths") <= 0 then
            sLuaApp:NotifyTipsMsg(player, "该玩家已无可用失败次数，无法加入。")
            return false
        end
        return true
    end
    return true
end

--地图中遭遇回调
function Act_WuDaoHui.on_encounter(role,ObjectList)
    --sLuaApp:LuaDbg("地图中遭遇回调")
    if role == nil or ObjectList == nil then
        return
    end
    if ObjectList[1]:GetType() == 3 then
        Act_WuDaoHui.StartBattle(role:GetGUID(),ObjectList[1]:GetGUID())
    end
end

--玩家登陆回调
function Act_WuDaoHui.on_player_login(player)
    if player == nil then
        return
    end
    local Map = player:GetMap()
    if Map:GetKeyName() == "对战地图" then
        sMapSystem:Jump(player,sMapSystem:GetMapByKey("长安城"),325,201,4)
        sLuaApp:ShowForm(player, "脚本表单", "TrackUI.SwitchQuestOrFightInfo3Node(true)")
        if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.close then
            Act_WuDaoHui.ClearPlayerData(player)
        end
    end
end

--玩家跳转地图回调
function Act_WuDaoHui.on_pre_jump_map(player,map)
    if player == nil then
        return false
    end
    local MapKey = map:GetKeyName()
    local MapData = MapConfig.GetByKeyName(MapKey)
    if player:GetMap():GetKeyName() == "对战地图" then
        if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.finish then --结束阶段
            sLuaApp:ShowForm(player, "脚本表单", "TrackUI.SwitchQuestOrFightInfo3Node(true)")
        elseif sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then
            local BuffContainer = player:GetBuffContainer()
            if player:GetDayInt("WuDaoHui_Team") == 1 then
                local TeamBuff = BuffContainer:GetBuff(14)
                if TeamBuff then
                    BuffContainer:DestroyBuff(TeamBuff)
                end
            elseif player:GetDayInt("WuDaoHui_Team") == 2 then
                local BuffContainer = player:GetBuffContainer()
                local TeamBuff = BuffContainer:GetBuff(15)
                if TeamBuff then
                    BuffContainer:DestroyBuff(TeamBuff)
                end
            end
            local WuDiBuff = BuffContainer:GetBuff(7)
            if WuDiBuff then
                BuffContainer:DestroyBuff(WuDiBuff)
            end
            sLuaApp:ShowForm(player, "脚本表单", "TrackUI.SwitchQuestOrFightInfo3Node(true)")
            return true
        end
        return true
    elseif MapData.Type == 2 then
        if player:GetDayInt("WuDaoHui_Deaths") ~= 0 and sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then
            local str = [[
                GlobalUtils.ShowServerBoxMessage("进入副本地图需退出武道大会，是否退出武道会？")
                ]]
            player:SetString("SYSTEM_ConfirmBox_Function", "Act_WuDaoHui.ExitAct("..player:GetGUID()..")")
            sLuaApp:ShowForm(player, "脚本表单", str)
            return false
        end
    end
    return true
end

--玩家进入地图回调
function Act_WuDaoHui.OnEnterMap(player)
    if player == nil then
        return
    end
    --sLuaApp:LuaDbg("玩家进入地图回调")
    --刷新右侧信息栏/加载透明墙特效
    local RightMsgList = Act_WuDaoHui.GetRightUIData(player)
    --sLuaApp:LuaDbg("RightMsgList === "..Lua_tools.serialize(RightMsgList))
    local str = [[
        WuDaoHuiMapEffect = 1
        if TrackUI then
            TrackUI.SwitchQuestOrFightInfo3Node(false)
            TrackUI.RightMsgList = ]]..Lua_tools.serialize(RightMsgList)..[[
            TrackUI.UpdateFightInfo3Data()
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)
    --打开战场上方UI
    if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then
        local str = [[
            GUI.OpenWnd("WuDaoHuiUpperTipsUI")
            if WuDaoHuiUpperTipsUI then
                WuDaoHuiUpperTipsUI.State = ]]..sVarSystem:GetInt("WuDaoHui_Stage")..[[
                WuDaoHuiUpperTipsUI.Timer = ]]..sVarSystem:GetInt("WuDaoHui_StageEndTime")..[[
                WuDaoHuiUpperTipsUI.Refresh()
            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)
    else
        Act_WuDaoHui.RefreshUpUI(player)
    end
end
--活动中退出武道会
function Act_WuDaoHui.ExitAct(PlayerGuid,jump)
    PlayerGuid = tonumber(PlayerGuid)
    if PlayerGuid == nil then
        return
    end
    local player = sPlayerSystem:GetPlayerByGUID(PlayerGuid)
    local team = player:GetTeam()
    if team then
        FormTeam.LeaveTeam(player)
    end
    if Data then
        if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.fighting then
            for k, v in pairs(Data["WuDaoHui"]["Player_List"]) do
                if v.GUID == PlayerGuid then
                    table.remove(Data["WuDaoHui"]["Player_List"],k)
                    break
                end
            end
            if player:GetDayInt("WuDaoHui_Team") ~= 0 then
                if player:GetDayInt("WuDaoHui_Team") == 1 then
                    for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                        if tonumber(v.guid) == PlayerGuid then
                            table.remove(Data["WuDaoHui"]["BlueTeam"]["PlayerList"],k)
                            local BuffContainer = player:GetBuffContainer()
                            local BlueBuff = BuffContainer:GetBuff(14)
                            if BlueBuff then
                                BuffContainer:DestroyBuff(BlueBuff)
                            end
                            break
                        end
                    end
                elseif player:GetDayInt("WuDaoHui_Team") == 2 then
                    for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                        if tonumber(v.guid) == PlayerGuid then
                            table.remove(Data["WuDaoHui"]["RedTeam"]["PlayerList"],k)
                            local BuffContainer = player:GetBuffContainer()
                            local RedBuff = BuffContainer:GetBuff(15)
                            if RedBuff then
                                BuffContainer:DestroyBuff(RedBuff)
                            end
                            break
                        end
                    end
                end
            end
            Act_WuDaoHui.ClearPlayerData(player)
        elseif sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.setout then
            for k, v in pairs(Data["WuDaoHui"]["Player_List"]) do
                if v.GUID == PlayerGuid then
                    table.remove(Data["WuDaoHui"]["Player_List"],k)
                    break
                end
            end
            Act_WuDaoHui.ClearPlayerData(player)
        end
    else
        sLuaApp:LuaErr("缺少Data文件")
		return
    end

    if tonumber(jump) == 1 then
        sMapSystem:Jump(player,sMapSystem:GetMapByKey("长安城"),325,201,4)
    end
    sLuaApp:NotifyTipsMsg(player, "已退出武道会。")
end

--退出武道会传送至长安城
function Act_WuDaoHui.ExitToChangAn(player)
    if player == nil then
        return
    end
    if sMapSystem:Jump(player,sMapSystem:GetMapByKey("长安城"),325,201,4) then
        sLuaApp:NotifyTipsMsg(player, "已退出武道会。")
        Act_WuDaoHui.ClearPlayerData(player)
    end
end

--清除玩家身上的活动数据
function Act_WuDaoHui.ClearPlayerData(player)
    if player == nil then
        return
    end
    player:SetDayInt("WuDaoHui_Team",0)
    player:SetDayInt("WuDaoHui_Score",0)
    player:SetDayInt("WuDaoHui_WinNum",0)
    player:SetDayInt("WuDaoHui_FightNum",0)
end

--创建NPC
function Act_WuDaoHui.CreateNPC()
    if Data then
        Data.WuDaoHui['NPCGUIDList'] = {}
	else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end

    for k, v in pairs(Act_WuDaoHui.InsideNPCData) do
        local map = sMapSystem:GetMapByKey(v.mapkey)
        local npc = sNpcSystem:CreateNpc( v.id , map , v.x , v.y , 1 , 3 , 0 )
        table.insert(Data.WuDaoHui['NPCGUIDList'] , npc:GetGUID())
    end
end

--创建宝箱NPC
function Act_WuDaoHui.CreateBoxNPC()
    local PlayerNum = Act_WuDaoHui.GetTeamPlayerNum(1) + Act_WuDaoHui.GetTeamPlayerNum(2)
    local map = sMapSystem:GetMapByKey("对战地图")
    local CanMovePoint = sMapSystem:GetRandomPoint(map,182,145,30)
    Act_WuDaoHui.BoxNPCList = {}
    for i = 1, PlayerNum do
        local Npc = sNpcSystem:CreateNpc( 10309 , map , CanMovePoint.x , CanMovePoint.y , 1 , 3 , 0 )
        table.insert(Act_WuDaoHui.BoxNPCList,Npc:GetGUID())
    end
end

--给胜利玩家发送胜利奖励
function Act_WuDaoHui.SendWinAward()
    local tb_goods = Act_WuDaoHui.Win_Award
    if Data then
        if Data.WuDaoHui['Win_Team'] then
            if Data.WuDaoHui['Win_Team'] == 1 then
                if Data["WuDaoHui"]["BlueTeam"]["PlayerList"] == nil then
                    return
                end
                for k, v in pairs(Data["WuDaoHui"]["BlueTeam"]["PlayerList"]) do
                    Lua_tools.SendItemMail(tonumber(v.guid), tb_goods, "武道会", "武道会", "您所在的阵营是本次武道会最终的胜利方，以下奖励是对您荣誉的认可！")
                end
            elseif Data.WuDaoHui['Win_Team'] == 2 then
                if Data["WuDaoHui"]["RedTeam"]["PlayerList"] == nil then
                    return
                end
                for k, v in pairs(Data["WuDaoHui"]["RedTeam"]["PlayerList"]) do
                    Lua_tools.SendItemMail(tonumber(v.guid), tb_goods, "武道会", "武道会", "您所在的阵营是本次武道会最终的胜利方，以下奖励是对您荣誉的认可！")
                end
            else
                return
            end

        end
	else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
end

--给存活玩家发送存活奖励
function Act_WuDaoHui.SendAliveAward()
    local tb_goods = Act_WuDaoHui.Alive_Award
    if Data then
        if Data.WuDaoHui['Player_List'] then
            for k, v in pairs(Data.WuDaoHui['Player_List']) do
                Lua_tools.SendItemMail(v.GUID, tb_goods, "武道会", "武道会", "您在武道会存活至最后一刻，这是对您英勇战斗的奖励！")
            end
        end
	else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
end
