--宝阁大开活动
BaoGeDaKai = {}

--刷新的宝箱keyname,每次刷新数量
BaoGeDaKai.BoxNpc = {"帮派宝阁宝箱", 20} 
--每个帮派地图最多宝箱数量
BaoGeDaKai.EachGuildMaxBoxNum = 60	
--刷新区域
BaoGeDaKai.CenterPos = {
	{46,110},
	{99,75},
	{168,170},
	{223,125},
	{134,120}
}
--宝箱打开次数上限
BaoGeDaKai.BoxOpenMaxNum = 10 
--兑换奖励所需宝券数量
BaoGeDaKai.ExchangeGuildTicket = 10
--兑换奖励所提供帮贡
BaoGeDaKai.GuildTicketToGuildOffer = 100 
--进度条时间(毫秒)
BaoGeDaKai.ProgressBarTime = 3000
--#进度条提示
BaoGeDaKai.ProgressBarTip = "打开宝箱中..."
--特殊奖励物品(帮派宝券)
BaoGeDaKai.SpecialItem = {keyName = "帮派宝券", count = 1}
--奖励类型图标
BaoGeDaKai.ShowItem = "61025,61001,61005,20774,61022,31001"

BaoGeDaKai.BoxReward = {
	{bindgold = 0, item ="装备强化石",amount = 1,bind = 0, weight = 10000},
	{bindgold = 0, item ="装备强化石2",amount = 1,bind = 0, weight = 500},
	{bindgold = 10000, item ="",amount = 1,bind = 1, weight = 10000},
	{bindgold = 0, item ="特技卷轴礼盒1",amount = 1,bind = 0, weight = 500},
	{bindgold = 0, item ="特技卷轴礼盒2",amount = 1,bind = 0, weight = 50},
	{bindgold = 0, item ="特效卷轴礼盒1",amount = 1,bind = 0, weight = 50},
	{bindgold = 0, item ="50书铁",amount = 1,bind = 0, weight = 5000},
	{bindgold = 0, item ="50书铁",amount = 1,bind = 0, weight = 5000}

}--银币，物品，物品数量，该奖励权重，物品是否绑定

BaoGeDaKai.RefreshTime = {
	{"15:30", 3600},
	{"30:30", 3600},
	{"45:30", 3600},
	{"58:30", 3600},
}

-- 活动开始前回调
function BaoGeDaKai.OnDeclare(id, seconds)

end

function BaoGeDaKai.OnStart(id, is_normal)
	sLuaApp:LuaDbg("宝阁大开活动开始！")
	local refreshtime = BaoGeDaKai.RefreshTime
	--初始化刷新时刻表
	BaoGeDaKai.InitTimeList(id)
	--活动开始，刷一批宝箱
	BaoGeDaKai.SetCreateNPC(0,refreshtime[1][2]..","..id)
	--设置NPC刷新任务
	BaoGeDaKai.ScheduleNPC(id)
end

-- 活动结束回调
function BaoGeDaKai.OnStop(id)
	local act_name = ActivityConfig.GetById(id).Name
	sLuaApp:NotifyTopMsgToAll( 1, act_name.."活动结束!")
end

-- 玩家点击参与活动回调
function BaoGeDaKai.OnJoin(id, player)
	if sLuaApp:IsActivityRunning(id) then
		if not player:GetTeam() then
			local guild = player:GetGuild()
			if guild then
				local map = guild:GetMap()
				--中心点坐标
				local x = math.floor(map:GetWidth()/2)
				local y = math.floor(map:GetHeight()/2)
				if sMapSystem:Jump(player, map, x, y, 3) then
					local str = [[
						GUI.CloseWnd("ActivityPanelUI")
					]]
					sLuaApp:ShowForm(player, "脚本表单", str)
					return true
				else
					sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
					return false
				end
			end
		else
			sLuaApp:NotifyTipsMsg(player, "组队状态下无法跳转至帮派地图")
			return false
		end
	end
end

