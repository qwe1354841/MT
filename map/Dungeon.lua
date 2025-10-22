--秘境副本功能(包括创建地图 给奖励)
Dungeon = {}
--副本
--创建地图
--进入step
--step 中的事件
--完成目标事件进入下一进度

--Dungeon.FightTag = 100000~199999 作为副本GUID（FightTag）
Dungeon.StepFunc = {
	["AddNPC"] = "Dungeon.RefreshNPC",
	["DelNPC"] = "Dungeon.DeleteNPC",
	["AddBox"] = "Dungeon.RefreshNPC",
	["AddTips"] = "Dungeon.ShowTips",
	["AddSummon"] = "Dungeon.Summon",
	["AddSymbiosis"] = "Dungeon.ToSymbiosis",
}

Dungeon.FightNpcTB = {}

--退出 --mod 1-通关离开 2-中途离开 3-倒计时到了离开 4-强制退出(现在出现了玩家在副本内但是已经没有first_map的情况)
function Dungeon.Quit(first_map, obj, mod, player)
	mod = tonumber(mod)
	if mod == 3 then
		local fight_tag = first_map:GetInt("DungeonGUID")
		sFightSystem:StopTagFight(fight_tag, 1)
	end
	local flag = ""
	if mod == 1 or mod == 2 or mod == 3 then
		flag = first_map:GetString("DungeonFlag")
	end
	local player_tb = {}
	if mod == 2 then --中途离开 只有该队伍退出副本
		if not flag or flag == "" then 
			sLuaApp:NotifyTipsMsg(obj, "退出失败")
			return 
		end
		local DungeonType = obj:GetString("DungeonType")
		local team = obj:GetTeam()
		if team then
			player_tb = team:GetTeamMembers(false)
		else
			player_tb[1] = obj
		end
		local step = first_map:GetString("DungeonStepNum")
		for _,v in ipairs(player_tb) do
			--sLuaApp:LuaErr("Dungeon.Quit          First_Map_Guid = "..tostring(first_map:GetGUID()))
			v:SetInt("DungeonFirstMapGUID", 0)
			if DungeonType == "Raid" then
				v:SetString(flag.."Last_floor_num", "")
			elseif DungeonType == "Rift" then
				v:SetString("Dungeon"..flag.."Last_step", step)
			else
				v:SetString(flag.."Last_floor_num", "")
			end
			for i = 1, 5 do 
				if first_map:GetInt("DungeonPlayerGUID"..i) == v:GetGUID() then
					first_map:SetInt("DungeonPlayerGUID"..i, 0)
				end
			end
		end
	elseif mod == 1 or mod == 3 then
		for i = 1, 5 do 
			local PlayerGUID = first_map:GetInt("DungeonPlayerGUID"..i)
			if PlayerGUID ~= 0 then
				table.insert(player_tb, sPlayerSystem:GetPlayerByGUID(PlayerGUID))
				--sLuaApp:LuaErr("Dungeon.Quit          PlayerGUID = "..tostring(PlayerGUID))
				first_map:SetInt("DungeonPlayerGUID"..i, 0)
			end
		end
		if not next(player_tb) then
			if player then
				table.insert(player_tb, player)
			end
		end
	end
	
	if mod == 1 then
		if not flag or flag == "" then 
			return 
		end
		local Quit_Timer_Guid = first_map:GetInt("Quit_Timer_Guid")
		if Quit_Timer_Guid ~= 0 then
			sLuaTimerSystem:DisableTimer(Quit_Timer_Guid)
			first_map:SetInt("Quit_Timer_Guid", 0)
		end
		local DungeonName = player_tb[1]:GetString("DungeonName")
		local active_add_num = assert(load(" return "..flag ..".ActiveAddNum"))() or 5
		local active_max = assert(load(" return "..flag ..".ActiveMax"))() or 0
		for _,v in ipairs(player_tb) do
			v:SetString(flag.."Last_floor_num", "")
			v:SetString("Dungeon"..flag.."Last_step", "")
			v:SetInt("Dungeon"..flag.."Relink", 0)
			v:SetInt("Dungeon"..flag.."IsFinish", 0)
			if Achievement then
				Achievement.Achievement_Mysterious_Place(v, DungeonName)
			end
			if SeasonPassQuestFunc then
				local DungeonType = v:GetString("DungeonType")
				SeasonPassQuestFunc.Dungeon(v, DungeonType)
			end
			--  + 每层活跃值		需要调整，至少也得是打完副本
			local active = v:GetDayInt("Dungeon"..flag.."ActiveNum")
			local MaxJoinTimes = DungeonSystem.Config[DungeonName]["MaxJoinTimes"] or 1
			local VipTimes = VipLogic.GetVipEnhanced(v, "副本奖励次数", "times", MaxJoinTimes)
			local AM = active_max * VipTimes
			if active and AM then
				if active < AM then
					local active_sum = active + active_add_num
					if active_sum > AM then
						v:SetDayInt("Dungeon"..flag.."ActiveNum", AM)
						ActivitySystem.AddActiveVal(v, AM - active)
					else
						v:SetDayInt("Dungeon"..flag.."ActiveNum", active_sum)
						ActivitySystem.AddActiveVal(v, active_add_num)
					end
				end
			end
		end
	end
	
	if mod == 3 then
		if not flag or flag == "" then 
			return 
		end
		for k = 1, 5 do
			local Guid = first_map:GetInt("DungeonPlayerGUID"..k)
			if Guid ~= 0 then
				local player_Object = sPlayerSystem:GetPlayerByGUID(Guid)
				player_Object:SetString(flag.."Last_floor_num", "")
				player_Object:SetString("Dungeon"..flag.."Last_step", "")
				player_Object:SetInt("Dungeon"..flag.."Relink", 0)
				table.insert(player_tb, player_Object)
			end
		end
	end
	
	--退出副本 清除标记
	if next(player_tb) then
		--local flag = first_map:GetString("DungeonFlag")
		--if not flag or flag == "" then 
		--	return
		--end
		local quit_pos_tb = assert(load(" return "..tostring(flag) ..".QuitPos"))()
		if not quit_pos_tb then
			sLuaApp:LuaErr(tostring(flag)..".QuitPos配置缺失")
			quit_pos_tb = {"傲来村", 21, 120, 10}
		end
		local DungeonType = ""
		if player_tb[1] then
			DungeonType = player_tb[1]:GetString("DungeonType")
		end
		local dungeon_name = first_map:GetString("DungeonName")
		local quit_str = ""
		if mod == 1	then
			if DungeonType ~= "" and DungeonType == "Raid" then
				quit_str = "<color=#FF0000FF>恭喜通关"..dungeon_name.."副本！</color>"
			elseif DungeonType ~= "" and DungeonType == "Rift" then
				quit_str = "<color=#FF0000FF>恭喜通关"..dungeon_name.."秘境！</color>"
			end
		elseif mod == 2 then
			if DungeonType ~= "" and DungeonType == "Raid" then
				quit_str = "<color=#FF0000FF>您已主动退出"..dungeon_name.."副本。</color>"
			elseif DungeonType ~= "" and DungeonType == "Rift" then
				quit_str = "<color=#FF0000FF>您已主动退出"..dungeon_name.."秘境。</color>"
			end
		elseif mod == 3 then
			if DungeonType ~= "" and DungeonType == "Raid" then
				quit_str = "<color=#FF0000FF>倒计时已结束，退出"..dungeon_name.."副本。</color>"
			elseif DungeonType ~= "" and DungeonType == "Rift" then
				quit_str = "<color=#FF0000FF>倒计时已结束，退出"..dungeon_name.."秘境。</color>"
			end
		end
		if quit_str == "" then
			sLuaApp:LuaErr("Dungeon.Quit  quit_str 为空")
			--return
		end
		local quit_map = sMapSystem:GetMapById(MapConfig.GetByKeyName(quit_pos_tb[1]).Id)
		local str = [[
			if TrackUI then
				TrackUI.SwitchQuestOrDungeonNode(true)
			end
			GlobalUtils.ShowServerBoxMessage1Btn("]]..quit_str..[[",5)
		]]
		for _,v in ipairs(player_tb) do
			sTriggerSystem:DelTrigger(v, TRIGGER_ON_PRE_JUMP_MAP, "Dungeon", "on_pre_jump_map")
			sTriggerSystem:DelTrigger(v, TRIGGER_ON_LOGOUT, "Dungeon", "Logout")
			sTriggerSystem:DelTrigger(v, TRIGGER_ON_RELOGIN, "Dungeon", "ReLogin")
			sLuaApp:LuaDbg("TRIGGER_ON_PRE_JUMP_MAP = "..v:GetName())
			Dungeon.DelDungeonItem(v)
			v:SetInt("DungeonFloor", 0)
			v:SetString("DungeonStep", "")
			v:SetInt("DungeonFirstMapGUID", 0)
			v:SetString("DungeonFlag", "")
			sLuaApp:ShowForm(v, "脚本表单", str)
			v:SetString("SYSTEM_ConfirmBox_Function", "")
			--sLuaApp:LuaErr(v:GetName().."退出副本")
		end
		--只有队长跳转地图
		if mod == 2 then 
			sMapSystem:Jump(obj, quit_map, quit_pos_tb[2], quit_pos_tb[3], quit_pos_tb[4])
		else
			for _,v in ipairs(player_tb) do 
				if not v:GetTeam() or v:IsTeamLeader() then
					sMapSystem:Jump(v, quit_map, quit_pos_tb[2], quit_pos_tb[3], quit_pos_tb[4])
				end
			end			
		end
		for _,v in ipairs(player_tb) do
			if TianXiaHuiWu then
				TianXiaHuiWu.SyncSignState(v)
			end
		end
	else
		sLuaApp:LuaErr("Dungeon.Quit player_tb为空")
	end
	
	--销毁副本地图
	local isdestroymap = 1
	for i = 1, 5 do 
		if first_map:GetInt("DungeonPlayerGUID"..i) ~= 0 then
			isdestroymap = 0
		end
	end
	if isdestroymap == 1 then
		for i = 2, first_map:GetInt("DungeonFloorNum") do
			if first_map:GetInt("DungeonMap"..i) ~= 0 then
				local destroy_map = sMapSystem:GetMapByGUID(first_map:GetInt("DungeonMap"..i))
				sMapSystem:DestroyDungeon(destroy_map)
			end
		end
		--用于记录进本人员, 当需要进行副本中归队操作时用
		if Data then
			local DungeonFirstMapGUID = first_map:GetGUID()
			Data[tostring(DungeonFirstMapGUID)] = nil
		else
			sLuaApp:LuaErr("不存在Data")
		end
		sMapSystem:DestroyDungeon(first_map)
	end
