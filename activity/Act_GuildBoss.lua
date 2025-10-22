--帮派boss活动脚本
Act_GuildBoss = {}
-------------不可更改配置，修改后需要自行修改逻辑，自行负责---------------
Act_GuildBoss.ID = 65
--占用10010000到10011000
Act_GuildBoss.FightTag = 10000000
Act_GuildBoss.RanklistMaxSize = 2000

-------------可更改配置，奖励相关---------------
--参与等级
Act_GuildBoss.Level = 50
--次数
Act_GuildBoss.DayCount = 3
--道具显示，61024,61025为经验和银币
Act_GuildBoss.ShowItem = "61024,61025"
--帮派boss寻路位置NPCID
Act_GuildBoss.OnJoinNpcId = 20078


Act_GuildBoss.Config = {
	Guild_Boss_Config = {
		['level_1'] = {
			name = "巨魔刑天(1级)",
			icon = 1900359850,
			id = 20067,
			keyname = "帮派地图-刑天之魂1",
			describe = "受天地大劫感召，封印在圣树中的巨魔刑天吸收了怨气冲破封印，帮派的勇士们啊，请集结起来将之封印。",
			monster_group = 4001,
			pos_x = 144,
			pos_y = 54 ,
			direction = 4,
			bg_pic = 1800608780,
		},
			['level_2'] = {
			name = "巨魔刑天(2级)",
			icon = 1900359850,
			id = 20069,
			keyname = "帮派地图-刑天之魂2",
			describe = "受天地大劫感召，封印在圣树中的巨魔刑天吸收了怨气冲破封印，帮派的勇士们啊，请集结起来将之封印。",
			monster_group = 4002,
			pos_x = 144,
			pos_y = 54 ,
			direction = 4,	
			bg_pic = 1800608780,
		},
			['level_3'] = {
			name = "巨魔刑天(3级)",
			icon = 1900359850,
			id = 20070,
			keyname = "帮派地图-刑天之魂3",
			describe = "受天地大劫感召，封印在圣树中的巨魔刑天吸收了怨气冲破封印，帮派的勇士们啊，请集结起来将之封印。",
			monster_group = 4003,
			pos_x = 144,
			pos_y = 54 ,
			direction = 4,	
			bg_pic = 1800608780,
		},
			['level_4'] = {
			name = "巨魔刑天(4级)",
			icon = 1900359850,
			id = 20071,
			keyname = "帮派地图-刑天之魂4",
			describe = "受天地大劫感召，封印在圣树中的巨魔刑天吸收了怨气冲破封印，帮派的勇士们啊，请集结起来将之封印。",
			monster_group = 4004,
			pos_x = 144,
			pos_y = 54 ,
			direction = 4,	
			bg_pic = 1800608780,
		},
			['level_5'] = {
			name = "巨魔刑天(5级)",
			icon = 1900359850,
			id = 20072,
			keyname = "帮派地图-刑天之魂5",
			describe = "受天地大劫感召，封印在圣树中的巨魔刑天吸收了怨气冲破封印，帮派的勇士们啊，请集结起来将之封印。",
			monster_group = 4005,
			pos_x = 144,
			pos_y = 54 ,
			direction = 4,	
			bg_pic = 1800608780,
		},
			['level_6'] = {
			name = "巨魔刑天(6级)",
			icon = 1900359850,
			id = 20073,
			keyname = "帮派地图-刑天之魂6",
			describe = "受天地大劫感召，封印在圣树中的巨魔刑天吸收了怨气冲破封印，帮派的勇士们啊，请集结起来将之封印。",
			monster_group = 4006,
			pos_x = 144,
			pos_y = 54 ,
			direction = 4,	
			bg_pic = 1800608780,
		},
	},
	Reward_Config = {
		['List'] = {
			['List_Num'] = 3,
			['List1'] = {
				Exp = "return 0",
				Bind_Gold = "return 50000+boss_level*1000",
				Gold = "",
				Contrb = "",
				Fund = "",
				['ItemList'] = {26200,4,0, 20737,1,0, 20910,1,0},
			},
			['List2'] = {
				Exp = "return 0",
				Bind_Gold = "return 30000+boss_level*600",
				Gold = "",
				Contrb = "",
				Fund = "",
				['ItemList'] = {26200,3,0, 20737,1,0, 20818,1,0},
			},
			['List3'] = {
				Exp = "return 0",
				Bind_Gold = "return 20000+boss_level*400",
				Gold = "",
				Contrb = "",
				Fund = "",
				['ItemList'] = {26200,4,0, 20737,1,0, 20818,1,0},
			},
		},

		['List_Not_KO'] = {
			['List_Not_KO_Num'] = 3,
			['List_Not_KO1'] = {
				Exp = "return 0",
				Bind_Gold = "return 25000+boss_level*500",
				Gold = "",
				Contrb = "",
				Fund = "",
				['ItemList'] = {26200,3,0, 20737,1,0, 20818,1,0},
			},
			['List_Not_KO2'] = {
				Exp = "return 0",
				Bind_Gold = "return 15000+boss_level*300",
				Gold = "",
				Contrb = "",
				Fund = "",
				['ItemList'] = {26200,2,0, 20737,1,0, 20818,1,0},
			},
			['List_Not_KO3'] = {
				Exp = "return 0",
				Bind_Gold = "return 10000+boss_level*200",
				Gold = "",
				Contrb = "",
				Fund = "",
				['ItemList'] = {26200,1,0, 20738,1,0, 20818,1,0},
			},
		},
		
		['Fight_End1'] = {
			Exp = "return 0",
			Bind_Gold = "return (level+boss_level)*250+3000*guild_level",
			Gold = "",
			Contrb = "return level/2+5*guild_level",
			Fund = "return boss_level*100+1000",
			['ItemList'] = {},
		},
		
		['KO1'] = {
			Exp = "return 0",
			Bind_Gold = "return (level+boss_level)*600+3000*guild_level",
			Gold = "",
			Contrb = "return level*3+15*guild_level",
			Fund = "return 10000+500*boss_level",
			['ItemList'] = {26200,1,0},
		},
	},
}



