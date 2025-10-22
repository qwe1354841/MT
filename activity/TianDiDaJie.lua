--天地大劫活动
TianDiDaJie = {}

-- 活动开始前回调
function TianDiDaJie.OnDeclare(id, seconds)

end

function TianDiDaJie.OnStart(id, is_normal)
	sLuaApp:LuaDbg("天地大劫活动开始！")
	
	local refreshtime = TianDiDaJieConfig.RefreshTime
	--初始化刷新时刻表
	TianDiDaJie.InitTimeList(id)
	--活动开始刷怪
	TianDiDaJie.SetCreateNPC(0,refreshtime[1][2]..","..id)
	--设置NPC刷新任务
	TianDiDaJie.ScheduleNPC(id)
end

-- 活动结束回调
-- @newinter TianDiDaJie.OnStop(79)
function TianDiDaJie.OnStop(id)
	--活动结束清除所有地图NPC
	sLuaApp:LuaDbg("活动结束")
	if Data["TDDJ_"..id.."_DestroyNPCGUID"] ~= nil then
		for k,v in pairs(Data["TDDJ_"..id.."_DestroyNPCGUID"]) do
			--sLuaApp:LuaDbg("销毁NPC："..v)
			--sLuaApp:LuaDbg("typev："..type(v))
			local npc = sNpcSystem:GetNpcByGUID(v) 
			if npc then
				local id = npc:GetInt("TianDiDaJieActID")
				local map_id = npc:GetInt("TianDiDaJieMapID")
				--sLuaApp:LuaDbg("MapID:"..map_id)
				local map_npc_num = sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum") - 1
				sVarSystem:SetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum", map_npc_num)
				sNpcSystem:DestroyNpc(npc)
			end
		end
	end
	--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("TianDiDaJie_"..id.."_213_NPCNum"))
	--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("TianDiDaJie_"..id.."_239_NPCNum"))
	--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("TianDiDaJie_"..id.."_216_NPCNum"))
	Data["TDDJ_"..id.."_DestroyNPCGUID"] = nil
	
	--sLuaApp:NotifyTopMsgToAll( 1, "测试，活动"..id.."结束!")
end

-- 玩家点击参与活动回调
function TianDiDaJie.OnJoin(id, player)
	--跳到有怪的地图
	sLuaApp:LuaDbg("玩家点击参与活动回调")
	if sLuaApp:IsActivityRunning(id) then
		if player:GetTeam() and not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "只有队长才能决定参加天地大劫活动！")
			return
		end
		local check_tb = TianDiDaJie.CheckFight(player, id)
		if check_tb and next(check_tb) then
			if check_tb[1] == 0 and check_tb[2] == 1 then
				sLuaApp:NotifyTipsMsg(player, "只有等级达到"..check_tb[3].."级才有资格参与活动！")
				return
			elseif check_tb[1] == 0 and check_tb[2] > 1 then
				sLuaApp:NotifyTipsMsg(player, "只有至少"..check_tb[2].."人组队并且全员等级达到"..check_tb[3].."级才有资格参与活动！")
				return
			end
		else
			sLuaApp:LuaDbg("TianDiDaJie.CheckFight返回错误")
			return
		end
		local map_list = TianDiDaJieConfig.MapJump_Config
		-- = TianDiDaJieConfig.Map_Config['MapKeyName']
		if next(map_list) then
			local tmp_num = 0
			local goto_map_id = 0
			local map_id
			for k, v in pairs(map_list) do
				map_id = v.id
				local map_npc_num = sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum")
				if map_npc_num > tmp_num then
					tmp_num = map_npc_num
					goto_map_id = map_id
				end
			end
			if goto_map_id ~=0 then
				local map = sMapSystem:GetMapById(map_id)
				--中心点坐标
				local x = math.floor(map:GetWidth()/2)
				local y = math.floor(map:GetHeight()/2)
				local range = math.max(x,y) - TianDiDaJieConfig.NoMonsterBorder
				if sMapSystem:Jump(player, map, x, y, range) then
					local str = [[
						GUI.CloseWnd("ActivityPanelUI")
					]]
					sLuaApp:ShowForm(player, "脚本表单", str)
				else
					sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
				end
			else
				sLuaApp:NotifyTipsMsg(player, "来晚啦，所有怪物都已被各路大侠消灭。")
				return
			end
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
		return
	end
	return
end