end

--创建地图 -进入副本 floor_num=1
function Dungeon.CreateMap(player, floor_num)--地图配置表的序号 
	--floor_num==0时 离开副本
	--sLuaApp:LuaDbg("163    CreateMap           floor_num = "..tostring(floor_num))
	if floor_num == 0 then
		if player:GetTeam() and not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "您不是队长，无法决定队伍去向！")
			return
		else
			local first_map = sMapSystem:GetMapByGUID(player:GetInt("DungeonFirstMapGUID"))
			local NowDungeonMapGuid = player:GetInt("NowDungeonMapGuid")
			local map = sMapSystem:GetMapByGUID(NowDungeonMapGuid)
			local player_tb = map:GetAllPlayers()
			local reward_keyname = first_map:GetString("DungeonStepRewardKeyName")
			for _,v in ipairs(player_tb) do
				--发放上一进度奖励
				if reward_keyname ~= "" then
					Dungeon.GiveReward(v, "step_reward", reward_keyname)
				end
			end
			Dungeon.Quit(first_map, 0, 1, player)
		end
	end
	
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then 
		return 
	end
	local Last_step = player:GetString("Dungeon"..flag.."Last_step")
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	if not map_config or not map_config[floor_num] then
		sLuaApp:LuaErr(flag..".MapConfig缺少配置"..floor_num)
		return
	end
	local map_keyname = map_config[floor_num]["MapKeyName"]
	if Data.DungeonMap then--判断MapKeyName
		for k,v in ipairs(Data.DungeonMap) do
			if v == player:GetMap():GetKeyName() then
				--if Data.DungeonMap[k+1] ~= map_keyname then
				--	sLuaApp:LuaErr("Dungeon.CreateMap 需要创建的地图 "..map_keyname.." 不是副本下一张地图")
				--	return
				--end
				--break
			end
		end
	else
		sLuaApp:LuaErr("Dungeon.CreateMap 缺少Data.DungeonMap")
		return
	end
	
	local map_id = MapConfig.GetByKeyName(map_keyname).Id
	local map = sMapSystem:CreateDungeon(map_id)
	map:SetString("DungeonFlag", flag) -- 副本flag
	--sLuaApp:LuaDbg("203    map name"..map:GetName())
	
	--跳转地图 ------需要来回跳转 要加在Data里加地图表
	local born_point = map_config[floor_num]["BornPoint"]
	local Last_floor_num = player:GetString(flag.."Last_floor_num")
	if not tonumber(Last_floor_num) then
		Last_floor_num = ""
		player:SetString(flag.."Last_floor_num", Last_floor_num)
	end
	local JumpTOF = 0
	local first_map_guid_A = "false"	--12.20  用于记录
	if floor_num == 1 then
		--floor_num==1 第一场地图 需要记录 副本进度（floor和step） 进入副本的玩家  副本已经创建的其他地图（销毁用） 副本倒计时 打开追踪栏 清空活跃值 生成副本GUID作为fighttag 记下副本中文名
		--sLuaApp:LuaErr("210       Last_floor_num "..Last_floor_num)
		if Last_floor_num == "" or tonumber(Last_floor_num) == 1 then
			JumpTOF = sMapSystem:Jump(player, map, born_point[1], born_point[2], born_point[3])
			sLuaApp:LuaDbg("跳地图了,跳到1层了")
		end
		if JumpTOF ~= 0 and not JumpTOF then
			sLuaApp:LuaDbg("1层地图跳转出错")
			return ""
		end
		--开追踪栏 关天下会武图标
		local str = [[
			if TrackUI then
				TrackUI.SwitchQuestOrDungeonNode(false)
			end
			if MainDynamicUI then
				MainDynamicUI.World_PVP_STATE = 0
				MainDynamicUI.World_PVP_BtnRefresh()
			end
		]]
		local player_tb = {}
		--if Last_floor_num == "" then
		--	player_tb = map:GetAllPlayers()
		--else
		--	local team = player:GetTeam()
		--	if team then
		--		player_tb = team:GetTeamMembers(false)
		--	else
		--		player_tb = {player}
		--	end
		--end
		local team = player:GetTeam()
		if team then
			player_tb = team:GetTeamMembers(false)
		else
			player_tb = {player}
		end
		--用于记录进本人员, 当需要进行副本中归队操作时用
		if Data then
			local MapGUID = map:GetGUID()
			local TB = {}
			for k,v in pairs(player_tb) do
				local guid = v:GetGUID()
				table.insert(TB, guid)
			end
			Data[tostring(MapGUID)] = TB
		else
			sLuaApp:LuaErr("不存在Data")
		end
		local continue_time = assert(load(" return "..flag ..".ContinueTime"))()
		if not continue_time then
			sLuaApp:LuaErr(flag..".ContinueTime缺少配置")
			return
		end
		first_map_guid_A = map:GetGUID()		--12.20
		for k,v in ipairs(player_tb) do
			v:SetInt("DungeonFirstMapGUID", first_map_guid_A)
			v:SetInt("Dungeon"..flag.."IsFinish", 0)
			v:SetInt("NowDungeonMapGuid", map:GetGUID())
			map:SetInt("DungeonPlayerGUID"..k, v:GetGUID())
			sLuaApp:ShowForm(v, "脚本表单", str)
			sTriggerSystem:AddTrigger(v, TRIGGER_ON_LOGOUT, "Dungeon", "Logout")
			sTriggerSystem:AddTrigger(v, TRIGGER_ON_RELOGIN, "Dungeon", "ReLogin")
			sTriggerSystem:AddTrigger(v, TRIGGER_ON_PRE_JUMP_MAP, "Dungeon", "on_pre_jump_map")
		end
		
		--设置副本时间
		local deadline_sec = continue_time*60 + sLuaApp:SecondSinceEpoch(0)
		local Quit_Timer_Guid = sLuaTimerSystem:AddTimerEx(map, continue_time * 60 * 1000, 1, "Dungeon.Quit", "3")			--0000
		map:SetInt("Quit_Timer_Guid", Quit_Timer_Guid)
		map:SetInt("DungeonDeadline", deadline_sec)
		--设置副本GUID
		local dungeon_GUID = sVarSystem:GetInt("DungeonGUID") + 1
		sVarSystem:SetInt("DungeonGUID", dungeon_GUID)
		if dungeon_GUID == 200000 then
			dungeon_GUID = 100000
			sVarSystem:SetInt("DungeonGUID", 100000)
		end
		map:SetInt("DungeonGUID", dungeon_GUID)
		
		for k,v in pairs(DungeonSystem.Config) do
			if v["Config"] == flag then
				map:SetString("DungeonName", k)
				break
			end
		end
	else
		local player_tb = {}
		local DungeonLastMapGuid = tonumber(player:GetString("DungeonLastMapGuid"))
		local DungeonLastMap = 0
		if DungeonLastMapGuid then
			DungeonLastMap = sMapSystem:GetMapByGUID(DungeonLastMapGuid)
		else
			DungeonLastMap = nil
		end
		--if Last_floor_num == "" then
		--	player_tb = map:GetAllPlayers()
		--else
		--	local team = player:GetTeam()
		--	if team then
		--		player_tb = team:GetTeamMembers(false)
		--	else
		--		player_tb = {player}
		--	end
		--end
		if DungeonLastMap and DungeonLastMap ~= 0 then
			player_tb = DungeonLastMap:GetAllPlayers()
		else
			local team = player:GetTeam()
			if team then
				player_tb = team:GetTeamMembers(false)
			else
				player_tb = {player}
			end

		end
		--用于记录进本人员, 当需要进行副本中归队操作时用
		if Data then
			local DungeonFirstMapGUID = 0
			if type(first_map_guid_A) == "string" then
				DungeonFirstMapGUID = player_tb[1]:GetInt("DungeonFirstMapGUID")
			elseif type(first_map_guid_A) == "number" then
				DungeonFirstMapGUID = first_map_guid_A
			end
			local MapGUID = map:GetGUID()
			Data[tostring(MapGUID)] = Data[tostring(DungeonFirstMapGUID)]
		else
			sLuaApp:LuaErr("不存在Data")
		end
		for _,v in pairs(player_tb) do
			if not v:GetTeam() or v:IsTeamLeader() then
				JumpTOF = sMapSystem:Jump(v, map, born_point[1], born_point[2], born_point[3])
			end
			if JumpTOF == false then
				sLuaApp:LuaDbg(v:GetName().." 地图跳转出错")
				sLuaApp:LuaDbg("JumpTOF = "..tostring(JumpTOF))
				return ""
			end
			v:SetInt("NowDungeonMapGuid", map:GetGUID())
		end
	end
	
	local Relink = player:GetInt("Dungeon"..flag.."Relink")
	
	local first_map_guid = 0
	if type(first_map_guid_A) == "string" then
		first_map_guid = player:GetInt("DungeonFirstMapGUID")
	elseif type(first_map_guid_A) == "number" then
		first_map_guid = first_map_guid_A
	end
	local DungeonType = player:GetString("DungeonType")
	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
	if first_map then
		--sLuaApp:LuaDbg("300====================first_map_guid = "..tostring(first_map_guid))
		first_map:SetInt("DungeonMap"..floor_num, map:GetGUID())
		if Last_step == "" or DungeonType == "Raid" then
			if floor_num == 1 then
				first_map:SetInt("DungeonShowStep", 0)
			end
		elseif Last_step ~= "" and DungeonType == "Rift" then
			local step_num = tonumber(sLuaApp:StrSplit(Last_step, "_")[2])
			first_map:SetInt("DungeonShowStep", step_num)
		end
		if Relink == 1 then
			first_map:SetString("DungeonStepRewardKeyName", "")
		end
	end
	
	for _,v in pairs(map:GetAllPlayers()) do
		--sLuaApp:LuaDbg("=================================floor_num = "..tostring(floor_num))
		v:SetInt("DungeonFloor", floor_num)
		local DungeonType = v:GetString("DungeonType")
		if Last_step == "" or DungeonType == "Raid" then
			v:SetString("DungeonStep", "Step_0")
			--sLuaApp:LuaDbg("=================================DungeonType = "..tostring(DungeonType))
		else
			--sLuaApp:LuaDbg("Last_step = "..Last_step)
			v:SetString("DungeonStep", Last_step)		
		end
	end
	
	--跳转step
	local step = player:GetString("DungeonStep")
	if Relink == 0 then
		step = "Step_0"
	end
	
	if map_config[floor_num][step] and JumpTOF == true then
		--sLuaApp:LuaErr("349    create         +++++++++step = "..step)
		Dungeon.GoToStep(player, map, floor_num, step, first_map)
	else
		sLuaApp:LuaErr(flag..".MapConfig"..floor_num..step.."缺失")
		sLuaApp:LuaErr("错误楼层 = "..flag..".MapConfig  "..floor_num)
		sLuaApp:LuaErr("错误Step = "..flag..".MapConfig  "..step)
	end
	
	local movie_id = map_config[floor_num]["Movie"]
	if movie_id and JumpTOF == true then
		Dungeon.PlayMovie(player, movie_id)
	end