--初始化刷新时刻表
function BaoGeDaKai.InitTimeList(id)
	sLuaApp:LuaDbg("初始化刷新时刻表")
	BaoGeDaKai.RefreshTimelist = {}
	assert(load("BaoGeDaKai.RefreshTimelist["..id.."] = {} return "))()
	BaoGeDaKai.RefreshTimelist[id] = {}
	local refresh_time = BaoGeDaKai.RefreshTime
	local activityData = ActivityConfig.GetById(id)
	local hour = tonumber(string.sub(activityData.TimeEnd,1,2)) - 1 
	--sLuaApp:LuaDbg("hour:"..hour)
	local now_hour = sLuaApp:Hour(0)
	local index = 1
	for i = now_hour,hour,1 do
		for _,v in ipairs(refresh_time) do
			BaoGeDaKai.RefreshTimelist[id][index] = {}
			local fresh_time = i..":"..v[1]
			table.insert(BaoGeDaKai.RefreshTimelist[id][index],fresh_time)
			table.insert(BaoGeDaKai.RefreshTimelist[id][index],v[2])
			index = index+1
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(BaoGeDaKai.RefreshTimelist))
end

--计划刷新宝箱
function BaoGeDaKai.ScheduleNPC(id)
	for k,v in pairs(BaoGeDaKai.RefreshTimelist[id]) do
		sScheduleSystem:CreateSchedule(0, v[1], "BaoGeDaKai","SetCreateNPC", v[2]..","..id)
	end
end

--设置创建宝箱
--@newinter BaoGeDaKai.SetCreateNPC(timer, param)
function BaoGeDaKai.SetCreateNPC(timer, params)
	--sLuaApp:LuaDbg("设置刷新NPC")
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	local destroy_time = tonumber(tmp_tb[1])
	--sLuaApp:LuaDbg("destroy_time："..destroy_time)
	local id = tonumber(tmp_tb[2])
	local guild_list = sGuildSystem:GetAllGuilds()
	if sLuaApp:IsActivityRunning(id) then
		--destroy_time = tonumber(destroy_time)
		for k, v in pairs(guild_list) do
			--sLuaApp:LuaDbg(v:GetGUID())	--帮派对象GUID
			--sLuaApp:LuaDbg(v:GetMap():GetGUID())	--帮派地图GUID
			--sLuaApp:LuaDbg(v:GetMap():GetId())	--帮派地图GUID
			--local map = v:GetGuildMap()
			--sLuaApp:LuaDbg("map_id:"..map:GetId())
			local guild = v
			local map = v:GetMap()
			local map_NowMonsterNum = sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map:GetGUID().."_NPCNum")
			if map_NowMonsterNum > BaoGeDaKai.EachGuildMaxBoxNum then
				return ""
			end
			local boxnpc = BaoGeDaKai.BoxNpc
			local refersh_num = boxnpc[2]
			--sLuaApp:LuaDbg("refersh_num:"..refersh_num)
			for i = 1, refersh_num do
				local d = sLuaApp:RandInteger (1,#BaoGeDaKai.CenterPos)
				local pos_x = BaoGeDaKai.CenterPos[d][1]
				local pos_y = BaoGeDaKai.CenterPos[d][2]
				--sLuaApp:LuaDbg("x:"..pos_x)
				--sLuaApp:LuaDbg("y:"..pos_y)
				
				local map_range = math.min(pos_x, pos_y)
				local npc_keyname = boxnpc[1]
				local npc_data = NpcConfig.GetByKeyName(npc_keyname)
				local npc_id = npc_data.Id
				if map_NowMonsterNum >= BaoGeDaKai.EachGuildMaxBoxNum then
					return ""
				end
				local npc = sNpcSystem:CreateNpc (npc_id, map, pos_x, pos_y, map_range, 0, 0)--5是方向
				if npc then
					npc:SetInt("BaoGeDaKaiActID", id)
					npc:SetInt("BaoGeDaKaiMapGUID", map:GetGUID())
					sVarSystem:SetInt("BaoGeDaKai_"..id.."_"..map:GetGUID().."_NPCNum", sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map:GetGUID().."_NPCNum") + 1)
					sLuaTimerSystem:AddTimerEx(npc, destroy_time*1000,1,"BaoGeDaKai.DestroyNPC", "")
					--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map:GetGUID().."_NPCNum"))
				end
			end
		end
	end
