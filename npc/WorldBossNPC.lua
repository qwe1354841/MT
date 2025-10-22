--世界BOSSNPC
WorldBossNPC = {}

function WorldBossNPC.main(npc, player)	
	sLuaApp:LuaDbg("WorldBossNPC.main")
	if player:GetAttr(ROLE_ATTR_LEVEL) >= Act_WorldBoss.Level then
		if sLuaApp:IsActivityRunning(Act_WorldBoss.ID) then 
			player:AddNpcOption(npc, 0 , "魔神降临", "option", "")
		else
			player:AddNpcOption(npc, 0 , "上期信息", "option", "")
		end
	end
	return "0"
end

function WorldBossNPC.option(npc, player, str)
	local FormStr = [[
		GUI.OpenWnd("WorldBossUI", string.format("index:%s,index2:%s", ]]..Act_WorldBoss.ID..[[, 0))
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
    return ""
end

function WorldBossNPC.get_server_data(player)
	local tb = {}
	local bosslevel = sDBVarSystem:GetInt("World_Boss_Level")
	tb['lastCD'] = 0
	tb['activityId'] = Act_WorldBoss.ID
	tb['activityName'] = "魔神降临"
	tb['activityTimeInfo'] = "周四20:00~22:00"
	tb['activityRule'] = "大于"..Act_WorldBoss.Level.."级且组队可以参加"
	tb['activityItem'] = {Exp = 1,MoneyType = 5,MoneyVal = 1,ItemList = {"神兽牛碎片",1,0}}
	tb['bossName'] = Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['name']
	tb['bossIcon'] = Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['icon']
	tb['bossDes'] = Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['describe']
	tb['bossLevel'] = bosslevel
	tb['bgPic'] = Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['bg_pic']
	tb['playerGuidTable'] = {}
	tb['teamId'] = 0
	tb['AwardNumMax'] = Act_WorldBoss.DayCount
	tb['myName'] = player:GetName()
	tb['myRank'] = 0
	tb['myDamage'] = 0
	local guid = player:GetString("World_Boss_Team_Guid")
	if guid ~= "" then
		local tb1 = sRanklistSystem:GetRank(RankingListSystem.Config['世界BOSS排行榜'],guid)
		if #tb1 > 0 then
			tb['myRank'] = tb1[1]
			tb['myDamage'] = tb1[2]
		end
	end
	tb['rankingTable'] = sRanklistSystem:GetAllRanklist(RankingListSystem.Config['世界BOSS排行榜'])
	
	if sLuaApp:IsActivityRunning(Act_WorldBoss.ID) then 
		tb['openState'] = 1
		tb['monsterHp'] = 0
		local BossIDList = Act_WorldBoss.GetBossIdList()
		for i, BossID in ipairs(BossIDList) do
			if Data["Act_WorldBoss_BossHP_"..BossID] then
				tb['monsterHp'] = tb['monsterHp'] + Data["Act_WorldBoss_BossHP_"..BossID]
			end
		end
		tb['monsterMaxHp'] = sDBVarSystem:GetInt("World_Boss_Max_HP")
		tb['lastFightCnt'] = Act_WorldBoss.DayCount - player:GetDayInt("World_Boss_Player_Day_Count")
		tb['lastTime'] = sLuaApp:Str2DateTime(""..sLuaApp:Year(0).."-"..sLuaApp:Month(0).."-"..sLuaApp:MonthDay(0).." 22:00:00")
	else
		tb['openState'] = 0
		tb['monsterHp'] = 0
		tb['monsterMaxHp'] = 0
		tb['lastFightCnt'] = 0
		tb['lastTime'] = 0
	end

	local FormStr = [[
		if WorldBossUI then
			WorldBossUI.serverData = ]]..Lua_tools.serialize(tb)..[[
			WorldBossUI.Refresh()
		end
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)

end