end

--跳转地图前回调
function Dungeon.on_pre_jump_map(player, to_map)
	--return true
	local flag = player:GetString("DungeonFlag")
	local Relink = player:GetInt("Dungeon"..flag.."Relink")
	local now_map_keyname = player:GetMap():GetKeyName()
	if Data.DungeonMap then
		for k,v in ipairs(Data.DungeonMap) do
			if v == now_map_keyname then
				if Data.DungeonMap[k+1] == to_map:GetKeyName() then 
					return true
				end
				break
			end
		end
		if Relink == 1 then
			return true
		end
	else
		sLuaApp:LuaErr("缺少Data.DungeonMap")
	end
	local player_name = player:GetName()
	sLuaApp:NotifyTipsMsg(player, "副本中无法跳转地图")
	sLuaApp:LuaErr("副本中无法跳转地图   player_name = "..tostring(player_name))
	return false
end

--进入step
function Dungeon.GoToStep(player, map, floor_num, step, first_map)
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	if not map_config or not map_config[floor_num] then
		sLuaApp:LuaErr(flag..".Map缺少配置")
		return
	end
	
	if not first_map then
		local DungeonFirstMapGUID = player:GetInt("DungeonFirstMapGUID")
		first_map = sMapSystem:GetMapByGUID(DungeonFirstMapGUID)
	end
	--sLuaApp:LuaDbg("404===============player:GetInt('DungeonFirstMapGUID') = "..tostring(player:GetInt("DungeonFirstMapGUID")))
	first_map:SetInt("DungeonFloorNum", floor_num)
	first_map:SetString("DungeonStepNum", step)
	--强制结束战斗
	local fight_tag = first_map:GetInt("DungeonGUID")
	sFightSystem:StopTagFight(fight_tag, 1)
	
	local trace_tb = map_config[floor_num][step]["Trace"]
	if not trace_tb or not trace_tb["Desc"] or not trace_tb["QuestMode"] or not trace_tb["QuestAim"] then
		sLuaApp:LuaErr(flag..".MapConfig"..floor_num..step.."Trace配置缺失")
		return
	end
	
	--map上记录追踪进度
	map:SetString("TraceMsg", trace_tb["Desc"]) --追踪文本
	map:SetString("TraceMode", trace_tb["QuestMode"])	--地图记录该进度 追踪mode
	map:SetString("TraceAim", trace_tb["QuestAim"])	--地图记录该进度 追踪目标
	
	--创建这一进度
	if not map_config or not map_config[floor_num][step] then 
		return 
	end
	local map_guid = map:GetGUID()
	for k,v in pairs(map_config[floor_num][step]) do
		if Dungeon.StepFunc[k] then
			assert(load("local map_num, step , map= "..floor_num..",'"..step.."'"..",".."sMapSystem:GetMapByGUID("..map_guid..") return "..Dungeon.StepFunc[k].."(map_num,step,map)"))()
		end
	end
	-- step创建完成 --
	--设置NPC自定义称号--
	if Dungeon.FightNpcTB and Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)] and next(Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)]) then
		for i = 1, #Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)] do
			local npc_keyname = Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)][i]
			local npc_tb = map:GetNpcByKeyName(npc_keyname)
				for j = 1, #npc_tb do
				npc_tb[j]:SetLogo("0")
			end
		end
		Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)] = {}
	end
	
	if trace_tb["QuestMode"] == "Fight" then
		local npc_keyname = trace_tb["QuestAim"]
		local npc_tb = map:GetNpcByKeyName(npc_keyname)
		for i = 1, #npc_tb do
			npc_tb[i]:SetLogo("3401300000")
		end
		if not Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)] then
			Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)] = {}
		end
		table.insert(Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)], npc_keyname)
	else
		Dungeon.FightNpcTB[tostring(DungeonFirstMapGUID)] = {}
	end
	
	--获取地图上所有的玩家 记录step
	local player_tb = map:GetAllPlayers()
	local reward_keyname = first_map:GetString("DungeonStepRewardKeyName")
	sLuaApp:LuaErr("609===============reward_keyname = "..tostring(reward_keyname))
	for _,v in ipairs(player_tb) do
		v:SetString("DungeonStep", step)
		--发放上一进度奖励
		if reward_keyname ~= "" then
			Dungeon.GiveReward(v, "step_reward", reward_keyname)
		end
	end
	local step_config = map_config[floor_num][step]
	local show_step = first_map:GetInt("DungeonShowStep")

	if not step_config["ShowStep"] or step_config["ShowStep"] == 1 then
		show_step = show_step + 1
	end
	first_map:SetInt("DungeonShowStep", show_step)
	first_map:SetString("DungeonStepRewardKeyName", floor_num.."_"..step)
	Dungeon.ShowTrace(player, first_map)
	
	local movie_id = map_config[floor_num][step]["Movie"]
	if movie_id then
		Dungeon.PlayMovie(player, movie_id)
	end