end

--销毁npc
function BaoGeDaKai.DestroyNPC(npc, timer, p)
	--sLuaApp:LuaDbg("销毁NPC")
	local id = npc:GetInt("BaoGeDaKaiActID")
	local map_guid = npc:GetInt("BaoGeDaKaiMapGUID")
	--sLuaApp:LuaDbg("map_guid:"..map_guid)
	--sLuaApp:LuaDbg("mapNumber1:"..sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map_guid.."_NPCNum"))	
	sVarSystem:SetInt("BaoGeDaKai_"..id.."_"..map_guid.."_NPCNum", sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map_guid.."_NPCNum")-1)	
	--sLuaApp:LuaDbg("mapNumber2:"..sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map_guid.."_NPCNum"))
	sNpcSystem:DestroyNpc(npc)
end

--开箱！
function BaoGeDaKai.OpenBox(player, npc)
	local id = npc:GetInt("BaoGeDaKaiActID")
	local level_min = ActivityConfig.GetById(id).LevelMin
	if not level_min then return end
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "不到"..level_min.."级是没有能力开启宝箱的！")
		return false
	end
	local join_max = BaoGeDaKai.BoxOpenMaxNum
	--player:SetDayInt("BaoGeDaKai_Join_Num", 0)
	local join_num = player:GetDayInt("BaoGeDaKai_Join_Num") + 1
	--sLuaApp:LuaDbg("join_max:"..join_max)
	--sLuaApp:LuaDbg("join_num:"..join_num)
	if join_num > join_max then
		sLuaApp:NotifyTipsMsg(player, "今天已经开了够多的宝箱，无法再开了。")
		return false
	end
	if npc:GetInt("BaoGeDaKaiisOpening") == 1 then
		sLuaApp:NotifyTipsMsg(player, "宝箱从来都是先到先得，少侠，这个宝箱已经有主了！")
		return false
	end
   
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormBaoGeDaKai", "StopOpenBox", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]]..BaoGeDaKai.ProgressBarTime.."#"..BaoGeDaKai.ProgressBarTip..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)  
	local npc_guid = npc:GetGUID()
	--sLuaApp:LuaDbg("join_num:"..join_num)
	--sLuaApp:LuaDbg("npc_guid:"..npc_guid)
	local t_guid = sLuaTimerSystem:AddTimerEx(player, TianJiangBaoXiangConfig.ProgressBarTime,1,"BaoGeDaKai.GiveReward", join_num..","..npc_guid)
	if t_guid then
		npc:SetInt("BaoGeDaKaiisOpening", 1)
		player:SetInt("BaoGeDaKaiOpeningNPC", npc:GetGUID())
		player:SetInt("BaoGeDaKaiOpenBoxTimer", t_guid)
	end
		
	--if lualib:GetInt("0", "GuildBoxAcitivityStatus") == 1 then
	--	local guild = lualib:Player_GetGuild(player)
	--	local guild_map = lualib:Guild_GetGuildMap(guild)
	--	local monster_num = lualib:Map_GetNpcNumber(guild_map, boxnpc[1])
	--
	--	if monster_num < boxnpc[2]/2 then
	--		local guild = lualib:Player_GetGuild(player)
	--		on_refresh("", "",guild)
	--	end
	--end
end

--进度条打断
function BaoGeDaKai.StopOpenBox(player)
	local timer_guid = player:GetInt("BaoGeDaKaiOpenBoxTimer")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."BaoGeDaKai.StopOpenBox HasTimer错误")
	end
	player:SetInt("TianJiangBaoXiangOpenBoxTimer", 0)
	
	local npc_guid = player:GetInt("BaoGeDaKaiOpeningNPC")
	local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
	if npc then
		npc:SetInt("BaoGeDaKaiisOpening", 0)
	end
