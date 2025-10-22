--大雁塔(困难)副本(活动界面)
DaYanTahard = {}

-- 活动开始前回调
function DaYanTahard.OnDeclare(id, seconds)
end

-- 活动开始回调
function DaYanTahard.OnStart(id, is_normal)
end

-- 活动结束回调
function DaYanTahard.OnStop(id)
end

-- 玩家点击参与活动回调
function DaYanTahard.OnJoin(id, player)
	local level_min = tonumber(ActivityConfig.GetById(id).LevelMin)
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "等级低于"..level_min.."级的无名之辈也想挑战大雁塔(困难)？真是痴心妄想！")
		return
	end
	local now_time = sLuaApp:DaySinceEpoch(0)
	local RefreshTime = 0
	if DungeonSystem.Config["大雁塔(困难)"] and DungeonSystem.Config["大雁塔(困难)"]["RefreshTime"] then
		RefreshTime = DungeonSystem.Config["大雁塔(困难)"]["RefreshTime"]
	end
	if player:GetInt("大雁塔(困难)EnterTime") + RefreshTime > now_time then
		sLuaApp:NotifyTipsMsg(player, "大雁塔(困难)内妖气横生，哪怕是少侠也不可短时间内进入多次。")
		return
	end
	if DaYanTahardConfig.EnterPos then
		local npc_name = DaYanTahardConfig.EnterPos[5] or "秘境1_开启"
		local npc_id = NpcConfig.GetByKeyName(npc_name).Id
		local str = [[
			GUI.CloseWnd("ActivityPanelUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		Lua_tools.MoveToNpc(player, npc_id)
	else
		sLuaApp:LuaErr("缺少DaYanTahardConfig.EnterPos")
	end
end

-- 玩家客户端查询数据回调
function DaYanTahard.OnQuery(id, player)
	local now_time = sLuaApp:DaySinceEpoch(0)
	local is_join = 0
	local RefreshTime = 0
	if DungeonSystem.Config["大雁塔(困难)"] and DungeonSystem.Config["大雁塔(困难)"]["RefreshTime"] then
		RefreshTime = DungeonSystem.Config["大雁塔(困难)"]["RefreshTime"]
	end
	if player:GetInt("大雁塔(困难)EnterTime") + RefreshTime > now_time then
		is_join = 1
	end
	local active_num = player:GetDayInt("DungeonDaYanTahardConfigActiveNum")
	-- if is_join == 0 then
		-- active_num = 0
		-- player:SetDayInt("DungeonDaYanTahardConfigActiveNum", 0)
	-- end
	
	local show_item = DaYanTahardConfig.ShowItem or "61024,61025,36016,50204"
	local str = is_join..":"..DaYanTahardConfig.JoinMax..":"..active_num..":"..DaYanTahardConfig.ActiveMax..":"..show_item..":2:"..ActivitySystem.Act_GetClassify("DaYanTahard")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end