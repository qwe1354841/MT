--
Host = {}

local HostsNum = {5,10}			--机器人数量
local Maps = {					--模板地图和该地图的Host数量
	--["傲来村"] = 100,
	["长安城"] = 5000,
	--["傲来村"] = 300,
	--["江南野外"] = 400
	}
local MoveMode = {
	["长安城"] = {325, 200, 20}
	}	
local Levels = {10, 50}			--机器人等级
local Stop_times = {2000,30000}	--走到某点后的停留时间(毫秒)
local MoveRange = 5			--每次行走的随机范围

local AI_List = {["1级任务-开始到离开"] = 10,['傲来村1'] = 1,['傲来村2'] = 1,["长安城-羽翼仙宝图"] = 1,["长安城-除暴安良"] = 1,["慈恩寺-师门"] = 1,["花果山-师门"] = 1,["净坛禅院-师门"] = 1,["流沙界-师门"] = 1,["西海龙宫-师门"] = 1,["酆都-师门"] = 1,["长安城-武器店"] = 1,["长安城-接藏宝图"] = 1,["大唐国境-程咬金"] = 1,["大唐境外1"] = 1,["沙城遗址1"] = 1,["解阳山1"] = 1,['长安-江南野外'] = 10,['西梁女国-饰品店'] = 1,['西梁女国-宠物店'] = 1,['东海湾1'] = 1,['东海湾2'] = 1,['傲来村野1'] = 10,['江南野外1'] = 1,['两界山1'] = 1,['玄阴池1'] = 1,['水帘洞1层'] = 1,["长安城-喊话"]=1,
	["傲来村-三行动A"] = 2,
	["傲来村-三行动B"] = 2,
	["傲来村-三行动C"] = 2,
	["傲来村-四行动A"] = 2,
	["傲来村-四行动B"] = 2,
	["傲来村-四行动C"] = 2,
	["傲来村-五行动A"] = 2,
	["傲来村-五行动B"] = 2,
	["傲来村-五行动C"] = 2,
	["傲来村-六行动A"] = 3,
	["傲来村-六行动B"] = 3,
	["傲来村-六行动C"] = 3,
	["傲来村-七行动及以上A"] = 3,
	["傲来村-七行动及以上B"] = 3,
	["主线-11级进入东海海湾"] = 10,
	["主线-14级进入傲来村"] = 5,
	["主线-15级进入西海龙宫"] = 5,
	["主线-16级进入傲来村野"] = 10,
	["主线-20级进入花果山"] = 10,
	["主线-22级进入长安城-袁守城"] = 10,
	["主线-22级进入长安城-泾河龙王"] = 10,
	["主线-25级进入花果山"] = 10,
	["主线-26级进入长安城-镇元大仙"] = 20,
	["主线-30级进入慈恩寺"] = 10,
	["主线-31级进入长安城-喵煌"] = 10,
	["主线-31级进入慈恩寺"] = 10,
	["主线-32级进入长安城-药店千里思邈"] = 20,
	["主线-34级进入大雁塔一层"] = 5,
	["主线-35级进入大雁塔三层"] = 5,
	["主线-36级进入慈恩寺"] = 10,
	["主线-36级进入长安城-唐僧"] = 10,
	["主线-37级进入紫宸殿"] = 10,
	["主线-37级进入长安城-程咬金"] = 20,
	["主线-38级进入江南野外"] = 20,
	}
--local AI_List = {["1级任务-开始到离开"] = 1}

function Host.HostMoving(host, time_id)
	if lualib:Player_IsOnline(host) == false then
		return
	end
	local mapname = lualib:KeyName(lualib:MapGuid(host))
	local new_point
	local now_step = lualib:GetInt(host, "AutoMove_Step")
	local moveIndex = lualib:GetStr(host, "AutoMove_Index")
	if Host_Paths_Config[''..mapname.."_"..moveIndex.."_"..now_step] then
		local direction = lualib:GetStr(host, "AutoMove_Direct")
		local next_step
		if direction == "Forward" then
			next_step = now_step + 1
		else
			next_step = now_step - 1
		end
		if not Host_Paths_Config[''..mapname.."_"..moveIndex.."_"..next_step] then
			if direction == "Forward" then
				lualib:SetStr(host, "AutoMove_Direct", "Anti")
				next_step = now_step - 1
			else
				lualib:SetStr(host, "AutoMove_Direct", "Forward")
				next_step = now_step + 1
			end
		end
		if not Host_Paths_Config[''..mapname.."_"..moveIndex.."_"..next_step] then
			lualib:SetInt(host, "AutoMove_Step", 0)
			lualib:SetStr(host, "AutoMove_Index", "")
			lualib:SetStr(host, "AutoMove_Direct", "")
			HostMoving(host)
		end
		lualib:SetInt(host, "AutoMove_Step", next_step)
		lualib:Map_MoveTo(host, Host_Paths_Config[''..mapname.."_"..moveIndex.."_"..next_step][1], Host_Paths_Config[''..mapname.."_"..moveIndex.."_"..next_step][2]);
		lualib:Debug('Host玩家 '..lualib:Name(host).. "开始走向 "..Host_Paths_Config[''..mapname.."_"..moveIndex.."_"..next_step][1]..","..Host_Paths_Config[''..mapname.."_"..moveIndex.."_"..next_step][2])
	else
		local tb = MoveMode[mapname]
		if tb then
			new_point = lualib:Map_RndPoint(lualib:MapGuid(host), tb[1],tb[2],tb[3])
		else
			new_point = lualib:Map_RndPoint(lualib:MapGuid(host), lualib:X(host),lualib:Y(host),MoveRange)
		end	
		lualib:Map_MoveTo(host, new_point.x, new_point.y);
	end
