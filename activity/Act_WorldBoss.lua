--世界BOSS活动脚本
Act_WorldBoss = {}
-------------不可更改配置，修改后需要自行修改逻辑，自行负责---------------
Act_WorldBoss.ID = 64
Act_WorldBoss.DayCount = 1
Act_WorldBoss.FightTag = 100
Act_WorldBoss.RanklistMaxSize = 2000

-------------可更改配置---------------
--道具显示，61024,61025为经验和银币
Act_WorldBoss.ShowItem =  "61024,61025"
--队伍人数上下限
Act_WorldBoss.TeamNum_MIN = 1
Act_WorldBoss.TeamNum_MAX = 5
--参与等级
Act_WorldBoss.Level = 30

Act_WorldBoss.Config = {
	World_Boss_Config = {
		['level_1'] = {
			name = "蚩尤(1级)",
			icon = 1900359860,
			id = 20080,
			keyname = "世界BOSS-蚩尤1",
			describe = "魔域重现人间，封印在魔域底部的蚩尤冲破封印，勇士们，请集结起来将之封印。",
			monster_group = 4101, --怪物组里的怪物不能有相同ID的怪物
			bg_pic = 1801208010,
			
			map_keyname = "酆都",
			map_name = "酆都",
			pos_x = 135,
			pos_y = 107,
			direction = 4,
		},
		
		['level_2'] = {
			name = "蚩尤(2级)",
			icon = 1900359860,
			id = 20081,
			keyname = "世界BOSS-蚩尤2",
			describe = "魔域重现人间，封印在魔域底部的蚩尤冲破封印，勇士们，请集结起来将之封印。",
			monster_group = 4102,
			bg_pic = 1801208010,
			
			map_keyname = "酆都",
			map_name = "酆都",
			pos_x = 135,
			pos_y = 107,
			direction = 4,	
		},
		['level_3'] = {
			name = "蚩尤(3级)",
			icon = 1900359860,
			id = 20082,
			keyname = "世界BOSS-蚩尤3",
			describe = "魔域重现人间，封印在魔域底部的蚩尤冲破封印，勇士们，请集结起来将之封印。",
			monster_group = 4103,
			bg_pic = 1801208010,
			
			map_keyname = "酆都",
			map_name = "酆都",
			pos_x = 135,
			pos_y = 107,
			direction = 4,	
		},
		['level_4'] = {
			name = "蚩尤(4级)",
			icon = 1900359860,
			id = 20083,
			keyname = "世界BOSS-蚩尤4",
			describe = "魔域重现人间，封印在魔域底部的蚩尤冲破封印，勇士们，请集结起来将之封印。",
			monster_group = 4104,
			bg_pic = 1801208010,
			
			map_keyname = "酆都",
			map_name = "酆都",
			pos_x = 135,
			pos_y = 107,
			direction = 4,	
		},
		['level_5'] = {
			name = "蚩尤(5级)",
			icon = 1900359860,
			id = 20084,
			keyname = "世界BOSS-蚩尤5",
			describe = "魔域重现人间，封印在魔域底部的蚩尤冲破封印，勇士们，请集结起来将之封印。",
			monster_group = 4105,
			bg_pic = 1801208010,
			
			map_keyname = "酆都",
			map_name = "酆都",
			pos_x = 135,
			pos_y = 107,
			direction = 4,	
		},
		['level_6'] = {
			name = "蚩尤(6级)",
			icon = 1900359860,
			id = 20085,
			keyname = "世界BOSS-蚩尤6",
			describe = "魔域重现人间，封印在魔域底部的蚩尤冲破封印，勇士们，请集结起来将之封印。",
			monster_group = 4106,
			bg_pic = 1801208010,
			
			map_keyname = "酆都",
			map_name = "酆都",
			pos_x = 135,
			pos_y = 107,
			direction = 4,	
		},
	},
	World_Boss_Reward_Config = {
		['List'] = {
			['List_Num'] = 3,
			['List1'] = {
				Exp = "return 0",
				Bind_Gold = "return 50000+boss_level*1000",
				['ItemList'] = {20799,4,0,20910,2,0,20776,1,0,24101,1,1},
			},
			['List2'] = {
				Exp = "return 0",
				Bind_Gold = "return 30000+boss_level*600",
				['ItemList'] = {20799,3,0,20910,1,0,20775,1,0,24102,1,1},
			},
			['List3'] = {
				Exp = "return 0",
				Bind_Gold = "return 20000+boss_level*400",
				['ItemList'] = {20799,2,0,20818,1,0,20774,1,0,24103,1,1},
			},
		},

		['List_Not_KO'] = {
			['List_Not_KO_Num'] = 3,
			['List_Not_KO1'] = {
				Exp = "return 0",
				Bind_Gold = "return 25000+boss_level*500",
				['ItemList'] = {20799,3,0,20910,1,0,20775,1,0},
			},
			['List_Not_KO2'] = {
				Exp = "return 0",
				Bind_Gold = "return 15000+boss_level*300",
				['ItemList'] = {20799,2,0,20818,1,0,20774,1,0},
			},
			['List_Not_KO3'] = {
				Exp = "return 0",
				Bind_Gold = "return 10000+boss_level*200",
				['ItemList'] = {20799,1,0,20818,1,0,20773,1,0},
			},
		},
		
		['Fight_End1'] = {
			Exp = "return 0",
			Bind_Gold = "return (level+boss_level)*800+30000",
			['ItemList'] = {},
		},
		
		['KO'] = {
			Exp = "return 0",
			Bind_Gold = "return (level+boss_level)*1000+50000",
			['ItemList'] = {20799,1,0,20775,1,0,24104,1,1},
		},
	}
}



