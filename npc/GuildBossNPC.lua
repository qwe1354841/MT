--帮派BOSSNPC
GuildBossNPC = {}

function GuildBossNPC.main(npc, player)	
	if player:GetAttr(ROLE_ATTR_LEVEL) >= Act_GuildBoss.Level then
		if sLuaApp:IsActivityRunning(Act_GuildBoss.ID) then 
			player:AddNpcOption(npc, 0 , "帮派BOSS", "option", "")
		else
			player:AddNpcOption(npc, 0 , "上期信息", "option", "")
		end
	end
	return ""
end

function GuildBossNPC.option(npc, player, str)
	local FormStr = [[
		GUI.OpenWnd("WorldBossUI", string.format("index:%s,index2:%s", ]]..Act_GuildBoss.ID..[[, 0))
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
    return ""
end

function GuildBossNPC.get_server_data(player)
	local guild = player:GetGuild()
	local tb = {}
	local bosslevel = guild:GetInt("Guild_Boss_Level")
	tb['lastCD'] = 0
	tb['activityId'] = Act_GuildBoss.ID
	tb['activityName'] = "帮派BOSS"
	tb['activityTimeInfo'] = "周一19:30~20:30"
	tb['activityRule'] = "大于"..Act_GuildBoss.Level.."级单人可以参加"
	tb['activityItem'] = {Exp = 1,MoneyType = 5,MoneyVal = 1,ItemList = {"神兽兔碎片",5,0}}
	tb['bossName'] = Act_GuildBoss.Config['Guild_Boss_Config']['level_'..bosslevel]['name']
	tb['bossIcon'] = Act_GuildBoss.Config['Guild_Boss_Config']['level_'..bosslevel]['icon']
	tb['bossDes'] = Act_GuildBoss.Config['Guild_Boss_Config']['level_'..bosslevel]['describe']
	tb['bossLevel'] = bosslevel
	tb['bgPic'] = Act_GuildBoss.Config['Guild_Boss_Config']['level_'..bosslevel]['bg_pic']
	tb['playerGuidTable'] = {}
	tb['teamId'] = 0
	tb['AwardNumMax'] = Act_GuildBoss.DayCount
	tb['myName'] = player:GetName()
	tb['myRank'] = 0
	tb['myDamage'] = 0
	
	
	local player_guid = player:GetGUID()
	local tb1 = sRanklistSystem:GetRank(guild:GetInt("GuildBossRankNum"),player_guid)
	if #tb1 > 0 then
		tb['myRank'] = tb1[1]
		tb['myDamage'] = tb1[2]
	end
	
	tb['rankingTable'] = sRanklistSystem:GetAllRanklist(guild:GetInt("GuildBossRankNum"))
	
	if sLuaApp:IsActivityRunning(Act_GuildBoss.ID) then 
		tb['openState'] = 1
		tb['monsterHp'] = guild:GetInt("Guild_Boss_Max_HP")
		if not Data['GuildBoss']["BossHP"] then
			Data['GuildBoss']["BossHP"] = {}
		end
		if Data['GuildBoss']["BossHP"][''..guild:GetGUID()] then
			tb['monsterHp'] = Data['GuildBoss']["BossHP"][''..guild:GetGUID()]
		end

		tb['monsterMaxHp'] = guild:GetInt("Guild_Boss_Max_HP")
		tb['lastFightCnt'] = Act_GuildBoss.DayCount - player:GetDayInt("Guild_Boss_Count")
		tb['lastTime'] = sLuaApp:Str2DateTime(""..sLuaApp:Year(0).."-"..sLuaApp:Month(0).."-"..sLuaApp:MonthDay(0).." 20:30:00")
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