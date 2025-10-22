--门派入侵活动
MenPaiRuQin = {}

-- 侍宠数量
MenPaiRuQin.GuardPetCount = 4

-- 当前地图索引
MenPaiRuQin.CurrMapIndex = nil

-- 刷新周期
MenPaiRuQin.RefreshTime = {
-- {开始刷怪时间(分：秒)，本次怪物存在时间(秒)}
    {"00:00", 300},
    {"05:00", 300},
    {"10:00", 300},
    {"15:00", 300},
    {"20:00", 300},
    {"25:00", 300},
}

-- 战斗后发放的奖励
MenPaiRuQin.Reward = {
    { Exp = "level * 200", MoneyType = 5, MoneyVal = "level * 200", ItemTime = 1,
      ItemList = {
          { ItemKey = "Nil", Num = 1, Bind = 0, Rand = 0 },
          { ItemKey = "小银币袋", Num = 1, Bind = 0, Rand = 5 },
          { ItemKey = "百炼精铁20", Num = 1, Bind = 0, Rand = 0 },
          { ItemKey = "幸运石1", Num = 1, Bind = 0, Rand = 0 },
          { ItemKey = "翅膀升级1", Num = 1, Bind = 0, Rand = 995 },
      }
    }
}

-- 创建NPC的数量
MenPaiRuQin.NR_NPC = 15

-- 最大参与次数
MenPaiRuQin.JoinMax = 10

-- 队伍最少人数
MenPaiRuQin.JoinMinNum = 1

--战斗标识
MenPaiRuQin.FightTag = 10010

-- 刷新NPC
MenPaiRuQin.Refresh = {
    { NPCKeyNameList = { "花果山明雷", "花果山明雷1", "花果山明雷2" }, MapId = "205", MonId = 31061 },
    { NPCKeyNameList = { "净坛禅院明雷", "净坛禅院明雷1", "净坛禅院明雷2" }, MapId = "218", MonId = 31061 },
    { NPCKeyNameList = { "流沙界明雷", "流沙界明雷1", "流沙界明雷2" }, MapId = "214", MonId = 31061 },
    { NPCKeyNameList = { "龙宫明雷", "龙宫明雷1", "龙宫明雷2" }, MapId = "206", MonId = 31061 },
    { NPCKeyNameList = { "慈恩寺明雷", "慈恩寺明雷1", "慈恩寺明雷2" }, MapId = "204", MonId = 31061 },
    { NPCKeyNameList = { "酆都明雷", "酆都明雷1", "酆都明雷2" }, MapId = "215", MonId = 31061 },
}

--活动界面 展示奖励 物品id
MenPaiRuQin.ShowItem = "61025,61024,61001,20168"

-- 地图范围
MenPaiRuQin.NoMonsterBorder = 10

-- 活动开始前回调
function MenPaiRuQin.OnDeclare(id, seconds)

end

-- 活动开始回调
function MenPaiRuQin.OnStart(id, is_normal)
    local refreshTime = MenPaiRuQin.RefreshTime
    MenPaiRuQin.InitTimeList(id)

    if is_normal then
        MenPaiRuQin.CreateNPC(0, sLuaApp:Hour(0)..":"..refreshTime[1][1]..","..refreshTime[1][2]..","..id)
    end
    MenPaiRuQin.ScheduleNPC(id)
end

-- 活动结束回调
function MenPaiRuQin.OnStop(id)

end

