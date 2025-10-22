--护卫银子任务活动脚本
Act_HuWeiYinZi = {}
Act_HuWeiYinZi.ShowItem = "61024"
Act_HuWeiYinZi.Active_Add = 2
Act_HuWeiYinZi.Active_Max = 10
Act_HuWeiYinZi.Active_ID = 55
-- 活动开始前回调
function Act_HuWeiYinZi.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_HuWeiYinZi.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_HuWeiYinZi.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_HuWeiYinZi.OnJoin(id, player)
	local team = player:GetTeam()

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
					CL.StartMove(21069)
				]]
					
				sLuaApp:ShowForm(player, "脚本表单", FormStr)
			end
		end
	end
	--sMapSystem:Jump(player,map,x,y,range)
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(21069)
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

-- 玩家客户端查询数据回调
function Act_HuWeiYinZi.OnQuery(id, player)
	local str = ""..sQuestSystem:GetRingDay(player,122)..":5:"..player:GetDayInt("Act_HuWeiYinZi_Active_Num"..Act_HuWeiYinZi.Active_ID)..":"..Act_HuWeiYinZi.Active_Max..":"..Act_HuWeiYinZi.ShowItem ..":1:"..ActivitySystem.Act_GetClassify("Act_HuWeiYinZi")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end