end

function on_post_trace(host)
	if lualib:GetStr(host, "Host_AIType") ~= "" then
		Host.HostAIOver(host)
	else
		local timer_id = lualib:GenTimerId(host)
		lualib:AddTimerEx(host, timer_id, lualib:Random(Stop_times[1],Stop_times[2]), 1, "HostMoving", "")
	end
end

function Host.CreatAIHost()
	local host = ""
	local map_guid = ""
	if Host_Config then
		for k,v in pairs(AI_List) do
			for i = 1, v do
				map_guid = ""
				local tb_config = Host_Config[k]
				if tb_config then
					if tb_config.StartMap then
						map_guid = sMapSystem:GetMapByKey(tb_config.StartMap)
					end
					if map_guid ~= "" and tb_config.Step_1 then
						if type(tb_config.StartLevel) == "table" then
							host = sRobotSystem:CreateRobot(sLuaApp:RandInteger(31,36), sLuaApp:RandInteger(tb_config.StartLevel[1],tb_config.StartLevel[2]), tb_config.StartRein or 0, map_guid, tb_config.StartPosX, tb_config.StartPosY)
							--host = lualib:Map_GenDummy(map_guid, tb_config.StartPosX, tb_config.StartPosY, 1, lualib:Random(tb_config.StartLevel[1],tb_config.StartLevel[2]), tb_config.School or 0)
						else
							host = sRobotSystem:CreateRobot(sLuaApp:RandInteger(31,36), tb_config.StartLevel or 1, tb_config.StartRein or 0, map_guid, tb_config.StartPosX, tb_config.StartPosY)
							--host = lualib:Map_GenDummy(map_guid, tb_config.StartPosX, tb_config.StartPosY, 1, tb_config.StartLevel or 1, tb_config.School or 0)
						end
						if tb_config.StartTitle then
							--加称谓
						end
						--lualib:Map_SetMoveSpeed(host, 90)
						host:SetString("Host_AIType", k)
						Host.HostAIOver(host)
					end
				end
			end
		end
	end
end

--local itemList = {"50级橙重剑","60级紫重剑","70级橙护腰"}