-- 玩家点击参与活动回调
function MenPaiRuQin.OnJoin(id, player)
    sLuaApp:LuaDbg("玩家点击参与")
    if sLuaApp:IsActivityRunning(id) then
        id = tonumber(id)

        local index = sVarSystem:GetInt("MenPaiRuQin_NPC_Info_Index")
        local npcInfo = MenPaiRuQin.Refresh[index]
        if npcInfo then
            local map = sMapSystem:GetMapById(npcInfo.MapId)
            local check_tb = MenPaiRuQin.CheckFight(player, id)
            if check_tb and next(check_tb) then
                if check_tb[1] == 0 and check_tb[2] == 1 then
                    sLuaApp:NotifyTipsMsg(player, "只有等级达到"..check_tb[3].."级才有资格参与活动！")
                    return
                elseif check_tb[1] == 0 and check_tb[2] > 1 then
                    sLuaApp:NotifyTipsMsg(player, "只有至少"..check_tb[2].."人组队并且全员等级达到"..check_tb[3].."级才有资格参与活动！")
                    return
                end
            else
                sLuaApp:LuaDbg("MenPaiRuQin.CheckFight返回错误")
                return
            end

            local map_npc_num = tonumber(sVarSystem:GetInt("MenPaiRuQin_"..id.."_"..MenPaiRuQin.Refresh[index].MapId.."_NPCNum"))
            sLuaApp:LuaDbg(map_npc_num)
            sLuaApp:LuaDbg(id)
            if map_npc_num > 0 then
                local x = math.floor(map:GetWidth() / 2)
                local y = math.floor(map:GetHeight() / 2)
                local range = math.min(x, y) - MenPaiRuQin.NoMonsterBorder
                if Lua_tools.Jump(player, map, x, y, range) then
                    local str = [[
						GUI.CloseWnd("ActivityPanelUI")
					]]
                    sLuaApp:ShowForm(player, "脚本表单", str)
                else
                    sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
                end
            else
                sLuaApp:NotifyTipsMsg(player, "来晚啦，所有怪物都已被各路大侠消灭。")
                return
            end
        else
            sLuaApp:NotifyTipsMsg(player, "现在没有怪物入侵，请少侠放心")
            return
        end
    else
        sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
    end
end

-- 玩家客户端查询数据回调
function MenPaiRuQin.OnQuery(id, player)
    local joinNum = player:GetDayInt("MenPaiRuQin_Join_Num"..id)
    local state = 2
    if joinNum >= MenPaiRuQin.JoinMax then
        state = 3
    end
    local str = joinNum..":"..MenPaiRuQin.JoinMax..":"..[[0:0]]..":"..MenPaiRuQin.ShowItem..":"..state..":"..ActivitySystem.Act_GetClassify("MenPaiRuQin")
    --分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
    --活动状态（1，可参加  2，进行中   3，已参与）
    return str
end

-- 初始化刷新时间表
function MenPaiRuQin.InitTimeList(id)
    MenPaiRuQin.RefreshTimeList = {}
    assert(load("MenPaiRuQin.RefreshTimeList["..id.."] = {} return "))()
    local refreshTime = MenPaiRuQin.RefreshTime
    local activityData = ActivityConfig.GetById(id)
    local hour = tonumber(string.sub(activityData.TimeEnd,1,2))
    local currHour = sLuaApp:Hour(0)
    local index = 1
    for i = currHour, hour - 1 do
        for _,v in ipairs(refreshTime) do
            MenPaiRuQin.RefreshTimeList[id][index] = {}
            local fresh_time = i..":"..v[1]
            table.insert(MenPaiRuQin.RefreshTimeList[id][index], fresh_time)
            table.insert(MenPaiRuQin.RefreshTimeList[id][index], v[2])
            index = index + 1
        end
    end
end

