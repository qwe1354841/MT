--用于进入副本(包括判断是否能进入副本以及记录玩家进入的是哪个秘境副本)

--在这里把所有的副本配置优先加载！！！
require("map/AoLaiMiBaoConfig")
require("map/AoLaiMiBaohardConfig")
require("map/MengHuiQianGuConfig")
require("map/MengHuiQianGuhardConfig")
require("map/DongKuFuMoConfig")
require("map/DongKuFuMohardConfig")
require("map/RenGuiJueLianConfig")
require("map/RenGuiJueLianhardConfig")
require("map/DaYanTaConfig")
require("map/DaYanTahardConfig")
require("map/ShaChengConfig")
require("map/ShaChenghardConfig")
require("map/ShuiLianDongConfig")
require("map/ShuiLianDonghardConfig")
DungeonSystem = {}
--倒计时时间,默认单位:秒
DungeonSystem.ReadyTime = 30
--副本系统
--关于副本进入次数限制，有两条数据会影响["RefreshTime"]和["MaxJoinTimes"]；如果想无限制进入直接["RefreshTime"] = 0；如果想有限制进入就["MaxJoinTimes"] = X次，不写默认为1
DungeonSystem.Config = {
	["大雁塔"] = {
		--最小参与等级
		["LevelMin"] = 35,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "DaYanTaConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["大雁塔(困难)"] = {
		--最小参与等级
		["LevelMin"] = 50,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "DaYanTahardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["沙城遗址"] = {
		--最小参与等级
		["LevelMin"] = 40,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "ShaChengConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["沙城遗址(困难)"] = {
		--最小参与等级
		["LevelMin"] = 70,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "ShaChenghardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["水帘洞"] = {
		--最小参与等级
		["LevelMin"] = 60,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "ShuiLianDongConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["水帘洞(困难)"] = {
		--最小参与等级
		["LevelMin"] = 90,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "ShuiLianDonghardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["巅峰试炼"] = {
		--最小参与等级
		["LevelMin"] = 80,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "DianFengShiLianConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["巅峰试炼(困难)"] = {
		--最小参与等级
		["LevelMin"] = 110,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 0, 
		--配置脚本名
		["Config"] = "DianFengShiLianhardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Rift",
	},
	["傲来秘宝"] = {
		--最小参与等级
		["LevelMin"] = 50,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] = 1,
		--配置脚本名
		["Config"] = "AoLaiMiBaoConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
	["傲来秘宝(困难)"] = {
		--最小参与等级
		["LevelMin"] = 90,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] = 1,
		--配置脚本名
		["Config"] = "AoLaiMiBaohardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
	["梦回千古"] = {
		--最小参与等级
		["LevelMin"] = 60,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] = 1,
		--配置脚本名
		["Config"] = "MengHuiQianGuConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
	["梦回千古(困难)"] = {
		--最小参与等级
		["LevelMin"] = 100,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] = 1,
		--配置脚本名
		["Config"] = "MengHuiQianGuhardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
	["洞窟伏魔"] = {
		--最小参与等级
		["LevelMin"] = 70,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] =1,
		--配置脚本名
		["Config"] = "DongKuFuMoConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
	["洞窟伏魔(困难)"] = {
		--最小参与等级
		["LevelMin"] = 110,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] =1,
		--配置脚本名
		["Config"] = "DongKuFuMohardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
	["人鬼绝恋"] = {
		--最小参与等级
		["LevelMin"] = 80,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] =1,
		--配置脚本名
		["Config"] = "RenGuiJueLianConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
	["人鬼绝恋(困难)"] = {
		--最小参与等级
		["LevelMin"] = 120,
		--副本刷新时间（天）, 秘境可以不写或者写0
		["RefreshTime"] = 1, 
		["MaxJoinTimes"] =1,
		--配置脚本名
		["Config"] = "RenGuiJueLianhardConfig",
		--Dungeon类型, "Rift"代表秘境, "Raid"代表副本, 如果是副本还需设置最大/最小参与人数
		["Type"] = "Raid",
		["TeamJoinMinNum"] = 1,
		["TeamJoinMaxNum"] = 5,
	},
}
--判断能否进入副本
function DungeonSystem.CheckJoin(player, dungeon_name)				--dungeon_name是中文, 例如"大雁塔"
	if not DungeonSystem.Config or not DungeonSystem.Config[dungeon_name] then
		sLuaApp:LuaErr("不存在DungeonSystem.Config"..dungeon_name)
		return
	end
	local TeamJoinMaxNum = 0
	local TeamMemberCount = 1
	local level_min = DungeonSystem.Config[dungeon_name]["LevelMin"]
	local RefreshTime = DungeonSystem.Config[dungeon_name]["RefreshTime"]
	if not RefreshTime then
		RefreshTime = 0
	end
	local Dungeon_Type = DungeonSystem.Config[dungeon_name]["Type"]
	local return_msg_tb ={}
	local team = player:GetTeam()
	local cant_join_player = {}
	local now_time =  sLuaApp:DaySinceEpoch(0)
	--sLuaApp:LuaDbg("sLuaApp:DaySinceEpoch(0)   now_time = "..now_time)
	local can_fight = 0
	--[1]={0符合条件/
	--	1不符合条件，队伍中有暂离人员(仅用作副本)/
	--	2不符合条件，玩家组队(仅用作秘境)/
	--	3不符合条件，等级不够/
	--	4不符合条件，队伍中有玩家已经完成过副本/
	--	5队伍人数不满足进入条件(仅副本用)},
	--	6申请人不是队长(仅副本用)
	if Dungeon_Type == "Raid" then
		if team then
			if player:IsTeamLeader() then
				for k,v in pairs(team:GetTeamMembers(true)) do
					--local a = v:GetInt(dungeon_name.."EnterTime")
					--sLuaApp:LuaDbg("sLuaApp:DaySinceEpoch(0)   a = "..a)
					if can_fight ~= 4 and can_fight ~= 3 then
						if sTeamSystem:IsTempLeave(v) then
							can_fight = 1
							table.insert(cant_join_player, v:GetName())
						end
					end
					if can_fight ~= 1 and can_fight ~= 4 then
						if v:GetAttr(ROLE_ATTR_LEVEL) < level_min then
							can_fight = 3
							table.insert(cant_join_player, v:GetName())
						end
					end
					if can_fight ~= 1 and can_fight ~= 3 then
						local LastEnterTime = v:GetInt(dungeon_name.."EnterTime")
						if LastEnterTime + RefreshTime > now_time then
							local JoinTimes = v:GetDayInt(dungeon_name.."JoinTimes")
							local MaxJoinTimes = DungeonSystem.Config[dungeon_name]["MaxJoinTimes"] or 1
							local VipTimes = VipLogic.GetVipEnhanced(v, "副本奖励次数", "times", MaxJoinTimes)		--经过Vip等级计算之后实际能打的次数
							--sLuaApp:LuaDbg("DungeonSystem.CheckJoin       VipTimes = "..VipTimes)
							if JoinTimes >= VipTimes then
								can_fight = 4
								table.insert(cant_join_player, v:GetName())
							end
						end
					end
				end
			else
				can_fight = 6
				table.insert(return_msg_tb, can_fight)
				return return_msg_tb
			end
			if can_fight == 0 then
				TeamMemberCount = team:GetTeamMemberCount()
				if TeamMemberCount < DungeonSystem.Config[dungeon_name]["TeamJoinMinNum"] or TeamMemberCount > DungeonSystem.Config[dungeon_name]["TeamJoinMaxNum"] then
					can_fight = 5
					table.insert(return_msg_tb, can_fight)
					return return_msg_tb
				end
			else
				table.insert(return_msg_tb, can_fight)
				table.insert(return_msg_tb, cant_join_player)
				return return_msg_tb
			end
		else
			can_fight = 5
			table.insert(return_msg_tb, can_fight)
			return return_msg_tb
		end
	elseif Dungeon_Type == "Rift" then
		if team then
			can_fight = 2
			table.insert(cant_join_player, player:GetName())
			table.insert(return_msg_tb, can_fight)
			table.insert(return_msg_tb, cant_join_player)
			return return_msg_tb
		else
			local LEVEL = player:GetAttr(ROLE_ATTR_LEVEL)
			if LEVEL >= level_min then
				can_fight = 0
			else
				can_fight = 3
				table.insert(cant_join_player, player:GetName())
				table.insert(return_msg_tb, can_fight)
				table.insert(return_msg_tb, cant_join_player)
				return return_msg_tb
			end
		end
	end
	--此处记录短期内是否可再次进入Dungeon, 待改
	sLuaApp:LuaDbg("=============can_fight = "..can_fight)
	table.insert(return_msg_tb, can_fight)
	table.insert(return_msg_tb, cant_join_player)
	--{
	--[1]={0符合条件/
	--	1不符合条件，队伍中有暂离人员(仅用作副本)/
	--	2不符合条件，玩家组队(仅用作秘境)/
	--	3不符合条件，等级不够/4不符合条件，队伍中有玩家已经完成过副本/
	--	5队伍人数不满足进入条件(仅副本用)},
	--	6申请人不是队长(仅副本用)
	--[2] = {不能进入的玩家名字}
	--}	
	return return_msg_tb
