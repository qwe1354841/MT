--官职
OfficialPosition = {}

--官职配置 1官位 2官职名 3称号id 4称号属性（显示用） 5官职所需功勋 6俸禄 7俸禄icon 8俸禄类型
OfficialPosition.OfficalConfig = {
	{"无名小吏","无名小吏",554,"物防  +1_法防  +1",0,50000,1800408280,5},
	{"正九品","九品·兵曹",537,"物防  +3_法防  +3",75,100000,1800408280,5},
	{"正八品","八品·校尉",538,"物防  +5_法防  +5",150,200000,1800408280,5},
	{"正七品","七品·武骑尉",539,"物防  +7_法防  +7",300,300000,1800408280,5},
	{"正六品","六品·骁骑尉",540,"物防  +9_法防  +9",600,400000,1800408280,5},
	{"正五品","五品·上骑都尉",541,"物防  +11_法防  +11",900,500000,1800408280,5},
	{"正四品","四品·忠武将军",542,"物防  +13_法防  +13",1400,600000,1800408280,5},
	{"正三品","三品·上都护",543,"物防  +15_法防  +15",1900,700000,1800408280,5},
	{"正二品","二品·辅国大将军",544,"物防  +17_法防  +17",2400,800000,1800408280,5},
	{"正一品","一品·镇国上将军",545,"物防  +19_法防  +19",3000,900000,1800408280,5},
	{"超一品","丹书铁券·太尉",546,"物防  +25_法防  +25",3600,1000000,1800408280,5},
	{"超一品","金印紫绶·郡王",547,"物防  +30_法防  +30",4500,2000000,1800408280,5},
	{"超一品","御赐·辅政王",548,"物防  +35_法防  +35",6600,3000000,1800408280,5},
}

--官职系统开启等级
OfficialPosition.OpenLevel = 42

--OfficialPosition.SpecialTitleConfig = {553, 552, 551, 550, 549}

--官职排行榜前五名所获得的特殊称号的道具id 分别对应第一到第五
OfficialPosition.SpecialTitleConfig = {35507, 35506, 35505, 35504, 35503}

--称号官运亨通	35003
--称号达官显贵	35004
--称号高位重禄	35005
--称号官居极品	35006
--称号只手遮天	35007

--战功获取的活动途径以及自动引路的NPCID
OfficialPosition.ActivityAndNPC = {
	{activeid = 20, NPCid = 21074},
	{activeid = 22, NPCid = 21075},
}

--@newinter OfficialPosition.Test(player, 100)
function OfficialPosition.Test(player, exp)
	if player:AddPvp(exp, "", "", "") then
		sLuaApp:NotifyTipsMsg(player, "当前战功为："..player:GetPvp())
		sLuaApp:NotifyTipsMsg(player, "历史最高战功为："..player:GetInt("__total_pvp"))
		OfficialPosition.UpPosition(player)
		local attrs = {}
		local item = {35503, 1, 1}
		--if sMailSystem:SendMail(0,"系统",player:GetGUID(),1,"官职称号发放","您获得了官职限时称号！",attrs,item) ~= 0 then
		--	sLuaApp:LuaDbg(" OfficialPosition.CheckSpecialTitle SendMail err")
		--end
		return true
	else
		return false
	end
end

