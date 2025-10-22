--宝图任务活动脚本
Act_BaoTu = {}
Act_BaoTu.ShowItem = "61024,60001,60002"
Act_BaoTu.Active_Add = 1
Act_BaoTu.Active_Max = 10
Act_BaoTu.Active_ID = 25
-- 活动开始前回调
function Act_BaoTu.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_BaoTu.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_BaoTu.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_BaoTu.OnJoin(id, player)
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
					CL.StartMove(50001)
				]]
					
				sLuaApp:ShowForm(player, "脚本表单", FormStr)
			end
		end
	end
	--sMapSystem:Jump(player,map,x,y,range)
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(50001)
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

-- 玩家客户端查询数据回调
function Act_BaoTu.OnQuery(id, player)
	local str = ""..sQuestSystem:GetRingDay(player,70)..":10:"..player:GetDayInt("Act_BaoTu_Active_Num"..Act_BaoTu.Active_ID)..":"..Act_BaoTu.Active_Max..":"..Act_BaoTu.ShowItem..":"..ActivitySystem.Act_GetClassify("Act_BaoTu")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end