-- 活动开始前回调
function Act_GuildBoss.OnDeclare(id, seconds)
	local str = "30分钟后，帮派BOSS将会出现在帮派内，请所有帮派成员做好准备。"
	for k,v in pairs(sGuildSystem:GetAllGuilds()) do
		 sLuaApp:ShowFormToGuild(v, "脚本表单", [[SystemBroadCastUI.ShowSystemBroadCast(']]..str..[[', 1)]]);
	end
end

-- 活动开始回调
--@newinter Act_GuildBoss.OnStart(65)
function Act_GuildBoss.OnStart(id, is_normal)
	Data['GuildBoss'] = {}
	Data['GuildBoss']['RankMaxNum'] = 1
	for k,v in pairs(sGuildSystem:GetAllGuilds()) do
		if not is_normal then
			local str = "帮派BOSS出现在帮派内，请所有帮派成员做好准备。"
			sLuaApp:ShowFormToGuild(v, "脚本表单", [[SystemBroadCastUI.ShowSystemBroadCast(']]..str..[[', 1)]]);
		end
		v:SetInt("Guild_Boss_Max_HP",0)
		v:SetInt("GuildBossRankNum",(Data['GuildBoss']['RankMaxNum']+10000))
		sRanklistSystem:SetRanklistMaxSize(Data['GuildBoss']['RankMaxNum']+10000,Act_GuildBoss.RanklistMaxSize)
		sRanklistSystem:ClearRanklist(Data['GuildBoss']['RankMaxNum']+10000)
		Data['GuildBoss']['RankMaxNum'] = Data['GuildBoss']['RankMaxNum'] + 1
		
		local bosslevel = v:GetInt("Guild_Boss_Level")
		if v:GetInt("Guild_Boss_IS_KO") == 1 then
			if Act_GuildBoss.Config['Guild_Boss_Config']['level_'..(bosslevel+1)] then
				bosslevel = bosslevel + 1 
				v:SetInt("Guild_Boss_Level",bosslevel)
			end
		end
		
		if not Act_GuildBoss.refresh_npc(v) then
			sLuaApp:LuaDbg("Act_GuildBoss.OnStart err")
		end
		v:SetInt("Guild_Boss_IS_KO",0)
		Data['GuildBoss']['JoinGuile'] = {}
		table.insert(Data['GuildBoss']['JoinGuile'],v:GetGUID())
	end
end