-- 创建NPC
function MenPaiRuQin.CreateNPC(timer, param)
    local tb = sLuaApp:StrSplit(param, ",")
    local timeStr = tostring(tb[1])
    local time_tb = sLuaApp:StrSplit(timeStr, ":")
    local survivalTime = tonumber(tb[2])
    local id = tonumber(tb[3])
    if sLuaApp:IsActivityRunning(id) then
        local refreshList = MenPaiRuQin.Refresh
        local length = #refreshList

        if not MenPaiRuQin.CurrMapIndex then
            MenPaiRuQin.CurrMapIndex = sLuaApp:RandInteger(1, length)
        else
            local curr_hour = sLuaApp:Hour(0)
            local curr_refresh_time = tonumber(time_tb[1])
            sLuaApp:LuaDbg("currHour: "..curr_hour..", refreshTime: "..curr_refresh_time)
            if curr_hour ~= curr_refresh_time then
                MenPaiRuQin.CurrMapIndex = sLuaApp:RandInteger(1, length)
            end
        end
        sVarSystem:SetInt("MenPaiRuQin_NPC_Info_Index", MenPaiRuQin.CurrMapIndex)
        local npcInfo = refreshList[MenPaiRuQin.CurrMapIndex]
        local map = sMapSystem:GetMapById(npcInfo.MapId)
        sLuaApp:LuaDbg("MapKeyName: "..map:GetKeyName())

        local x = math.floor(map:GetWidth() / 2)
        local y = math.floor(map:GetHeight() / 2)
        local range = math.min(x, y) - MenPaiRuQin.NoMonsterBorder --刷怪范围

        local kn_index = sLuaApp:RandInteger(1, #npcInfo.NPCKeyNameList)
        local npcData = NpcConfig.GetByKeyName(npcInfo.NPCKeyNameList[kn_index])

        if not npcData then return end

        local npcId = npcData.Id
        local count = MenPaiRuQin.NR_NPC
        local map_npc_num = sVarSystem:GetInt("MenPaiRuQin_"..id.."_"..npcInfo.MapId.."_NPCNum") + count
        sVarSystem:SetInt("MenPaiRuQin_"..id.."_"..npcInfo.MapId.."_NPCNum", map_npc_num)

        for i = 1 ,count do
            local npc = sNpcSystem:CreateMoveNpc(npcId, map, x, y, range, 5)--5是方向
            if npc then
                npc:SetInt("MenPaiRuQinFightMonID", npcInfo.MonId)
                npc:SetInt("MenPaiRuQinActID", id)
                npc:SetInt("MenPaiRuQinMapID", npcInfo.MapId)
                sLuaTimerSystem:AddTimerEx(npc, survivalTime * 1000, 1, "MenPaiRuQin.DestroyNPC", "")
            end
        end
    end
end

-- 设置NPC调度任务
function MenPaiRuQin.ScheduleNPC(id)
    id = tonumber(id)
    local timeList = MenPaiRuQin.RefreshTimeList[id]
    for i = 1, #timeList do
        sScheduleSystem:CreateSchedule(0, timeList[i][1], "MenPaiRuQin", "CreateNPC", timeList[i][1]..","..timeList[i][2]..","..id)
    end
end

-- 销毁NPC
function MenPaiRuQin.DestroyNPC(npc, timer, p)
    local id = npc:GetInt("MenPaiRuQinActID")
    local map_id = npc:GetInt("MenPaiRuQinMapID")
    local map_npc_num = sVarSystem:GetInt("MenPaiRuQin_"..id.."_"..map_id.."_NPCNum") - 1
    sVarSystem:SetInt("MenPaiRuQin_"..id.."_"..map_id.."_NPCNum", map_npc_num)
    sNpcSystem:DestroyNpc(npc)
end

--检查能否进入战斗 npc对话和活动跳转用
function MenPaiRuQin.CheckFight(player, id)
    id = tonumber(id)

    local activity_data = ActivityConfig.GetById(id)
    if not activity_data then
        sLuaApp:LuaErr("MenPaiRuQin.CheckFight  ActivityConfig 不存在 "..id)
        return false
    end
    local level_min = tonumber(activity_data.LevelMin)
    local join_min_num = MenPaiRuQin.JoinMinNum -- 队伍最少人数

    local return_msg_tb = {}
    local can_fight =0

    if Lua_tools.GetTeamMember(player, false) >= join_min_num then
        if Lua_tools.GetTeamLowestlevel(player) >= level_min then
            can_fight = 1
        end
    end
    if player:IsTempLeave() then
        can_fight = 0
    end
    table.insert(return_msg_tb, can_fight)
    table.insert(return_msg_tb, join_min_num)
    table.insert(return_msg_tb, level_min)
    --{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
    return return_msg_tb
end

--进入战斗
function MenPaiRuQin.StartFight(player, npc)
    if npc:GetInt("MenPaiRuQinNPCisFight") > 0 then
        return false
    else
        local mon_id = npc:GetInt("MenPaiRuQinFightMonID") or 20001

        if sFightSystem:StartTagPVE(player, mon_id, MenPaiRuQin.FightTag, "MenPaiRuQin", "FightCallBack", ""..npc:GetGUID()) then
            --npc:SetInt("MenPaiRuQinNPCisFight", 1) --1 npc在战斗中 0 不在
            local team = player:GetTeam()
            local memberList = {}
            if team and not player:IsTempLeave() then
                memberList = team:GetTeamMembers(false)
            else
                memberList[1] = player
            end
            for _,v in ipairs(memberList) do
                sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "MenPaiRuQin", "OnResult")

                v:SetInt("MenPaiRuQinFightNPCGUID", npc:GetGUID())
                v:SetString("MenPaiRuQinFightNPCName", npc:GetKeyName())
                v:SetInt("MenPaiRuQinFightNPCActID", npc:GetInt("MenPaiRuQinActID"))
            end
            if player:IsTeamLeader() then
				for _,v in ipairs(memberList) do
					if v:GetType() ~= GUID_ROBOT then
						npc:SetInt("MenPaiRuQinNPCisFight", npc:GetInt("MenPaiRuQinNPCisFight")+1)
					end
				end
			end
        else
            sLuaApp:LuaErr("MenPaiRuQin.StartFight开始pve失败")
        end
        return true
    end
end

--战斗完回调
function MenPaiRuQin.FightCallBack(typ, tag, custom)
    if custom == "" or tag ~= MenPaiRuQin.FightTag then
        sLuaApp:LuaErr("MenPaiRuQin.FightCallBack回调错误")
        return
    end
    local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
    if npc then
        npc:SetInt("MenPaiRuQinNPCisFight", 0)
    end
end

--人物完成战斗回调
function MenPaiRuQin.OnResult(player, typ, victory, custom)
    sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "MenPaiRuQin", "OnResult")

    local npc = sNpcSystem:GetNpcByGUID(player:GetInt("MenPaiRuQinFightNPCGUID"))
    local id = player:GetInt("MenPaiRuQinFightNPCActID")
    if npc and npc:GetInt("MenPaiRuQinNPCisFight") > 0 then
		npc:SetInt("MenPaiRuQinNPCisFight", npc:GetInt("MenPaiRuQinNPCisFight")-1)
	end
    if victory == 2 then
        --参与次数没到上限才发奖励
        local join_max = MenPaiRuQin.JoinMax
        local join_num = player:GetDayInt("MenPaiRuQin_Join_Num"..id) + 1
        if join_num <= join_max then
            player:SetDayInt("MenPaiRuQin_Join_Num"..id, join_num)
            --发奖励
            MenPaiRuQin.GiveReward(player, player:GetString("MenPaiRuQinFightNPCName"), id)
        else
            sLuaApp:NotifyTipsMsg(player, "参与次数已达上限，无法获得奖励")
        end

        if npc then
            MenPaiRuQin.DestroyNPC(npc)
        end
		
		local activity_data = ActivityConfig.GetById(id)
		if activity_data and VipIngotTrace then
			VipIngotTrace.GetReward(player, activity_data.Name)
		end
    end
    player:SetInt("MenPaiRuQinFightNPCGUID", 0)
    player:SetString("MenPaiRuQinFightNPCName", "")
    player:SetInt("MenPaiRuQinFightNPCActID", 0)