end
function DungeonSystem.Enter(player, dungeon_name)
	--给玩家身上加
	local now_time_day = sLuaApp:DaySinceEpoch(0)
	local team = player:GetTeam()
	local memberlist = {}
	if team then
		memberlist = team:GetTeamMembers(false)
	else
		memberlist[1] = player
	end
	for _,v in ipairs(memberlist) do
		if DungeonSystem.Config[dungeon_name]["Type"] == "Rift" then
			v:SetString("DungeonType", "Rift")
		elseif DungeonSystem.Config[dungeon_name]["Type"] == "Raid" then
			v:SetString("DungeonType", "Raid")
		end
		v:SetInt(dungeon_name.."EnterTime", now_time_day)	
		v:SetString("DungeonFlag", DungeonSystem.Config[dungeon_name]["Config"])
		v:SetString("DungeonName", dungeon_name)
	end
	--进入副本
	local DungeonFlag = player:GetString("DungeonFlag")
	local Last_floor_num = player:GetString(DungeonFlag.."Last_floor_num")
	local Last_step = player:GetString("Dungeon"..DungeonFlag.."Last_step")
	if DungeonSystem.Config[dungeon_name]["Type"] == "Rift" then
		--player:SetString("DungeonType", "Rift")
		if Last_floor_num ~= "" or Last_step ~= "" then
			player:SetInt("Dungeon"..DungeonFlag.."Relink", 1)
			Dungeon.ContinueProcess(player, Last_floor_num, Last_step)
		else
			Dungeon.CreateMap(player, 1)
		end
	elseif DungeonSystem.Config[dungeon_name]["Type"] == "Raid" then
		--player:SetString("DungeonType", "Raid")
		Dungeon.CreateMap(player, 1)
	end
	
	--检测dungeon地图并扣除次数
	local playerlist = DungeonSystem.CheckMap(memberlist)
	if playerlist and next(playerlist) then
		for k, v in pairs(playerlist) do
			local JoinTimes = v:GetDayInt(dungeon_name.."JoinTimes")
			v:SetDayInt(dungeon_name.."JoinTimes", JoinTimes + 1)
			sLuaApp:LuaErr("==================玩家  "..tostring(v:GetName()).."  已经进入过副本"..dungeon_name.."  "..JoinTimes.."次")
		end
	end