end

--发奖励
function BaoGeDaKai.GiveReward(player, timer, param)
	--sLuaApp:LuaDbg("param:"..param)
	local data = sLuaApp:StrSplit (param, ",")
	local join_num = data[1]
	local npc_guid = data[2]
	--sLuaApp:LuaDbg("join_num:"..join_num)
	--sLuaApp:LuaDbg("npc_guid:"..npc_guid)
	--
	--sLuaApp:LuaDbg("npc_guid:"..npc_guid)
	local npc = sNpcSystem:GetNpcByGUID(npc_guid)
	local id = npc:GetInt("BaoGeDaKaiActID")
	
	local weight_list = {}
	for i = 1, #BaoGeDaKai.BoxReward do
		weight_list[#weight_list+1] = BaoGeDaKai.BoxReward[i].weight
	end
	
	local weight = BaoGeDaKai.GetWeight(weight_list)
	--sLuaApp:LuaDbg("weight:"..weight)
	local reward = BaoGeDaKai.BoxReward[weight]
	
	if reward.bindgold > 0 then
		Lua_tools.AddMoney(player, 5, reward.bindgold, "帮派宝阁宝箱", "开启宝箱", "开启宝箱获得银币")
		--player:AddBindGold(reward.bindgold)
		sLuaApp:NotifyTipsMsg(player, "开启宝箱获得银币"..reward.bindgold)
	end
	
	--sLuaApp:LuaDbg("reward.item:"..reward.item)
	--sLuaApp:LuaDbg("reward.bindgold:"..reward.bindgold)
	--sLuaApp:LuaDbg("reward.amount:"..reward.amount)
	if Lua_tools.GetBagFree(player) < 0 then
		sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足，请清理后再打开宝箱")
		return ""
	end
	if reward.item ~= "" then
		local item_list = {reward.item, reward.amount, reward.bind}
		if not Lua_tools.AddItem(player, item_list, "宝阁大开活动", "开启宝箱", "开启宝箱获得道具") then
			sLuaApp:LuaErr("领取道具出错")
		end
	end
	local itemData = ItemConfig.GetByKeyName(BaoGeDaKai.SpecialItem["keyName"])
	sItemSystem:MergeItemEx(player, itemData.Id, BaoGeDaKai.SpecialItem["count"], true, "宝阁大开活动", "开启宝箱", "开启宝箱获得特殊道具")
	player:SetDayInt("BaoGeDaKai_Join_Num", join_num)
	--sItemSystem:AddItemEx(player, itemData.Id, BaoGeDaKai.SpecialItem["count"], true, "宝阁大开活动", "开启宝箱", "开启宝箱获得特殊道具")
	BaoGeDaKai.DestroyNPC(npc)
	--local guild = player:GetGuild()
	--local map = guild:GetMap()
	--sVarSystem:SetInt("BaoGeDaKai_"..id.."_"..map:GetGUID().."_NPCNum", sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map:GetGUID().."_NPCNum") - 1)
	--sLuaApp:LuaDbg("mapNumber:"..sVarSystem:GetInt("BaoGeDaKai_"..id.."_"..map:GetGUID().."_NPCNum"))
end


--计算权重
function BaoGeDaKai.GetWeight(list)
	local sum = 0
	local weight = 1
	for i=1 ,#list do
		sum = sum + list[i]
	end
	local num = sLuaApp:RandInteger(1,sum)
	
	for i=1 ,#list do
		if num <= list[i] then
			weight = i
			break
		else
			num = num -list[i]
		end
	end
	return weight
end

-- 玩家客户端查询数据回调
function BaoGeDaKai.OnQuery(id, player)
	local join_num = player:GetDayInt("BaoGeDaKai_Join_Num")
	local str = join_num..":"..BaoGeDaKai.BoxOpenMaxNum..":0:0:"..BaoGeDaKai.ShowItem..":2:"..ActivitySystem.Act_GetClassify("BaoGeDaKai")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end










