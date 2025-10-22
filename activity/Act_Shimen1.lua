--师门任务活动脚本
Act_Shimen1 = {}
Act_Shimen1.NpcConfig = {
	[31] = 10009,
	[32] = 10011,
	[33] = 10008,
	[34] = 10012,
	[35] = 10010,
	[36] = 10013,
}
Act_Shimen1.QuestConfig = {
	[31] = 31,
	[32] = 96,
	[33] = 82,
	[34] = 86,
	[35] = 163,
	[36] = 91,
}
Act_Shimen1.ShowItem = "61024,61025,20916,20835"
Act_Shimen1.Active_Add = 1
Act_Shimen1.Active_Max = 20
Act_Shimen1.Active_ID = 2
-- 活动开始前回调
function Act_Shimen1.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_Shimen1.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_Shimen1.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_Shimen1.OnJoin(id, player)
	local npc = Act_Shimen1.NpcConfig[player:GetAttr(3)]
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
				local FormStr = [[
					GUI.DestroyWnd('ActivityPanelUI')
					CL.StartMove(]]..npc..[[)
				]]
					
				sLuaApp:ShowForm(player, "脚本表单", FormStr)
			end
		end
	end
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(]]..npc..[[)
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

-- 玩家客户端查询数据回调
function Act_Shimen1.OnQuery(id, player)
	local quest_id = Act_Shimen1.QuestConfig[player:GetAttr(3)]
	local str = ""..sQuestSystem:GetRingDay(player,quest_id)..":20:"..player:GetDayInt("Act_Shimen1_Active_Num"..Act_Shimen1.Active_ID)..":"..Act_Shimen1.Active_Max..":"..Act_Shimen1.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_Shimen1")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end