function Host.HostAIOver(host)
	if Host_Config then
		local newStep = host:GetInt("Host_AIStep") + 1
		local nowAI = host:GetString("Host_AIType")
		if Host_Config[nowAI] then
			local tb_newDo = Host_Config[nowAI]['Step_'..newStep]
			if tb_newDo then
				local canDo = 0
				if tb_newDo[1] == "等待" or tb_newDo[1] == "Wait" then
					local times = tb_newDo[2] or 5
					times = times*1000
					if tb_newDo[3] then
						times = sLuaApp:RandInteger(tb_newDo[2]*1000, tb_newDo[3]*1000)
					end
					--if newStep == 1 then
					sLuaTimerSystem:AddTimerEx(host, times, 1, "Host.HostAIOver", "")
					--end
					--sLuaApp:LuaDbg("HOST - " .. host:GetName() .. "进入等待，等待时长"..times.."毫秒，触发位置".. sMapSystem:GetPosX(host) .."，".. sMapSystem:GetPosY(host))
					canDo = 1
				elseif tb_newDo[1] == "移动" or tb_newDo[1] == "Move" then
					--sLuaApp:LuaDbg("HOST - " .. host:GetName() .. "进入移动，触发位置".. sMapSystem:GetPosX(host) .."，".. sMapSystem:GetPosY(host))
					if tb_newDo[2] and tb_newDo[3] then
						host:SetTracePoint(tb_newDo[2], tb_newDo[3], "Host", "HostAIOver", "");
						canDo = 1
					end
				elseif tb_newDo[1] == "升级" or tb_newDo[1] == "Levelup" then
					if tb_newDo[2] then
						--lualib:SetLevel(host,tb_newDo[2])
						--lualib:AddTimer(host, lualib:GenTimerId(host), 1000, 1, "HostAIOver")
						sLuaTimerSystem:AddTimerEx(host, sLuaApp:RandInteger(1000, 5000), 1, "Host.HostAIOver", "")
						canDo = 1
					end
				elseif tb_newDo[1] == "传送" or tb_newDo[1] == "Jump" then
					if tb_newDo[3] then
						sMapSystem:Jump(host, tb_newDo[1], tb_newDo[2], tb_newDo[3], 0)
						sLuaTimerSystem:AddTimerEx(host, sLuaApp:RandInteger(3000, 10000), 1, "Host.HostAIOver", "")
						--lualib:AddTimer(host, lualib:GenTimerId(host), lualib:Random(5000, 20000), 1, "HostAIOver")
						canDo = 1
					end
				elseif tb_newDo[1] == "聊天" or tb_newDo[1] == "Talk" then
					sLuaTimerSystem:AddTimerEx(host, sLuaApp:RandInteger(1000, 5000), 1, "Host.HostAIOver", "")
					canDo = 1
					--local talk_type = tb_newDo[2]
					--if talk_type then
					--	local itemKey = ""
					--	if tb_newDo[3] then
					--		if type(tb_newDo[3]) == "table" then
					--			itemKey = tb_newDo[3][lualib:Random(1,#tb_newDo[3])]
					--		end
					--	else
					--		itemKey = itemList[lualib:Random(1,#itemList)]
					--	end
					--	if itemKey then
					--		local itemGuid = lualib:Player_AddItem(host,itemKey,1,false)
					--		local STR = "#ITEMLINK<STR:【"..lualib:Item_GetName(itemKey).."】,OWERGUID:"..lualib:ConvertGuid32To10(host)..",ITEMGUID:"..lualib:ConvertGuid32To10(itemGuid)..",ITEMGRADE:"..lualib:Item_GetGrade(lualib:Item_GetId(itemKey))..">#"
					--		if talk_type == 1 then
					--			lualib:SysRoleTalk(host, STR)
					--		elseif talk_type == 2 then
					--			lualib:SysMsg_SendWorldNtf(host, STR)
					--		end
					--		lualib:AddTimer(host, lualib:GenTimerId(host), lualib:Random(5000, 10000), 1, "HostAIOver")
					--		canDo = 1
					--	end
					--end
				end
				if canDo == 1 then
					host:SetInt("Host_AIStep", newStep)
					return
				end
			elseif Host_Config[nowAI].RefreshTime then
				sLuaTimerSystem:AddTimer(sLuaApp:RandInteger(Host_Config[nowAI].RefreshTime[1],Host_Config[nowAI].RefreshTime[2]), 1, "Host.CreatAIHostEx", ""..nowAI)
				sLuaApp:LuaDbg("即将进入重生")
				--lualib:AddTimerEx("0", lualib:GenTimerId("0"), lualib:Random(Host_Config[nowAI].RefreshTime[1],Host_Config[nowAI].RefreshTime[2]), 1, "CreatAIHostEx", nowAI)
			end
		end
	end
	sRobotSystem:DestroyRobot(host)
end

function Host.CreatAIHostEx(timer_id, AIType)
	sLuaApp:LuaDbg("CreatAIHostEx")
	if Host_Config then
		local tb_config = Host_Config[AIType]
		if tb_config then
			sLuaApp:LuaDbg("AIType = " .. AIType)
			local map_guid = ""
			if tb_config.StartMap then
				map_guid = sMapSystem:GetMapByKey(tb_config.StartMap)
			end
			if map_guid ~= "" and tb_config.Step_1 then
				sLuaApp:LuaDbg("机器人重生完毕")
				local host = sRobotSystem:CreateRobot(sLuaApp:RandInteger(31,36), tb_config.StartLevel or 1, tb_config.StartRein or 0, map_guid, tb_config.StartPosX, tb_config.StartPosY)
				--lualib:Map_SetMoveSpeed(host, 90)
				host:SetString("Host_AIType", AIType)
				Host.HostAIOver(host)
			end
		end
	end
end

function Host.on_system_start()
	if FunctionSwitch.AllFuncitonConfig["Function_Switch_HostActor"] == "on" then
		Host.CreatAIHost()
	end
end

--HostCreate()