--检查能否进入活动
function TianDiDaJie.CheckFight(player, id)
	sLuaApp:LuaDbg("检查能否进入活动")
	local activity_data = ActivityConfig.GetById(id)
	if not activity_data then
		sLuaApp:LuaErr("TianDiDaJie.CheckFight  ActivityConfig 不存在 "..id)
		return false
	end
	local level_min = tonumber(activity_data.LevelMin)
	local join_min_num = TianDiDaJieConfig.JoinMinNum
	
	local return_msg_tb ={}
	local can_fight =0
	
	if Lua_tools.GetTeamMember(player,false) >= join_min_num then
		if Lua_tools.GetTeamLowestlevel(player) >= level_min then
			can_fight = 1
		end
	end
	if player:IsTempLeave() then
		can_fight = 0
	end
	table.insert(return_msg_tb, can_fight)
	table.insert(return_msg_tb, join_min_num)
	table.insert(return_msg_tb, level_min)
	--{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
	return return_msg_tb


end

--初始化刷新时刻表
function TianDiDaJie.InitTimeList(id)
	--sLuaApp:LuaDbg("初始化刷新时刻表")
	TianDiDaJie.RefreshTimelist = {}
	assert(load("TianDiDaJie.RefreshTimelist["..id.."] = {} return "))()
	TianDiDaJie.RefreshTimelist[id] = {}
	local refresh_time = TianDiDaJieConfig.RefreshTime
	local activityData = ActivityConfig.GetById(id)
	local hour = tonumber(string.sub(activityData.TimeEnd,1,2)) - 1 --21
	--sLuaApp:LuaDbg("hour:"..hour)
	local now_hour = sLuaApp:Hour(0)
	local index = 1
	for i = now_hour,hour,1 do
		for _,v in ipairs(refresh_time) do
			TianDiDaJie.RefreshTimelist[id][index] = {}
			local fresh_time = i..":"..v[1]
			table.insert(TianDiDaJie.RefreshTimelist[id][index],fresh_time)
			table.insert(TianDiDaJie.RefreshTimelist[id][index],v[2])
			index = index+1
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(TianDiDaJie.RefreshTimelist))
	
end

--设置所有刷新npc计划任务
function TianDiDaJie.ScheduleNPC(id)
	--sLuaApp:LuaDbg("设置所有刷新npc计划任务")
	for k,v in pairs(TianDiDaJie.RefreshTimelist[id]) do
		--sLuaApp:LuaDbg("=========refreshtimev1:"..v[1])
		--sLuaApp:LuaDbg("=========refreshtimev2:"..v[2])
		sScheduleSystem:CreateSchedule(0, v[1], "TianDiDaJie","SetCreateNPC", v[2]..","..id)
	end
end