end

function DungeonSystem.CheckMap(memberlist)
	local list = {}
	if Data.DungeonMap then
		for m, n in pairs(memberlist) do
			local player_map_keyname = n:GetMap():GetKeyName()
			sLuaApp:LuaErr("CheckMap   =====  "..tostring(n:GetName()).."     "..player_map_keyname)
			local TOF = false
			for _,v in ipairs(Data.DungeonMap) do
				if player_map_keyname == v then
					TOF = true
				end
			end
			if TOF then
				table.insert(list, n)
			end
		end
	else
		sLuaApp:LuaErr("没有Data.DungeonMap")
		return memberlist
	end
	return list
end

function DungeonSystem.RequestEnter(player,dungeon_name)
	if not DungeonSystem.Config[dungeon_name] then
		sLuaApp:NotifyTipsMsg(player, "休想骗我，没有这个副本。")
	end
	local tb = DungeonSystem.CheckJoin(player, dungeon_name)
	local str = ""
	if tb[1] == 0 then
		str = [[
			if InstanceUI then
				GUI.CloseWnd("InstanceUI")
			end
		]]
		if DungeonSystem.Config[dungeon_name]["Type"] == "Rift" then
			sLuaApp:ShowForm(player, "脚本表单", str)
			DungeonSystem.Enter(player, dungeon_name)
		elseif DungeonSystem.Config[dungeon_name]["Type"] == "Raid" then
			player:SetString("ready_dungeon_name",""..dungeon_name)
			str = str..[[
				GUI.OpenWnd("InstanceConfirmUI")
			]]
			local team = player:GetTeam()
			for k,v in pairs(team:GetTeamMembers(false)) do
				sLuaApp:ShowForm(v, "脚本表单", str)
			end
		end
	elseif tb[1] == 1 then
		str = "队伍中有暂离玩家，无法进入副本。"
		sLuaApp:NotifyTipsMsg(player, ""..str)
	elseif tb[1] == 2 then
		str = "组队无法进入秘境。"
		sLuaApp:NotifyTipsMsg(player, ""..str)
	elseif tb[1] == 3 then
		if DungeonSystem.Config[dungeon_name]["Type"] == "Rift" then
			str = "等级不足，无法进入秘境。"
		elseif DungeonSystem.Config[dungeon_name]["Type"] == "Raid" then
			str = "队伍中有玩家等级不够，无法进入副本。"
		end
		sLuaApp:NotifyTipsMsg(player, ""..str)
	elseif tb[1] == 4 then
		str = "队伍中有玩家已经使用完该副本次数，无法进入副本。"
		sLuaApp:NotifyTipsMsg(player, ""..str)
	elseif tb[1] == 5 then
		str = "队伍人数不满足条件，无法进入副本。"
		sLuaApp:NotifyTipsMsg(player, ""..str)
	elseif tb[1] == 6 then
		str = "只有队长才可以进行此操作。"
		sLuaApp:NotifyTipsMsg(player, ""..str)
	end