-- 活动开始前回调
function Act_WorldBoss.OnDeclare(id, seconds)
	local str = "30分钟后，冲破封印的世界BOSS将出现在酆都，请勇士们做好准备!"
    sLuaApp:NotifyTopMsgToAll(1, str)
end

-- 活动开始回调
--@newinter Act_WorldBoss.OnStart(64, "")
function Act_WorldBoss.OnStart(id, is_normal)
	sRanklistSystem:ClearRanklist(RankingListSystem.Config['世界BOSS排行榜'])--清空排行榜
	sDBVarSystem:SetInt("World_Boss_Max_HP",0,2)
	local bosslevel = sDBVarSystem:GetInt("World_Boss_Level")
	if sDBVarSystem:GetInt("World_Boss_IS_KO") == 1 then
		if Act_WorldBoss.Config['World_Boss_Config']['level_'..(bosslevel+1)] then
			bosslevel = bosslevel + 1 
			sDBVarSystem:SetInt("World_Boss_Level",bosslevel,2)
		end
	end
	
	if not is_normal then
		local str = "冲破封印的世界BOSS将出现在"..Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['map_name'].."，请勇士们前往迎敌!"
		sLuaApp:NotifyTopMsgToAll(1, str)
	end
	
	if not Act_WorldBoss.refresh_npc() then
		sLuaApp:LuaDbg( "Act_WorldBoss.OnStart err")
	end
	sDBVarSystem:SetInt("World_Boss_IS_KO",0,2)
end

-- 活动结束回调
--@newinter Act_WorldBoss.OnStop(64)
function Act_WorldBoss.OnStop(id)
	--if Data["Act_WorldBoss_BossHP"] then
	--	Data["Act_WorldBoss_BossHP"] = nil
	--end
	Act_WorldBoss.ClearHPData()
	sDBVarSystem:SetInt("World_Boss_Max_HP",0,2)
	if sDBVarSystem:GetInt("World_Boss_IS_KO") == 0 then
		sFightSystem:StopTagFight(Act_WorldBoss.FightTag,2)
		local str = "很遗憾，勇士们未能击杀世界BOSS，他逃离了魔域。"
		sLuaApp:NotifyTopMsgToAll(1, str)
		--没有击杀，全部奖励
		Act_WorldBoss.reward_all(2)
	end
end

function Act_WorldBoss.ClearHPData()
	local config_count = Lua_tools.tablecount(Act_WorldBoss.Config["World_Boss_Config"])
	for i = 1, config_count do
		local BossIdList = Act_WorldBoss.GetBossIdList(i)
		for index, value in ipairs(BossIdList) do
			Data["Act_WorldBoss_BossHP_"..value] = nil
		end
	end
end

-- 玩家点击参与活动回调
function Act_WorldBoss.OnJoin(id, player)
	local npc_id = sNpcSystem:GetNpcByGUID(sVarSystem:GetString("World_Boss_Guid")):GetId()
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
					CL.StartMove(]]..npc_id..[[)
				]]
					
				sLuaApp:ShowForm(player, "脚本表单", FormStr)
			end
		end
	end
	--sMapSystem:Jump(player,map,x,y,range)
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(]]..npc_id..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

