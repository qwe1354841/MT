--帮派任务活动脚本
Act_GuildQuest = {}
Act_GuildQuest.ShowItem = "61024,61025"
-- 活动开始前回调
function Act_GuildQuest.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_GuildQuest.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_GuildQuest.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_GuildQuest.OnJoin(id, player)
	local team = player:GetTeam()
	if team then
		sLuaApp:NotifyTipsMsg(player, "帮派任务是单人任务，请离队")
		return
	end
	local guild = player:GetGuild()
	if not guild then
		sLuaApp:NotifyTipsMsg(player, "请先加入一个帮派")
		return
	end
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(20060)
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

-- 玩家客户端查询数据回调
function Act_GuildQuest.OnQuery(id, player)
	local str = ""..sQuestSystem:GetRingDay(player,72)..":10:0:0:"..Act_GuildQuest.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_GuildQuest")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end