end

-- 发放奖励
function MenPaiRuQin.GiveReward(player, npc_keyname, id)
    local reward = MenPaiRuQin.Reward[1]
    if not reward then return end

    -- + exp
    local add_exp = reward.Exp
    if add_exp and add_exp ~= 0 then
        local res_exp = MenPaiRuQin.RewardConfigToNumber(player, add_exp)
        player:AddExp(res_exp, "system", "门派入侵活动", "门派入侵掉落")

        local PetList = Lua_tools.GetFightPets(player)
        for k,v in pairs(PetList) do
            v:AddExp(res_exp, "system", "门派入侵活动", "门派入侵掉落")
        end
    end

    -- + money
    local add_money_type = reward.MoneyType
    local add_money_val = reward.MoneyVal
    if add_money_type and add_money_val and add_money_val ~= 0 then
        local res_money = MenPaiRuQin.RewardConfigToNumber(player, add_money_val)
        Lua_tools.AddMoney(player, add_money_type, res_money, "system", "活动"..id, npc_keyname.."怪物掉落")
        sLuaApp:NotifyTipsMsg(player, "您获得了"..res_money.."银币")
    end

    -- + 道具奖励
    local res_item_list = Lua_tools.PlayerStartRandom(reward.ItemList, "活动"..id..npc_keyname, reward.ItemTime)
    if res_item_list[1] ~= "Nil" then
        Lua_tools.AddItem(player, res_item_list, "system", "活动"..id, npc_keyname.."怪物掉落")
    end
end

function MenPaiRuQin.RewardConfigToNumber(player, add_num)
    if not add_num then return end

    local res_num = 0
    local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
	]]
    if type(add_num) == "table" then
        local min_num = add_num[1]
        local max_num = add_num[2]

        if type(min_num) == "string" then
            min_num = assert(load(str_factor .. " return " .. min_num))()
        end
        if type(max_num) == "string" then
            max_num = assert(load(str_factor .. " return " .. max_num))()
        end
        if max_num < min_num then
            max_num,min_num = min_num,max_num
        end
        res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
    elseif type(add_num) == "string" then
        res_num = assert(load(str_factor .. " return " .. add_num))()
    elseif type(add_num) == "number" then
        res_num = math.floor(add_num)
    end

    return res_num
end