--获取官职信息
function OfficialPosition.GetOPConfig(player)
	--sLuaApp:LuaDbg("玩家上线发送官职信息")
	local str = [[
		UIDefine.OfficialPositionData = ]]..Lua_tools.serialize(OfficialPosition.OfficalConfig)..[[
		UIDefine.OfficialPosition_ActivityConfig = ]]..Lua_tools.serialize(OfficialPosition.ActivityAndNPC)..[[
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	OfficialPosition.UpPosition(player)
	if player:GetWeekInt("EveryWeekSpecialTitle") ~= 1 then
		OfficialPosition.CheckSpecialTitle(player)
	end
	return ""
end

--获取玩家当前官职信息
function OfficialPosition.GetNowPositionData(player)
	--sLuaApp:LuaDbg("获取当前官职及相关信息")
	OfficialPosition.UpPosition(player)
	local str = [[
		RoleAttributeUI.NowPosition = ]]..player:GetInt("NowPosition")..[[
		RoleAttributeUI.IsGetSalary = ]]..player:GetWeekInt("NowWeekGetSalary")..[[
		RoleAttributeUI.NowPVP = ]]..player:GetInt("__total_pvp")..[[
		RoleAttributeUI.SetCurrentOfficePosition("]]..OfficialPosition.OfficalConfig[player:GetInt("NowPosition")][2]..[[")
		RoleAttributeUI.RefreshOfficeAdvance()
	]]
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--检测升官
--@newinter OfficialPosition.UpPosition(player)
function OfficialPosition.UpPosition(player)
	--local now_pvp = player:GetPvp()
	local now_pvp = player:GetInt("__total_pvp")
	--sLuaApp:LuaDbg("now_pvp:"..now_pvp)
	local now_position = player:GetInt("NowPosition")
	local officaial_data = OfficialPosition.OfficalConfig
	if now_position < 0 or now_position > #officaial_data then
		sLuaApp:LuaErr("当前官职数据非法") 
		return ""
	end
	if now_position == #officaial_data then
		--sLuaApp:LuaDbg("当前官职已达到最大")
		local str = [[RoleAttributeUI.NowPVP = ]]..player:GetInt("__total_pvp")
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
	--sLuaApp:LuaDbg("#officaial_data:"..#officaial_data)
	local long = #officaial_data - 1
	for i = 1, long  do
		if now_pvp >= officaial_data[i][5] and now_pvp < officaial_data[i+1][5] then
			now_position = i
			break
		elseif i == long and now_pvp >= officaial_data[i+1][5] then
			now_position = i + 1
		end
	end
	if now_position ~= player:GetInt("NowPosition") then
		if now_position - player:GetInt("NowPosition") > 1 then
			for i = player:GetInt("NowPosition"), now_position do 
				if not sTitleSystem:HasTitle(player, officaial_data[i][3]) then
					sTitleSystem:AddTitle(player,officaial_data[i][3])
				end
			end
		end
		player:SetInt("NowPosition", now_position)
		if not sTitleSystem:HasTitle(player, officaial_data[now_position][3]) then
			sTitleSystem:AddTitle(player,officaial_data[now_position][3])
		end
		
		local str = [[RoleAttributeUI.SetCurrentOfficePosition("]]..OfficialPosition.OfficalConfig[player:GetInt("NowPosition")][2]..[[")]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		--官职成就
		if Achievement then
			Achievement.Achievement_Position(player)
		end
	end
	--更新官职排行榜
	local rankVal = tonumber(sRanklistSystem:GetRank(RankingListSystem.Config['官职榜'] or 34, player:GetGUID())[2])
	if now_pvp > 0 and now_pvp ~= rankVal then	
		sRanklistSystem:UpdateRanklist(RankingListSystem.Config['官职榜'] or 34, player:GetGUID(), now_pvp, player:GetName(), officaial_data[player:GetInt("NowPosition")][2])
		--sLuaApp:LuaDbg("更新排行榜")
	end
	return ""
	--sLuaApp:LuaDbg("NowPosition:"..player:GetInt("NowPosition"))
end

--检测获得特殊称号
function OfficialPosition.CheckSpecialTitle(player)
	if player:GetWeekInt("EveryWeekSpecialTitle") == 1 then
		return ""
	end
	local rank_list = sRanklistSystem:GetRanklist(RankingListSystem.Config['官职榜'] or 34, 1, 5)
	for k, v in ipairs(rank_list) do
		if player:GetInt("__total_pvp") > 0 then
			if player:GetGUID() == v[1] then
				local attrs = {}
				local item = {OfficialPosition.SpecialTitleConfig[tonumber(k)], 1, 1}
				if sMailSystem:SendMail(0,"系统",player:GetGUID(),1,"官职称号发放","您获得了官职限时称号",attrs,item) ~= 0 then
					sLuaApp:LuaDbg(" OfficialPosition.CheckSpecialTitle SendMail err")
				end
			end
		end
	end
	player:SetWeekInt("EveryWeekSpecialTitle", 1)
end

--领取俸禄
function OfficialPosition.GetSalary(player)
	-- sLuaApp:LuaDbg("GetSalary")
	-- sLuaApp:LuaDbg("是否领取："..player:GetWeekInt("NowWeekGetSalary"))
	if player:GetWeekInt("NowWeekGetSalary") == 1 then
		sLuaApp:NotifyTipsMsg(player, "本周俸禄已领取")
		return ""
	end
	OfficialPosition.UpPosition(player)
	local now_position = player:GetInt("NowPosition")
	local officaial_data = OfficialPosition.OfficalConfig
	if now_position < 0 or now_position > #officaial_data then
		sLuaApp:LuaDbg("当前官职数据非法") 
		return ""
	end
	if not Lua_tools.AddMoney(player, officaial_data[now_position][8], officaial_data[now_position][6], "官职系统", "官职对应领取俸禄", "领取俸禄给予货币") then
		sLuaApp:LuaErr("给予金币失败")
		return ""
	end
	sLuaApp:NotifyTipsMsg(player, "领取俸禄成功")
	player:SetWeekInt("NowWeekGetSalary", 1)
	local str = [[
		RoleAttributeUI.IsGetSalary = ]]..player:GetWeekInt("NowWeekGetSalary")..[[
		RoleAttributeUI.RefreshOfficeAdvance()
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	 return ""
end