end


--发送tips 描述剧情用
function Dungeon.ShowTips(map_num, step, map)
	local flag = map:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	local tips_tb = map_config[map_num][step]["AddTips"]
	
	if not tips_tb["Message"] or type(tips_tb["Message"]) ~= "string" then
		sLuaApp:LuaErr(flag.."AddTips [Message]配置错误")
		return
	end
	local msg = tips_tb["Message"] 
	if tips_tb["Color"] then
		msg = "<color="..tips_tb["Color"]..">"..msg.."</color>"
	end
	
	local player_tb = map:GetAllPlayers()
	for _,v in ipairs(player_tb) do
		sLuaApp:NotifyTipsMsg(v,msg)
	end
end

--刷NPC
function Dungeon.RefreshNPC(map_num, step, map)
	local flag = map:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	if not map_config then return end
	for k,v in ipairs(map_config[map_num][step]["AddNPC"]) do		
		local npc_keyname = v["KeyName"]
		local npc_id = NpcConfig.GetByKeyName(npc_keyname).Id
		map:SetInt(v["KeyName"].."_Min_Num", v["Min_Num"])
		if v["Move"] == 1 then
			for i=1,v["Add_Num"] do
				local npc = sNpcSystem:CreateMoveNpc(npc_id, map, v["X"], v["Y"], v["Range"], 0)
				if npc then
					npc:SetString("DungeonNPCType", v["Type"])
					npc:SetString("ReCreateInfo", v["Move"]..":"..v["X"]..":"..v["Y"]..":"..v["Range"]..":"..v["Direction"])
				end
			end
		elseif v["Move"] == 0 then
			for i=1,v["Add_Num"] do
				local npc = sNpcSystem:CreateNpc(npc_id, map, v["X"], v["Y"], v["Range"], v["Direction"], 0)
				if npc then
					npc:SetString("DungeonNPCType", v["Type"])
					npc:SetString("ReCreateInfo", v["Move"]..":"..v["X"]..":"..v["Y"]..":"..v["Range"]..":"..v["Direction"])
				end
			end
		end
	end
end

--进入战斗
function Dungeon.StartFight(player, npc)
	if npc:GetInt("DungeonNPCisFight") == 1 then 
		return false 
	end
	
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local npc_config = assert(load(" return "..flag ..".NPCConfig"))()
	
	local npc_keyname = npc:GetKeyName()
	if not npc_config or not npc_config[npc_keyname] or not npc_config[npc_keyname]["MonID"] then
		sLuaApp:LuaErr(flag..".NPCConfig"..npc_keyname.."缺少配置")
		return false
	end
	
	local npc_guid = npc:GetGUID()
	
	local first_map = sMapSystem:GetMapByGUID(player:GetInt("DungeonFirstMapGUID"))
	local fight_tag = first_map:GetInt("DungeonGUID")
	if sFightSystem:StartTagPVE(player, npc_config[npc_keyname]["MonID"], fight_tag, "Dungeon", "FightCallBack", ""..npc_guid) then
		npc:SetInt("DungeonNPCisFight", 1)--1 npc在战斗中 0 不在
		npc:SetInt("DungeonNPCWinToDel", npc_config[npc_keyname]["WinToDel"]) -- 1 胜利后删除 0 不删
		local team = player:GetTeam()
		local memberlist = {}
		if team and not player:IsTempLeave() then
			memberlist = team:GetTeamMembers(false)
		else
			memberlist[1] = player
		end
		for _,v in ipairs(memberlist) do
			sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "Dungeon", "OnResult")
			v:SetInt("DungeonFightNPCGUID", npc_guid)
			v:SetString("DungeonFightNPCName", npc_keyname)
		end
	else
		sLuaApp:LuaErr("Dungeon.StartFight开始pve失败")
	end
	return true
end

--战斗完回调  -玩家掉线需要获得npc 标记为 不在战斗中
function Dungeon.FightCallBack(typ, tag, custom)
	if custom == "" then
		sLuaApp:LuaErr("Dungeon.FightCallBack回调错误")
		return
	end
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if npc then
		npc:SetInt("DungeonNPCisFight", 0)
	end
end

--人物完成战斗回调
function Dungeon.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Dungeon", "OnResult")
	local npc_keyname = player:GetString("DungeonFightNPCName")
	if victory == 2 then
		Dungeon.GiveReward(player, "fight_reward", npc_keyname)
		local DungeonName = player:GetString("DungeonName")
		if VipIngotTrace then
			VipIngotTrace.GetReward(player, DungeonName)
		end
		if Assist then
			local DungeonType = player:GetString("DungeonType")
			if DungeonType == "Raid" then
				Assist.ActivityGetPoint(player, "副本")
			end			
		end
	end
	player:SetString("DungeonFightNPCName", "")
end

--打开宝箱  收集材料也不是不可以
function Dungeon.OpenBox(player, npc)
	npc:SetInt("DungeonNPCWinToDel", 1) -- 1 打开后删除	
	if npc:GetInt("DungeonBoxisOpening") == 1 then
		sLuaApp:NotifyTipsMsg(player, "宝箱从来都是先到先得，少侠，这个宝箱已经有主了！")
		return false
	end
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormDungeon", "StopOpenBox", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]].."2000#打开宝箱中..."..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	local map = player:GetMap()
	local memberlist = map:GetAllPlayers()
	for _,v in ipairs(memberlist) do
		local t_guid = sLuaTimerSystem:AddTimerEx(v, 2000,1,"Dungeon.GiveReward", ""..npc:GetKeyName())
		if t_guid then
			npc:SetInt("DungeonBoxisOpening", 1)
			v:SetInt("DungeonFightNPCGUID", npc:GetGUID())
			v:SetInt("DungeonBoxOpenBoxTimer", t_guid)
		end
	end
end

-- 打开宝箱的进度条打断
function Dungeon.StopOpenBox(player)
	local map = player:GetMap()
	local memberlist = map:GetAllPlayers()
	for _,v in ipairs(memberlist) do
		local timer_guid = v:GetInt("DungeonBoxOpenBoxTimer")
		if sLuaTimerSystem:HasTimer(timer_guid) then
			sLuaTimerSystem:DisableTimer(timer_guid)
		else
			sLuaApp:LuaErr(v:GetName().."Dungeon.StopOpenBox HasTimer错误")
		end
		v:SetInt("DungeonBoxOpenBoxTimer", 0)
		
		local npc_guid = v:GetInt("DungeonFightNPCGUID")
		local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
		if npc then
			npc:SetInt("DungeonBoxisOpening", 0)
		end
		v:SetInt("DungeonFightNPCGUID", 0)
	end
end

