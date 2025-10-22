--假结婚巡礼
FakeWeddingWalk = {}

FakeWeddingWalk.ShowItem = "61024,21704"
--婚礼等级
FakeWeddingWalk.Grade = 3 

FakeWeddingWalk.HusbandName = "翩翩美少年"
FakeWeddingWalk.WifeName = "无敌美少女"

--红包内容 仅支持货币
FakeWeddingWalk.Reward = {
	{MoneyType = 5, MoneyVal = 2000, Rand = 30},
	{MoneyType = 5, MoneyVal = 2013, Rand = 30},
	{MoneyType = 5, MoneyVal = 4000, Rand = 20},
	{MoneyType = 5, MoneyVal = 4567, Rand = 20},
	{MoneyType = 5, MoneyVal = 6000, Rand = 10},
	{MoneyType = 5, MoneyVal = 6666, Rand = 10},
}
--每天最多捡红包数量
FakeWeddingWalk.GetGiftMaxNum = 20

function FakeWeddingWalk.Start(id)
	if sVarSystem:GetInt("Marry_IsWedding") == 1 then 
		sLuaApp:LuaDbg("已有婚礼进行中，结婚巡礼取消")
		return 
	end
	--设置婚礼品级
	sVarSystem:SetInt("Marry_NowWeddingGrade", FakeWeddingWalk.Grade)
	--设置有婚礼进行
	sVarSystem:SetInt("Marry_IsWedding",1)
	sVarSystem:SetInt("Marry_IsWeddingPlayer_1", 0)
	sVarSystem:SetInt("Marry_IsWeddingPlayer_2", 0)
	
	sVarSystem:SetInt("Marry_IsFakeWedding",1)
	--全服通告
	local grade_name = Marry.Grade[FakeWeddingWalk.Grade]["Name"]
	Marry.StartMsgToAll(FakeWeddingWalk.HusbandName, FakeWeddingWalk.WifeName, grade_name)
	
	Marry.StartWalk()
	
	--弹出跳转
	if ActOpenInformWnd then
		ActOpenInformWnd.StartInform(id)
	end
end

-- 活动开始前回调
function FakeWeddingWalk.OnDeclare(id, seconds)
end

-- 活动开始回调
function FakeWeddingWalk.OnStart(id, is_normal)
	sVarSystem:SetInt("FakeWeddingWalk_ID", id)
	FakeWeddingWalk.Start(id)
end

-- 活动结束回调
function FakeWeddingWalk.OnStop(id)
	sVarSystem:SetInt("FakeWeddingWalk_ID", 0)
end

-- 玩家点击参与活动回调
function FakeWeddingWalk.OnJoin(id, player)
	if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动尚未开启")
		return
	end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "正在战斗中，无法参与活动！")
		return
	end
	
	local view_npc_guid = sVarSystem:GetInt("Marry_PlayerViewNPC")
	local view_npc = sNpcSystem:GetNpcByGUID(view_npc_guid)
	local map = sMapSystem:GetMapByKey("长安城")
	if view_npc then
		local pos_x = sMapSystem:GetPosX(view_npc)
		local pos_y = sMapSystem:GetPosY(view_npc)
		sMapSystem:Jump(player, map, pos_x, pos_y, 5)
	else
		sMapSystem:Jump(player, map, 534, 125, 5)
	end
end

-- 玩家客户端查询数据回调
function FakeWeddingWalk.OnQuery(id, player)
	local show_item = FakeWeddingWalk.ShowItem or "61024,21704"
	local get_num = player:GetDayInt("FakeWeddingWalk_GetGiftNum")
	local str = get_num..":"..FakeWeddingWalk.GetGiftMaxNum..":0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("FakeWeddingWalk") or "2")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

-- --@newinter FakeWeddingWalk.t(player)
-- function FakeWeddingWalk.t(player)
	-- local map = player:GetMap()
	-- local player_x = sMapSystem:GetPosX(player)
	-- local player_y = sMapSystem:GetPosY(player)
	-- --发红包啦 特效
	-- local hb_str = [[
		-- GUI.OpenWnd("PlayScreenEffectUI","MarriageEffect")
	-- ]]
	-- sLuaApp:LuaErr(map:GetName()..player_x..player_y)
	-- sLuaApp:ShowAroundForm(map, player_x, player_y, "脚本表单", hb_str)
-- end