end
function DungeonSystem.GetReadyData(player)
	local team = player:GetTeam()
	if not team then
		local str = [[
			GUI.CloseWnd("InstanceConfirmUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	local team_leader = team:GetTeamLeader()
	if team_leader:GetGUID() ~= player:GetGUID() then
		return
	end
	sLuaApp:LuaErr("DungeonSystem.GetReadyData    team_leader:"..team_leader:GetName().."    player:"..player:GetName())
	local dungeon_name = player:GetString("ready_dungeon_name")
	if not DungeonSystem.Config[dungeon_name] or dungeon_name == "" then
		local str = [[
			GUI.CloseWnd("InstanceConfirmUI")
		]]
		for k,v in pairs(team:GetTeamMembers(false)) do
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
		return
	end
	local member_state = {}
	local state = 1
	for k,v in pairs(team:GetTeamMembers(false)) do
		if v:GetType() == GUID_ROBOT then
			member_state[''..v:GetGUID()] = 1
		else
			if v:GetGUID() ~= player:GetGUID() then
				state = 0
				member_state[''..v:GetGUID()] = 0
			else
				member_state[''..v:GetGUID()] = 1
			end
		end
	end
	if state == 0 then
		player:SetString("ready_dungeon_state",""..Lua_tools.serialize(member_state))
		sLuaApp:LuaErr("ready_dungeon_state       "..player:GetString("ready_dungeon_state"))
		for k,v in pairs(team:GetTeamMembers(false)) do
			local str = [[
				if InstanceConfirmUI then
					InstanceConfirmUI.Data = ]]..Lua_tools.serialize(member_state)..[[
					InstanceConfirmUI.Refresh()
				end
			]]
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
		local timer = sLuaTimerSystem:AddTimerEx(player, DungeonSystem.ReadyTime * 1000 ,1,"DungeonSystem.ReadyTimerOver", "")
		player:SetInt("ReadyTimer",timer)
	elseif state == 1 then
		for k,v in pairs(team:GetTeamMembers(false)) do
			local str = [[
				GUI.CloseWnd("InstanceConfirmUI")
			]]
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
		DungeonSystem.Enter(player, player:GetString("ready_dungeon_name"))
		player:SetInt("ReadyTimer",0)
		player:SetString("ready_dungeon_name","")
		player:SetString("ready_dungeon_state","")
	end
end
function DungeonSystem.ReadyTimerOver(player, tinmer, p)
	player:SetInt("ReadyTimer",0)
	player:SetString("ready_dungeon_name","")
	player:SetString("ready_dungeon_state","")
	local team = player:GetTeam()
	if team then
		for k,v in pairs(team:GetTeamMembers(false)) do
			local str = [[
				GUI.CloseWnd("InstanceConfirmUI")
			]]
			sLuaApp:ShowForm(v, "脚本表单", str)
			sLuaApp:NotifyTipsMsg(player, "队伍中有玩家长时间没做出反应。")
		end
	end
end
function DungeonSystem.ReadyTrue(player)
	if not player then
		return
	end
	local team = player:GetTeam()
	if not team then
		sLuaApp:LuaErr("DungeonSystem.ReadyTrue no team")
		return
	end
	local team_leader = team:GetTeamLeader()
	if not team_leader then
		sLuaApp:LuaErr("DungeonSystem.ReadyTrue not team_leader player:"..player:GetName())
		return
	end
	local member_state = assert(load(" return "..team_leader:GetString("ready_dungeon_state")))()
	if not member_state then
		sLuaApp:LuaErr("DungeonSystem.ReadyTrue not member_state     team_leader:"..team_leader:GetName().."    player:"..player:GetName())
		return
	end
	member_state[''..player:GetGUID()] = 1
	local state = 1
	for k,v in pairs(member_state) do
		if v == 0 then
			state = 0
			break
		end
	end
	if state == 1 then
		if sLuaTimerSystem:HasTimer(team_leader:GetInt("ReadyTimer")) then
			sLuaTimerSystem:DisableTimer(team_leader:GetInt("ReadyTimer"))
		end
		for k,v in pairs(team:GetTeamMembers(false)) do
			local str = [[
				GUI.CloseWnd("InstanceConfirmUI")
			]]
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
		DungeonSystem.Enter(team_leader, team_leader:GetString("ready_dungeon_name"))
		team_leader:SetInt("ReadyTimer",0)
		team_leader:SetString("ready_dungeon_name","")
		team_leader:SetString("ready_dungeon_state","")
	elseif state == 0 then
		team_leader:SetString("ready_dungeon_state",""..Lua_tools.serialize(member_state))
		for k,v in pairs(team:GetTeamMembers(false)) do
			local str = [[
				if InstanceConfirmUI then
					InstanceConfirmUI.Data = ]]..Lua_tools.serialize(member_state)..[[
					InstanceConfirmUI.Refresh()
				end
			]]
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
	end
end
function DungeonSystem.ReadyFalse(player)
	if not player then
		return
	end
	local team = player:GetTeam()
	if not team then
		sLuaApp:LuaErr("DungeonSystem.ReadyTrue no team")
		return
	end
	local team_leader = team:GetTeamLeader()
	if sLuaTimerSystem:HasTimer(team_leader:GetInt("ReadyTimer")) then
		sLuaTimerSystem:DisableTimer(team_leader:GetInt("ReadyTimer"))
	end
	team_leader:SetInt("ReadyTimer",0)
	team_leader:SetString("ready_dungeon_name","")
	team_leader:SetString("ready_dungeon_state","")
	for k,v in pairs(team:GetTeamMembers(false)) do
		local str = [[
			GUI.CloseWnd("InstanceConfirmUI")
		]]
		sLuaApp:ShowForm(v, "脚本表单", str)
		sLuaApp:NotifyTipsMsg(v, "队伍中有玩家取消进入副本。")
	end
end

function DungeonSystem.GetDungeonData(player)
	for k,v in pairs(DungeonSystem.ConfigToShow['Raid'])do
		v['MaxJoinTimes'] = VipLogic.GetVipEnhanced(player, "副本奖励次数", "times", DungeonSystem.Config[v['Dg_Name']]["MaxJoinTimes"] or 1)
		v['JoinTimes'] = player:GetDayInt(v['Dg_Name'].."JoinTimes")
	end
	local str = [[
		if InstanceUI then
			InstanceUI.Data = ]]..Lua_tools.serialize(DungeonSystem.ConfigToShow)..[[
			InstanceUI.Refresh()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function DungeonSystem.GetInitializeData(player)
	local str = [[
		if GlobalProcessing then
			GlobalProcessing.InstanceUI_parameterOne = ]]..Lua_tools.serialize(DungeonSystem.parameterOne)..[[
			GlobalProcessing.InstanceUI_parameterTwo = ]]..Lua_tools.serialize(DungeonSystem.parameterTwo)..[[
			GlobalProcessing.InstanceUI_LabelList = ]]..Lua_tools.serialize(DungeonSystem.LabelList)..[[
			GlobalProcessing.InstanceUI_PageNum = ]]..Lua_tools.serialize(DungeonSystem.PageNum)..[[
			GlobalProcessing.InstanceConfirmUICountDownTime = ]]..Lua_tools.serialize(DungeonSystem.ReadyTime)..[[
		end
	]]
	--sLuaApp:LuaErr("DungeonSystem.Initialization = "..str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function DungeonSystem.Initialization()
	if Data then
		Data.DungeonMap = {}
		Data.DungeonMaxStep = {}
		Data.DungeonItem = {}
		DungeonSystem.ConfigToShow = {}
		DungeonSystem.ConfigToShow["Rift"] = {}
		DungeonSystem.ConfigToShow["Raid"] = {}
		local TB = {}
		DungeonSystem.parameterOne = {}
		DungeonSystem.parameterTwo = {}
		local AList = {
			["Rift"] = {"秘境","secretAreaTog","OnSecretAreaToggle","secretAreaPage","CreateSecretAreaPage"},
			["Raid"] = {"副本","instanceTog","OnInstanceToggle","instancePage","CreateInstancePage"},
		}
		DungeonSystem.LabelList = {}
		local BList={
		    ["Rift"] = "secretAreaPage",
		    ["Raid"] = "instancePage",
		}
		DungeonSystem.PageNum = {}
		DungeonSystem.NPCToDgName = {}
		for a,y in pairs(DungeonSystem.Config) do
			--根据配置生成一张发给客户端做显示用的表
			local tb = {}
			tb['Dg_Name'] = a
			tb['LevelMin'] = y.LevelMin
			tb['ShowItem'] = assert(load(" return ".. y.Config ..".ShowItem"))()
			tb['ShowDesc'] = assert(load(" return ".. y.Config ..".ShowDesc"))()
			tb['ShowPic'] = assert(load(" return ".. y.Config ..".ShowPic"))()
			table.insert(DungeonSystem.ConfigToShow[y.Type],tb)
			--根据配置生成一张发给客户端做参数用的表 (part 1)
			TB[y.Type] = 1
			
			--根据配置生成一张站街NPC对应副本的表
			local npc_keyname = ""..assert(load(" return ".. y.Config ..".EnterPos[5]"))()
			if not DungeonSystem.NPCToDgName[npc_keyname] then
				DungeonSystem.NPCToDgName[npc_keyname] = {}
			end
			table.insert(DungeonSystem.NPCToDgName[npc_keyname],a)
			
			local flag = y["Config"]
			assert(load(" if not "..flag.." then require('map/"..flag.."') end"))()
			local map_config = assert(load(" return "..flag ..".MapConfig"))()
			if not map_config then
				sLuaApp:LuaErr("DungeonSystem.Initialization  "..flag.."不存在MapConfig")
			end
			
			--存副本地图  副本地图不允许跳转 不允许归队
			for _,v in ipairs(map_config) do
				table.insert(Data.DungeonMap, v["MapKeyName"])
			end
			
			--存副本单层最大进度
			Data.DungeonMaxStep[flag] = {}
			if y["Type"] == "Rift" then
				for k,v in ipairs(map_config) do
					local max_step = 0
					for a,b in pairs(v) do
						if string.sub(a,1,5) == "Step_" and (not b["ShowStep"] or b["ShowStep"] == 1) then
							max_step = max_step + 1
						end
					end
					table.insert(Data.DungeonMaxStep[flag], max_step)
				end
			elseif y["Type"] == "Raid" then
				local max_step = 0
				for k,v in ipairs(map_config) do
					for a,b in pairs(v) do
						if string.sub(a,1,5) == "Step_" and (not b["ShowStep"] or b["ShowStep"] == 1) then
							max_step = max_step + 1
						end
					end
				end
				table.insert(Data.DungeonMaxStep[flag], max_step)
			end
			--sLuaApp:LuaErr(Lua_tools.serialize(Data.DungeonMaxStep))
				
			--副本物品 退出副本/下一进度物品删除 包裹格子不够不会给 组队打只给队长
			Data.DungeonItem[flag] = {}
			local reward_config = assert(load(" return "..flag ..".RewardConfig"))()
			if not reward_config then
				sLuaApp:LuaErr("DungeonSystem.Initialization  "..flag.."不存在RewardConfig")
			end
			for k,v in pairs(reward_config) do
				if v['DungeonItem'] and next(v['DungeonItem']) then
					for _,b in ipairs(v['DungeonItem']) do
						if type(b) == "string" then
							table.insert(Data.DungeonItem[flag], b)
						end
					end
				end
			end
		end
		--根据配置生成一张发给客户端做参数用的表 (part 2)
		local aabb = 1
		for k,v in pairs(TB) do
			DungeonSystem.parameterOne[k] = aabb
			aabb = aabb + 1
		end
		
		for k, v in pairs(DungeonSystem.ConfigToShow) do
			table.sort(v, function(a,b)
				return a.LevelMin < b.LevelMin
			end)
		end
		for k, v in pairs(DungeonSystem.ConfigToShow) do
			for a,b in pairs(v) do
				DungeonSystem.parameterTwo[b.Dg_Name] = a
			end
		end
		
		local TTBB = {}
		for k,v in pairs(DungeonSystem.parameterOne) do
			if DungeonSystem.ConfigToShow[k] and next(DungeonSystem.ConfigToShow[k]) then
				if k == "Rift" then
					-- 将下面的LabelList[1/2],TTBB[1/2] 的key值改为v,前面是随机的秘境、副本对应1或2，这个地方也不应该写固定
					DungeonSystem.LabelList[v] = AList[k]
					TTBB[v] = BList[k]
				elseif k == "Raid" then
					DungeonSystem.LabelList[v] = AList[k]
					TTBB[v] = BList[k]
				end
				--table.insert(DungeonSystem.LabelList, AList[k])	
				--table.insert(TTBB, BList[k])
			end
		end
		for k,v in pairs(TTBB) do
			DungeonSystem.PageNum[v] = k
		end
		--sLuaApp:LuaWrn(Lua_tools.serialize(DungeonSystem.NPCToDgName))
		--sLuaApp:LuaWrn(Lua_tools.serialize(TTBB))
	else
		sLuaApp:LuaErr("DungeonSystem.Initialization 笑死，怎么连Data都没")
	end
end

DungeonSystem.Initialization()