-- 活动结束回调
function Act_GuildBoss.OnStop(id)
	for k,v in pairs(Data['GuildBoss']['JoinGuile']) do 
		local guild = sGuildSystem:GetGuildByGUID(v)
		if not Data['GuildBoss']["BossHP"] then
			Data['GuildBoss']["BossHP"] = {}
		end
		if Data['GuildBoss']["BossHP"][''..v] then
			Data['GuildBoss']["BossHP"][''..v] = nil
		end
		
		guild:SetInt("Guild_Boss_Max_HP",0)
		if guild:GetInt("Guild_Boss_IS_KO") == 0 then
			sFightSystem:StopTagFight((Act_GuildBoss.FightTag+guild:GetInt("GuildBossRankNum")),2)
			local str = "很遗憾，帮派成员未能击杀帮派BOSS，他逃离了帮派。"
			sLuaApp:ShowFormToGuild(guild, "脚本表单", [[SystemBroadCastUI.ShowSystemBroadCast(']]..str..[[', 1)]]);
			Act_GuildBoss.reward_all(2,guild)
		end
	end
end

-- 玩家点击参与活动回调
--@newinter Act_GuildBoss.OnJoin(65, player)
function Act_GuildBoss.OnJoin(id, player)
	local guild = player:GetGuild()
	local guild_level = guild:GetInt("Guild_Boss_Level")
	if guild_level == 0 then
		guild_level = 1
	end
	--local npc_id = Act_GuildBoss.Config['Guild_Boss_Config']['level_'..guild_level]['id']
	local npc_id = Act_GuildBoss.OnJoinNpcId
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
function Act_GuildBoss.OnQuery(id, player)
	local str = ""..player:GetDayInt("Guild_Boss_Count")..":"..Act_GuildBoss.DayCount..":0:0:"..Act_GuildBoss.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_GuildBoss")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

function Act_GuildBoss.refresh_npc(guild)
	local bossguid = sVarSystem:GetString("Guild_Boss_Guid"..guild:GetGUID())
	local bosslevel = guild:GetInt("Guild_Boss_Level")
	--服务器重启过，或第一次开启该活动
	if bossguid == ""then
		return Act_GuildBoss.create_npc(bosslevel,guild)
	end
	--判断是否击杀过boss
	if guild:GetInt("Guild_Boss_IS_KO") == 1 then
		if not Act_GuildBoss.destroy_npc(bossguid) then
			return false
		end
		if not Act_GuildBoss.create_npc(bosslevel,guild) then
			return false
		end
	end
	
	return true
end

function Act_GuildBoss.create_npc(bosslevel,guild)
	if not guild then
		sLuaApp:LuaDbg( "Act_GuildBoss.create_npc err guild is nil")
		return
	end
	if bosslevel == 0 then
		bosslevel = 1
		guild:SetInt("Guild_Boss_Level",bosslevel)
	end
	
	local tb = Act_GuildBoss.Config['Guild_Boss_Config']['level_'..bosslevel]
	local npc = sNpcSystem:CreateNpc(tb['id'], guild:GetMap(), tb['pos_x'], tb['pos_y'], 0, tb['direction'], 0)
	if not npc then
		sLuaApp:LuaDbg( "Act_GuildBoss.create_npc err , bosslevel = "..bosslevel)
		return false
	end
	sVarSystem:SetString("Guild_Boss_Guid"..guild:GetGUID(),npc:GetGUID())
	return true
end

function Act_GuildBoss.destroy_npc(bossguid)
	if not sNpcSystem:DestroyNpc(sNpcSystem:GetNpcByGUID(bossguid)) then
		sLuaApp:LuaDbg( "Act_GuildBoss.destroy_npc err , bossguid = "..bossguid)
		return false
	end
	return true
end

--@newinter Act_GuildBoss.onjoin_guildboss_fight(player)
function Act_GuildBoss.onjoin_guildboss_fight(player)
	local team = player:GetTeam()
	if team then
		sLuaApp:NotifyTipsMsg(player, "帮派BOSS只能单人参加！")
		return
	end
	if player:GetAttr(ROLE_ATTR_LEVEL) < Act_GuildBoss.Level then
		sLuaApp:NotifyTipsMsg(player, "等级不足，无法参加活动！")
		return
	end
	if player:GetDayInt("Guild_Boss_Count") >= Act_GuildBoss.DayCount then
		sLuaApp:NotifyTipsMsg(player, "活动次数用尽，无法参加活动！")
		return
	end
	local guild = player:GetGuild()
	if guild:GetInt("Guild_Boss_IS_KO") == 1 then
		sLuaApp:NotifyTipsMsg(player, "帮派BOSS已经被击杀！")
		return
	end
	
	local bosslevel = guild:GetInt("Guild_Boss_Level")
	local res = sFightSystem:StartTagPVE(player,Act_GuildBoss.Config['Guild_Boss_Config']['level_'..bosslevel]['monster_group'], Act_GuildBoss.FightTag+guild:GetInt("GuildBossRankNum"), "Act_GuildBoss","fight_over", ""..player:GetGUID())
	if res then
		player:SetDayInt("Guild_Boss_Count",(player:GetDayInt("Guild_Boss_Count")+1))
		sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Act_GuildBoss", "fight_result")
	end
