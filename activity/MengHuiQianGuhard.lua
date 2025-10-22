--梦回千古(困难)副本(活动界面)
MengHuiQianGuhard = {}

-- 活动开始前回调
function MengHuiQianGuhard.OnDeclare(id, seconds)
end

-- 活动开始回调
function MengHuiQianGuhard.OnStart(id, is_normal)
end

-- 活动结束回调
function MengHuiQianGuhard.OnStop(id)
end

-- 玩家点击参与活动回调
function MengHuiQianGuhard.OnJoin(id, player)
	local level_min = tonumber(ActivityConfig.GetById(id).LevelMin)
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "等级低于"..level_min.."级的无名之辈也想挑战梦回千古(困难)？真是痴心妄想！")
		return
	end
	local now_time = sLuaApp:DaySinceEpoch(0)
	if player:GetInt("梦回千古(困难)EnterTime") + DungeonSystem.Config["梦回千古(困难)"]["RefreshTime"] > now_time then
		local MaxJoinTimes = DungeonSystem.Config["梦回千古(困难)"]["MaxJoinTimes"] or 1
		local VipTimes = VipLogic.GetVipEnhanced(player, "副本奖励次数", "times", MaxJoinTimes)
		local JoinTimes = player:GetDayInt("梦回千古(困难)JoinTimes")
		if JoinTimes >= VipTimes then
			sLuaApp:NotifyTipsMsg(player, "梦回千古(困难)内妖气横生，哪怕是少侠也不可短时间内进入多次。")
			return
		end
	end
	if MengHuiQianGuhardConfig.EnterPos then
		local npc_name = MengHuiQianGuhardConfig.EnterPos[5] or "主线任务-袁守城-长安城"
		local npc_id = NpcConfig.GetByKeyName(npc_name).Id
		local str = [[
			GUI.CloseWnd("ActivityPanelUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		Lua_tools.MoveToNpc(player, npc_id)
	else
		sLuaApp:LuaErr("缺少MengHuiQianGuhardConfig.EnterPos")
	end
end

-- 玩家客户端查询数据回调
function MengHuiQianGuhard.OnQuery(id, player)
	local MaxJoinTimes = DungeonSystem.Config["梦回千古(困难)"]["MaxJoinTimes"] or 1
	local VipTimes = VipLogic.GetVipEnhanced(player, "副本奖励次数", "times", MaxJoinTimes)
	local JoinTimes = player:GetDayInt("梦回千古(困难)JoinTimes")
	local active_num = player:GetDayInt("DungeonMengHuiQianGuhardConfigActiveNum")
	local show_item = MengHuiQianGuhardConfig.ShowItem or "61024,61025,36016,50204"
	local str = JoinTimes..":"..VipTimes..":"..active_num..":"..(MengHuiQianGuhardConfig.ActiveMax * VipTimes)..":"..show_item..":2:"..ActivitySystem.Act_GetClassify("MengHuiQianGuhard")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end