-- 玩家客户端查询数据回调
function Act_WorldBoss.OnQuery(id, player)
	--local str = ""..sQuestSystem:GetRingDay(player,109)..":5:0:0:61024,61025:1:2,3,5"
	local str = ""..player:GetDayInt("World_Boss_Player_Day_Count")..":"..Act_WorldBoss.DayCount..":0:0:"..Act_WorldBoss.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_WorldBoss")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

function Act_WorldBoss.refresh_npc()
	local bossguid = sVarSystem:GetString("World_Boss_Guid")
	local bosslevel = sDBVarSystem:GetInt("World_Boss_Level")
	--服务器重启过，或第一次开启该活动
	if bossguid == ""then
		return Act_WorldBoss.create_npc(bosslevel)
	end
	--判断是否击杀过boss
	if sDBVarSystem:GetInt("World_Boss_IS_KO") == 1 then
		if not Act_WorldBoss.destroy_npc(bossguid) then
			return false
		end
		if not Act_WorldBoss.create_npc(bosslevel) then
			return false
		end
	end
	
	return true
end

function Act_WorldBoss.create_npc(bosslevel)
	if bosslevel == 0 then
		bosslevel = 1
		sDBVarSystem:SetInt("World_Boss_Level",bosslevel,2)
	end
	local tb = Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]
	local npc = sNpcSystem:CreateNpc(tb['id'], sMapSystem:GetMapByKey(""..tb['map_keyname']), tb['pos_x'], tb['pos_y'], 0, tb['direction'], 0)
	if not npc then
		sLuaApp:LuaDbg( "Act_WorldBoss.create_npc err , bosslevel = "..bosslevel)
		return false
	end
	sVarSystem:SetString("World_Boss_Guid",npc:GetGUID())
	return true
end

function Act_WorldBoss.destroy_npc(bossguid)
	if not sNpcSystem:DestroyNpc(sNpcSystem:GetNpcByGUID(bossguid)) then
		sLuaApp:LuaDbg( "Act_WorldBoss.destroy_npc err , bossguid = "..bossguid)
		return false
	end
	return true
end

function Act_WorldBoss.onjoin_worldboss_fight(player)
	local team = player:GetTeam()
	local members = {}
	if Act_WorldBoss.TeamNum_MIN <= 0 or Act_WorldBoss.TeamNum_MAX <= 0 then
		sLuaApp:NotifyTipsMsg(player, "世界BOSS人数配置错误")
		return
	elseif Act_WorldBoss.TeamNum_MIN == 1 and Act_WorldBoss.TeamNum_MAX == 1 then
		sLuaApp:NotifyTipsMsg(player, "世界BOSS人数配置错误")
		return
		--if team then
		--	sLuaApp:NotifyTipsMsg(player, "该活动只能单人参加，请先离队！")
		--	return
		--end
		--if Lua_tools.GetTeamLowestlevel(player) < Act_WorldBoss.Level then
		--	sLuaApp:NotifyTipsMsg(player, "您的等级不够，无法参加活动！")
		--	return
		--end
		--members = {player}
		--if not Act_WorldBoss.check_count(members) then
		--	sLuaApp:NotifyTipsMsg(player, "您的次数不够，无法参加活动！")
		--	return
		--end
	else
		if sDBVarSystem:GetInt("World_Boss_IS_KO") == 1 then
			sLuaApp:NotifyTipsMsg(player, "世界BOSS已经被击杀！")
			return
		end
		if not team then
			sLuaApp:NotifyTipsMsg(player, "该活动需要组队才能参加，快去喊小伙伴吧！")
			return
		end
		if not sTeamSystem:IsTeamLeader(team , player) then
			sLuaApp:NotifyTipsMsg(player, "只有队长才可以发起战斗！")
			return
		end
		if Lua_tools.GetTeamMember(player,false) < Act_WorldBoss.TeamNum_MIN or Lua_tools.GetTeamMember(player,false) > Act_WorldBoss.TeamNum_MAX then
			sLuaApp:NotifyTipsMsg(player, "队伍人数不足，无法参加活动！")
			return
		end
		if Lua_tools.GetTeamLowestlevel(player) < Act_WorldBoss.Level then
			sLuaApp:NotifyTipsMsg(player, "队伍中有玩家等级不足，无法参加活动！")
			return
		end
		members = team:GetTeamMembers(false)
		if not Act_WorldBoss.check_count(members) then
			sLuaApp:NotifyTipsMsg(player, "队伍中有玩家活动次数用尽，无法参加活动！")
			return
		end
	end
	if not Act_WorldBoss.set_count(members) then
		sLuaApp:LuaDbg( "Act_WorldBoss.set_count err")
		return
	end

	local bosslevel = sDBVarSystem:GetInt("World_Boss_Level")
	local res = sFightSystem:StartTagPVE(player,Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['monster_group'], Act_WorldBoss.FightTag,"Act_WorldBoss", "fight_over", ""..player:GetGUID())
	if res then
		sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Act_WorldBoss", "fight_result")
	end