end


function Act_GuildBoss.fight_start(fighter)
	local player_guid = tonumber(sFightSystem:GetTagCustom(fighter))
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local guild = player:GetGuild()
	local bosslevel = guild:GetInt("Guild_Boss_Level")
	if not Data['GuildBoss']["BossHP"] then
		Data['GuildBoss']["BossHP"] = {}
	end
	if not Data['GuildBoss']["BossHP"][''..guild:GetGUID()] then
		Data['GuildBoss']["BossHP"][''..guild:GetGUID()] = fighter:GetAttr(ROLE_ATTR_HP_LIMIT)
		guild:SetInt("Guild_Boss_Max_HP",Data['GuildBoss']["BossHP"][''..guild:GetGUID()])
	end
	fighter:SetHp(Data['GuildBoss']["BossHP"][''..guild:GetGUID()])
	player:SetInt("IsGuildBossFight",1)
	player:SetString("GuildBossFightGUID",fighter:GetGUID())
	local FormStr = [[
		if WorldBossUI then
			WorldBossUI.OnStartBattle()
		end
		TimeDownUI.SetBossGuid(']]..fighter:GetGUID()..[[',]]..Act_GuildBoss.Config['Guild_Boss_Config']['level_'..bosslevel]['icon']..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

function Act_GuildBoss.round_over(fighter)
	local player_guid = tonumber(sFightSystem:GetTagCustom(fighter))
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local guild = player:GetGuild()
	local last_hp = fighter:GetDayInt("Act_GuildBoss_Last")
	local now_hp = fighter:GetAttr(ROLE_ATTR_HP)
	local damage = last_hp - now_hp
	player:SetDayInt("All_Damage",player:GetDayInt("All_Damage")+damage)
	Data['GuildBoss']["BossHP"][''..guild:GetGUID()] = Data['GuildBoss']["BossHP"][''..guild:GetGUID()] - damage
	sRanklistSystem:UpdateRanklist(guild:GetInt("GuildBossRankNum"),""..player_guid,player:GetDayInt("All_Damage"),player_guid..",",player:GetName()..",")
end

function Act_GuildBoss.handle_over(fighter)
	local player_guid = tonumber(sFightSystem:GetTagCustom(fighter))
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local guild = player:GetGuild()
	local hp = Data['GuildBoss']["BossHP"][''..guild:GetGUID()]
	fighter:SetHp(hp)
	fighter:SetDayInt("Act_GuildBoss_Last",hp)
end

function Act_GuildBoss.fight_over(typ, tag, custom)
end

function Act_GuildBoss.fight_result(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Act_GuildBoss", "fight_result")
	player:SetInt("IsGuildBossFight",0)
	player:SetString("GuildBossFightGUID","")
	local guild = player:GetGuild()
	if victory == 2 then
		guild:SetInt("Guild_Boss_IS_KO",1)
		sFightSystem:StopTagFight(Act_GuildBoss.FightTag+guild:GetInt("GuildBossRankNum"),2)
		
		Data['GuildBoss']["BossHP"][''..guild:GetGUID()] = 0
		
		local str = "通过帮派成员的努力，帮派BOSS被成功击杀。恭喜帮派成员"..player:GetName().."完成了最后一击！"
		sLuaApp:ShowFormToGuild(guild, "脚本表单", [[SystemBroadCastUI.ShowSystemBroadCast(']]..str..[[', 1)]]);
		--最后一击
		Act_GuildBoss.reward_ko(player)
		--击杀，全部奖励
		Act_GuildBoss.reward_all(1,guild)
	end
	local GongShi = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		local boss_level = ]]..guild:GetInt("Guild_Boss_Level")..[[
		local guild_level = ]]..guild:GetLevel()..[[
	]]
	local bindgold = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config']['Fight_End1']['Bind_Gold']))()
	local exp = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config']['Fight_End1']['Exp']))()
	local attrs = {}
		if exp > 0 then
		table.insert(attrs,295)
		table.insert(attrs,exp)
	end
	if bindgold > 0 then
		table.insert(attrs,300)
		table.insert(attrs,bindgold)
	end
	
	--增加帮贡
	if Act_GuildBoss.Config['Reward_Config']["Fight_End1"]['Contrb'] and Act_GuildBoss.Config['Reward_Config']["Fight_End1"]['Contrb'] ~= "" then
		local contrb = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config']["Fight_End1"]['Contrb']))()
		player:AddGuildContribute(tonumber(math.floor(contrb+0.5)), "帮派除魔活动", "Fight_End1", "增加帮贡")
		sLuaApp:NotifyTipsMsg(player, "增加了"..math.floor(contrb+0.5).."帮派贡献")
	end
	
	--增加帮派资金
	if Act_GuildBoss.Config['Reward_Config']["Fight_End1"]['Fund'] and Act_GuildBoss.Config['Reward_Config']["Fight_End1"]['Fund'] ~= "" then
		local fund = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config']["Fight_End1"]['Fund']))()
		local fund = tonumber(math.floor(fund+0.5))
		if fund > 0 then
			Lua_tools.AddGuildFund(player,fund)
		end
		sLuaApp:NotifyTipsMsg(player, "增加了"..fund.."帮派资金")
	end
	
	local items = {}
	items = Act_GuildBoss.Config['Reward_Config']['Fight_End1']['ItemList']
	if sMailSystem:SendMail(0,"帮派BOSS",player:GetGUID(),1,"帮派BOSS奖励","您在这次帮派BOSS中有不错的表现，以下是您的参与奖励！",attrs,items) ~= 0 then
		sLuaApp:LuaDbg("Act_GuildBoss.fight_result SendMail err")
	end