--给奖励 
function Dungeon.GiveReward(player, timer_mod, reward_keyname)
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then 
		return 
	end
	local reward_config = assert(load(" return "..flag ..".RewardConfig"))()
	local reward = {}
	-- 后加的 首通相关
	sLuaApp:LuaErr("reward_keyname = "..tostring(reward_keyname))
	local is_first_reward, reward_keyname = Dungeon.CheckFirstReward(player, reward_keyname)
	--sLuaApp:LuaWrn("is_first_reward = "..tostring(is_first_reward))
	--sLuaApp:LuaWrn("reward_keyname = "..tostring(reward_keyname))

	if reward_config[tostring(reward_keyname)] then
		reward = reward_config[tostring(reward_keyname)]
	elseif timer_mod == "step_reward" then --怪物没有配奖励表时默认不给奖励 进度奖励默认通用默认奖励配置表
		if is_first_reward == 0 then
			if reward_config["通用默认奖励配置表"] then
				reward = reward_config["通用默认奖励配置表"]
				sLuaApp:LuaDbg(flag..".RewardConfig配置因缺少"..reward_keyname.."而使用了通用默认奖励配置表")
			end
		elseif is_first_reward == 1 then
			if reward_config["通用默认奖励配置表First"] then
				reward = reward_config["通用默认奖励配置表First"]
				sLuaApp:LuaDbg(flag..".RewardConfig配置因缺少"..reward_keyname.."而使用了通用默认奖励配置表First")
			end
		end
	else
		sLuaApp:LuaDbg(flag..".RewardConfig配置缺少"..reward_keyname.."   557")
	end
	
	if next(reward) then
		-- +exp
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = Dungeon.RewardConfigToNmber(player, add_exp, 1)
			if tonumber(res_exp) ~= 0 then
				player:AddExp(res_exp, "system", "副本", (timer_mod == "fight_reward" and "战斗奖励" or "奖励列表"..reward_keyname)) --战斗奖励 有双倍经验点加成
			end
		end
		local add_pet_exp = reward["PetExp"]
		if add_pet_exp and add_pet_exp ~= 0 then
			local res_pet_exp = Dungeon.RewardConfigToNmber(player, add_pet_exp, 1)
			if tonumber(res_pet_exp) ~= 0 then
				local pets = Lua_tools.GetFightPets(player)
				for _,pet in ipairs(pets) do
					pet:AddExp(res_pet_exp, "system", "副本", (timer_mod == "fight_reward" and "战斗奖励" or "奖励列表"..reward_keyname))
				end
			end
		end
		-- +money
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = Dungeon.RewardConfigToNmber(player, add_money_val, 1)
			if tonumber(res_money) ~= 0 then
				Lua_tools.AddMoney(player, add_money_type, res_money, "system", "副本"..flag, "奖励列表"..reward_keyname)
				sLuaApp:NotifyTipsMsg(player, "您获得了"..res_money.."银币")
			end
		end
		-- +固定物品
		local item_list = reward['Item']
		if item_list and next(item_list) then
			Lua_tools.AddItem(player, item_list, "system", "副本"..flag, "奖励列表"..reward_keyname)
		end
		-- +随机物品
		if reward['RandItemList'] and next(reward['RandItemList']) then
			for k,v in ipairs(reward['RandItemList']) do
				local item_rand_time = v['RandTime'] or 1
				local item_rand_list = v['ItemRand']
				if item_rand_time and item_rand_list then
					local res_item_list = Lua_tools.PlayerStartRandom(item_rand_list, "副本"..flag..reward_keyname..k, item_rand_time)
					if res_item_list[1] ~= "Nil" then
						Lua_tools.AddItem(player, res_item_list, "system", "副本"..flag, "奖励列表"..reward_keyname)
					end
				end
			end
		end
		-- +副本物品 包裹不足不发 只发队长
		if reward['DungeonItem'] and next(reward['DungeonItem']) then
			if not player:GetTeam() or player:IsTeamLeader() then
				if Lua_tools.GetBagFree(player) < 1 then
					sLuaApp:NotifyTipsMsg(player, "<color=#FF0000FF>包裹不足，副本物品无法获得</color>")
				else
					Lua_tools.AddItem(player, reward['DungeonItem'], "system", "副本"..flag, "奖励列表"..reward_keyname)
				end
			end
		end
	end
	
	--记录已获得首通奖励
	if is_first_reward == 1 then
		player:SetInt(flag.."_"..reward_keyname, 1)
	end
	
	if timer_mod == "step_reward" then
		--sLuaApp:NotifyTipsMsg(player, "恭喜获得副本进度奖励")
	else
		-- 删npc
		local npc = sNpcSystem:GetNpcByGUID(player:GetInt("DungeonFightNPCGUID"))
		if npc then
			Dungeon.CheckTrace(player, npc)
			local npc = sNpcSystem:GetNpcByGUID(player:GetInt("DungeonFightNPCGUID"))
			if npc then
				if npc:GetInt("DungeonNPCWinToDel") == 1 then
					Dungeon.DestroyNPC(player, npc)
				end
			end
		end
		player:SetInt("DungeonFightNPCGUID", 0)
	end
end