--设置刷新NPC 
function TianDiDaJie.SetCreateNPC(timer, params)
	--sLuaApp:LuaDbg("设置刷新NPC")
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	local destroy_time = tonumber(tmp_tb[1])
	--sLuaApp:LuaDbg("destroy_time："..destroy_time)
	local id = tonumber(tmp_tb[2])
	if sLuaApp:IsActivityRunning(id) then
		destroy_time = tonumber(destroy_time)
		local map_table = TianDiDaJie.RandomMap()
		for a, b in pairs (map_table) do
			local mapData = MapConfig.GetByKeyName(b)
			local map_id = mapData.Id
			sLuaApp:LuaDbg(map_id)
			local map = sMapSystem:GetMapById(map_id)
			--中心点坐标
			local x = math.floor(map:GetWidth()/2)
			local y = math.floor(map:GetHeight()/2)
			local map_range = math.min(x,y) - TianDiDaJieConfig.NoMonsterBorder --刷怪范围
			
			if sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum") > TianDiDaJieConfig.Map_Max_Monster_Num then
				return ""
			end
			local map = sMapSystem:GetMapById(map_id)
			local map_range = math.min(x,y) - TianDiDaJieConfig.NoMonsterBorder --刷怪范围
			--local random_monster = sLuaApp:RandInteger(1, )
			local monster_config = TianDiDaJieConfig.Monster_Config
			for k, v in ipairs(TianDiDaJieConfig.Monster_Level) do
				local num_range = sLuaApp:RandInteger(monster_config[v]["MinNum"], monster_config[v]["MaxNum"])
				--sLuaApp:LuaDbg("num_range:"..num_range)
				for i = 1, num_range do
					local monster_range = sLuaApp:RandInteger(1, #monster_config[v]["KeyName"])
					local npc_keyname = monster_config[v]["KeyName"][monster_range]
					local npc_data = NpcConfig.GetByKeyName(npc_keyname)
					local npc_id = npc_data.Id
					local map_NowMonsterNum = sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum")
					if map_NowMonsterNum >= TianDiDaJieConfig.Map_Max_Monster_Num then
						return ""
					end
					
					local npc = sNpcSystem:CreateMoveNpc(npc_id, map, x, y, map_range, 0)--5是方向
					if npc then
						if not Data["TDDJ_"..id.."_DestroyNPCGUID"] then
							--sLuaApp:LuaDbg("创建DATA")
							Data["TDDJ_"..id.."_DestroyNPCGUID"] = {}
						end
						--sLuaApp:LuaDbg("把GUID存入表中："..npc:GetGUID())
						table.insert(Data["TDDJ_"..id.."_DestroyNPCGUID"], tostring(npc:GetGUID()))
						
						npc:SetInt("TianDiDaJieMonID", TianDiDaJieConfig.Reward_Monster_Config[npc_keyname]['MonsterGen'])
						npc:SetInt("TianDiDaJieActID", id)
						npc:SetInt("TianDiDaJieMapID", map_id)
						sVarSystem:SetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum", sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum") + 1)
						sLuaTimerSystem:AddTimerEx(npc, destroy_time*1000,1,"TianDiDaJie.DestroyNPC", "")
					end
				end
				if monster_config[v]["MaxNum"] == 0 and monster_config[v]["MinNum"] == 0 then
					local map_NowMonsterNum = sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum")
					if map_NowMonsterNum < TianDiDaJieConfig.Map_Max_Monster_Num then
						for i = 1, (TianDiDaJieConfig.Map_Max_Monster_Num - sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum")) do
							local monster_range = sLuaApp:RandInteger(1, #monster_config[v]["KeyName"])
							local npc_keyname = monster_config[v]["KeyName"][monster_range]
							local npc_data = NpcConfig.GetByKeyName(npc_keyname)
							local npc_id = npc_data.Id
							local npc = sNpcSystem:CreateMoveNpc(npc_id, map, x, y, map_range, 0)--5是方向
							if npc then
								if not Data["TDDJ_"..id.."_DestroyNPCGUID"] then
									--sLuaApp:LuaDbg("创建DATA")
									Data["TDDJ_"..id.."_DestroyNPCGUID"] = {}
								end
								--sLuaApp:LuaDbg("把GUID存入表中："..npc:GetGUID())
								table.insert(Data["TDDJ_"..id.."_DestroyNPCGUID"], tostring(npc:GetGUID()))
								
								npc:SetInt("TianDiDaJieMonID", TianDiDaJieConfig.Reward_Monster_Config[npc_keyname]['MonsterGen'])
								npc:SetInt("TianDiDaJieActID", id)
								npc:SetInt("TianDiDaJieMapID", map_id)
								sVarSystem:SetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum", sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum") + 1)
								sLuaTimerSystem:AddTimerEx(npc, destroy_time*1000,1,"TianDiDaJie.DestroyNPC", "")
							end
						end
					end
				end
				--sVarSystem:SetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum", map_NowMonsterNum)
			end
		end
		--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("TianDiDaJie_"..id.."_213_NPCNum"))
		--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("TianDiDaJie_"..id.."_239_NPCNum"))
		--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("TianDiDaJie_"..id.."_216_NPCNum"))
	end
end

