--除暴安良任务活动脚本
Act_ChuBao = {}
Act_ChuBao.ShowItem = "61025"
Act_ChuBao.Active_Add = 10
Act_ChuBao.Active_Max = 10
Act_ChuBao.Active_ID = 76
-- 活动开始前回调
function Act_ChuBao.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_ChuBao.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_ChuBao.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_ChuBao.OnJoin(id, player)
	sLuaApp:NotifyTipsMsg(player, "快去击杀怪物完成任务吧！")
end

-- 玩家客户端查询数据回调
function Act_ChuBao.OnQuery(id, player)
	local str = ""..player:GetDayInt("Act_ChuBao_Count")..":1:"..player:GetDayInt("Act_ChuBao_Active_Num"..Act_ChuBao.Active_ID)..":"..Act_ChuBao.Active_Max..":"..Act_ChuBao.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_ChuBao")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end