end

function Act_GuildBoss.reward_ko(player)
	local guild = player:GetGuild()
	local GongShi = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		local boss_level = ]]..guild:GetInt("Guild_Boss_Level")..[[
		local guild_level = ]]..guild:GetLevel()..[[
	]]
	local bindgold = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config']['KO1']['Bind_Gold']))()
	local exp = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config']['KO1']['Exp']))()
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
	items = Act_GuildBoss.Config['Reward_Config']['KO1']['ItemList']
	if sMailSystem:SendMail(0,"帮派BOSS",player:GetGUID(),1,"帮派BOSS奖励","恭喜您完成了帮派BOSS的最后一击，特此奖励！",attrs,items) ~= 0 then
		sLuaApp:LuaDbg("Act_GuildBoss.reward_ko SendMail err")
	end
end

function Act_GuildBoss.reward_all(pattern,guild)
	local str = ""
	if pattern == 1 then
		str = "List"
	elseif pattern == 2 then
		str = "List_Not_KO"
	end
	if str == "" then
		sLuaApp:LuaDbg( "Act_GuildBoss.reward_all err")
		return
	end
	local num = Act_GuildBoss.Config['Reward_Config'][''..str][''..str..'_Num']
	local tb = sRanklistSystem:GetRanklist(guild:GetInt("GuildBossRankNum"),1,num)
	for i = 1 , num , 1 do
		if Act_GuildBoss.Config['Reward_Config'][''..str][''..str..i] then
			if tb[i] then
				local player_guild = tb[i][3]
				if player_guild ~= "" then
					player_guild = sLuaApp:StrSplit(player_guild, ',')[1]
					sLuaApp:LuaDbg( "=========================player_guild======================   "..player_guild)
					local GongShi = [[
						local level = ]]..sContactSystem:GetContactLevel(tonumber(player_guild))..[[
						local reincarnation = ]]..sContactSystem:GetContactReincarnation(tonumber(player_guild))..[[
						local boss_level = ]]..sDBVarSystem:GetInt("World_Boss_Level")..[[
						local guild_level = ]]..guild:GetLevel()..[[
					]]
					local bindgold = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config'][''..str][''..str..i]['Bind_Gold']))()
					local exp = assert(load(GongShi..Act_GuildBoss.Config['Reward_Config'][''..str][''..str..i]['Exp']))()
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
					items = Act_GuildBoss.Config['Reward_Config'][''..str][''..str..i]['ItemList']
					if sMailSystem:SendMail(0,"帮派BOSS",tonumber(player_guild),1,"帮派BOSS奖励","恭喜您在帮派BOSS活动中获得前"..num.."名，特此奖励。",attrs,items) ~= 0 then
						sLuaApp:LuaDbg("Act_GuildBoss.reward_all SendMail err  pattern = "..pattern)
					end
				end
			end
		end
	end
end