--@newinter TianDiDaJie.RandomMap()
function TianDiDaJie.RandomMap()
	--sLuaApp:LuaDbg("RandomMap")
	local map_table = {}
	if TianDiDaJieConfig.Map_Config then
		local map_num = #TianDiDaJieConfig.Map_Config['MapKeyName']
		--sLuaApp:LuaDbg("map_num:"..map_num)
		if map_num >= TianDiDaJieConfig.Map_Config['MapReadomNum']then
			local Table = {}
			for i = 1 , map_num do 
				Table[i] = i 
			end
			for i = 1 , TianDiDaJieConfig.Map_Config['MapReadomNum'] do 
				local randomnum = sLuaApp:RandInteger(1, map_num)
				while(Table[randomnum] == 0) do
					randomnum = sLuaApp:RandInteger(1, map_num)
				end
				map_table[i] = TianDiDaJieConfig.Map_Config['MapKeyName'][randomnum]
				Table[randomnum] = 0 
			end
		else
			sLuaApp:LuaDbg("天地大劫地图数量配置小于随机数配置")
		end
	else
		sLuaApp:LuaDbg("天地大劫地图配置为空")
	end
	--sLuaApp:LuaDbg("map_table表长度："..#map_table)
	--sLuaApp:LuaDbg("map_table表内容："..Lua_tools.serialize(map_table))
	return map_table
end

--销毁NPC
function TianDiDaJie.DestroyNPC(npc, timer, p)
	--sLuaApp:LuaDbg("销毁NPC")
	local id = npc:GetInt("TianDiDaJieActID")
	local map_id = npc:GetInt("TianDiDaJieMapID")
	--sLuaApp:LuaDbg("MapID:"..map_id)
	local map_npc_num = sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum") - 1
	sVarSystem:SetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum", map_npc_num)
	if Data["TDDJ_"..id.."_DestroyNPCGUID"] ~= nil then
		for k,v in pairs(Data["TDDJ_"..id.."_DestroyNPCGUID"]) do
			if tostring(npc:GetGUID()) == v then
				--sLuaApp:LuaDbg("v:"..v)
				--sLuaApp:LuaDbg("删除表格中的GUID")
				table.remove(Data["TDDJ_"..id.."_DestroyNPCGUID"], k)
			end
		end
	end
	--table.remove(TianDiDaJie.DestroyNPCGUID, tostring(npc:GetGUID()))
	sNpcSystem:DestroyNpc(npc)
	--sLuaApp:LuaDbg("MapNumber:"..sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum"))
end

--进入战斗
function TianDiDaJie.StartFight(player, npc)
	if npc:GetInt("TianDiDaJieNPCisFight") > 0 then
		return false
	else
		--npc==>monster
		local npc_id = npc:GetId()
		local mon_id = npc:GetInt("TianDiDaJieMonID") or 3034
		
		if sFightSystem:StartTagPVE(player, mon_id, TianDiDaJieConfig.FightTag, "TianDiDaJie", "FightCallBack", ""..npc:GetGUID()) then
			--npc:SetInt("TianDiDaJieNPCisFight", 1)--1 npc在战斗中 0 不在
			local team = player:GetTeam()
			local memberlist = {}
			if team and not player:IsTempLeave() then
				memberlist = team:GetTeamMembers(false)
			else
				memberlist[1] = player
			end
			for _,v in ipairs(memberlist) do
				sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "TianDiDaJie", "OnResult")
				
				v:SetInt("TianDiDaJieFightNPCGUID", npc:GetGUID())
				v:SetString("TianDiDaJieFightNPCName", npc:GetKeyName())
				v:SetInt("TianDiDaJieFightNPCActID", npc:GetInt("TianDiDaJieActID"))
			end
			if player:IsTeamLeader() then
				for _,v in ipairs(memberlist) do
					if v:GetType() ~= GUID_ROBOT then
						npc:SetInt("TianDiDaJieNPCisFight", npc:GetInt("TianDiDaJieNPCisFight")+1)
					end
				end
			end
		else
			sLuaApp:LuaErr("TianDiDaJie.StartFight开始pve失败")
		end
		return true
	end
end

--战斗完成回调
function TianDiDaJie.FightCallBack(typ, tag, custom)
	sLuaApp:LuaDbg("战斗完成回调")
	--sLuaApp:LuaDbg("tag:"..tag)
	--sLuaApp:LuaDbg("custom:"..custom)
	if custom == "" or tag ~= TianDiDaJieConfig.FightTag then
		sLuaApp:LuaErr("TianDiDaJie.FightCallBack回调错误")
		return
	end
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if npc then
		npc:SetInt("TianDiDaJieNPCisFight", 0)
	end
end

--人物完成战斗回调
function TianDiDaJie.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "TianDiDaJie", "OnResult")
	local npc = sNpcSystem:GetNpcByGUID(player:GetInt("TianDiDaJieFightNPCGUID"))
	local id = player:GetInt("TianDiDaJieFightNPCActID")
	sLuaApp:LuaErr(player:GetName().."victory"..tostring(victory))
	if npc and npc:GetInt("TianDiDaJieNPCisFight") > 0 then
		npc:SetInt("TianDiDaJieNPCisFight", npc:GetInt("TianDiDaJieNPCisFight")-1)
	end
	if victory == 2 then
		--参与次数没到上限才发奖励
		local join_max = TianDiDaJieConfig.Join_Max
		local join_num = player:GetDayInt("TianDiDaJie_Join_Num"..id) + 1
		player:SetDayInt("TianDiDaJie_Join_Num_True"..id, player:GetDayInt("TianDiDaJie_Join_Num_True"..id) + 1)
		--sLuaApp:LuaDbg("战斗胜利次数："..player:GetDayInt("TianDiDaJie_Join_Num_True"..id))
		sLogServerSystem:LogToServer(0, player, "天地大劫参与活动战斗胜利次数", player:GetDayInt("TianDiDaJie_Join_Num_True"..id) , 1 , "战斗胜利", "")
		--sLuaApp:LuaDbg("当前参与活动次数："..join_num)
		--sLuaApp:LuaDbg("活动ID："..id)
		--sLuaApp:LuaDbg("玩家name："..player:GetName())
		if join_num <= join_max then
			player:SetDayInt("TianDiDaJie_Join_Num"..id, join_num)
			--发奖励
			local NPC_data = NpcConfig.GetByKeyName(player:GetString("TianDiDaJieFightNPCName"))
			if TianDiDaJieConfig.Reward_Monster_Config[NPC_data.KeyName]["Level"] == "SSR" then
				local msg = "#COLORCOLOR_GREENG#"..player:GetName().."#COLOREND##COLORCOLOR_WHITE#所在的队伍神勇不凡，竟击败了历劫的#COLOREND##COLORCOLOR_GREENG#"..NPC_data.Name.."#COLOREND##COLORCOLOR_WHITE#，助其历劫成功，重回真身，结下了一段善缘。#COLOREND#"
				sLuaApp:NotifyTopMsgToAll(1, msg)
			end
			local active_add = TianDiDaJieConfig.Active_Add
			local active_max = TianDiDaJieConfig.Active_Max
			local active = player:GetDayInt("TianDiDaJie_Active_Num"..id)
			if active < active_max then
				local active_sum = active + active_add
				if active_sum > active_max then
					player:SetDayInt("TianDiDaJie_Active_Num"..id, active_max)
					ActivitySystem.AddActiveVal(player, active_max - active)
				else
					player:SetDayInt("TianDiDaJie_Active_Num"..id, active_sum)
					ActivitySystem.AddActiveVal(player, active_add)
				end
			end
			TianDiDaJie.GiveReward(player, player:GetString("TianDiDaJieFightNPCName"), id)
		else
			sLuaApp:NotifyTipsMsg(player, "参与次数已达上限，无法获得奖励")
		end
		
		if npc then
			local map_id = npc:GetInt("TianDiDaJieMapID")
			local map_npc_num = sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum")-1
			sVarSystem:SetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum", map_npc_num)
			--sLuaApp:LuaDbg("mapNum:"..	sVarSystem:GetInt("TianDiDaJie_"..id.."_"..map_id.."_NPCNum"))
			if Data["TDDJ_"..id.."_DestroyNPCGUID"] ~= nil then
				for k,v in pairs(Data["TDDJ_"..id.."_DestroyNPCGUID"]) do
					if tostring(npc:GetGUID()) == v then
						--sLuaApp:LuaDbg("v:"..v)
						--sLuaApp:LuaDbg("删除表格中的GUID")
						table.remove(Data["TDDJ_"..id.."_DestroyNPCGUID"], k)
					end
				end
			end
			sNpcSystem:DestroyNpc(npc)
		end
		
		local activity_data = ActivityConfig.GetById(id)
		if activity_data and VipIngotTrace then
			VipIngotTrace.GetReward(player, activity_data.Name)
		end
	end
	player:SetInt("TianDiDaJieFightNPCGUID", 0)
	player:SetString("TianDiDaJieFightNPCName", "")
	player:SetInt("TianDiDaJieFightNPCActID", 0)