--奖励配置表转数字 mod == 1 给奖励 取随机 mod==0 显示奖励 取最小值
function Dungeon.RewardConfigToNmber(player, add_num, mod)
	local res_num = 0
	local first_map = sMapSystem:GetMapByGUID(player:GetInt("DungeonFirstMapGUID"))
	if not first_map then
		return math.floor(res_num)
	end
	--sLuaApp:LuaDbg("first_map:Name = "..tostring(first_map:GetName()))
	local floor_num = first_map:GetInt("DungeonFloorNum")
	local show_step = first_map:GetInt("DungeonShowStep")
	local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		local floors_num = ]]..floor_num..[[
		local process = ]]..show_step..[[
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
		if mod == 0 then
			res_num = math.floor(min_num)
		elseif mod == 1 then
			res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
		end
	elseif type(add_num) == "string" then
		res_num = assert(load(str_factor .. " return " .. add_num))()
	elseif type(add_num) == "number" then
		res_num = add_num
	end
	return math.floor(res_num)
end

--删除副本物品 
function Dungeon.DelDungeonItem(player)
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	if not Data or not Data.DungeonItem then
		sLuaApp:LuaErr("Dungeon.DelDungeonItem不存在Data.DungeonItem")
	end
	local dungeon_item_tb = Data.DungeonItem[flag]
	if not dungeon_item_tb then
		sLuaApp:LuaErr("Data.DungeonItem"..flag.."配置缺失")
	end
	for _,v in ipairs(dungeon_item_tb) do
		local item_id = sItemSystem:GetItemIdByKeyname(v)
		local item_tb = sItemSystem:GetItemList(player, item_id, 3)--包裹
		for _,b in ipairs(item_tb) do
			sItemSystem:DestroyItem(b, "system", "副本", "删除副本物品")
		end
		local item_container = player:GetItemContainer(7)--仓库
		local item_tb = sItemSystem:GetItemListEx(item_container, item_id, 3)
		for _,b in ipairs(item_tb) do
			sItemSystem:DestroyItem(b, "system", "副本", "删除副本物品")
		end
	end
end

--检查进度
function Dungeon.CheckTrace(player, npc)
	local map = npc:GetMap()
	local npc_keyname = npc:GetKeyName()
	local flag = map:GetString("DungeonFlag")
	if not flag or flag == "" then 
		return 
	end
	local DungeonType = player:GetString("DungeonType")
	local npc_config = assert(load(" return "..flag ..".NPCConfig"))()
	if not npc_config or not npc_config[npc_keyname] then
		sLuaApp:LuaErr(flag.."NPCConfig 缺少配置")
		return 
	end
	--如果是追踪目标 检查进度
	if map:GetString("TraceMode") == "" or map:GetString("TraceAim") == "" then
		sLuaApp:LuaErr("map String TraceMode或TraceAim为空")
	end
	
	local first_map_guid = player:GetInt("DungeonFirstMapGUID")
	if first_map_guid == 0 then 
		return "" 
	end
	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
	
	--目标是打怪数量
	if map:GetString("TraceMode") == "Fight" or map:GetString("TraceMode") == "Open" then
		local aim_tb = sLuaApp:StrSplit(map:GetString("TraceAim"), ",")
		local success_aim = 0
		
		for _,v in ipairs(aim_tb) do
			if v == npc_keyname then
				if sLuaApp:RandInteger(1,10000) <= npc_config[npc_keyname]["WinRand"] then
					map:SetInt("TraceWinNum"..npc_keyname, map:GetInt("TraceWinNum"..npc_keyname) + 1)
				end
			end
			
			--判断是否达到追踪目标
			local WinNum = map:GetInt("TraceWinNum"..v)
			if WinNum >= npc_config[v]["WinTime"] then
				success_aim = success_aim + 1
			end
			--sLuaApp:LuaErr("WinNum"..WinNum)
		end
		if success_aim >= #aim_tb then
			local floor_num = player:GetInt("DungeonFloor")
			local to_next_floor = npc_config[npc_keyname]["DestroyToNextFloor"]
			if to_next_floor and type(to_next_floor) == "number" then
				if DungeonType == "Rift" then
					player:SetString("Dungeon"..flag.."Last_step", "")
					first_map:SetInt("DungeonShowStep", 0)
				end
				player:SetString(flag.."Last_floor_num", tostring(to_next_floor))
				Dungeon.CreateMap(player, to_next_floor)
				return
			end
			
			local next_step = "Step_"..npc_config[npc_keyname]["NextStep"]
			Dungeon.GoToStep(player, map, floor_num, next_step, first_map)
			for _,v in ipairs(aim_tb) do
				map:SetInt("TraceWinNum"..v, 0)
			end
		end
	--目标是消灭怪物
	elseif map:GetString("TraceMode") == "CleanUp" then
		local aim_tb = sLuaApp:StrSplit(map:GetString("TraceAim"), ",")
		local success_aim = 0
		for _,v in ipairs(aim_tb) do
			local npc_tb = map:GetNpcByKeyName(v)
			if #npc_tb == 0 or (v == npc_keyname and #npc_tb == 1) then --销毁在判断追踪之后
				success_aim = success_aim + 1
			end
		end
		if success_aim >= #aim_tb then
			local floor_num = player:GetInt("DungeonFloor")
			local to_next_floor = npc_config[npc_keyname]["DestroyToNextFloor"]
			if to_next_floor and type(to_next_floor) == "number" then
				player:SetString(flag.."Last_floor_num", tostring(to_next_floor))
				if DungeonType == "Rift" then
					player:SetString("Dungeon"..flag.."Last_step", "")
					first_map:SetInt("DungeonShowStep", 0)
				end
				Dungeon.CreateMap(player, to_next_floor)
				return
			end
			local next_step = "Step_"..npc_config[npc_keyname]["NextStep"]
			Dungeon.GoToStep(player, map, floor_num, next_step, first_map)
		end
	end
end

--NPC销毁时回调
function Dungeon.DestroyNPC(player, npc)
	local map = npc:GetMap()
	local npc_keyname = npc:GetKeyName()
	
	--如果npc销毁后数量小于Min_Num  再加一个npc
	local npc_min_num = map:GetInt(npc_keyname.."_Min_Num")
	local npc_tb = map:GetNpcByKeyName(npc_keyname)
	if #npc_tb <= npc_min_num then
		local npc_id = npc:GetId()
		local re_create_info = npc:GetString("ReCreateInfo")
		Dungeon.ReCreateNPC(npc_id, re_create_info, "NPC", map, "")
	end
	
	--设置重生
	local tmp_sym = npc:GetString("SymbiosisNPC") --时间+共生系统内npc
	if tmp_sym and tmp_sym ~= "" then
		local sym_tb = sLuaApp:StrSplit(tmp_sym, ",")
		local revive_time = tonumber(sym_tb[1]) * 1000
		local re_create_info = npc:GetString("ReCreateInfo")
		local params = npc:GetKeyName()..","..re_create_info
		for _,v in ipairs(sym_tb) do 
			params = params ..","..v
		end
		local t_guid= sLuaTimerSystem:AddTimerEx(map, revive_time,1,"Dungeon.Revive", params)
	end

	sNpcSystem:DestroyNpc(npc) 
	
	Dungeon.ShowTrace(player)
end

--删npc
function Dungeon.DeleteNPC(map_num, step, map)
	local flag = map:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	if not map_config then return end
	local del_tb = map_config[map_num][step]["DelNPC"]
	if next(del_tb) then
		for _,v in ipairs(del_tb) do
			local npc_tb = map:GetNpcByKeyName(v["KeyName"])
			local del_num = v["Del_Num"]
			if del_num == -1 then
				del_num = #npc_tb
			end
			for i = 1,del_num do
				sNpcSystem:DestroyNpc(npc_tb[i]) 
			end
		end
	end
end

--召唤怪 包括照明灯物品脚本
function Dungeon.Summon(map_num, step, map)
	local flag = map:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	if not map_config then return end
	local hide_pos_tb = map_config[map_num][step]["AddSummon"]["HideNPC"]["Pos"]
	local pos = hide_pos_tb[sLuaApp:RandInteger(1,#hide_pos_tb)]
	
	map:SetInt("HideNPCX", pos["X"])
	map:SetInt("HideNPCY", pos["Y"])
	map:SetInt("HideNPCDirection", pos["Direction"])
	map:SetString("ClueNPCKeyName", map_config[map_num][step]["AddSummon"]["ClueNPC"])
end

-- 延迟触发 Dungeon.Symbiosis
function Dungeon.ToSymbiosis(map_num, step, map)
	sLuaTimerSystem:AddTimerEx(map, 500,1,"Dungeon.Symbiosis", map_num ..",".. step)
end

-- 给指定npc添加共生属性
function Dungeon.Symbiosis(map, timer, map_param)
	local tmp_tb = sLuaApp:StrSplit(map_param, ",")
	local map_num = tonumber(tmp_tb[1])
	local step = tmp_tb[2]
	
	local flag = map:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	if not map_config then return end
	
	local sym_tb = map_config[map_num][step]["AddSymbiosis"]
	for _,v in ipairs(sym_tb) do
		local sym_str = ""..v["RefreshTime"]
		for _,b in ipairs(v["BindNPC"]) do
			sym_str = sym_str .. "," .. b
		end
		
		for _,b in ipairs(v["BindNPC"]) do
			local npc_tb = map:GetNpcByKeyName(b)
			if not next(npc_tb) then
				sLuaApp:LuaErr(map:GetName().."不存在"..b)
			end
			for _,y in pairs(npc_tb) do
				y:SetString("SymbiosisNPC", sym_str)
			end
		end
	end
end

--npc复活
function Dungeon.Revive(map, timer, params)
	--需要创建的npc keyname , 创建信息 , 重生时间 , 判断存在的npc列表
	local rev_tb = sLuaApp:StrSplit(params, ",")
	local sym_str = ""..rev_tb[3]
	for i=4, #rev_tb do
		sym_str = sym_str ..",".. rev_tb[i]
	end
	for i=4, #rev_tb do
		local npc_tb = map:GetNpcByKeyName(rev_tb[i])
		if #npc_tb > 0 then
			local npc_id = NpcConfig.GetByKeyName(rev_tb[1]).Id
			Dungeon.ReCreateNPC(npc_id, rev_tb[2], "NPC", map, sym_str)
			break
		end
	end
	
end

--重新创建npc
function Dungeon.ReCreateNPC(npc_id, re_create_info, npc_type, map, sym_str)
	local tmp_tb = sLuaApp:StrSplit(re_create_info, ":")
	if next(tmp_tb) then
		if tonumber(tmp_tb[1]) == 1 then
			local npc = sNpcSystem:CreateMoveNpc(npc_id, map, tonumber(tmp_tb[2]), tonumber(tmp_tb[3]), tonumber(tmp_tb[4]), 0)
			if npc then
				npc:SetString("ReCreateInfo", re_create_info)
				npc:SetString("DungeonNPCType", npc_type)
				if sym_str then
					npc:SetString("SymbiosisNPC", sym_str)
				end
			end
		elseif tonumber(tmp_tb[1]) == 0 then
			local npc = sNpcSystem:CreateNpc(npc_id, map, tonumber(tmp_tb[2]), tonumber(tmp_tb[3]), tonumber(tmp_tb[4]), tonumber(tmp_tb[5]), 0)
			if npc then
				npc:SetString("ReCreateInfo", re_create_info)
				npc:SetString("DungeonNPCType", npc_type)
				if sym_str then
					npc:SetString("SymbiosisNPC", sym_str)
				end
			end
		end
	else
		sLuaApp:LuaErr("Dungeon.ReCreateNPC re_create_info 为空")
	end
end

--客户端追踪 升级刷新
function Dungeon.ShowTrace(player, first_map)
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then 
		return 
	end
	local reward_config = assert(load(" return "..flag ..".RewardConfig"))()
	local npc_config = assert(load(" return "..flag ..".NPCConfig"))()
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	
	local NowDungeonMapGuid = player:GetInt("NowDungeonMapGuid")
	local map = sMapSystem:GetMapByGUID(NowDungeonMapGuid)
	
	if not first_map or type(first_map) == "number" then
		first_map = sMapSystem:GetMapByGUID(player:GetInt("DungeonFirstMapGUID"))
	end
	local deadline_sec = first_map:GetInt("DungeonDeadline") --√
	local floor_num = first_map:GetInt("DungeonFloorNum")
	-- local step = 0 
	-- for v in string.gmatch(first_map:GetString("DungeonStepNum"), "%d+") do --√
		-- step = tonumber(v) + 1
	-- end
	local show_step = first_map:GetInt("DungeonShowStep") --√
	
	local max_step = Data.DungeonMaxStep[flag][1]
	local DungeonType = player:GetString("DungeonType")
	if DungeonType == "Rift" then
		max_step = Data.DungeonMaxStep[flag][floor_num] --√
	end
	local reward_keyname = first_map:GetString("DungeonStepRewardKeyName")
	
	local is_first_reward, reward_keyname = Dungeon.CheckFirstReward(player, reward_keyname)
	
	--奖励列表
	local reward_list = {} --√
	if reward_config[reward_keyname] then
		reward_list = reward_config[reward_keyname]
	else
		if is_first_reward == 0 then
			reward_list = reward_config["通用默认奖励配置表"]
			sLuaApp:LuaDbg(flag..".RewardConfig配置缺少"..reward_keyname)
		else
			reward_list = reward_config["通用默认奖励配置表First"]
		end
	end
	--追踪文本
	if map then
		local trace_aim = {} --√
		local trace_mode = map:GetString("TraceMode")
		local aim_tb = sLuaApp:StrSplit(map:GetString("TraceAim"), ",")
		sLuaApp:LuaDbg("map TraceAim"..map:GetString("TraceAim"))
		local trace_msg = map:GetString("TraceMsg")
		local npc_t_str_tb = {}
		local aim_npc_tb = {}
		if trace_mode == "Fight" or trace_mode == "Open" then
			for k,v in ipairs(aim_tb) do
				local npc_name = NpcConfig.GetByKeyName(v).Name
				local trace_num = map:GetInt("TraceWinNum"..v)
				local trace_max = npc_config[v]["WinTime"]
				local npc_t_str = npc_name .. "（"..trace_num.."/"..trace_max.."）"
				npc_t_str_tb["$Aim"..k] = "#NPCLINK<STR:".. npc_t_str .. ">#"
				aim_npc_tb = map:GetNpcByKeyName(v)
				if trace_num < trace_max and next(aim_npc_tb) then
					trace_aim[1] = v
				end
			end
		elseif trace_mode == "Talk" or trace_mode == "CleanUp" then
			for k,v in ipairs(aim_tb) do
				local npc_name = NpcConfig.GetByKeyName(v).Name
				npc_t_str_tb["$Aim"..k] = "#NPCLINK<STR:".. npc_name .. ">#"
				if next(map:GetNpcByKeyName(v)) then
					aim_npc_tb = map:GetNpcByKeyName(v)
					trace_aim[1] = v
				end
			end
		end
		local trace_msg_show = string.gsub(trace_msg, "%$Aim[0-9]*", npc_t_str_tb) --√
		
		if not trace_aim[1] or trace_aim[1] == "" then
			sLuaApp:LuaErr("Dungeon.ShowTrace trace_aim[1]为空")
		end
		if next(aim_npc_tb) then
			--first_map:SetInt("DungeonTraceNPC", aim_npc_tb[1]:GetGUID())--npc暂停用
			table.insert(trace_aim, sMapSystem:GetPosX(aim_npc_tb[1]))
			table.insert(trace_aim, sMapSystem:GetPosY(aim_npc_tb[1]))
			local re_create_tb = sLuaApp:StrSplit(aim_npc_tb[1]:GetString("ReCreateInfo"), ":")
			table.insert(trace_aim, tonumber(re_create_tb[1]))
		end
		
		local data_tb = {}
		data_tb["DeadlineSec"] = deadline_sec
		data_tb["NowStep"] = show_step
		data_tb["MaxStep"] = max_step
		data_tb["TraceAim"] = trace_aim
		data_tb["TraceMsg"] = trace_msg_show
		data_tb["RewardExp"] = 0
		data_tb["RewardMoney"] = 0
		data_tb["RewardItem"] = reward_list["Item"] or {}
		data_tb["IsFirstReward"] = is_first_reward
		local player_tb = map:GetAllPlayers()
		for _,v in ipairs(player_tb) do
			if reward_list["Exp"] and reward_list["Exp"] ~= 0 then
				data_tb["RewardExp"] = Dungeon.RewardConfigToNmber(v, reward_list["Exp"], 0) --√
			end
			if reward_list["MoneyType"] and reward_list["MoneyVal"] and reward_list["MoneyVal"] ~= 0 then
				data_tb["RewardMoney"] = Dungeon.RewardConfigToNmber(v, reward_list["MoneyVal"], 0) --√
			end
			local str = [[
				if TrackUI then
					TrackUI.dungeonData = ]]..Lua_tools.serialize(data_tb)..[[
					TrackUI.UpdateDungeonData()
				end
			]]
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
	end
end

-- --点击追踪栏让 被追踪的怪不移动
-- function Dungeon.StopNPCMove(player)
	-- local first_map = sMapSystem:GetMapByGUID(player:GetInt("DungeonFirstMapGUID"))
	-- local npc_guid = first_map:GetInt("DungeonTraceNPC")
	-- if npc_guid ~= 0 then
		-- local npc = sNpcSystem:GetNpcByGUID()
		-- if npc then
			-- npc:SetPatrol(false)
		-- end
	-- end
-- end

--掉线重连
function Dungeon.OnLogin(player)
	--sLuaApp:LuaErr("OnLogin   map_name"..player:GetMap():GetName())
	local first_map_guid = player:GetInt("DungeonFirstMapGUID")
	--sLuaApp:LuaErr("1190      first_map_guid = "..first_map_guid)
	--if first_map_guid == 0 then 
	--	return 
	--end
	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
	if first_map then
		local floor_num = first_map:GetInt("DungeonFloorNum")
		player:SetInt("DungeonFloor", floor_num)
		player:SetString("DungeonStep", first_map:GetString("DungeonStepNum"))
		local now_map = sMapSystem:GetMapByGUID(first_map:GetInt("DungeonMap"..floor_num))
		if now_map then
			sTriggerSystem:AddTrigger(player, TRIGGER_ON_PRE_JUMP_MAP, "Dungeon", "on_pre_jump_map")
			sMapSystem:Jump(player, now_map, math.floor(now_map:GetWidth()/2), math.floor(now_map:GetHeight()/2), 100)
			local str = [[
				if TrackUI then
					TrackUI.SwitchQuestOrDungeonNode(false)
				end
				if MainDynamicUI then
					MainDynamicUI.World_PVP_STATE = 0
					MainDynamicUI.World_PVP_BtnRefresh()
				end

			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			Dungeon.ShowTrace(player, first_map)
		else	--12.14发现会出现有first_map但是没有now_map的情况
			sTriggerSystem:DelTrigger(player, TRIGGER_ON_PRE_JUMP_MAP, "Dungeon", "on_pre_jump_map")
			Dungeon.DelDungeonItem(player)
			player:SetInt("DungeonFloor", 0)
			player:SetString("DungeonStep", "")
			local flag = player:GetString("DungeonFlag")
			if flag ~= "" then
				player:SetString(flag.."Last_floor_num", "")
				player:SetString("Dungeon"..flag.."Last_step", "")
				player:SetInt("Dungeon"..flag.."Relink", 0)
			end
			player:SetInt("DungeonFirstMapGUID", 0)
			player:SetString("DungeonFlag", "")
			sLuaApp:NotifyTipsMsg(player, "副本已结束。")
		end
	else
		sTriggerSystem:DelTrigger(player, TRIGGER_ON_PRE_JUMP_MAP, "Dungeon", "on_pre_jump_map")
		Dungeon.DelDungeonItem(player)
		player:SetInt("DungeonFloor", 0)
		player:SetString("DungeonStep", "")
		local flag = player:GetString("DungeonFlag")
		if flag ~= "" then
			player:SetString(flag.."Last_floor_num", "")
			player:SetString("Dungeon"..flag.."Last_step", "")
			player:SetInt("Dungeon"..flag.."Relink", 0)
		end
		player:SetInt("DungeonFirstMapGUID", 0)
		player:SetString("DungeonFlag", "")
		local player_map_keyname = player:GetMap():GetKeyName()
		if Data.DungeonMap then
			for k,v in ipairs(Data.DungeonMap) do
				if v == player_map_keyname then
					local quit_pos_tb = {"傲来村", 110, 50, 10}
					local quit_map = sMapSystem:GetMapById(MapConfig.GetByKeyName(quit_pos_tb[1]).Id)
					sMapSystem:Jump(player, quit_map, quit_pos_tb[2], quit_pos_tb[3], quit_pos_tb[4])
					sLuaApp:NotifyTipsMsg(player, "副本	已结束。")
				end
			end
		end	
	end
end

function Dungeon.Set(player, flag, num)
	--local flag = player:GetString("DungeonFlag")
	player:SetString(flag.."Last_floor_num", tostring(num))
	return flag
end

--转接 确认退出提示框
function Dungeon.ToQuit(player_guid)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local first_map = sMapSystem:GetMapByGUID(player:GetInt("DungeonFirstMapGUID"))
	local flag = player:GetString("DungeonFlag")
	local IsFinish = player:GetInt("Dungeon"..flag.."IsFinish")
	if first_map then
		if IsFinish == 0 then
			Dungeon.Quit(first_map, player, 2)
		elseif IsFinish == 1 then
			Dungeon.Quit(first_map, 0, 1, player)
		end
	else
		sTriggerSystem:DelTrigger(player, TRIGGER_ON_PRE_JUMP_MAP, "Dungeon", "on_pre_jump_map")
		Dungeon.DelDungeonItem(player)
		player:SetInt("DungeonFloor", 0)
		player:SetString("DungeonStep", "")
		if flag ~= "" then
			player:SetString(flag.."Last_floor_num", "")
			player:SetString("Dungeon"..flag.."Last_step", "")
			player:SetInt("Dungeon"..flag.."Relink", 0)
		end
		player:SetInt("DungeonFirstMapGUID", 0)
		player:SetString("DungeonFlag", "")
		local player_map_keyname = player:GetMap():GetKeyName()
		if Data.DungeonMap then
			for k,v in ipairs(Data.DungeonMap) do
				if v == player_map_keyname then
					local quit_pos_tb = {"傲来村", 110, 50, 10}
					local quit_map = sMapSystem:GetMapById(MapConfig.GetByKeyName(quit_pos_tb[1]).Id)
					sMapSystem:Jump(player, quit_map, quit_pos_tb[2], quit_pos_tb[3], quit_pos_tb[4])
					sLuaApp:NotifyTipsMsg(player, "副本	已结束。")
				end
			end
		end	
		local str = [[
			if TrackUI then
				TrackUI.SwitchQuestOrDungeonNode(true)
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function Dungeon.CheckFirstReward(player, reward_keyname)
	local is_first_reward = 0
	local flag = player:GetString("DungeonFlag")
	local LUA = flag..".FirstRewardSwitch"
	local FirstRewardSwitch = assert(load("local XXX = "..LUA.." return XXX"))()
	if FirstRewardSwitch and FirstRewardSwitch == 1  then
		local has_first_reward = player:GetInt(flag.."_"..reward_keyname.."_First")
		if has_first_reward == 0 then
			reward_keyname = reward_keyname.."_First"
			is_first_reward = 1
		end
	else
		sLuaApp:LuaDbg(flag..".RewardConfig配置缺少"..reward_keyname.."  首通配置")
	end
	return is_first_reward, reward_keyname
end

function Dungeon.PlayMovie(player, movie_id)
	movie_id = tonumber(movie_id)
	if not player or not movie_id then
		return
	end
	local first_map = sMapSystem:GetMapByGUID(player:GetInt("DungeonFirstMapGUID"))
	if not first_map then
		return ""
	end
	local DungeonType = player:GetString("DungeonType")

	if DungeonType == "Rift" then
		if player:GetInt("DungeonMovie_"..movie_id) == 1 then
			return
		end
		sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", movie_id)
		player:SetInt("DungeonMovie_"..movie_id, 1)
	elseif DungeonType == "Raid" then
		for i = 1, 5 do
			local player_guid = first_map:GetInt("DungeonPlayerGUID"..i)
			if player_guid ~= 0 then
				local player_now = sPlayerSystem:GetPlayerByGUID(player_guid)
				if player_now then
					if player_now:GetType() == GUID_PLAYER then
						sLuaTimerSystem:AddTimerEx(player_now, 500, 1, "Movie_system.QuestCallMovie", movie_id)
					end
				end
			end
		end
	end
end

function Dungeon.ContinueProcess(player, Last_floor_num, Last_step)
	sLuaApp:LuaErr("进入ContinueProcess了")
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local map_config = assert(load(" return "..flag ..".MapConfig"))()
	
	if Last_floor_num ~= "" or Last_step ~= "" then
		if Last_floor_num ~= "" then
			Last_floor_num = tonumber(Last_floor_num)
		else
			Last_floor_num = 1
		end
		if Last_step == "" then
			Last_step = "Step_0"
		end
		if map_config[Last_floor_num] and map_config[Last_floor_num][Last_step] then
			--local first_map_guid = player:GetInt("DungeonFirstMapGUID")
			--if first_map_guid and first_map_guid ~= 0 then
			--	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
			--	local step_num = tonumber(sLuaApp:StrSplit(Last_step, "_")[2])
			--	sLuaApp:LuaErr("------------step_num = "..step_num.."    -----------------------")
			--	first_map:SetInt("DungeonShowStep", step_num)
			--	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
			--	first_map:SetString("DungeonStepRewardKeyName", "")
			--end
			player:SetString("DungeonStep", Last_step)
			if Last_floor_num ~= 1 then	
				Dungeon.CreateMap(player, 1)
				Dungeon.CreateMap(player, Last_floor_num)
			else
				Dungeon.CreateMap(player, 1)
			end
		else
			sLuaApp:LuaErr("进度继承   "..flag..".MapConfig"..floor_num..step.."缺失")
		end	
	end
end

function Dungeon.Logout(player)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_LOGOUT, "Dungeon", "Logout")
	local first_map_guid = player:GetInt("DungeonFirstMapGUID")
	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
end

function Dungeon.ReLogin(player)
	--sTriggerSystem:DelTrigger(player, TRIGGER_ON_RELOGIN, "Dungeon", "ReLogin")
	if not player then
		sLuaApp:LuaErr("Dungeon.ReLogin  没有player")
		return
	end
	--local player_name = player:GetName()
	--sLuaApp:LuaErr("Dungeon.ReLogin(player) player_name = "..tostring(player_name))
	Dungeon.OnLogin(player)
end

--在副本通关后的退出弹窗
function Dungeon.ConfirmQuit(player)
	sLuaApp:LuaErr("Dungeon.ConfirmQuit player_name = "..tostring(player:GetName()))
	local str = [[GlobalUtils.ShowServerBoxMessage("副本已经结束，需要立即离开吗？")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ConfirmQuitContinue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function Dungeon.GetExitTime(player, time)
	if not Dungeon.ExitTime then
		Dungeon.ExitTime = 30
	end
	Dungeon.ExitTime = tonumber(time) or 30
	local flag = player:GetString("DungeonFlag")
	player:SetInt("Dungeon"..flag.."IsFinish", 1)
	local first_map_guid = player:GetInt("DungeonFirstMapGUID")
	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
	local Quit_Timer_Guid = first_map:GetInt("Quit_Timer_Guid")
	sLuaTimerSystem:DisableTimer(Quit_Timer_Guid)
	local Success_Quit_Timer_Guid = sLuaTimerSystem:AddTimerEx(first_map, (Dungeon.ExitTime + 0.3) * 1000, 1, "Dungeon.Quit", "1")
	first_map:SetInt("Quit_Timer_Guid", Success_Quit_Timer_Guid)
end

--在玩家点击弹窗中"确认"后触发的方法
function Dungeon.ConfirmQuitContinue(player)
	local first_map_guid = player:GetInt("DungeonFirstMapGUID")
	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
	Dungeon.Quit(first_map, 0, 1, player)
end

function Dungeon.Initialization()
	if sVarSystem:GetInt("DungeonGUID") == 0 then
		sVarSystem:SetInt("DungeonGUID", 100000)
	end
end
Dungeon.Initialization()