end

function Act_WorldBoss.check_count(tb)
	for k,v in pairs(tb) do 
		if v:GetDayInt("World_Boss_Player_Day_Count") >= Act_WorldBoss.DayCount then
			return false
		end
	end
	return true
end

function Act_WorldBoss.set_count(tb)
	for k,v in pairs(tb) do 
		v:SetDayInt("World_Boss_Player_Day_Count", v:GetDayInt("World_Boss_Player_Day_Count")+1)
		v:SetString("World_Boss_Team_Guid", ""..v:GetTeam():GetTeamGUID())
	end
	return true
end

function Act_WorldBoss.fight_start(fighter)
	--战斗开始
	local bosslevel = sDBVarSystem:GetInt("World_Boss_Level")
	if not Data["Act_WorldBoss_BossHP_"..fighter:GetId()] then
		Data["Act_WorldBoss_BossHP_"..fighter:GetId()] = fighter:GetAttr(ROLE_ATTR_HP_LIMIT)
		--Data["Act_WorldBoss_BossHP"] = Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['max_hp']
	end
	fighter:SetHp(Data["Act_WorldBoss_BossHP_"..fighter:GetId()])

	if fighter:GetInt("SetBossGuid") ~= 1 then
		local player_guid = tonumber(sFightSystem:GetTagCustom(fighter))
		local player = sPlayerSystem:GetPlayerByGUID(player_guid)
		player:SetDayInt("All_Damage",0)
		local team = player:GetTeam()
		local members = team:GetTeamMembers(false)
		local boss_list = sFightSystem:GetFriends(fighter)
		local GUIDString = ""
		local Max_HP = 0
		for i, v in ipairs(boss_list) do
			GUIDString = GUIDString ..v:GetGUID().."_"
			v:SetInt("SetBossGuid",1)
			Max_HP = Max_HP + v:GetAttr(ROLE_ATTR_HP_LIMIT)
		end
		sDBVarSystem:SetInt("World_Boss_Max_HP",Max_HP,2)
		for k,v in pairs(members) do
			v:SetInt("IsWorldBossFight",1)
			--v:SetString("WorldBossFightGUID",fighter:GetGUID())
			local FormStr = [[
				if WorldBossUI then
					WorldBossUI.OnStartBattle()
				end
				TimeDownUI.SetBossGuid(']]..GUIDString..[[',]]..Act_WorldBoss.Config['World_Boss_Config']['level_'..bosslevel]['icon']..[[,]]..Max_HP..[[)
			]]
			sLuaApp:ShowForm(v, "脚本表单", FormStr)
		end
	end
end