end

--发奖励
function TianDiDaJie.GiveReward(player, npc_keyname, id)
	local reward_monster_list = TianDiDaJieConfig.Reward_Monster_Config
	local reward_rank_list = TianDiDaJieConfig.Reward_Level_Config
	local rank = reward_monster_list[npc_keyname]["Level"]
	--reward_monster_list[npc_keyname]["ItemList"]
	--reward_rank_list[rank]
	
	--加经验
	local add_exp = TianDiDaJieConfig.Exp
	if add_exp and add_exp ~= 0 then
		local res_exp = TianDiDaJie.RewardConfigToNmber(player, add_exp) * reward_rank_list[rank]["Exp_UP"]
		sLuaApp:LuaDbg("res_exp:"..res_exp)
		player:AddExp(res_exp, "system", "天地大劫活动", "天地大劫打败怪物获得经验")
	--+宠物exp
		local petlist = Lua_tools.GetFightPets(player) 
		if petlist and next(petlist) then
			for k , v in pairs(petlist) do
				v:AddExp(res_exp, "system", "天地大劫活动","天地大劫打败怪物获得经验")
			end	
		end
	end
	
	-- 加货币
	local add_money_type = reward_rank_list[rank]['Money_Type']
	local add_money_val = TianDiDaJieConfig.Money
	if add_money_type and add_money_val and add_money_val ~= 0 then
		local res_money = TianDiDaJie.RewardConfigToNmber(player, add_money_val) * reward_rank_list[rank]["Money_UP"]
		sLuaApp:LuaDbg("res_money:"..res_money)
		Lua_tools.AddMoney(player, add_money_type, res_money, "system", "活动"..id, npc_keyname.."怪物掉落")
	end
	
	--对应怪物特定奖励
	local specific_reward_list = TianDiDaJie.ResRewardList(reward_monster_list[npc_keyname]["ItemList"])
	if specific_reward_list then
		if not Lua_tools.AddItem(player, specific_reward_list, "system", "天地大劫活动", "天地大劫活动打败怪物获得特定物品") then
			sLuaApp:LuaErr("发放道具失败")
			return ""
		end
	end
	--怪物等阶对应奖励
	--reward_rank_list[rank]['ItemList']
	local rank_reward_list = TianDiDaJie.ResRewardList(reward_rank_list[rank]['ItemList'])
	if rank_reward_list then
		if not Lua_tools.AddItem(player, rank_reward_list, "system", "天地大劫活动", "天地大劫活动打败怪物获得对应等阶物品") then
			sLuaApp:LuaErr("发放道具失败")
			return ""
		end
	end
	sLuaApp:NotifyTipsMsg(player, "发放奖励成功")
	return ""
