--神兽挑战任务活动脚本
Act_ShenShouTiaoZhan = {}
Act_ShenShouTiaoZhan.ShowItem = "61024,61025,20833"
Act_ShenShouTiaoZhan.Active_Add = 2
Act_ShenShouTiaoZhan.Active_Max = 12
Act_ShenShouTiaoZhan.Active_ID = 45
-- 活动开始前回调
function Act_ShenShouTiaoZhan.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_ShenShouTiaoZhan.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_ShenShouTiaoZhan.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_ShenShouTiaoZhan.OnJoin(id, player)
	--local x = 562
	--local y = 134
	--local range = 0
	local team = player:GetTeam()
	--local map = sMapSystem:GetMapByKey("长安城")
	--if not map then
	--	sLuaApp:LuaDbg("map is nil")
	--	return 
	--end
	if team then
		local leader_guid = team:GetTeamLeaderGUID()
		if leader_guid then
			if leader_guid ~= player:GetGUID() then
				if not sTeamSystem:IsTempLeave(player) then
					sLuaApp:LuaDbg("not leader and not leave")
					return
				end
			else
				--sTeamSystem:EnterMap(team,map,x,y,range)
				local FormStr = [[
					GUI.DestroyWnd('ActivityPanelUI')
					CL.StartMove(10023)
				]]
					
				sLuaApp:ShowForm(player, "脚本表单", FormStr)
			end
		end
	end
	--sMapSystem:Jump(player,map,x,y,range)
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(10023)
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

-- 玩家客户端查询数据回调
function Act_ShenShouTiaoZhan.OnQuery(id, player)
	local str = ""..sQuestSystem:GetRingDay(player,102)..":6:"..player:GetDayInt("Act_ShenShouTiaoZhan_Active_Num"..Act_ShenShouTiaoZhan.Active_ID)..":"..Act_ShenShouTiaoZhan.Active_Max..":"..Act_ShenShouTiaoZhan.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_ShenShouTiaoZhan")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end