function Act_WorldBoss.round_over(fighter)
	--回合后
	local player_guid = tonumber(sFightSystem:GetTagCustom(fighter))
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local team = player:GetTeam()
	if not team then	
		sLuaApp:LuaDbg( "Act_WorldBoss.round_over err")
		return 
	end
	local team_guid = team:GetTeamGUID()
	local last_hp = fighter:GetDayInt("Act_WorldBoss_Last_"..fighter:GetId())
	local now_hp = fighter:GetAttr(ROLE_ATTR_HP)
	local damage = last_hp - now_hp
	player:SetDayInt("All_Damage",player:GetDayInt("All_Damage")+damage)
	Data["Act_WorldBoss_BossHP_"..fighter:GetId()] = Data["Act_WorldBoss_BossHP_"..fighter:GetId()] - damage

	--Boss存活判断
	local boss_list = sFightSystem:GetFriends(fighter)
	local BossIDList = Act_WorldBoss.GetBossIdList()
	for i, BossID in ipairs(BossIDList) do
		local survival = false
		for index, v in ipairs(boss_list) do
			if BossID == v:GetId() then
				survival = true
			end
		end
		if not survival then
			Data["Act_WorldBoss_BossHP_"..BossID] = 0
		end
	end

	local str = ""
	local str1 = ""
	for k,v in pairs(team:GetTeamMembers(false)) do
		str = v:GetGUID()..","..str
		str1 = VipIngotTrace.GetPlayerName(v)..","..str1
	end
	sRanklistSystem:UpdateRanklist(RankingListSystem.Config['世界BOSS排行榜'],team_guid,player:GetDayInt("All_Damage"),str,str1)
end

function Act_WorldBoss.handle_over(fighter)
	--行动前
	local hp = Data["Act_WorldBoss_BossHP_"..fighter:GetId()]
	fighter:SetHp(hp)
	fighter:SetDayInt("Act_WorldBoss_Last_"..fighter:GetId(),hp)
end

function Act_WorldBoss.fight_over(typ, tag, custom)
end

--@newinter Act_WorldBoss.fight_result(player, "", true, "")
function Act_WorldBoss.fight_result(player, typ, victory, custom)
	
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Act_WorldBoss", "fight_result")
	player:SetInt("IsWorldBossFight",0)
	--player:SetString("WorldBossFightGUID","")
	if victory == 2 then
		sDBVarSystem:SetInt("World_Boss_IS_KO",1,2)
		sFightSystem:StopTagFight(Act_WorldBoss.FightTag,2)

		local BossIdList = Act_WorldBoss.GetBossIdList()
		for index, value in ipairs(BossIdList) do
			Data["Act_WorldBoss_BossHP_"..value] = 0
		end
		
		local str = "通过大家的努力，世界BOSS被成功击杀。"
		for k,v in pairs(player:GetTeam():GetTeamMembers(false)) do
			str = str.." "..v:GetName()
		end
		str = str.." 所在的队伍完成了最后一击！"
		sLuaApp:NotifyTopMsgToAll(1, str)
		--最后一击
		Act_WorldBoss.reward_ko(player)
		--击杀，全部奖励
		Act_WorldBoss.reward_all(1)
	end
	local members = {}
	if player:GetTeam() then
		members = player:GetTeam():GetTeamMembers(false)
	else
		members[1] = player
	end
	for k,v in pairs(members) do
		v:SetInt("IsWorldBossFight",0)
		--v:SetString("WorldBossFightGUID",fighter:GetGUID())
		local FormStr = [[
			if TimeDownUI then
				TimeDownUI.IsWorldBossFight = nil
			end
		]]
		sLuaApp:ShowForm(v, "脚本表单", FormStr)
	end
	for k,v in pairs(members) do
			local GongShi = [[
			local level = ]]..sContactSystem:GetContactLevel(v:GetGUID())..[[
			local reincarnation = ]]..sContactSystem:GetContactReincarnation(v:GetGUID())..[[
			local boss_level = ]]..sDBVarSystem:GetInt("World_Boss_Level")..[[
		]]
		local bindgold = assert(load(GongShi..Act_WorldBoss.Config['World_Boss_Reward_Config']['Fight_End1']['Bind_Gold']))()
		local exp = assert(load(GongShi..Act_WorldBoss.Config['World_Boss_Reward_Config']['Fight_End1']['Exp']))()
		local attrs = {}
			if exp > 0 then
			table.insert(attrs,295)
			table.insert(attrs,exp)
		end
		if bindgold > 0 then
			table.insert(attrs,300)
			table.insert(attrs,bindgold)
		end
		
		local items = {}
		items = Act_WorldBoss.Config['World_Boss_Reward_Config']['Fight_End1']['ItemList']
		sLuaApp:LuaDbg(Lua_tools.serialize(items))
		if sMailSystem:SendMail(0,"世界BOSS",v:GetGUID(),1,"魔神降临奖励","您在这次魔神降临中有不错的表现，以下是您的参与奖励！",attrs,items) ~= 0 then
			sLuaApp:LuaDbg("Act_WorldBoss.fight_result SendMail err")
		end
	end