end

--返回配置对应的奖励列表
function TianDiDaJie.ResRewardList(item_list)
	local resList = {}
	for k,v in ipairs (item_list) do
		if type(v) == "string" then
			local rand = sLuaApp:RandInteger(1, 100)
			--sLuaApp:LuaDbg("rand:"..rand)
			--sLuaApp:LuaDbg("keyname:"..v)
			--sLuaApp:LuaDbg("num:"..item_list[k+2])
			--sLuaApp:LuaDbg("isbind:"..item_list[k+3])
			--sLuaApp:LuaDbg("rand:"..rand)
			if rand <= item_list[k+1] then
				table.insert(resList, v)
				table.insert(resList, item_list[k+2])
				table.insert(resList, item_list[k+3])
			end
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(resList))
	return resList
end

--奖励转数字
function TianDiDaJie.RewardConfigToNmber(player, add_num)
	local res_num = 0
	local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
	]]
	if type(add_num) == "table" then
		local min_num = add_num[1]
		local max_num = add_num[2]
		
		if type(min_num) == "string" then
			min_num = assert(load(str_factor .. " return " .. min_num))()
		end
		if type(max_num) == "string" then
			max_num = assert(load(str_factor .. " return " .. max_num))()
		end
		if max_num < min_num then
			max_num,min_num = min_num,max_num
		end
		res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
	elseif type(add_num) == "string" then
		res_num = assert(load(str_factor .. " return " .. add_num))()
	elseif type(add_num) == "number" then
		res_num = add_num
	end
	return math.floor(res_num)
end

-- 玩家客户端查询数据回调
function TianDiDaJie.OnQuery(id, player)
	--sLuaApp:LuaDbg("id:"..id)
	--sLuaApp:LuaDbg("playername::"..player:GetName())
	local join_num = player:GetDayInt("TianDiDaJie_Join_Num"..id)
	--local join_num = player:GetDayInt("TianDiDaJie_Join_Num"..id)
	local active_num = player:GetDayInt("TianDiDaJie_Active_Num"..id)
	--sLuaApp:LuaDbg("当前参与活动次数："..join_num)
	local str = join_num..":"..TianDiDaJieConfig.Join_Max..":"..active_num..":"..TianDiDaJieConfig.Active_Max..":"..TianDiDaJieConfig.ShowItem..":2:"..ActivitySystem.Act_GetClassify("TianDiDaJie")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end