end

function Act_WorldBoss.reward_all(pattern)
	local str = ""
	if pattern == 1 then
		str = "List"
	elseif pattern == 2 then
		str = "List_Not_KO"
	end
	if str == "" then
		sLuaApp:LuaDbg( "Act_WorldBoss.reward_all err")
		return
	end
	local num = Act_WorldBoss.Config['World_Boss_Reward_Config'][''..str][''..str..'_Num']
	local tb = sRanklistSystem:GetRanklist(RankingListSystem.Config['世界BOSS排行榜'],1,num)
	for i = 1 , num , 1 do
		if Act_WorldBoss.Config['World_Boss_Reward_Config'][''..str][''..str..i] then
			if tb[i] then
				local str1 = tb[i][3]
				local tb_1 = sLuaApp:StrSplit(str1, ',')
				for a,b in pairs(tb_1) do
					if b ~= "" then
						local GongShi = [[
							local level = ]]..sContactSystem:GetContactLevel(tonumber(b))..[[
							local reincarnation = ]]..sContactSystem:GetContactReincarnation(tonumber(b))..[[
							local boss_level = ]]..sDBVarSystem:GetInt("World_Boss_Level")..[[
						]]
						local bindgold = assert(load(GongShi..Act_WorldBoss.Config['World_Boss_Reward_Config'][''..str][''..str..i]['Bind_Gold']))()
						local exp = assert(load(GongShi..Act_WorldBoss.Config['World_Boss_Reward_Config'][''..str][''..str..i]['Exp']))()
						local attrs = {}
						if exp > 0 then
							table.insert(attrs,295)
							table.insert(attrs,exp)
						end
						if bindgold > 0 then
							table.insert(attrs,300)
							table.insert(attrs,bindgold)
						end
						local items = {}
						items = Act_WorldBoss.Config['World_Boss_Reward_Config'][''..str][''..str..i]['ItemList']
						if sMailSystem:SendMail(0,"世界BOSS",tonumber(b),1,"魔神降临奖励","恭喜您在魔神降临活动中获得前"..num.."名，特此奖励。",attrs,items) ~= 0 then
							sLuaApp:LuaDbg("Act_WorldBoss.reward_all SendMail err  pattern = "..pattern)
						end
					end
				end
			end
		end
	end
end

function Act_WorldBoss.reward_ko(player)
	for k,v in pairs(player:GetTeam():GetTeamMembers(false)) do
		local GongShi = [[
			local level = ]]..sContactSystem:GetContactLevel(v:GetGUID())..[[
			local reincarnation = ]]..sContactSystem:GetContactReincarnation(v:GetGUID())..[[
			local boss_level = ]]..sDBVarSystem:GetInt("World_Boss_Level")..[[
		]]
		local bindgold = assert(load(GongShi..Act_WorldBoss.Config['World_Boss_Reward_Config']['KO']['Bind_Gold']))()
		local exp = assert(load(GongShi..Act_WorldBoss.Config['World_Boss_Reward_Config']['KO']['Exp']))()
		local attrs = {}
		if exp > 0 then
			table.insert(attrs,295)
			table.insert(attrs,exp)
		end
		if bindgold > 0 then
			table.insert(attrs,300)
			table.insert(attrs,bindgold)
		end
		
		local items = {}
		items = Act_WorldBoss.Config['World_Boss_Reward_Config']['KO']['ItemList']
		if sMailSystem:SendMail(0,"世界BOSS",v:GetGUID(),1,"魔神降临奖励","恭喜您完成了世界BOSS的最后一击，特此奖励！",attrs,items) ~= 0 then
			sLuaApp:LuaDbg("Act_WorldBoss.reward_ko SendMail err")
		end
	end
end

--获取Boss ID
function Act_WorldBoss.GetBossIdList(level)
	if not level then
		level = sDBVarSystem:GetInt("World_Boss_Level")
	end
	local monster_group = Act_WorldBoss.Config['World_Boss_Config']['level_'..level]["monster_group"]
	local GroupData = MonsterGenConfig.GetById(monster_group)
	local BossIdList = {}
	for i = 1, 10 do
		if GroupData["Monster"..i] ~= 0 and GroupData["Monster"..i] ~= "" then
			table.insert(BossIdList,GroupData["Monster"..i])
		end
	end
	return BossIdList
end


