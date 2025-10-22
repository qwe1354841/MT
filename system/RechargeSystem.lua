-- 充值活动功能  版本1.0
RechargeSystem = {}
RechargeSystem.Vision = 1.0

function RechargeSystem.GetData(player, timerId, mode)
	--sLuaApp:LuaDbg("mode = " .. mode)
	local str = RechargeSystem.DataCompile(player, mode) .. [[
	if SuperValueUI then
		SuperValueUI.RefreshData(']]..mode..[[')
	end
	]]
	if mode == "Recharge" then
		str = str .. [[
		if RechargeUI then
			RechargeUI.RefreshData()
		end ]]
	end
	sLuaApp:ShowForm(player, "脚本表单", str);
end

function RechargeSystem.GetConfig(player, mode)
	local tb_request = {}
	
	--if mode ~= "All" then --"RechargeOfCon" then
		local index = math.ceil(sDBVarSystem:GetInt("RechargeSystem_"..mode.."_ActingState")/2)
		tb_request = RechargeConfig[mode.."_Config_"..index]
		if not tb_request then
			tb_request = RechargeConfig[mode.."_Config"]
		end
	--else
	--	tb_request = RechargeConfig[mode.."_Config"]
	--end
	--sLuaApp:LuaDbg("申请get config 2   " .. mode .. "         tb_request = " .. type(tb_request))
	if type(tb_request) == "table" then
		--sLuaApp:NotifyTipsMsg(player, "申请get config 3")
		local str = [[]]
		
		str = str .. "RECHARGE_DATA." .. mode .. "_Config = " ..Lua_tools.serialize(tb_request) .. [[
		]]..RechargeSystem.DataCompile(player, mode) .. [[
		if SuperValueUI then
			SuperValueUI.RefreshData(']]..mode..[[')
		end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str);
		--sLuaApp:NotifyTipsMsg(player, "申请get config 4")
		--sLuaApp:LuaDbg("str = " .. Lua_tools.serialize(str))
	end
end

function RechargeSystem.Login_Data(player)
	RechargeSystem.GetData(player, 0, "All")
end

function RechargeSystem.Initialization()
	
end

function RechargeSystem.DataCompile(player, mode)
	local str = [[ if not RECHARGE_DATA then RECHARGE_DATA = {} end
	]]
	
	local UserID = player:GetUserId()	--GetUserID
	local NowDay = sLuaApp:DaySinceEpoch(0)
	local Effective = 0
	local CampaignOffs = 0
	local AllCampaigns = 4
	
	if mode ~= "All" then
		local playerRtime = player:GetInt("Recharge_System_RefreshTime")
		--sLuaApp:NotifyTipsMsg(player,"玩家更新时间   " .. playerRtime)
		if playerRtime == 0 then
			mode = "All"
		else
			local SystemRtime = sDBVarSystem:GetInt("Recharge_System_RefreshTime")
			if playerRtime - SystemRtime < 0 then
				mode = "All"
				--sLuaApp:NotifyTipsMsg(player,"服务器有内容更新")
			end
		end
	end
	
	if mode == "All" then
		player:SetInt("Recharge_System_RefreshTime", sLuaApp:SecondSinceEpoch(0))
	end
	
	if mode == "All" or mode == "LuckyWheel" then			--幸运转盘
		if sDBVarSystem:GetInt("Recharge_System_IsLuckyWheelActing") == 1 and RechargeConfig.LuckyWheel_Switch == "on" then
			Effective = Effective + 1
			str = str ..[[RECHARGE_DATA.LuckyWheel_Switch = "on"
			]]
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.LuckyWheel_StartTime = "]]..(RechargeConfig.LuckyWheel_Time[sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")] or RechargeConfig.LuckyWheel_Time[1])..[["
				RECHARGE_DATA.LuckyWheel_EndTime = "]]..(RechargeConfig.LuckyWheel_Time[sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")+1] or RechargeConfig.LuckyWheel_Time[2])..[["
			]]
			end
			str = str .. [[RECHARGE_DATA.LuckyWheel_Counts = ]]..player:GetInt("Recharge_System_LuckyWheel_Counts")..[[
				RECHARGE_DATA.LuckyWheel_RechargeProgress = ]]..player:GetInt("Recharge_System_LuckyWheel_ConsumeProgress")..[[
				RECHARGE_DATA.LuckyWheel_TenthMode = ]]..(RechargeConfig.LuckyWheel_TenthMode or 0)..[[
			]]
		else
			str = str ..[[RECHARGE_DATA.LuckyWheel_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
			--sLuaApp:NotifyTipsMsg(player,"LuckyWheel 已关闭")
		end
	end
	
	if mode == "All" or mode == "LevelFund" then			--等级基金
		if sDBVarSystem:GetInt("Recharge_System_IsLevelFundActing") == 1 and RechargeConfig.LevelFund_Switch == "on" then
			str = str .. [[RECHARGE_DATA.LevelFund_Switch = "on"
			]]
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.LevelFund_StartTime = "]]..(RechargeConfig.LevelFund_Time[sDBVarSystem:GetInt("RechargeSystem_LevelFund_ActingState")] or RechargeConfig.LevelFund_Time[1])..[["
				RECHARGE_DATA.LevelFund_EndTime = "]]..(RechargeConfig.LevelFund_Time[sDBVarSystem:GetInt("RechargeSystem_LevelFund_ActingState")+1] or RechargeConfig.LevelFund_Time[2])..[["
				RECHARGE_DATA.LevelFund_MaxConfig = ]]..#RechargeConfig.LevelFund_Config.Reward..[[
				]]
			end
			local level = player:GetAttr(ROLE_ATTR_LEVEL)
			if RechargeConfig.LevelFund_Mode == "player" then
				local state = player:GetInt("Recharge_System_LevelFund_TotalState")				
				str = str .. [[RECHARGE_DATA.LevelFund_TotalState = ]]..state..[[
				]]
				if RechargeConfig.LevelFund_Config['Reward'] then
				--	local cantget = 0
					for k,v in ipairs(RechargeConfig.LevelFund_Config['Reward']) do
						local ev_state = player:GetInt("Recharge_System_LevelFund_EveryState_" .. k)
						if ev_state == 0 and level >= v.Level and state == 2 then
							ev_state = 1
						end
						str = str .. [[RECHARGE_DATA.LevelFund_EveryState_]]..k..[[ = ]]..ev_state..[[
						]]
						--if ev_state == 2 and state == 2 then
						--	cantget = cantget + 1
						--end
					end
				--	if cantget == #LevelFund_Config['Reward'] then				--所有的都领取过了
				--		str = str ..[[RECHARGE_DATA.LevelFund_Switch = "off"
				--	]]
				--	else
				--		Effective = Effective + 1
				--	end
				end
			else
				local state = sDBVarSystem:GetInt("Recharge_System_LevelFund_TotalState_"..UserID)
				str = str .. [[RECHARGE_DATA.LevelFund_TotalState = ]]..state..[[
				]]
				if RechargeConfig.LevelFund_Config['Reward'] then
				--	local cantget = 0
					for k,v in ipairs(RechargeConfig.LevelFund_Config['Reward']) do
						local ev_state = sDBVarSystem:GetInt("Recharge_System_LevelFund_EveryState_" .. k .. "_" .. UserID)
						if ev_state == 0 and level >= v.Level and state == 2 then
							ev_state = 1
						end
						
						str = str .. [[RECHARGE_DATA.LevelFund_EveryState_]]..k..[[ = ]]..ev_state..[[
						]]
						--if ev_state == 2 and state == 2 then
						--	cantget = canget + 1
						--end
					end
				--	if cantget == #LevelFund_Config['Reward'] then				--所有的都领取过了
				--		str = str ..[[RECHARGE_DATA.LevelFund_Switch = "off"
				--	]]
				--	else
				--		Effective = Effective + 1
				--	end
				end
			end
		else
			str = str .. [[RECHARGE_DATA.LevelFund_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
		end
	end
	
	if mode == "All" or mode == "BuyOfDay" then			--每日限购
		if sDBVarSystem:GetInt("Recharge_System_IsBuyOfDayActing") == 1 and RechargeConfig.BuyOfDay_Switch == "on" then
			str = str ..[[RECHARGE_DATA.BuyOfDay_Switch = "on"
			]]
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.BuyOfDay_StartTime = "]]..(RechargeConfig.BuyOfDay_Time[sDBVarSystem:GetInt("RechargeSystem_BuyOfDay_ActingState")] or RechargeConfig.BuyOfDay_Time[1])..[["
				RECHARGE_DATA.BuyOfDay_EndTime = "]]..(RechargeConfig.BuyOfDay_Time[sDBVarSystem:GetInt("RechargeSystem_BuyOfDay_ActingState")+1] or RechargeConfig.BuyOfDay_Time[2])..[["
			]]
			end
			local BuyOfDay_Config = RechargeConfig.BuyOfDay_Config
			local maxnum = #BuyOfDay_Config['Goods']
			if BuyOfDay_Config['Loop'] == "Daily" then
				index = NowDay - sDBVarSystem:GetInt("Recharge_System_BuyOfDay_StartDay") + 1
			elseif BuyOfDay_Config['Loop'] == "Weekly" then
				index = sLuaApp:WeekDay(0)
			elseif BuyOfDay_Config['Loop'] == "Monthly" then
				index = sLuaApp:MonthDay(0)
			end
			if index > maxnum then
				index = maxnum%index + 1
			end
			str = str ..[[RECHARGE_DATA.BuyOfDay_TodayIndex = ]] .. index .. [[
			]]
			if RechargeConfig.BuyOfDay_Mode == "player" then
				local state = player:GetDayInt("Recharge_System_BuyOfDay_State")
				str = str .. [[RECHARGE_DATA.BuyOfDay_State = ]]..state..[[
				]]
				--if state == 2 then
				--	str = str ..[[RECHARGE_DATA.BuyOfDay_Switch = "off"
				--	]]
				--else
				--	Effective = Effective + 1
				--end
			else
				local BuyDays = sDBVarSystem:GetInt("Recharge_System_BuyOfDay_BuyDays_"..UserID)
				local state = sDBVarSystem:GetInt("Recharge_System_BuyOfDay_State_"..UserID)
				str = str .. [[RECHARGE_DATA.BuyOfDay_State = ]]..(BuyDays == nowDay and state or 0)..[[
				]]
				--if state == 2 and BuyDays == nowDay then
				--	str = str ..[[RECHARGE_DATA.BuyOfDay_Switch = "off"
				--	]]
				--else
				--	Effective = Effective + 1
				--end
			end
		else
			str = str ..[[RECHARGE_DATA.BuyOfDay_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
			--lualib:SysMsg_SendTipsMsg(player,"BuyOfDay 已关闭")
		end
	end
	
	if mode == "All" or mode == "RechargeOfDay" then			--每日充值奖励
		if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfDayActing") == 1 and RechargeConfig.RechargeOfDay_Switch == "on" then			
			str = str .. [[RECHARGE_DATA.RechargeOfDay_Switch = "on"
			]]
			local RMB = 0
			if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_BuyDays_"..UserID) == NowDay then
				RMB = sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_Value_"..UserID)
			end
			str = str .. [[RECHARGE_DATA.RechargeOfDay_Value = ]]..RMB..[[
			]]
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.RechargeOfDay_StartTime = "]]..(RechargeConfig.RechargeOfDay_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfDay_ActingState")] or RechargeConfig.RechargeOfDay_Time[1])..[["
				RECHARGE_DATA.RechargeOfDay_EndTime = "]]..(RechargeConfig.RechargeOfDay_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfDay_ActingState")+1] or RechargeConfig.RechargeOfDay_Time[2])..[["
				RECHARGE_DATA.RechargeOfDay_MaxConfig = ]]..#RechargeConfig.RechargeOfDay_Config..[[
				]]
			end
			local refresh = 0				
			if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_BuyDays_"..UserID) ~= NowDay then		--界面刷新判断日期
				refresh = 1
			end
			if refresh == 1 then
				for k,v in ipairs(RechargeConfig.RechargeOfDay_Config) do
					str = str .. [[RECHARGE_DATA.RechargeOfDay_State_]]..k..[[ = 0
						]]
					sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_State_" .. k .. "_" .. UserID, 0, 2)
				end
			else
				local state = 0
				local canget = 0
				for k,v in ipairs(RechargeConfig.RechargeOfDay_Config) do
					state = sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_State_" .. k .. "_" .. UserID)
					str = str .. [[RECHARGE_DATA.RechargeOfDay_State_]]..k..[[ = ]]..state..[[
							]]
					--if state ~= 2 then
					--	canget = 1
					--end
				end
				--if canget == 0 then				--所有的都领取过了
				--	str = str ..[[RECHARGE_DATA.RechargeOfDay_Switch = "off"
				--]]
				--else
				--	Effective = Effective + 1
				--end
			end
		else
			str = str .. [[RECHARGE_DATA.RechargeOfDay_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
			--sLuaApp:NotifyTipsMsg(player,"RechargeOfDay 已关闭")
		end
	end
	
	if mode == "All" or mode == "RMBShopOfOnce" then			--人民币限购
		if sDBVarSystem:GetInt("Recharge_System_IsRMBShopOfOnceActing") == 1 and RechargeConfig.RMBShopOfOnce_Switch == "on" then
			local StartDay = sDBVarSystem:GetInt("Recharge_System_RMBShopOfOnce_StartDay")
			local RMBShopOfOnce_Time = RechargeConfig.RMBShopOfOnce_Time
			local RMBShopOfOnce_Config = RechargeConfig.RMBShopOfOnce_Config
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.RMBShopOfOnce_StartTime = "]]..(RMBShopOfOnce_Time[sDBVarSystem:GetInt("RechargeSystem_RMBShopOfOnce_ActingState")] or RMBShopOfOnce_Time[1])..[["
				RECHARGE_DATA.RMBShopOfOnce_EndTime = "]]..(RMBShopOfOnce_Time[sDBVarSystem:GetInt("RechargeSystem_RMBShopOfOnce_ActingState")+1] or RMBShopOfOnce_Time[2])..[["
				RECHARGE_DATA.RMBShopOfOnce_MaxConfig = ]]..#RMBShopOfOnce_Config..[[
				]]
			end
			local LastBuyTime
			if RechargeConfig.RMBShopOfOnce_Mode == "player" then
				LastBuyTime = player:GetString("Recharge_System_RMBShopOfOnce_LastBuyTime")
			else
				LastBuyTime = sDBVarSystem:GetString("Recharge_System_RMBShopOfOnce_LastBuyDay_" .. UserID)
			end
			str = str .. [[RECHARGE_DATA.RMBShopOfOnce_Switch = "on"
			]]
			local StartTime = (RMBShopOfOnce_Time[sDBVarSystem:GetInt("RechargeSystem_RMBShopOfOnce_ActingState")] or RMBShopOfOnce_Time[1])
			if StartTime == "" then
				StartTime = "2019-01-01 00:00:00"
			end
			local TimeDiff = sLuaApp:Str2DateTime(LastBuyTime) - sLuaApp:Str2DateTime(StartTime)
		
			if type(TimeDiff) ~= "number" then
				TimeDiff = -1
			end
			if TimeDiff >= 0 then
				if RechargeConfig.RMBShopOfOnce_Mode == "player" then
					for k,v in ipairs(RMBShopOfOnce_Config) do
						str = str .. [[RECHARGE_DATA.RMBShopOfOnce_SurplusTimes_]]..k..[[ = ]]..(v.Times - player:GetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..k))..[[
									RECHARGE_DATA.RMBShopOfOnce_State_]]..k..[[ = ]]..player:GetInt("Recharge_System_RMBShopOfOnce_State_"..k)..[[
						]]
					end
				else
					for k,v in ipairs(RMBShopOfOnce_Config) do
						str = str .. [[RECHARGE_DATA.RMBShopOfOnce_SurplusTimes_]]..k..[[ = ]]..(v.Times - sDBVarSystem:GetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..k.."_"..UserID))..[[
									RECHARGE_DATA.RMBShopOfOnce_State_]]..k..[[ = ]]..player:GetInt("Recharge_System_RMBShopOfOnce_State_"..k.."_"..UserID)..[[
						]]
					end
				end
			else
				for k,v in ipairs(RMBShopOfOnce_Config) do
					str = str .. [[RECHARGE_DATA.RMBShopOfOnce_SurplusTimes_]]..k..[[ = ]]..v.Times..[[
						RECHARGE_DATA.RMBShopOfOnce_State_]]..k..[[ = 0
					]]
				end
			end
		else
			str = str .. [[RECHARGE_DATA.RMBShopOfOnce_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
		end
	end
	
	if mode == "All" or mode == "RechargeOfAcc" then			--累积充值奖励
		if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfAccActing") == 1 and RechargeConfig.RechargeOfAcc_Switch == "on" then				
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.RechargeOfAcc_StartTime = "]]..(RechargeConfig.RechargeOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")] or RechargeConfig.RechargeOfAcc_Time[1])..[["
				RECHARGE_DATA.RechargeOfAcc_EndTime = "]]..(RechargeConfig.RechargeOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")+1] or RechargeConfig.RechargeOfAcc_Time[2])..[["
				RECHARGE_DATA.RechargeOfAcc_MaxConfig = ]]..#RechargeConfig.RechargeOfAcc_Config..[[
				]]
			end

			local CanAdd = 0
			if ((RechargeConfig.RechargeOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")] or RechargeConfig.RechargeOfAcc_Time[1])) == "" then
				CanAdd = 1
			else
				local LastRechargeTime = sDBVarSystem:GetString("Recharge_System_LastRechargeTime_"..UserID)
				local SystemRefTime = RechargeConfig.RechargeOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")] or RechargeConfig.RechargeOfAcc_Time[1]
				LastRechargeTime = sLuaApp:Str2DateTime(LastRechargeTime)
				SystemRefTime = sLuaApp:Str2DateTime(SystemRefTime)
				--此时要给SystemRefTime转成时间戳
				if SystemRefTime == -1 then
					sLuaApp:LuaDbg("RechargeOfAcc_Time配置有异常日期信息")
				end
				if LastRechargeTime > SystemRefTime then
					CanAdd = 1
				end
			end	
			str = str .. [[RECHARGE_DATA.RechargeOfAcc_Switch = "on"
			]]
			if CanAdd == 1 then
				local state = 0
				local canget = 0
				for k,v in ipairs(RechargeConfig.RechargeOfAcc_Config) do
					state = sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_State_" .. k .. "_" .. UserID)
					str = str .. [[RECHARGE_DATA.RechargeOfAcc_State_]]..k..[[ = ]]..state..[[
						]]
					--if state ~= 2 then
					--	canget = 1
					--end
				end
				--if canget == 0 then				--所有的都领取过了
				--	str = str ..[[RECHARGE_DATA.RechargeOfAcc_Switch = "off"
				--]]
				--else
				--	Effective = Effective + 1
				--end
			else
				sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..UserID, 0, 4)
				for k,v in ipairs(RechargeConfig.RechargeOfAcc_Config) do
					str = str .. [[RECHARGE_DATA.RechargeOfAcc_State_]]..k..[[ = 0
						]]
					sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_State_" .. k .. "_" .. UserID, 0, 2)
				end
			end
			--str = str .. [[RECHARGE_DATA.RechargeOfDay_Switch = "on"
			--]]
			str = str .. [[RECHARGE_DATA.RechargeOfAcc_Value = ]]..sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..UserID)..[[
			]]
		else
			str = str ..[[RECHARGE_DATA.RechargeOfAcc_Switch = "off"
				]]
			CampaignOffs = CampaignOffs + 1
			--sLuaApp:NotifyTipsMsg(player,"RechargeOfDay 已关闭")
		end
	end
	
	if mode == "All" or mode == "RechargeOfCon" then			--连续每日充值奖励
		if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfConActing") == 1 and RechargeConfig.RechargeOfCon_Switch == "on" then				
			local LastRechargeDay = sDBVarSystem:GetInt("Recharge_System_LastRechargeDay_"..UserID)
			local StartDay = sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_StartDay")
			local actingState = sDBVarSystem:GetInt("RechargeSystem_RechargeOfCon_ActingState")
			local index = math.ceil(actingState/2)
			local theConfig = RechargeConfig["RechargeOfCon_Config_"..index]
			if not theConfig then
				theConfig = RechargeConfig.RechargeOfCon_Config
			end
			--sLuaApp:NotifyTipsMsg(player, "RechargeOfCon mode = "..mode)
			if mode == "All" then
				--sLuaApp:NotifyTipsMsg(player, "index = "..index .. "         actingState = " .. actingState)
				str = str ..[[RECHARGE_DATA.RechargeOfCon_StartTime = "]]..(RechargeConfig.RechargeOfCon_Time[actingState] or RechargeConfig.RechargeOfCon_Time[1])..[["
				RECHARGE_DATA.RechargeOfCon_EndTime = "]]..(RechargeConfig.RechargeOfCon_Time[actingState+1] or RechargeConfig.RechargeOfCon_Time[2])..[["
				RECHARGE_DATA.RechargeOfCon_MaxConfig = ]]..#theConfig..[[
				]]
			end
			--sLuaApp:NotifyTipsMsg(player, "连续充值时间为 "..(RechargeOfCon_Time[actingState] or "超纲了").."       actingState = ".. actingState)
			local CanAdd = 0
			if (RechargeConfig.RechargeOfCon_Time[actingState] or RechargeConfig.RechargeOfCon_Time[1]) == "" then
				CanAdd = 1
			else
				--print("LastRechargeDay = " .. LastRechargeDay .. "        StartDay = " .. StartDay)
				if LastRechargeDay >= StartDay then
					if NowDay - StartDay + 1 >= sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_Received_"..UserID) then
						CanAdd = 1
					end
				end
				--local LastRechargeDay = sDBVarSystem:GetInt("Recharge_System_LastRechargeDay_"..UserID)
				--local TimeDiff = lualib:GetTimeDiff(LastRechargeTime, RechargeOfAcc_Time[1])
				
				--TimeDiff = tonumber(TimeDiff)
				--if type(TimeDiff) == "number" then
				--	if TimeDiff > 0 then
				--		CanAdd = 1
				--	end
				--end
			end
			
			if CanAdd == 1 then
				local state = 0
				--local enable = 0
				for k,v in ipairs(theConfig) do
					state = sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_State_" .. k .. "_" .. UserID)
					if state == 1 then
						if sDBVarSystem:GetInt("Recharge_System_LastRechargeDay_"..UserID) ~= NowDay then
							state = 0
						end
					end
					str = str .. [[RECHARGE_DATA.RechargeOfCon_State_]]..k..[[ = ]]..state..[[
						]]
					--sLuaApp:NotifyTipsMsg(player, k .. " = " .. sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_State_" .. k .. "_" .. UserID) .. " _ " ..UserID)
				--	if state == 2 then
				--		enable = enable + 1
				--	end
				--end
				--if enable ~= #RechargeOfCon_Config then				--未领完
				--	Effective = Effective + 1
				end
			else
				sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_Received_"..UserID, 0, 0)
				for k,v in ipairs(theConfig) do
					str = str .. [[RECHARGE_DATA.RechargeOfCon_State_]]..k..[[ = 0
						]]
					sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_" .. k .. "_" .. UserID, 0, 0)
				end
				if LastRechargeDay == NowDay then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_1_" .. UserID, 1, 0)
					sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_CanReceive_"..UserID, 1, 0)
				end
			end
			str = str .. [[RECHARGE_DATA.RechargeOfCon_Switch = "on"
			]]
			local Dayth = sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_Received_"..UserID)
			if sDBVarSystem:GetInt("Recharge_System_LastRechargeDay_"..UserID) ~= NowDay
			or sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_CanReceive_"..UserID) ~= 0 then
				Dayth = Dayth + 1
			end
			if Dayth == 0 then
				for k,v in ipairs(theConfig) do				
					if k == 1 then
						sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..UserID, 1, 0)
						--sLuaApp:NotifyTipsMsg(player, " k = 1  " .. userid .. "     " .. sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..UserID))
					else
						sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..UserID, 0, 0)
					end
					Dayth = 1
				end
			end
			str = str .. [[RECHARGE_DATA.RechargeOfCon_Dayth = ]]..Dayth..[[
			]]
		else
			str = str .. [[RECHARGE_DATA.RechargeOfCon_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
		end
	end
	
	if mode == "All" or mode == "ConsumIngotOfDay" then			--每日消费奖励
		if sDBVarSystem:GetInt("Recharge_System_IsConsumIngotOfDayActing") == 1 and RechargeConfig.ConsumIngotOfDay_Switch == "on" then
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.ConsumIngotOfDay_StartTime = "]]..(RechargeConfig.ConsumIngotOfDay_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfDay_ActingState")] or RechargeConfig.ConsumIngotOfDay_Time[1])..[["
				RECHARGE_DATA.ConsumIngotOfDay_EndTime = "]]..(RechargeConfig.ConsumIngotOfDay_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfDay_ActingState")+1] or RechargeConfig.ConsumIngotOfDay_Time[2])..[["
				RECHARGE_DATA.ConsumIngotOfDay_MaxConfig = ]]..#RechargeConfig.ConsumIngotOfDay_Config..[[
				]]
			end
			local isConsumeToday = 0
			if RechargeConfig.ConsumIngotOfDay_Mode == "player" then
				if player:GetInt("Recharge_System_LastConsumeDay_Ingot") == NowDay then
					isConsumeToday = 1
				end
			else
				if sDBVarSystem:GetInt("Recharge_System_LastConsumeDay_Ingot_"..UserID) == NowDay then
					isConsumeToday = 1
				end
			end
			if isConsumeToday ~= 1 then		--今日未消费
				for k,v in ipairs(RechargeConfig.ConsumIngotOfDay_Config) do
					str = str .. [[RECHARGE_DATA.ConsumIngotOfDay_State_]]..k..[[ = 0
						]]
					sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfDay_State_" .. k .. "_" .. UserID, 0, 2)
				end
				str = str .. [[RECHARGE_DATA.ConsumIngotOfDay_Value = 0
						]]
			else
				local IngotConsume = 0
				if RechargeConfig.ConsumIngotOfDay_Mode == "player" then
					IngotConsume = player:GetInt("Recharge_System_ConsumIngotOfDay_Value")
					local state = 0
					local enable = 0
					for k,v in ipairs(RechargeConfig.ConsumIngotOfDay_Config) do
						--sLuaApp:NotifyTipsMsg(player,"State_"..k.." = " .. lualib:GetInt(player, "Recharge_System_ConsumIngotOfDay_State_"..k))
						state = player:GetInt("Recharge_System_ConsumIngotOfDay_State_"..k)
						str = str .. [[RECHARGE_DATA.ConsumIngotOfDay_State_]]..k..[[ = ]]..state..[[
						]]
					--	if state == 2 then
					--		enable = enable + 1
					--	end
					--end
					--if enable ~= #ConsumIngotOfDay_Config then			--未领完
					--	Effective = Effective + 1
					end
				else
					IngotConsume = sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfDay_Value_"..UserID)
					for k,v in ipairs(RechargeConfig.ConsumIngotOfDay_Config) do
						str = str .. [[RECHARGE_DATA.ConsumIngotOfDay_State_]]..k..[[ = ]]..sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfDay_State_"..k.."_"..UserID)..[[
						]]
					end
				end
				str = str .. [[RECHARGE_DATA.ConsumIngotOfDay_Value = ]]..IngotConsume..[[
						]]
				
			end
			str = str .. [[RECHARGE_DATA.ConsumIngotOfDay_Switch = "on"
			]]
		else
			str = str .. [[RECHARGE_DATA.ConsumIngotOfDay_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
		end
	end
	if mode == "All" or mode == "ConsumIngotOfAcc" then			--累积消费返元宝
		if sDBVarSystem:GetInt("Recharge_System_IsConsumIngotOfAccActing") == 1 and RechargeConfig.ConsumIngotOfAcc_Switch == "on" then
			local LastConsumeTime = sDBVarSystem:GetString("Recharge_System_LastRechargeTime_"..UserID)
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.ConsumIngotOfAcc_StartTime = "]]..(RechargeConfig.ConsumIngotOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")] or RechargeConfig.ConsumIngotOfAcc_Time[1])..[["
				RECHARGE_DATA.ConsumIngotOfAcc_EndTime = "]]..(RechargeConfig.ConsumIngotOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")+1] or RechargeConfig.ConsumIngotOfAcc_Time[2])..[["
				RECHARGE_DATA.ConsumIngotOfAcc_MaxConfig = ]]..#RechargeConfig.ConsumIngotOfAcc_Config..[[
				]]
			end
			if RechargeConfig.ConsumIngotOfAcc_Mode == "player" then
				LastConsumeTime = player:GetString("Recharge_System_LastConsumeTime_Ingot")
			end
			local StartTime = (RechargeConfig.ConsumIngotOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")] or RechargeConfig.ConsumIngotOfAcc_Time[1])
			if StartTime == "" then
				StartTime = "2019-01-01 00:00:00"
			end	
			local TimeDiff = sLuaApp:Str2DateTime(LastConsumeTime) - sLuaApp:Str2DateTime(StartTime)
			--sLuaApp:NotifyTipsMsg(player, "LastConsumeTime = " .. LastConsumeTime .. "        StartTime = "..StartTime.."       TimeDiff = ".. lualib:GetTimeDiff(LastConsumeTime, StartTime))
			if type(TimeDiff) ~= "number" then
				TimeDiff = -1
			end
			--sLuaApp:LuaDbg("LastConsumeTime = " .. LastConsumeTime .. "         StartTime = " .. StartTime .. "      TimeDiff = " .. TimeDiff)
			str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_Switch = "on"
			]]
			--sLuaApp:NotifyTipsMsg(player,"获得了活动开启的信息")
			if TimeDiff >= 0 then
				if RechargeConfig.ConsumIngotOfAcc_Mode == "player" then
					str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_TotalCon = ]]..player:GetInt("Recharge_System_ConsumIngotOfAcc_TotalCon")..[[
						]]
					for k,v in ipairs(RechargeConfig.ConsumIngotOfAcc_Config) do
						str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_State_]]..k..[[ = ]]..player:GetInt("Recharge_System_ConsumIngotOfAcc_State_" .. k)..[[
						]]
					end
				else
					str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_TotalCon = ]]..sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfAcc_TotalCon_" .. UserID)..[[
						]]
					for k,v in ipairs(RechargeConfig.ConsumIngotOfAcc_Config) do
						str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_State_]]..k..[[ = ]]..sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfAcc_State_" .. k .. "_" ..UserID)..[[
						]]
					end
				end
			else
				str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_TotalCon = 0
						]]
				for k,v in ipairs(RechargeConfig.ConsumIngotOfAcc_Config) do
					str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_State_]]..k..[[ = 0
					]]
				end
			end
		else
			str = str .. [[RECHARGE_DATA.ConsumIngotOfAcc_Switch = "off"
			]]
			CampaignOffs = CampaignOffs + 1
		end
	end
	
	if mode == "MonthCard" or mode == "All" then
		--由于月卡功能移到超值功能里 月卡发送配置 从GetData移到这里
		if RechargeConfig.MonthCard_Switch == "on" then
			str = str ..[[RECHARGE_DATA.MonthCard_Switch = "on"
			]]
			if mode == "All" then
				str = str ..[[RECHARGE_DATA.MonthCard_StartTime = "]]..(RechargeConfig.MonthCard_Time[sDBVarSystem:GetInt("RechargeSystem_MonthCard_ActingState")] or RechargeConfig.MonthCard_Time[1])..[["
				RECHARGE_DATA.MonthCard_EndTime = "]]..(RechargeConfig.MonthCard_Time[sDBVarSystem:GetInt("RechargeSystem_MonthCard_ActingState")+1] or RechargeConfig.MonthCard_Time[2])..[["
			]]
			end
			local MonthCard_price = {}
			local MonthCardWnd_remainingDay = {}
			local today = sLuaApp:DaySinceEpoch(0)
			for i = 1, #RechargeConfig.MonthCard_Config do
				if player:GetInt("Recharge_System_MonthCard_"..i) > today then
					MonthCardWnd_remainingDay[i] = player:GetInt("Recharge_System_MonthCard_"..i) - today
					if player:GetDayInt("Recharge_System_MonthCard_Received_"..i) == 0 then 
						MonthCard_price[i] = 1
					else
						MonthCard_price[i] = 2
					end
				else
					MonthCardWnd_remainingDay[i] = 0
					MonthCard_price[i] = 0
				end
			end
			str = str .. [[
			RECHARGE_DATA.MonthCard_Config = ]]..Lua_tools.serialize(RechargeConfig.MonthCard_Config)..[[
			RECHARGE_DATA.MonthCard_price = ]]..Lua_tools.serialize(MonthCard_price)..[[
			RECHARGE_DATA.MonthCard_remainingDay = ]]..Lua_tools.serialize(MonthCardWnd_remainingDay)..[[
			]]
			str = str .. [[
			if GlobalProcessing then
				GlobalProcessing.monthcardConfig = ]]..Lua_tools.serialize(RechargeConfig.MonthCard_Config)..[[
				GlobalProcessing.monthcardstate = ]]..Lua_tools.serialize(MonthCard_price)..[[
			end
			]]
		else
			str = str ..[[RECHARGE_DATA.MonthCard_Switch = "off"
			]]
		end
	end
	if AllCampaigns == CampaignOffs then
		str = str..[[
			if GlobalProcessing then
				GlobalProcessing.CloseRechargeBtn()
			end
		]]
	else
		str = str .. [[
			if GlobalProcessing then
				GlobalProcessing.RefreshChargeRedpoint()
			end
		]]
	end
	if mode == "Recharge" then
		for k,v in ipairs(RechargeConfig.RechargeFunction_Config) do
			str = str .. [[RECHARGE_DATA.IsPlayerRecharged_]]..k..[[ = ]]..sDBVarSystem:GetInt("Recharge_System_IsPlayerRecharged_" .. k .. "_" ..UserID)..[[		
			]]
		end
	end
	if mode == "All" then
		str = str..[[
			RECHARGE_DATA.RechargeFunction_Config = ]]..Lua_tools.serialize(RechargeConfig.RechargeFunction_Config)..[[
		]]
	end
	if mode == "All" then
		if sDBVarSystem:GetInt("IsPlayerFirstRecharged_"..UserID) == 2 then
			str = str..[[
				if GlobalProcessing then
					GlobalProcessing.CloseFirstRecharge()
				end
			]]
		end
	end
	--sLuaApp:LuaDbg("str = " .. str)
	--lualib:AddTimerEx(player, lualib:GenTimerId(player), 10, 1, "FriendInviteSystem:on_login", "")
	--sLuaApp:NotifyTipsMsg(player, "测试通过")
	return str
end

--每日充值奖励
function RechargeSystem.RechargeOfDay_Receive(player, index)
	index = tonumber(index)
	index = Lua_tools.CheckNumber(index, false)
	if not index then return end
	local RechargeOfDay_Switch = RechargeConfig.RechargeOfDay_Switch
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_RechargeOfDay_ActingState")/2)
	local RechargeOfDay_Config = RechargeConfig['RechargeOfDay_Config_'..Serial] or RechargeConfig.RechargeOfDay_Config
	local userid = player:GetUserId()	--获取玩家USERID
	if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfDayActing") == 1 and RechargeOfDay_Switch == "on" then
		if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_BuyDays_"..userid) == sLuaApp:DaySinceEpoch(0) then
			local tb_RechargeOfDay = RechargeOfDay_Config[index]
			if type(tb_RechargeOfDay) == "table" then
				if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_Value_"..userid) >= tb_RechargeOfDay.Target then
					if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_State_"..index.."_"..userid) == 1 then
						if Lua_tools.GiveGoods(player,tb_RechargeOfDay, "system", "每日充值奖励", "超值") then
							sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_State_"..index.."_"..userid,2,2)
							RechargeSystem.GetData(player, 0, "RechargeOfDay")
						end
					else
						sLuaApp:NotifyTipsMsg(player,"您今天已经领取过了哦~")
					end
				else
					sLuaApp:NotifyTipsMsg(player,"您的充值额度还没有达到目标哦~")
				end
			end
		else
			sLuaApp:NotifyTipsMsg(player,"您今天还没有充值哦~")
		end
	else
		sLuaApp:NotifyTipsMsg(player,"活动暂未开启")
	end
end

--每日限购
function RechargeSystem.BuyOfDay_Receive(player, param)
	--lualib:SysMsg_SendTipsMsg(player, "ceshi 1")
	if sDBVarSystem:GetInt("Recharge_System_IsBuyOfDayActing") == 1 and RechargeConfig.BuyOfDay_Switch == "on" then
		local index = 1
		local NowDay = sLuaApp:DaySinceEpoch(0)
		local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_BuyOfDay_ActingState")/2)
		local BuyOfDay_Config = RechargeConfig['BuyOfDay_Config_'..Serial] or RechargeConfig.BuyOfDay_Config
		local maxnum = #BuyOfDay_Config['Goods']
		if BuyOfDay_Config['Loop'] == "Daily" then
			index = NowDay - sDBVarSystem:GetInt("Recharge_System_BuyOfDay_StartDay") + 1
		elseif BuyOfDay_Config['Loop'] == "Weekly" then
			index = sLuaApp:WeekDay(0)
		elseif BuyOfDay_Config['Loop'] == "Monthly" then
			index = sLuaApp:MonthDay(0)
		end
		if index > maxnum then
			index = maxnum%index
		end
		--lualib:SysMsg_SendTipsMsg(player, "ceshi 2      " .. index .. "     param = " .. param)
		local tb_buyofday = BuyOfDay_Config['Goods'][index]
		if tb_buyofday then
			if RechargeConfig.BuyOfDay_Mode == "player" then
				if param == "Buy" then
					--lualib:SysMsg_SendTipsMsg(player, "ceshi 3")
					if tb_buyofday.MoneyType == 999 then
						RechargeSystem.SetRechargeType(player, "BuyOfDay", index, tb_buyofday.MoneyVal)
					else
						if player:GetDayInt("Recharge_System_BuyOfDay_State") == 0 then
							if Lua_tools.PlayerIsMoneyEnough(player, tb_buyofday.MoneyType, tb_buyofday.MoneyVal) == true then
								if Lua_tools.GiveGoods(player,tb_buyofday, "system", "每日限购", "超值") == true then
									Lua_tools.PlayerSubMoney(player, tb_buyofday.MoneyType, tb_buyofday.MoneyVal, "每日限购")
									player:SetInt("Recharge_System_BuyOfDay_BuyDays", NowDay)
									player:SetDayInt("Recharge_System_BuyOfDay_State", 2)
									RechargeSystem.GetData(player, 0, "BuyOfDay")
								end
							end
						end
					end
				elseif param == "Receive" then
					if player:GetDayInt("Recharge_System_BuyOfDay_State") == 1 then
						if Lua_tools.GiveGoods(player,tb_buyofday, "system", "每日限购", "超值") == true then
							player:SetDayInt("Recharge_System_BuyOfDay_State", 2)
							RechargeSystem.GetData(player, 0, "BuyOfDay")
						end
					end
				end
			else
				local UserID = player:GetUserId()
				if param == "Buy" then
					if tb_buyofday.MoneyType == 999 then
						RechargeSystem.SetRechargeType(player, "BuyOfDay", index, tb_buyofday.MoneyVal)
					else
						if sDBVarSystem:GetInt("Recharge_System_BuyOfDay_State_"..UserID) == 0 or sDBVarSystem:GetInt("Recharge_System_BuyOfDay_BuyDays_" .. UserID) ~= NowDay then
							if Lua_tools.PlayerIsMoneyEnough(player, tb_buyofday.MoneyType, tb_buyofday.MoneyVal) == true then
								if Lua_tools.GiveGoods(player,tb_buyofday, "system", "每日限购", "超值") == true then
									Lua_tools.PlayerSubMoney(player, tb_buyofday.MoneyType, tb_buyofday.MoneyVal, "每日限购")
									sDBVarSystem:SetInt("Recharge_System_BuyOfDay_BuyDays_" .. UserID, NowDay,2)
									sDBVarSystem:SetInt("Recharge_System_BuyOfDay_State_" .. UserID, 2)
									RechargeSystem.GetData(player, 0, "BuyOfDay")
								end
							end
						end
					end
				elseif param == "Receive" then
					if sDBVarSystem:GetInt("Recharge_System_BuyOfDay_State_"..UserID) == 1 and sDBVarSystem:GetInt("Recharge_System_BuyOfDay_BuyDays_" .. UserID) == NowDay then
						if Lua_tools.GiveGoods(player,tb_buyofday, "system", "每日限购", "超值") == true then
							sDBVarSystem:SetInt("Recharge_System_BuyOfDay_State_" .. UserID, 2, 2)
							RechargeSystem.GetData(player, 0, "BuyOfDay")
						end
					end
				end
			end
		end
	end
end

--月卡领取
function RechargeSystem.MonthCard_Receive(player, param)
	param = tonumber(param) 
	param = Lua_tools.CheckNumber(param, false)
	if not param then return end
	local today = sLuaApp:DaySinceEpoch(0)
	local MonthCard_Config = RechargeConfig.MonthCard_Config
	if player:GetInt("Recharge_System_MonthCard_"..param) == 0 then 
		sLuaApp:NotifyTipsMsg(player, "你还没有购买该月卡")
		return
	else
		if player:GetInt("Recharge_System_MonthCard_"..param) <= today then
			sLuaApp:NotifyTipsMsg(player, "你的月卡已过期")
			return
		else
			if player:GetDayInt("Recharge_System_MonthCard_Received_"..param) == 0 then 
				Lua_tools.AddMoney(player,1,MonthCard_Config[param].BonusOnce,"system","MonthCardBonusOnce","system")
				player:SetDayInt("Recharge_System_MonthCard_Received_"..param,1)
				sLuaApp:NotifyTipsMsg(player, "获得"..MonthCard_Config[param].BonusOnce.."元宝")
				RechargeSystem.GetData(player, 0, "MonthCard")	
				return
			else
				sLuaApp:NotifyTipsMsg(player, "你已经领取过该奖励")
				return
			end
		end
	end
end

--每日充值奖励
function RechargeSystem.RechargeOfDay_Receive(player, index)
	index = tonumber(index)
	index = Lua_tools.CheckNumber(index, false)
	if not index then return end
	local userid = player:GetUserId()
	if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfDayActing") == 1 and RechargeConfig.RechargeOfDay_Switch == "on" then
		if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_BuyDays_"..userid) == sLuaApp:DaySinceEpoch(0) then
			local tb_RechargeOfDay = RechargeConfig.RechargeOfDay_Config[index]
			if type(tb_RechargeOfDay) == "table" then
				--local userid = lualib:Player_GetAccountID(player)
				if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_Value_"..userid) >= tb_RechargeOfDay.Target then
					if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_State_"..index.."_"..userid) == 1 then
						if Lua_tools.GiveGoods(player,tb_RechargeOfDay, "system", "每日充值奖励", "超值") then
							sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_State_"..index.."_"..userid,2,2)
							RechargeSystem.GetData(player, 0, "RechargeOfDay")
						end
					else
						sLuaApp:NotifyTipsMsg(player,"您今天已经领取过了哦~")
					end
				else
					sLuaApp:NotifyTipsMsg(player,"您的充值额度还没有达到目标哦~")
				end
			end
		else
			sLuaApp:NotifyTipsMsg(player,"您今天还没有充值哦~")
		end
	else
		sLuaApp:NotifyTipsMsg(player,"活动暂未开启")
	end
end

--累积充值
function RechargeSystem.RechargeOfAcc_Receive(player, index)
	index = tonumber(index)
	index = Lua_tools.CheckNumber(index, false)
	if not index then return end
	local RechargeOfAcc_Switch = RechargeConfig.RechargeOfAcc_Switch
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")/2)
	local RechargeOfAcc_Config = RechargeConfig['RechargeOfAcc_Config_'..Serial] or RechargeConfig.RechargeOfAcc_Config
	local RechargeOfAcc_Time = RechargeConfig.RechargeOfAcc_Time
	if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfAccActing") == 1 and RechargeOfAcc_Switch == "on" then
		local UserID = player:GetUserId()
		local LastRechargeTime = sDBVarSystem:GetString("Recharge_System_LastRechargeTime_"..UserID)
		local StartTime = (RechargeOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")] or RechargeOfAcc_Time[1])
		if StartTime == "" then
			StartTime = "2019-01-01 00:00:00"
		end
		local TimeDiff = sLuaApp:Str2DateTime(LastRechargeTime) - sLuaApp:Str2DateTime(StartTime)
		if TimeDiff > 0 then				
			local RechargeVal = sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..UserID)
			local tb_RechargeOfAcc = RechargeOfAcc_Config[index]
			if RechargeVal >= tb_RechargeOfAcc.Target and sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_State_"..index.."_"..UserID) ~= 2 then
				if Lua_tools.GiveGoods(player, tb_RechargeOfAcc, "system", "累积充值奖励", "超值") then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_State_"..index.."_"..UserID,2,2)
					RechargeSystem.GetData(player, 0, "RechargeOfAcc")
				end
			end
		else
			sLuaApp:NotifyTipsMsg(player,"您尚未充值过")
		end
	else
		sLuaApp:NotifyTipsMsg(player,"活动暂未开启")
	end
end

--连续充值
function RechargeSystem.RechargeOfCon_Receive(player)
	if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfConActing") == 1 and RechargeConfig.RechargeOfCon_Switch == "on" then
		local UserID = player:GetUserId()
		local LastRechargeDay = sDBVarSystem:GetInt("Recharge_System_LastRechargeDay_" .. UserID)
		local nowDay = sLuaApp:DaySinceEpoch(0)
		local index = sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_Received_"..UserID) + 1
		--sLuaApp:NotifyTipsMsg(player, "1111111111    " .. LastRechargeDay .. "      " .. nowDay)
		if sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_State_"..index.."_"..UserID) == 1 and LastRechargeDay == nowDay then			
			--sLuaApp:NotifyTipsMsg(player, "22222222222")
			local actingState = sDBVarSystem:GetInt("RechargeSystem_RechargeOfCon_ActingState")
			local index_2 = math.ceil(actingState/2)
			local theConfig = RechargeConfig["RechargeOfCon_Config_"..index_2]
			if not theConfig then
				theConfig = RechargeConfig.RechargeOfCon_Config
			end
			local tb_receive = theConfig[index]
			if tb_receive then
				if tb_receive.Item then
					if Lua_tools.GetBagFree(player) >= 1 then
						Lua_tools.AddItem(player, {tb_receive.Item, tb_receive.Num or 1, tb_receive.Bind}, "system", "连续每日充值奖励", "第"..index.."天奖励")
					else
						sLuaApp:NotifyTipsMsg(player, "您的背包空间不够！")
						return
					end
				elseif tb_receive.Pet then
					if Lua_tools.GetPetBagFree(player) >= 1 then
						local petData = PetConfig.GetByKeyName(tb_receive.Pet)
						if not petData then
							sLuaApp:NotifyTipsMsg(player, "错误的宠物数据！"..index)
							return
						end
						sPetSystem:AddPetEx(player, petData.Id, 1, tb_receive.Bind == 0 and false or true, "system", "连续每日充值奖励", "第"..index.."天奖励")
						--lualib:Player_AddPet(player, , 0, tb_receive.Bind == 1 and true or false,3)
					else
						sLuaApp:NotifyTipsMsg(player, "您的宠物栏位不够！")
						return
					end
				end
				sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_Received_"..UserID, index, 0)
				sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_CanReceive_"..UserID, 0, 0)
				sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..index.."_"..UserID, 2, 0)
				RechargeSystem.GetData(player, 0, "RechargeOfCon")
			end
		end
	end
end

function RechargeSystem.RechargeOfCon_Initialization()
	local actingState = sDBVarSystem:GetInt("RechargeSystem_RechargeOfCon_ActingState")
	local index_2 = math.ceil(actingState/2)
	local theConfig = RechargeConfig["RechargeOfCon_Config_"..index_2]
	if not theConfig then
		theConfig = RechargeConfig.RechargeOfCon_Config
	end
	--local tb_receive = theConfig[index]
	for k,v in ipairs(theConfig) do
		if v.Pet then
			Lua_tools.RegisterPets({v.Pet})
		end
	end
end

--等级基金
function RechargeSystem.LevelFund_Receive(player, param)
	param = tonumber(param)
	param = Lua_tools.CheckNumber(param, true)
	if not param then return end
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_LevelFund_ActingState")/2)
	local LevelFund_Config = RechargeConfig['LevelFund_Config_'..Serial] or RechargeConfig.LevelFund_Config
	if param then
		if RechargeConfig.LevelFund_Mode == "player" then
			if player:GetInt("Recharge_System_LevelFund_TotalState") == 0 then
				sLuaApp:NotifyTipsMsg(player, "你还没有购买成长基金")
				return
			else
				local Reward_tb = "Reward"
				if param == 0 then
					if player:GetInt("Recharge_System_LevelFund_TotalState") == 1 then
						if Lua_tools.SubMoney(LevelFund_Config['MoneyType'], LevelFund_Config['MoneyVal'], "购买成长基金") == true then
							player:SetInt("Recharge_System_LevelFund_TotalState",2)
							RechargeSystem.GetData(player, 0, "LevelFund")
						else
							sLuaApp:NotifyTipsMsg(player, "您没有足够的货币")
						end
					else
						sLuaApp:NotifyTipsMsg(player, "您已经购买过了成长基金")
						return
					end
				elseif LevelFund_Config[Reward_tb][param] then
					local tb_receive = LevelFund_Config[Reward_tb][param]
					if player:GetInt("Recharge_System_LevelFund_EveryState_"..param) == 0 then
						if tb_receive.Level <= player:GetAttr(ROLE_ATTR_LEVEL) then
							player:SetInt("Recharge_System_LevelFund_EveryState_"..param, 2)
							Lua_tools.AddMoney(player, tb_receive.Reward_Type, tb_receive.Reward_Money, "成长基金礼包")
							RechargeSystem.GetData(player, 0, "LevelFund")
						else
							sLuaApp:NotifyTipsMsg(player, "你的等级不够")
							return
						end
					else
						sLuaApp:NotifyTipsMsg(player, "你已经领取过了该奖励")
						return
					end
				else
					sLuaApp:NotifyTipsMsg(player, "错误的数据请求，LevelFund_Config-中缺少第"..param.."条")
					return
				end
			end
		else
			local UserID = player:GetUserId()
			if sDBVarSystem:GetInt("Recharge_System_LevelFund_TotalState_"..UserID) == 0 then
				sLuaApp:NotifyTipsMsg(player, "你还没有购买成长基金")
				return
			else
				if param == 0 then
					if sDBVarSystem:GetInt("Recharge_System_LevelFund_TotalState_"..UserID) == 1 then
						if Lua_tools.SubMoney(LevelFund_Config['MoneyType'], LevelFund_Config['MoneyVal'], "购买成长基金") == true then
							sDBVarSystem:SetInt("Recharge_System_LevelFund_TotalState_"..UserID,2,2)
							RechargeSystem.GetData(player, 0, "LevelFund")
						end
					else
						sLuaApp:NotifyTipsMsg(player, "你已经购买过了成长基金")
						return
					end
				elseif LevelFund_Config["Reward"][param] then
					local tb_receive = LevelFund_Config["Reward"][param]
					if sDBVarSystem:GetInt("Recharge_System_LevelFund_EveryState_"..param.."_"..UserID) == 0 then
						if tb_receive.Level <= player:GetAttr(ROLE_ATTR_LEVEL) then
							sDBVarSystem:SetInt("Recharge_System_LevelFund_EveryState_"..param.."_"..UserID, 2, 2)
							Lua_tools.AddMoney(player, tb_receive.Reward_Type, tb_receive.Reward_Money, "成长基金礼包")
							RechargeSystem.GetData(player, 0, "LevelFund")
						else
							sLuaApp:NotifyTipsMsg(player, "你的等级不够")
							return
						end
					else
						sLuaApp:NotifyTipsMsg(player, "你已经领取过了该奖励")
						return
					end
				else
					sLuaApp:NotifyTipsMsg(player, "错误的数据请求，LevelFund_Config-Reward中缺少第"..param.."条")
					return
				end
			end
		end
	end
end

--幸运转盘
function RechargeSystem.LuckyWheel_Start(player, param)
	local LuckyWheel_Switch = RechargeConfig.LuckyWheel_Switch
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")/2)
	local LuckyWheel_Config = RechargeConfig['LuckyWheel_Config_'..Serial] or RechargeConfig.LuckyWheel_Config
	if sDBVarSystem:GetInt("Recharge_System_IsLuckyWheelActing") == 1 and LuckyWheel_Switch == "on" then
		local Counts = player:GetInt("Recharge_System_LuckyWheel_Counts")
		if Counts < 1 then
			sLuaApp:NotifyTipsMsg(player,"没有剩余的次数了")
			return
		end
		local tb_luckwheel = LuckyWheel_Config[param]
		if not tb_luckwheel or type(tb_luckwheel) ~= "table" then
			sLuaApp:NotifyTipsMsg(player,"LuckyWheel中["..param.."]")
			return
		end
		if not RechargeSystem.SpinWin_Ran_table_All then
			RechargeSystem.SpinWin_Ran_table_All = {}
		end
		if not RechargeSystem.SpinWin_Ran_table_All[param] then
			RechargeSystem.SpinWin_Ran_table_All[param] = {0}
			for i = 1,#tb_luckwheel do
				RechargeSystem.SpinWin_Ran_table_All[param][i+1] = sVarSystem:GetInt("LuckyWheel_Rand_"..param.."_"..i)
			end
		end
		local rand = sLuaApp:RandInteger(1,RechargeSystem.SpinWin_Ran_table_All[param][#RechargeSystem.SpinWin_Ran_table_All[param]])
		local index = 1
		for i = 1,#tb_luckwheel do
			if rand <= RechargeSystem.SpinWin_Ran_table_All[param][i+1] and rand > RechargeSystem.SpinWin_Ran_table_All[param][i] then
				index = i
				break
			end
		end
		if player:GetInt("Recharge_System_LuckyWheel_TimerID_Once") ~= 0 then
			RechargeSystem.LuckyWheel_Receive(player)
		end
		local str = [[
			if SuperValueUI then
				SuperValueUI.StartTurnWheel(]]..index..[[)
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		
		player:SetInt("Recharge_System_LuckyWheel_Counts", Counts -1)
		player:SetString("Recharge_System_LuckyWheel_RewardType", param)
		player:SetInt("Recharge_System_LuckyWheel_RewardIndex", index)
		player:SetInt("Recharge_System_LuckyWheel_TimerID_Once",sLuaTimerSystem:AddTimerEx(player, 1000 * 10, 1, "RechargeSystem.LuckyWheel_Receive", ""))
	end
end

--幸运转盘获取道具
function RechargeSystem.LuckyWheel_Receive(player)	
	if player:GetInt("Recharge_System_LuckyWheel_TimerID_Once") == 0 then
		return
	end
	sLuaTimerSystem:DisableTimer(player:GetInt("Recharge_System_LuckyWheel_TimerID_Once"))
	player:SetInt("Recharge_System_LuckyWheel_TimerID_Once", 0)
	local LuckyWheel_Switch = RechargeConfig.LuckyWheel_Switch
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")/2)
	local LuckyWheel_Config = RechargeConfig['LuckyWheel_Config_'..Serial] or RechargeConfig.LuckyWheel_Config
	if sDBVarSystem:GetInt("Recharge_System_IsLuckyWheelActing") == 1 and LuckyWheel_Switch == "on" then
		local param = player:GetString("Recharge_System_LuckyWheel_RewardType")
		local index = player:GetInt("Recharge_System_LuckyWheel_RewardIndex")
		if param ~= "" and index ~= 0 then
			player:SetString("Recharge_System_LuckyWheel_RewardType", "")
			player:SetInt("Recharge_System_LuckyWheel_RewardIndex", 0)
			if LuckyWheel_Config[param] then
				local tb_receive = LuckyWheel_Config[param][index]
				if tb_receive.Item then
					Lua_tools.AddItem(player, {tb_receive.Item, tb_receive.Num, tb_receive.Bind}, "System", "幸运转盘", "")
					--local itemData = ItemConfig.GetByKeyName(tb_receive.Item)				
					--if itemData ~= {} then
					--	sItemSystem:AddItemEx(player, itemData.Id, tb_receive.Num, tb_receive.Bind == 1 and true or false, "System", "幸运转盘", "")
					--end
				elseif tb_receive.MoneyType then
					Lua_tools.AddMoney(player, tb_receive.MoneyType, tb_receive.MoneyVal or 0, "幸运大转盘")
				end
				--if tb_receive.Advert == 1 then			回来再做
				--	local msg = "玩家#COLORCOLOR_YELLOW#"..lualib:Name(player).."#COLOREND#在#COLORCOLOR_YELLOW#幸运大转盘#COLORCOLOR_YELLOW#中获得了珍贵的"..tb_receive.Item.."！"
				--	lualib:SysTopMsg(1,msg)
				--end
				RechargeSystem.GetData(player, 0, "LuckyWheel")
			end			
		end
	end
end

--幸运转盘十连
function RechargeSystem.LuckyWheel_Start_Tenth(player, param)
	local Counts = player:GetInt("Recharge_System_LuckyWheel_Counts")
	if Counts < 10 then
		sLuaApp:NotifyTipsMsg(player,"没有足够的剩余的次数了")
		return
	end
	local rewardList = ""
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")/2)
	local LuckyWheel_Config = RechargeConfig['LuckyWheel_Config_'..Serial] or RechargeConfig.LuckyWheel_Config
	local tb_luckwheel = LuckyWheel_Config[param]
	if not tb_luckwheel or type(tb_luckwheel) ~= "table" then
		sLuaApp:NotifyTipsMsg(player,"LuckyWheel中["..param.."]")
		return
	end
	if not RechargeSystem.SpinWin_Ran_table_All then
		RechargeSystem.SpinWin_Ran_table_All = {}
	end
	if not RechargeSystem.SpinWin_Ran_table_All[param] then
		RechargeSystem.SpinWin_Ran_table_All[param] = {0}
		for i = 1,#tb_luckwheel do
			RechargeSystem.SpinWin_Ran_table_All[param][i+1] = sVarSystem:GetInt("LuckyWheel_Rand_"..param.."_"..i)
		end
	end
	for s = 1,10 do
		local rand = sLuaApp:RandInteger(1,RechargeSystem.SpinWin_Ran_table_All[param][#RechargeSystem.SpinWin_Ran_table_All[param]])
		local index = 1
		for i = 1,#tb_luckwheel do
			if rand <= RechargeSystem.SpinWin_Ran_table_All[param][i+1] and rand > RechargeSystem.SpinWin_Ran_table_All[param][i] then
				index = i
				rewardList = rewardList..i..","
				break
			end
		end
	end
	if player:GetInt("Recharge_System_LuckyWheel_TimerID_Tenth") ~= 0 then
		RechargeSystem.LuckyWheel_Receive_Tenth(player)
	end
	if #rewardList >= 19 then
		local str = [[
			if SuperValueUI then
				SuperValueUI.GetTenRewardInfo(']]..rewardList..[[')
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		
		player:SetInt("Recharge_System_LuckyWheel_Counts", Counts -10)
		--sLuaApp:NotifyTipsMsg(player,"扣除了次数，剩余次数为 " .. (Counts -10))
		player:SetString("Recharge_System_LuckyWheel_RewardType_Tenth", param)
		player:SetString("Recharge_System_LuckyWheel_RewardIndex_Tenth", rewardList)
		
		RechargeSystem.GetData(player, 0, "LuckyWheel")
		player:SetInt("Recharge_System_LuckyWheel_TimerID_Tenth",sLuaTimerSystem:AddTimerEx(player, 1000 * 10, 1, "RechargeSystem.LuckyWheel_Receive_Tenth", ""))
	end
end

--幸运转盘十连获取道具
function RechargeSystem.LuckyWheel_Receive_Tenth(player)
	if player:GetInt("Recharge_System_LuckyWheel_TimerID_Tenth") == 0 then
		return
	end
	sLuaTimerSystem:DisableTimer(player:GetInt("Recharge_System_LuckyWheel_TimerID_Tenth"))
	player:SetInt("Recharge_System_LuckyWheel_TimerID_Tenth", 0)
	local LuckyWheel_Switch = RechargeConfig.LuckyWheel_Switch
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")/2)
	local LuckyWheel_Config = RechargeConfig['LuckyWheel_Config_'..Serial] or RechargeConfig.LuckyWheel_Config
	if sDBVarSystem:GetInt("Recharge_System_IsLuckyWheelActing") == 1 and LuckyWheel_Switch == "on" then
		local param = player:GetString("Recharge_System_LuckyWheel_RewardType_Tenth")
		local rewardList = player:GetString("Recharge_System_LuckyWheel_RewardIndex_Tenth")
		local tb_reward = sLuaApp:StrSplit(rewardList,",")
		if param ~= "" then
			player:SetString("Recharge_System_LuckyWheel_RewardType_Tenth", "")
			player:SetString("Recharge_System_LuckyWheel_RewardIndex_Tenth", "")			
			for k,v in ipairs(tb_reward) do
				local index = tonumber(v)
				if index and index ~= 0 then
					if LuckyWheel_Config[param] then
						local tb_receive = LuckyWheel_Config[param][index]
						if tb_receive.Item then
							Lua_tools.AddItem(player, {tb_receive.Item, tb_receive.Num, tb_receive.Bind}, "System", "幸运转盘", "")
							--local itemData = ItemConfig.GetByKeyName(tb_receive.Item)
							--if itemData ~= {} then
							--	sItemSystem:AddItemEx(player, itemData.Id, tb_receive.Num, tb_receive.Bind == 1 and true or false, "System", "幸运转盘", "")
							--end
						elseif tb_receive.MoneyType then
							Lua_tools.AddMoney(player, tb_receive.MoneyType, tb_receive.MoneyVal or 0, "幸运大转盘")
						end
						--if tb_receive.Advert == 1 then			回来再做
						--	local msg = "玩家#COLORCOLOR_YELLOW#"..lualib:Name(player).."#COLOREND#在#COLORCOLOR_YELLOW#幸运大转盘#COLORCOLOR_YELLOW#中获得了珍贵的"..tb_receive.Item.."！"
						--	lualib:SysTopMsg(1,msg)
						--end
					end			
				end
			end
			RechargeSystem.GetData(player, 0, "LuckyWheel")
		end
	end
end

--初始化LuckyWheel的权重
function RechargeSystem.LuckyWheel_Initialization()
	local rand
	if not RechargeConfig then
		require("system/RechargeConfig")
	end
	RechargeSystem.SpinWin_Ran_table_All = nil
	local Serial = math.ceil( sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")/2)
	local LuckyWheel_Config = RechargeConfig['LuckyWheel_Config_'..Serial] or RechargeConfig.LuckyWheel_Config
	for a,b in pairs(LuckyWheel_Config) do
		if type(b) == "table" then
			rand = 0
			for k,v in ipairs(b) do
				rand = rand + (v.Rand or 100)
				sVarSystem:SetInt("LuckyWheel_Rand_"..a.."_"..k, rand)
			end
		end
	end
end

--每日消费奖励的领取
function RechargeSystem.ConsumIngotOfDay_Receive(player, index)
	index = tonumber(index)
	index = Lua_tools.CheckNumber(index, false)
	if not index then return end
	--sLuaApp:LuaDbg("ConsumIngotOfDay_Receive index = "..index)
	local tb_receive = RechargeConfig.ConsumIngotOfDay_Config[index]
	if not tb_receive then		
		return
	end
	--sLuaApp:LuaDbg("ConsumIngotOfDay_Receive 1")
	if sDBVarSystem:GetInt("Recharge_System_IsConsumIngotOfDayActing") == 1 and RechargeConfig.ConsumIngotOfDay_Switch == "on" then
		--sLuaApp:LuaDbg("ConsumIngotOfDay_Receive 2")
		if RechargeConfig.ConsumIngotOfDay_Mode == "player" then
			--sLuaApp:LuaDbg("ConsumIngotOfDay_Receive 3")
			if player:GetInt("Recharge_System_LastConsumeDay_Ingot") ~= sLuaApp:DaySinceEpoch(0) then
				sLuaApp:NotifyTipsMsg(player,"消费额度不够，无法领取")
				return
			end
			if player:GetInt("Recharge_System_ConsumIngotOfDay_State_" .. index) == 2 then
				sLuaApp:NotifyTipsMsg(player,"该奖励你已经领取过了")
				return
			end
			local consumed = player:GetInt("Recharge_System_ConsumIngotOfDay_Value")
			if consumed < tb_receive['Target'] then
				sLuaApp:NotifyTipsMsg(player,"消费额度不够，无法领取")
				return
			end
			if Lua_tools.GiveGoods(player, tb_receive, "system", "每日消费奖励", "超值") == true then
				player:SetInt("Recharge_System_ConsumIngotOfDay_State_"..index, 2)
			end
			--sLuaApp:LuaDbg("ConsumIngotOfDay_Receive 4")
			RechargeSystem.GetData(player, 0, "ConsumIngotOfDay")
		else
			local UserID = player:GetUserId()
			if sDBVarSystem:GetInt("Recharge_System_LastConsumeDay_Ingot_" .. UserID) ~= NowDay then
				sLuaApp:NotifyTipsMsg(player,"消费额度不够，无法领取")
				return
			end
			if sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfDay_State_" .. index.."_"..UserID) == 2 then
				sLuaApp:NotifyTipsMsg(player,"该奖励你已经领取过了")
				return
			end
			local consumed = sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfDay_Value_" .. UserID)
			if consumed < tb_receive['Target'] then
				sLuaApp:NotifyTipsMsg(player,"消费额度不够，无法领取")
				return
			end
			if Lua_tools.GiveGoods(player, tb_receive, "system", "每日消费奖励", "超值") == true then
				sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfDay_State_"..index.."_"..UserID, 2, 2)
			end
			RechargeSystem.GetData(player, 0, "ConsumIngotOfDay")
		end
	end
end

--人民币限购礼包
function RechargeSystem.RMBShopOfOnce_Receive(player, index)
	index = tonumber(index)
	index = Lua_tools.CheckNumber(index, false)
	if not index then return end
	local tb_receive = RechargeConfig.RMBShopOfOnce_Config[index]
	--lualib:Debug("RMBShopOfOnce         11111111111111    index = " .. index)
	if not tb_receive then		
		return
	end
	--lualib:Debug("RMBShopOfOnce         22222222222222")
	if sDBVarSystem:GetInt("Recharge_System_IsRMBShopOfOnceActing") == 1 and RechargeConfig.RMBShopOfOnce_Switch == "on" then
		local RMBShopOfOnce_Time = RechargeConfig.RMBShopOfOnce_Time
		local StartTime = (RMBShopOfOnce_Time[sDBVarSystem:GetInt("RechargeSystem_RMBShopOfOnce_ActingState")] or RMBShopOfOnce_Time[1])
		if StartTime == "" then
			StartTime = "2019-01-01 00:00:00"
		end
		
		if RechargeConfig.RMBShopOfOnce_Mode == "player" then
			--lualib:Debug("RMBShopOfOnce         333333333333333")
			local LastRechargeTime = player:GetString("Recharge_System_RMBShopOfOnce_LastBuyTime")
			local TimeDiff = sLuaApp:Str2DateTime(LastRechargeTime) - sLuaApp:Str2DateTime(StartTime)
			if type(TimeDiff) ~= "number" then
				TimeDiff = -1
			end
			if TimeDiff <= 0 then
				lualib:SysMsg_SendTipsMsg(player, "没有资格领取")
				return
			end
			if player:GetInt("Recharge_System_RMBShopOfOnce_State_" .. index) == 1 then
				--lualib:Debug("RMBShopOfOnce         444444444444444444")
				if Lua_tools.AddMoney(player, tb_receive['RewardType'], tb_receive['RewardVal'],"购买人民币礼包") and Lua_tools.GiveGoods(player, tb_receive) then
					--lualib:Debug("RMBShopOfOnce         55555555555555555")
					if player:GetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..index) == tb_receive.Times then
						player:SetInt("Recharge_System_RMBShopOfOnce_State_" .. index, 2)
					else
						player:SetInt("Recharge_System_RMBShopOfOnce_State_" .. index, 0)
					end
					RechargeSystem.GetData(player, 0, "RMBShopOfOnce")
				end
			end
		else
			local UserID = player:GetUserID()
			local LastRechargeTime = sDBVarSystem:GetString("Recharge_System_RMBShopOfOnce_LastBuyTime_".. UserID)
			local TimeDiff = sLuaApp:Str2DateTime(LastRechargeTime) - sLuaApp:Str2DateTime(StartTime)
			if type(TimeDiff) ~= "number" then
				TimeDiff = -1
			end
			if TimeDiff <= 0 then
				lualib:SysMsg_SendTipsMsg(player, "没有资格领取")
				return
			end
			if sDBVarSystem:GetInt("Recharge_System_RMBShopOfOnce_State_" .. index .. "_" .. UserID) == 1 then
				if Lua_tools.AddMoney(player, tb_receive['RewardType'], tb_receive['RewardVal'],"购买人民币礼包") and Lua_tools.GiveGoods(player, tb_receive) then
					if sDBVarSystem:GetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..index.. "_" .. UserID) == tb_receive.Times then
						sDBVarSystem:SetInt("Recharge_System_RMBShopOfOnce_State_" .. index.. "_" .. UserID, 2, 2)
					else
						sDBVarSystem:SetInt("Recharge_System_RMBShopOfOnce_State_" .. index.. "_" .. UserID, 0, 2)
					end
					RechargeSystem.GetData(player, 0, "RMBShopOfOnce")
				end
			end
		end
	end
end

--累积消费奖励的领取
function RechargeSystem.ConsumIngotOfAcc_Receive(player, index)
	index = tonumber(index)
	index = Lua_tools.CheckNumber(index, false)
	if not index then return end
	--sLuaApp:NotifyTipsMsg(player, "进入ConsumIngotOfAcc_Receive")
	if sDBVarSystem:GetInt("Recharge_System_IsConsumIngotOfAccActing") == 1 and RechargeConfig.ConsumIngotOfAcc_Switch == "on" then
		local tb_receive = RechargeConfig.ConsumIngotOfAcc_Config[index]
		if tb_receive then
			--sLuaApp:NotifyTipsMsg(player, "1111111111111")
			if RechargeConfig.ConsumIngotOfAcc_Mode == "player" then
				--sLuaApp:NotifyTipsMsg(player, "2222222222222")
				local LastConsumeTime = player:GetString("Recharge_System_LastConsumeTime_Ingot")
				local StartTime = (RechargeConfig.ConsumIngotOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")] or RechargeConfig.ConsumIngotOfAcc_Time[1])
				if StartTime == "" then
					StartTime = "2019-01-01 00:00:00"
				end
				local TimeDiff = sLuaApp:Str2DateTime(LastConsumeTime) - sLuaApp:Str2DateTime(StartTime)
				--sLuaApp:NotifyTipsMsg(player, "LastConsumeTime = " .. LastConsumeTime .. "        StartTime = "..StartTime.."       TimeDiff = ".. lualib:GetTimeDiff(LastConsumeTime, StartTime))
				if type(TimeDiff) ~= "number" then
					TimeDiff = -1
				end
				if TimeDiff > 0 then				
					if player:GetInt("Recharge_System_ConsumIngotOfAcc_TotalCon") >= tb_receive.Target 
					and player:GetInt("Recharge_System_ConsumIngotOfAcc_State_" .. index) ~= 2 then
						player:SetInt("Recharge_System_ConsumIngotOfAcc_State_" .. index, 2)
						Lua_tools.AddMoney(player, tb_receive.RewardType, tb_receive.RewardVal, "消费返利")
						RechargeSystem.GetData(player, 0, "ConsumIngotOfAcc")
					end
					return
				end
			else
				local UserID = player:GetUserId()
				local LastConsumeTime = sDBVarSystem:GetString("Recharge_System_LastConsumeTime_Ingot_" .. UserID)
				local StartTime = (RechargeConfig.ConsumIngotOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")] or RechargeConfig.ConsumIngotOfAcc_Time[1])
				if StartTime == "" then
					StartTime = "2019-01-01 00:00:00"
				end
				local TimeDiff = sLuaApp:Str2DateTime(LastConsumeTime) - sLuaApp:Str2DateTime(StartTime)
				--sLuaApp:NotifyTipsMsg(player, "LastConsumeTime = " .. LastConsumeTime .. "        StartTime = "..StartTime.."       TimeDiff = ".. lualib:GetTimeDiff(LastConsumeTime, StartTime))
				if type(TimeDiff) ~= "number" then
					TimeDiff = -1
				end
				if TimeDiff > 0 then				
					if sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfAcc_TotalCon_"..UserID) >= tb_receive.Target 
					and sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfAcc_State_" .. index.."_"..UserID) ~= 2 then
						sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfAcc_State_" .. index.."_"..UserID, 2, 2)
						Lua_tools.AddMoney(player, tb_receive.RewardType, tb_receive.RewardVal, "消费返利")
						RechargeSystem.GetData(player, 0, "ConsumIngotOfAcc")
					end
					return
				end
			end
		end
	end
end


local Recharge_List = {"LuckyWheel","BuyOfDay","LevelFund","RechargeOfDay","RechargeOfAcc","RechargeOfCon","ConsumIngotOfDay","ConsumIngotOfAcc","RMBShopOfOnce","ChainPackOfDay","SeasonPass"}

function RechargeSystem.SystemStart()
	local nowSecond = sLuaApp:SecondSinceEpoch(0)
	sDBVarSystem:SetInt("Recharge_System_RefreshTime", sLuaApp:DaySinceEpoch(0), 0)
	RechargeSystem.GetConstVarTime()
	for k,v in ipairs(Recharge_List) do
		local StartTimes = 0
		if RechargeConfig[v..'_Switch'] == "on" then
			local tb_Times = RechargeConfig[v..'_Time']
			if type(tb_Times) == "table" then
				local now_timeSection = 0
				local last_timeSection = sDBVarSystem:GetInt("RechargeSystem_"..v.."_ActingState")
				local next_State = 0 						--0 关闭    1 开启
				local isLocation = 0
				local lastTimes = -1
				local nowTimes = 0
				if #tb_Times%2 == 0 then
					for i = 1, (#tb_Times+1) do
						if tb_Times[i] then
							local ReSecond = sLuaApp:Str2DateTime(tb_Times[i])
							if type(ReSecond) == "number" then
								nowTimes = ReSecond - nowSecond
								if v == "ConsumIngotOfAcc" then
									print("i = " .. i)
								end
								if lastTimes > 0 and nowTimes < lastTimes then
									sLuaApp:LuaDbg("充值活动【"..v.."】发生严重错误，时间序列中不是按照从小到大的顺序排列！")
									sVarSystem:SetInt("RechargeSystem_"..v.."_IsSuperError", 1)
									RechargeSystem.CampaignClose(0, ""..v)
									break
								end
								if lastTimes < 0 and nowTimes >= 0 then
									now_timeSection = i - 1
									isLocation = 1
									StartTimes = nowSecond + lastTimes
									if v == "RechargeOfCon" then
										print("lastTimes = " .. lastTimes .. "        nowTimes = "..nowTimes)
									end
								end
								if nowTimes == 0 then
									if i%2 == 0 then
										RechargeSystem.CampaignClose(0, ""..v)
									else
										RechargeSystem.CampaignStart(0, ""..v..","..i)
									end
								end
								if nowTimes > 0 then
									if i%2 == 0 then
										--增加定时回调
										sScheduleSystem:CreateSchedule(0,""..tb_Times[i],"RechargeSystem","CampaignClose",""..v)
									else
										--增加定时回调
										sScheduleSystem:CreateSchedule(0,""..tb_Times[i],"RechargeSystem","CampaignStart",""..v..","..i)
									end
								end
							end
						else
							if isLocation == 0 then
								now_timeSection = i - 1
								isLocation = 1
							end
						end
						lastTimes = nowTimes
					end
				else
					sLuaApp:LuaDbg("充值:充值活动"..v.."的时间配置并非成对出现！")
				end
				
				if now_timeSection%2 == 0 then
					next_State = 0
				else
					next_State = 1
				end
				
				if next_State == 1 then
					--print(""..v.."持续开启")
					RechargeSystem.CampaignStart(0, ""..v..","..now_timeSection, StartTimes)
				end
				
				if sDBVarSystem:GetInt("Recharge_System_Is"..v.."Acting") == 1 then
					if next_State == 0 then
						--print(""..v.."已关闭")
						RechargeSystem.CampaignClose(0, ""..v)
					end
				end

			end
		else
			sLuaApp:LuaDbg("【"..v.."】活动并未开启")
		end
	end
end

--获取常量表的活动时间
function RechargeSystem.GetConstVarTime()
	local TimePoint_Start = ""
	local TimePoint_End = ""
	local ServerTime = ConstVarConfig["StartServerTime"].Value
	local ServerTime_sec = sLuaApp:Str2DateTime(ServerTime)
	
	if SeasonPassConfig then
		if SeasonPassConfig.Time then
			RechargeConfig["SeasonPass_Switch"] = SeasonPassConfig.Switch
			RechargeConfig["SeasonPass_Time"] = SeasonPassConfig.Time
		end
	end
	for k,v in ipairs(Recharge_List) do
		TimePoint_Start = ""
		TimePoint_End = ""
		
		local ServerTimes = RechargeConfig[v.."_SeverTime"] or {}
		if ServerTimes then
			if type(ServerTimes) == "table" then
				if #ServerTimes >= 2 then
					RechargeConfig[v.."_Time"] = {}
					for a,b in ipairs(ServerTimes) do
						local tb_times = sLuaApp:StrSplit(b, " ")
						local Add_days = tonumber(tb_times[1])
						if Add_days >= 1 then
							Add_days = Add_days - 1
						end
						local New_Day = sLuaApp:DateTime2Str(ServerTime_sec + Add_days*24*3600)
						New_Day = sLuaApp:StrSplit(New_Day, " ")[1]
						table.insert(RechargeConfig[v.."_Time"], New_Day .. " " .. tb_times[2])
						--print("在表格"..v.."_Time中添加时间" .. New_Day .. " " .. tb_times[2])
					end
				end
			end
		end
	end
end



function RechargeSystem.CampaignStart(timer_id, param, times)
	print("充值活动【" .. param .. "】开始")
	local tb_param = sLuaApp:StrSplit(param, ",")
	if #tb_param == 2 then
		if sVarSystem:GetInt("RechargeSystem_"..tb_param[1].."_IsSuperError") == 1 then
			return
		end
		sDBVarSystem:SetInt("Recharge_System_RefreshTime", sLuaApp:DaySinceEpoch(0), 0)
		sDBVarSystem:SetInt("Recharge_System_Is"..tb_param[1].."Acting", 1, 0)
		sDBVarSystem:SetInt("Recharge_System_"..tb_param[1].."_StartDay", sLuaApp:DaySinceEpoch(times or 0), 0)
		sDBVarSystem:SetInt("RechargeSystem_"..tb_param[1].."_ActingState", tonumber(tb_param[2]) or 1, 0)
		if tb_param[1] == "LuckyWheel" then
			RechargeSystem.LuckyWheel_Initialization()
		elseif tb_param[1] == "RechargeOfCon" then
			RechargeSystem.RechargeOfCon_Initialization()
		end
	end
end

function RechargeSystem.CampaignClose(timer_id, param)
	sDBVarSystem:SetInt("Recharge_System_Is"..param.."Acting", 0, 0)
	sDBVarSystem:SetInt("Recharge_System_RefreshTime", sLuaApp:DaySinceEpoch(0), 0)
	sLuaApp:LuaDbg("充值活动【" .. param .. "】结束")
end

function RechargeSystem.SetRechargeType(player, types, index, value, strs)
	sLuaApp:LuaDbg("SetRechargeType 0")
	if types then
		sLuaApp:LuaDbg("SetRechargeType 1")
		player:SetString("Recharge_System_Function", "" .. types)
		if index then
			sLuaApp:LuaDbg("SetRechargeType 2")
			player:SetString("Recharge_System_Function_Param", "" .. index)
			if types == "Recharge" then
				if RechargeConfig.RechargeFunction_Config[index] then
					value = RechargeConfig.RechargeFunction_Config[index].Amount
				end
			elseif not value then
				player:SetString("Recharge_System_Function", "")
				player:SetString("Recharge_System_Function_Param", "")
				player:SetInt("Recharge_System_Function_RMBValue", 0)
				sLuaApp:LuaDbg("SetRechargeType return 1")
				return
			end
			value = tonumber(value)
			if not value then
				sLuaApp:LuaDbg("SetRechargeType return 2")
				return
			end
			player:SetInt("Recharge_System_Function_RMBValue", value)
			local goods = value*Lua_tools.RMBtoIngot.."元宝"
			if types == "BuyOfDay" then
				goods = "一元大礼"
			elseif types == "MonthCard" then
				if index == 1 then
					goods = "月惠卡"
				elseif index == 2 then
					goods = "至尊月卡"
				end
			elseif types == "RMBShopOfOnce" then
				goods = "限购礼包"..(index or 0)
			elseif types == "SeasonPass" then
				goods = SeasonPassConfig.PriceConfig[index].Name
			elseif types == "LevelFund" then
				goods = "等级基金"
			end
			local str_add = ""
			if index then
				str_add = "-"..index
			end
			--sLuaApp:NotifyTipsMsg(player, "Goods = " .. goods)
			local pay_str = goods..","..value..","..(strs or "0")..","..types..str_add
			local str = [[GlobalProcessing.RechargeOpen("]]..pay_str..[["]]
			local tb_Config
			if types == "Recharge" then
				tb_Config = RechargeConfig.RechargeFunction_Config[index]
				if tb_Config.Code and tb_Config.Name then
					str = str .. ",'" .. tb_Config.Code .. "','" .. tb_Config.Name .."','" .. tb_Config.Amount .. "'"
				else
					sLuaApp:LuaDbg("服务器配置错误，Recharge_Config中缺少Code或Name配置")
					sLuaApp:NotifyTipsMsg(player, "服务器配置错误，Recharge_Config中缺少Code或Name配置")
				end				
			elseif types == "BuyOfDay" then
				tb_Config = RechargeConfig.BuyOfDay_Config['Goods'][index]
				if tb_Config.Code and tb_Config.Name then
					str = str .. ",'" .. tb_Config.Code .. "','" .. tb_Config.Name .."','" .. tb_Config.MoneyVal .. "'"
				else
					sLuaApp:LuaDbg("服务器配置错误，BuyOfDay_Config中缺少Code或Name配置")
					sLuaApp:NotifyTipsMsg(player, "服务器配置错误，BuyOfDay_Config中缺少Code或Name配置")
				end	
			elseif types == "LevelFund" then
				tb_Config = RechargeConfig.LevelFund_Config
				if tb_Config.Code and tb_Config.Name then
					str = str .. ",'" .. tb_Config.Code .. "','" .. tb_Config.Name .."','" .. tb_Config.RMB_Val .. "'"
				else
					sLuaApp:LuaDbg("服务器配置错误，LevelFund_Config中缺少Code或Name配置")
					sLuaApp:NotifyTipsMsg(player, "服务器配置错误，LevelFund_Config中缺少Code或Name配置")
				end	
			elseif types == "RMBShopOfOnce" then
				tb_Config = RechargeConfig.RMBShopOfOnce_Config[index]
				if tb_Config.Code and tb_Config.Name then
					str = str .. ",'" .. tb_Config.Code .. "','" .. tb_Config.Name .."','" .. tb_Config.Price .. "'"
				else
					sLuaApp:LuaDbg("服务器配置错误，RMBShopOfOnce_Config中缺少Code或Name配置")
					sLuaApp:NotifyTipsMsg(player, "服务器配置错误，RMBShopOfOnce_Config中缺少Code或Name配置")
				end
			elseif types == "MonthCard" then
				tb_Config = RechargeConfig.MonthCard_Config[index]
				if tb_Config.Code and tb_Config.Name then
					str = str .. ",'" .. tb_Config.Code .. "','" .. tb_Config.Name .."','" .. tb_Config.Amount .. "'"
				else
					sLuaApp:LuaDbg("服务器配置错误，MonthCard_Config中缺少Code或Name配置")
					sLuaApp:NotifyTipsMsg(player, "服务器配置错误，MonthCard_Config中缺少Code或Name配置")
				end
			elseif types == "SeasonPass" then
				tb_Config = SeasonPassConfig.PriceConfig[index]
				if tb_Config.Code and tb_Config.Name then
					str = str .. ",'" .. tb_Config.Code .. "','" .. tb_Config.Name .."','" .. tb_Config.Amount .. "'"
				else
					sLuaApp:LuaDbg("服务器配置错误，SeasonPassConfig中缺少Code或Name配置")
					sLuaApp:NotifyTipsMsg(player, "服务器配置错误，SeasonPassConfig中缺少Code或Name配置")
				end
			end
			local userid = player:GetUserId()		--GetUserID
			str = str .. [[)]]
			sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('PaySubmitUI', '"..pay_str..","..tb_Config.Code.."')")	
			sLuaApp:LuaDbg("充值：玩家" .. player:GetName() .."(userid:"..userid..")".. " 打开充值界面，准备充值".. types)
		end
	end
end

function RechargeSystem.on_login(player)
	local userid = player:GetUserId()		--GetUserID
	if sDBVarSystem:GetInt("Recharge_System_IsRechargeByOffline_" .. userid) == 1 then	
		RechargeSystem.on_user_recharge(userid, nil,sDBVarSystem:GetInt("Recharge_System_LastRechargeValueByOffline_" .. userid, nil))
	end
	local name = player:GetName()
	local LoginStr = sDBVarSystem:GetString("RechargeSystem_Replenish_" .. name)
	if LoginStr ~= "" then
		sDBVarSystem:SetString("RechargeSystem_Replenish_" .. name, "")
		local LoginTb = sLuaApp:StrSplit(LoginStr, '-')
		RechargeSystem.GMAdd(0, player:GetName(), LoginTb[1], tonumber(LoginTb[2]))
	end
end

function RechargeSystem.GetRechargeInfByUserID(player)
	if RechargeSystem.RechargeOver then
		RechargeSystem.RechargeOver(player, nil, nil)
	end
end

function RechargeSystem.DelRechargeInfByOrder(player,order)
	local userid = player:GetUserId()
	if not userid then
		return
	end
	if not Data["RechargeTable"] then
		return
	end
	if not Data["RechargeTable"][''..userid] then
		return
	end
	if not Data["RechargeTable"][''..userid][''..order] then
		return
	end
	Data["RechargeTable"][''..userid][''..order] = nil
end	

function RechargeSystem.on_user_recharge(userid, orders, ingot, desc)
	sLuaApp:LuaDbg("玩家完成充值")
	local ReType = ""
	local ReIndex = 0
	local RMBtoIngot = Lua_tools.RMBtoIngot
	local RMB = math.floor(ingot/RMBtoIngot)
	sLuaApp:LuaWrn([[orders = ]] .. (orders or "nil") .. [[         desc = ]] .. (desc or "nil"))
	local player = sPlayerSystem:GetPlayerByUserId(userid,0)					--根据UserID获取玩家guid，暂无接口
	--if orders and desc then
	--	--local str = [[
	--	--	----unfilter
	--	--	if MainUI then
	--	--		MainUI.USER_RECHARGE_STR = ']]..userid..[[:]]..RMB..[[:]]..ingot..[[:]]..orders..[[:]]..ReType..[[:]]..desc..[['
	--	--		MainUI.Get_User_Recharge_String()
	--	--	end
	--	--]] 
	--	--sLuaApp:ShowForm(player, "脚本表单", str);
	--else
	--	ReType = player:GetString("Recharge_System_Function")
	--	ReIndex = tonumber(player:GetString("Recharge_System_Function_Param"))
	--end
	
	--sLuaApp:NotifyTipsMsg(player,"进入充值回调 on_recharge")
	--sLuaApp:NotifyTipsMsg(player,""..str)
	
	if desc and desc ~= "" then	
		ReType = sLuaApp:StrSplit(desc, '"')[4]
		local ReTable = sLuaApp:StrSplit(ReType, '-')
		ReType = ReTable[1]
		ReIndex = ReTable[2] or 0
		ReIndex = tonumber(ReIndex)
		--ReType = "RMBShopOfOnce"
		sDBVarSystem:SetInt("SYSTEM_DATA_RechargeTimes_"..ReType.."_"..RMB, sDBVarSystem:GetInt("SYSTEM_DATA_RechargeTimes_"..ReType.."_"..RMB)+1,4)
		sDBVarSystem:SetInt("SYSTEM_DATA_RechargeTimes_"..ReType, sDBVarSystem:GetInt("SYSTEM_DATA_RechargeTimes_"..ReType)+1,4)
		sDBVarSystem:SetInt("SYSTEM_DATA_RechargeRMB_"..ReType, sDBVarSystem:GetInt("SYSTEM_DATA_RechargeRMB_"..ReType)+RMB,4)
	end
	if ReType == "" then
		ReType = player:GetString("Recharge_System_Function")
		ReIndex = tonumber(player:GetString("Recharge_System_Function_Param"))
	end
	sLuaApp:LuaDbg("充值内容 = " .. ReType)
	if orders then
		sLuaApp:LuaWrn("充值：玩家" .. userid .. "，花费了"..RMB.."人民币，充值了"..ingot.."元宝，订单号为" .. orders .." 充值内容为 " .. ReType.."，desc为"..desc)
		
		--何老爷说的这部分内容不入库
		--表格式
		--Data["RechargeTable"] = {	
		--	['UserID'] = {
		--		['orders1'] = {Mode = "",Rmb = 10,Desc = ""},
		--		['orders2'] = {Mode = "",Rmb = 10,Desc = ""},
		--	},
		--},
		
		if not Data["RechargeTable"] then
			Data["RechargeTable"] = {}
		end
		if not Data["RechargeTable"][''..userid] then
			Data["RechargeTable"][''..userid] = {}
		end
		Data["RechargeTable"][''..userid][''..orders] = {['Mode'] = ReType ,['Rmb'] = RMB,['Desc'] = desc}
	end
	local Offline_SecondRecharge = 0
	
	local nowTime = sLuaApp:DateTime2Str(sLuaApp:GetTimes())
	local nowDay = sLuaApp:DaySinceEpoch(0)
	if player == nil and sDBVarSystem:GetInt("Recharge_System_IsRechargeByOffline_" .. userid) == 1 then
		sLuaApp:LuaWrn("充值：玩家" .. userid .. " 在离线状态下第二次充值")
		Offline_SecondRecharge = 1
	elseif player == nil then
		sLuaApp:LuaWrn("充值：玩家" .. userid .. "不在线")
		sDBVarSystem:SetInt("Recharge_System_LastRechargeValueByOffline_" .. userid, ingot, 0)
		sDBVarSystem:SetInt("Recharge_System_IsRechargeByOffline_" .. userid, 1, 0)
		return
	end
	if sDBVarSystem:GetInt("Recharge_System_IsRechargeByOffline_" .. userid) == 1 and Offline_SecondRecharge == 0 then
		sLuaApp:LuaWrn("充值：玩家" .. userid .. "上线，重新执行充值逻辑")
		sDBVarSystem:SetInt("Recharge_System_IsRechargeByOffline_" .. userid, 0, 0)
		sDBVarSystem:SetInt("Recharge_System_LastRechargeValueByOffline_" .. userid, 0, 0)
	end
	local LastRechargeTime = sDBVarSystem:GetString("Recharge_System_LastRechargeTime_" .. userid)
	local LastRechargeDay = sDBVarSystem:GetInt("Recharge_System_LastRechargeDay_" .. userid)
	sDBVarSystem:SetInt("Recharge_System_LastRechargeDay_" .. userid, nowDay, 2)
	sDBVarSystem:SetInt("SYSTEM_DATA_AllRechargeRMB", sDBVarSystem:GetInt("SYSTEM_DATA_AllRechargeRMB")+RMB,4)
	sDBVarSystem:SetInt("SYSTEM_DATA_AllRechargeTimes", sDBVarSystem:GetInt("SYSTEM_DATA_AllRechargeTimes")+1,4)
	if sDBVarSystem:GetInt("SYSTEM_DATA_IsUserRecharge_"..userid) == 0 then
		sDBVarSystem:SetInt("SYSTEM_DATA_IsUserRecharge_"..userid,1,2)
		sDBVarSystem:SetInt("SYSTEM_DATA_AllRechargeUsers", sDBVarSystem:GetInt("SYSTEM_DATA_AllRechargeUsers")+1,4)
	end
	if player:GetInt("SYSTEM_DATA_IsPlyaerRecharge") == 0 then
		player:SetInt("SYSTEM_DATA_IsPlyaerRecharge",1)
		sDBVarSystem:SetInt("SYSTEM_DATA_AllRechargePlayers", sDBVarSystem:GetInt("SYSTEM_DATA_AllRechargePlayers")+1,4)
	end
	
	if PlayerSetting.ResetChatLimit then
		PlayerSetting.ResetChatLimit(player)
	end
	
	--进入连续每日充值逻辑
	if sDBVarSystem:GetInt("Recharge_System_IsRechargeOfConActing") == 1 and RechargeConfig.RechargeOfCon_Switch == "on" then
		if LastRechargeDay ~= nowDay then
			local CanAdd = 0
			if ((RechargeConfig.RechargeOfCon_Time[actingState] or RechargeConfig.RechargeOfCon_Time[1])) == "" then
				CanAdd = 1
			else
				if LastRechargeDay >= sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_StartDay") then
					if nowDay - sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_StartDay") + 1 >= sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_Received_"..userid) then
						CanAdd = 1
					end
				end
				--local TimeDiff = lualib:GetTimeDiff(LastRechargeTime, RechargeOfCon_Time[1])
				--TimeDiff = tonumber(TimeDiff)
				--if type(TimeDiff) == "number" then
				--	if TimeDiff > 0 then
				--		CanAdd = 1
				--	end
				--end
			end
			--sLuaApp:NotifyTipsMsg(player, " CanAdd = " .. CanAdd)
			sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_CanReceive_"..userid, 1, 0)
			if CanAdd == 0 then
				sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_Received_"..userid, 0, 0)
				local actingState = sDBVarSystem:GetInt("RechargeSystem_RechargeOfCon_ActingState")
				local index = math.ceil(actingState/2)
				local theConfig = RechargeConfig["RechargeOfCon_Config_"..index]
				if not theConfig then
					theConfig = RechargeConfig.RechargeOfCon_Config
				end
				for k,v in ipairs(theConfig) do				
					if k == 1 then
						sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..userid, 1, 0)
						--sLuaApp:NotifyTipsMsg(player, " k = 1  " .. userid .. "     " .. sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..userid))
					else
						sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..userid, 0, 0)
					end
				end
			else
				sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..(sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_Received_"..userid)+1).."_"..userid, 1, 0)
			end
		else
			if sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_RechargedWhileClosed_" .. userid) == 1 then
				if sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_State_1_"..userid) == 0 then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_Received_"..userid, 0, 0)
					local actingState = sDBVarSystem:GetInt("RechargeSystem_RechargeOfCon_ActingState")
					local index = math.ceil(actingState/2)
					local theConfig = RechargeConfig["RechargeOfCon_Config_"..index]
					if not theConfig then
						theConfig = RechargeConfig.RechargeOfCon_Config
					end
					for k,v in ipairs(theConfig) do				
						if k == 1 then
							sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..userid, 1, 0)
							--sLuaApp:NotifyTipsMsg(player, " k = 1  " .. userid .. "     " .. sDBVarSystem:GetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..userid))
						else
							sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_State_"..k.."_"..userid, 0, 0)
						end
					end
				end
				sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_RechargedWhileClosed_" .. userid,0,2)
			end
		end
		--sDBVarSystem:SetString("Recharge_System_LastRechargeTime_"..userid, "" .. nowTime)
		if player ~= nil then
			sLuaTimerSystem:AddTimerEx(player, 5000, 1, "RechargeSystem.GetData", "RechargeOfCon")
		end
	else
		sDBVarSystem:SetInt("Recharge_System_RechargeOfCon_RechargedWhileClosed_" .. userid,1,2)
	end
	--进入RMB直接购买逻辑
	if player ~= nil then 	
		if ReType ~= "" then
			--if value == RMB then
			local index = math.ceil(sDBVarSystem:GetInt("RechargeSystem_"..ReType.."_ActingState")/2)
				if ReType == "RMBShopOfOnce" then
					local RMBShopOfOnce_Mode = RechargeConfig.RMBShopOfOnce_Mode
					local RMBShopOfOnce_Switch = RechargeConfig.RMBShopOfOnce_Switch
					local RMBShopOfOnce_Config = RechargeConfig['RMBShopOfOnce_Config_' .. index] or RechargeConfig.RMBShopOfOnce_Config
					local RMBShopOfOnce_Time = RechargeConfig.RMBShopOfOnce_Time
					if RMBShopOfOnce_Switch == "on" and sDBVarSystem:GetInt("Recharge_System_IsRMBShopOfOnceActing") == 1 then
						local tb_shop = RMBShopOfOnce_Config[ReIndex]
						if not tb_shop then
							return
						end
						if tb_shop.Price ~= RMB then
							sLuaApp:LuaDbg("检测到：玩家" .. player:GetName() .."(userid:"..userid..")".. " 在购买RMBShopOfOnce时恶意抓包或修改客户端！")
							return
						end
						player:SetString("Recharge_System_Function", "")
						player:SubIngot(ingot, "Recharge", "RMBShop", "")
						local LastBuyTime
						if RMBShopOfOnce_Mode == "player" then
							LastBuyTime = player:GetString("Recharge_System_RMBShopOfOnce_LastBuyTime")
						else
							LastBuyTime = sDBVarSystem:GetString("Recharge_System_RMBShopOfOnce_LastBuyTime_" .. userid)
						end
						local StartTime = (RMBShopOfOnce_Time[sDBVarSystem:GetInt("RechargeSystem_RMBShopOfOnce_ActingState")] or RMBShopOfOnce_Time[1])
						if StartTime == "" then
							StartTime = "2019-01-01 00:00:00"
						end
						local TimeDiff = sLuaApp:Str2DateTime(LastBuyTime) - sLuaApp:Str2DateTime(StartTime)
						--sLuaApp:NotifyTipsMsg(player, "LastConsumeTime = " .. LastConsumeTime .. "        StartTime = "..StartTime.."       TimeDiff = ".. lualib:GetTimeDiff(LastConsumeTime, StartTime))
						if type(TimeDiff) ~= "number" then
							TimeDiff = -1
						end
						if TimeDiff < 0 then
							for k,v in ipairs(RMBShopOfOnce_Config) do
								player:SetInt("Recharge_System_RMBShopOfOnce_State_"..k, 0)
								player:SetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..k, 0)
								sDBVarSystem:SetInt("Recharge_System_RMBShopOfOnce_State_"..ReIndex.."_"..userid, 0, 2)
								sDBVarSystem:SetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..ReIndex.."_"..userid, 0, 2)
							end
						end
						--local tb_shop = RMBShopOfOnce_Config[index]
						if tb_shop then
							--if RMBShopOfOnce_Config[index].Price == RMB then			
								local canbuy = 0 
								if RMBShopOfOnce_Mode == "player" then
									canbuy = player:GetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..ReIndex)
									if player:GetInt("Recharge_System_RMBShopOfOnce_State_"..ReIndex) == 0 and canbuy < tb_shop.Times then
										player:SetInt("Recharge_System_RMBShopOfOnce_State_"..ReIndex, 1)
										player:SetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..ReIndex, canbuy + 1)
										player:SetString("Recharge_System_RMBShopOfOnce_LastBuyTime", nowTime)
									end
								else
									canbuy = sDBVarSystem:GetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..ReIndex.."_"..userid)
									if sDBVarSystem:GetInt("Recharge_System_RMBShopOfOnce_State_"..ReIndex) == 0 and canbuy < tb_shop.Times then
										sDBVarSystem:SetInt("Recharge_System_RMBShopOfOnce_State_"..ReIndex.."_"..userid, 1, 2)
										sDBVarSystem:SetInt("Recharge_System_RMBShopOfOnce_ConsumeTimes_"..ReIndex.."_"..userid, canbuy + 1, 2)
										sDBVarSystem:SetString("Recharge_System_RMBShopOfOnce_LastBuyDay_" .. userid, nowTime, 0)
									end
								end
								RechargeSystem.RechargeOver(player, ReType, RMB)
								RechargeSystem.GetData(player, 0, "RMBShopOfOnce")					
								return															--花费人民币购买东西时不计入任何计数
							--end
						end
					end
				elseif ReType == "BuyOfDay" then 
					--sLuaApp:LuaDbg("ceshi 1      ")
					local BuyOfDay_Switch = RechargeConfig.BuyOfDay_Switch
					local BuyOfDay_Config = RechargeConfig['BuyOfDay_Config_' .. index] or RechargeConfig.BuyOfDay_Config
					if BuyOfDay_Switch == "on" and sDBVarSystem:GetInt("Recharge_System_IsBuyOfDayActing") == 1 then
						local index = 1
						local NowDay = sLuaApp:DaySinceEpoch(0)
						local maxnum = #BuyOfDay_Config['Goods']
						if BuyOfDay_Config['Loop'] == "Daily" then
							index = NowDay - sDBVarSystem:GetInt("Recharge_System_BuyOfDay_StartDay") + 1
						elseif BuyOfDay_Config['Loop'] == "Weekly" then
							index = sLuaApp:WeekDay(0)
						elseif BuyOfDay_Config['Loop'] == "Monthly" then
							index = sLuaApp:MonthDay(0)
						end
						if index > maxnum then
							index = maxnum%index
						end
						--sLuaApp:LuaDbg("ceshi 2      ")
						local tb_buyofday = BuyOfDay_Config['Goods'][index]
						if not tb_buyofday then
							return
						end
						--sLuaApp:LuaDbg("ceshi 3      ")
						if tb_buyofday.MoneyType == 999 and tb_buyofday.MoneyVal ~= RMB then
							sLuaApp:LuaDbg("检测到：玩家" .. player:GetName() .."(userid:"..userid..")".. " 在购买BuyOfDay时恶意抓包或修改客户端！")
							return
						end
						--sLuaApp:LuaDbg("ceshi 4      ")
						if RechargeConfig.BuyOfDay_Mode == "player" then
							--sLuaApp:LuaDbg("ceshi 5      ")
							if player:GetDayInt("Recharge_System_BuyOfDay_State") == 0 then
								--sLuaApp:LuaDbg("ceshi 6      ")
								player:SetDayInt("Recharge_System_BuyOfDay_State", 1)
							else
								sLuaApp:NotifyTipsMsg(player,"重复购买")
								return
							end
						else
							local BuyDays = player:GetInt("Recharge_System_BuyOfDay_BuyDays_" .. userid)
							if BuyDays ~= nowDay then
								sDBVarSystem:SetInt("Recharge_System_BuyOfDay_BuyDays_"..userid, nowDay, 2)
								sDBVarSystem:SetInt("Recharge_System_BuyOfDay_State_"..userid, 1, 2)
							else
								sLuaApp:NotifyTipsMsg(player,"重复购买")
								return
							end
						end
						player:SetString("Recharge_System_Function", "")
						player:SubIngot(ingot, "Recharge", "RMBShop", "")
						RechargeSystem.RechargeOver(player, ReType, RMB)
						RechargeSystem.GetData(player, 0, "BuyOfDay")					
						return																--花费人民币购买东西时不计入任何计数
					end
				elseif ReType == "LevelFund" then
					local LevelFund_Switch = RechargeConfig.LevelFund_Switch
					local LevelFund_Config = RechargeConfig['LevelFund_Config_' .. index] or RechargeConfig.LevelFund_Config
					sLuaApp:LuaDbg("ceshi 1      ")
					if LevelFund_Switch == "on" and sDBVarSystem:GetInt("Recharge_System_IsLevelFundActing") == 1 then
						if LevelFund_Config.RMB_Val ~= RMB then
							sLuaApp:LuaDbg("检测到：玩家" .. player:GetName() .."(userid:"..userid..")".. " 在购买LevelFund时恶意抓包或修改客户端！")
							return
						end
						sLuaApp:LuaDbg("ceshi 2      ")
						if RechargeConfig.LevelFund_Mode == "player" then
							if player:GetInt("Recharge_System_LevelFund_TotalState") == 0 then
								if LevelFund_Config['MoneyVal'] == nil or LevelFund_Config['MoneyVal'] == ingot or LevelFund_Config['MoneyVal'] == -1 then
									player:SubIngot(ingot, "Recharge", "LevelFund", "")
									player:SetInt("Recharge_System_LevelFund_TotalState", 2)	
								elseif LevelFund_Config['MoneyVal'] ~= 0 then
									player:SetInt("Recharge_System_LevelFund_TotalState", 1)
								else
									player:SetInt("Recharge_System_LevelFund_TotalState", 2)
								end
							else
								sLuaApp:NotifyTipsMsg(player,"重复购买")
								return
							end
						else
							if sDBVarSystem:GetInt("Recharge_System_LevelFund_TotalState_"..userid) == 0 then
								if LevelFund_Config['MoneyVal'] == nil or LevelFund_Config['MoneyVal'] == ingot or LevelFund_Config['MoneyVal'] == -1 then
									player:SubIngot(ingot, "Recharge", "LevelFund", "")
									sDBVarSystem:SetInt("Recharge_System_LevelFund_TotalState_"..userid, 2, 2)	
								elseif LevelFund_Config['MoneyVal'] ~= 0 then
									sDBVarSystem:SetInt("Recharge_System_LevelFund_TotalState_"..userid, 1, 2)							
								else
									sDBVarSystem:SetInt("Recharge_System_LevelFund_TotalState_"..userid, 2, 2)
								end
							else
								sLuaApp:NotifyTipsMsg(player,"重复购买")
								return
							end
						end
						player:SetString("Recharge_System_Function", "")
						RechargeSystem.RechargeOver(player, ReType, RMB)
						RechargeSystem.GetData(player, 0, "LevelFund")
						return						
					end
				elseif ReType == "MonthCard" then
					local MonthCard_Config = RechargeConfig.MonthCard_Config
					
					
					--sLuaApp:LuaDbg("111111111111")
					local tb_config = MonthCard_Config[ReIndex]
					if tb_config then
						--sLuaApp:LuaDbg("222222222222222222     " .. ingot .. "   plyaersingot = " ..lualib:GetIngot(player))
						if tb_config.Amount ~= RMB then
							sLuaApp:LuaDbg("检测到：玩家" .. player:GetName() .."(userid:"..userid..")".. " 在购买MonthCard时恶意抓包或修改客户端！")
							return
						end
						player:SubIngot(ingot, "Recharge", "MonthCard", "")
						if tb_config.FirstIngot then
							if tb_config.FirstIngot > 0 then
								player:AddIngot(tb_config.FirstIngot, "system", "MonthCardFirstIngot","System")
							end
						end
						local monthcarddate = player:GetInt("Recharge_System_MonthCard_"..ReIndex)
						--sLuaApp:LuaDbg("3333333333333")
						if monthcarddate > nowDay then
							player:SetInt("Recharge_System_MonthCard_"..ReIndex, monthcarddate + 30)
						else
							player:SetInt("Recharge_System_MonthCard_"..ReIndex, nowDay + 30)
						end
						RechargeSystem.RechargeOver(player, ReType, RMB)
						RechargeSystem.GetData(player, 0, "MonthCard")
						return
					
					end
				elseif ReType == "SeasonPass" then
					local SeasonPass_Config = SeasonPassConfig.PriceConfig
					
					--sLuaApp:LuaDbg("111111111111")
					local tb_config = SeasonPass_Config[ReIndex]
					if tb_config then
						--sLuaApp:LuaDbg("222222222222222222     " .. ingot .. "   plyaersingot = " ..lualib:GetIngot(player))
						if tb_config.Amount ~= RMB then
							sLuaApp:LuaDbg("检测到：玩家" .. player:GetName() .."(userid:"..userid..")".. " 在购买SeasonPass时恶意抓包或修改客户端！")
							return
						end
						player:SubIngot(ingot, "Recharge", "SeasonPass_Recharge", "")
						SeasonPass.Activation(player, tb_config.Goods)
						RechargeSystem.RechargeOver(player, ReType, RMB)
						return
					
					end
				end	
			--end
		end
	end
	--每日充值奖励
	local RechargeOfDay_Switch = RechargeConfig.RechargeOfDay_Switch
	local RechargeOfDay_Config = RechargeConfig.RechargeOfDay_Config
	local RechargeOfAcc_Switch = RechargeConfig.RechargeOfAcc_Switch
	local RechargeOfAcc_Time = RechargeConfig.RechargeOfAcc_Time
	local RechargeOfAcc_Config = RechargeConfig.RechargeOfAcc_Config
	
	if RechargeOfDay_Switch == "on" and sDBVarSystem:GetInt("Recharge_System_IsRechargeOfDayActing") == 1 then
		local AllRMB = 0
		local IsFirst = 0
		if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_BuyDays_"..userid) ~= nowDay then
			AllRMB = RMB
			sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_BuyDays_"..userid,nowDay,2)
			IsFirst = 1	
		else
			AllRMB = RMB + sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_Value_"..userid)
		end
		--sLuaApp:NotifyTipsMsg(player,"进入每日充值" .. AllRMB )
		sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_Value_"..userid, AllRMB, 4)
		for k,v in ipairs(RechargeOfDay_Config) do			
			if IsFirst == 1 then
				if AllRMB >= v.Target then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_State_"..k.."_"..userid, 1, 2)
				else
					sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_State_"..k.."_"..userid, 0, 2)
				end
			else
				--sLuaApp:NotifyTipsMsg(player,"第"..k.."个值的判断为"..v.Target)
				if sDBVarSystem:GetInt("Recharge_System_RechargeOfDay_State_"..k.."_"..userid) == 0 and AllRMB >= v.Target then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfDay_State_"..k.."_"..userid, 1, 2)
				end
			end
		end
		if player ~= nil then
			RechargeSystem.GetData(player, 0, "RechargeOfDay")
		end
	end
	--进入累积充值逻辑
	--sLuaApp:LuaDbg("RechargeOfAcc_Switch = " .. RechargeOfAcc_Switch .. "    Recharge_System_IsRechargeOfAccActing = " .. sDBVarSystem:GetInt("Recharge_System_IsRechargeOfAccActing"))
	if RechargeOfAcc_Switch == "on" and sDBVarSystem:GetInt("Recharge_System_IsRechargeOfAccActing") == 1 then
		--sLuaApp:LuaDbg("RechargeOfAcc_Test_1")
		local CanAdd = 0
		local AllRMB = 0
		if ((RechargeOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")] or RechargeOfAcc_Time[1])) == "" then	
			AllRMB = sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid) + RMB
			sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid, AllRMB, 4)
			CanAdd = 1
			--sLuaApp:LuaDbg("RechargeOfAcc_Test_2")
		else
			local TimeDiff = sLuaApp:Str2DateTime(LastRechargeTime) - sLuaApp:Str2DateTime((RechargeOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_RechargeOfAcc_ActingState")] or RechargeOfAcc_Time[1]))
			if TimeDiff ~= "" then
				TimeDiff = tonumber(TimeDiff)
				if type(TimeDiff) == "number" then
					if TimeDiff >= 0 then
						sLuaApp:LuaDbg("RechargeOfAcc_Test_3_0      RMB = "..RMB.."     OLDRMB = " ..sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid))
						AllRMB = sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid) + RMB
						sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid, AllRMB, 4)
						sDBVarSystem:SetString("Recharge_System_LastRechargeTime_" .. userid, nowTime, 0)
						CanAdd = 1
						sLuaApp:LuaDbg("RechargeOfAcc_Test_3_1      AllRMB_Now = "..AllRMB.."     AllRMB_Save = " ..sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid))
					end
				end
			end
			--sLuaApp:LuaDbg("RechargeOfAcc_Test_3_2")
		end
		if CanAdd == 0 then
			AllRMB = RMB
			sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid, RMB, 4)
			sDBVarSystem:SetString("Recharge_System_LastRechargeTime_" .. userid, nowTime, 0)
			--sLuaApp:LuaDbg("RechargeOfAcc_Test_4")
		end
		--sLuaApp:LuaDbg("RechargeOfAcc_Test_5")
		for k,v in ipairs(RechargeOfAcc_Config) do
			if CanAdd == 0 then
				if RMB >= v.Target then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid, 1, 2)
				else
					sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid, 0, 2)
				end
			else
				if AllRMB >= v.Target and sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid) == 0 then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid, 1, 2)
				end
				sLuaApp:LuaDbg("Target = " .. v.Target .. " AllRMB = " .. AllRMB .. " State_"..k.." = "..sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid))
			end
		end
		if player ~= nil then
			RechargeSystem.GetData(player, 0, "RechargeOfAcc")
		end
	end
	--充值送RMB内容
	if ReType == "Recharge" then
		--sLuaApp:LuaDbg("Recharge     888888888888888888888 " ..(ReIndex or " nil "))
		--local index = lualib:GetString(player, "Recharge_System_Function_Param")
		--if index ~= "" then
			--index = tonumber(index)
			--sLuaApp:LuaDbg("Recharge     99999999999999999999999999999    "..index)
			local tb_recharge = RechargeConfig.RechargeFunction_Config[ReIndex]
			if tb_recharge then
				sLuaApp:LuaDbg("Recharge     000000000000000000000000000000000000 " .. math.floor(ingot/RMBtoIngot) .." = " .. tb_recharge['Amount'])
				if math.floor(ingot/RMBtoIngot) == tb_recharge['Amount'] then
					if sDBVarSystem:GetInt("Recharge_System_IsPlayerRecharged_" .. ReIndex .. "_" ..userid) ~= 1 then
						--sLuaApp:LuaDbg("未首充用户")
						sDBVarSystem:SetInt("Recharge_System_IsPlayerRecharged_" .. ReIndex .. "_" ..userid,1,2)
						Lua_tools.AddMoney(player,1,tb_recharge['BonusOnce'],"system","RechargePresenter","第"..ReIndex.."档首充")
						RechargeSystem.GetData(player, 0, "Recharge")
					else
						--sLuaApp:LuaDbg("已首充用户")
						Lua_tools.AddMoney(player,1,tb_recharge['BonusNor'],"system","RechargePresenter","第"..ReIndex.."档普通赠送")
					end
					
					--送元宝
					if SendGoldIngot then
						SendGoldIngot.main(player,tb_recharge['Amount'])
					end
				end
				--if tb_recharge.SeverGift == 1 then
				--	sLuaTimerSystem:AddTimerEx(player, 10000, 1, "RedundantRedEnvelope:start",tb_recharge.Amount.."-"..lualib:Name(player))
				--end
				
			end
			--if VipExp then
			--	VipExp.on_recharge(player, RMB, "system","RechargePresenter", "充值金额" .. RMB)
			--end
			RechargeSystem.RechargeOver(player, ReType, RMB)
		--end
	end
	if player ~= nil then
		player:SetString("Recharge_System_Function","")
		player:SetString("Recharge_System_Function_Param","")
	end
	if FirstRecharge then
		FirstRecharge.GetReward(player, RMB)
	end
	sDBVarSystem:SetString("Recharge_System_LastRechargeTime_" .. userid, nowTime, 0)
	if PlayerSetting.ResetChatLimit then
		PlayerSetting.ResetChatLimit(player)
	end
end

function RechargeSystem.RechargeOver(player, mode, rmb)
	local userid = player:GetUserId()
	if not userid then
		return
	end
	if not Data["RechargeTable"] then
		return
	end
	local tb = Data["RechargeTable"][''..userid]
	if not tb then
		return
	end	
	local str = [[
		if SDKPluginCenter then
			if SDKPluginCenter.RechargeCallback then
				SDKPluginCenter.RechargeCallback(]]..Lua_tools.serialize(tb)..[[)
			end
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function RechargeSystem.GMAdd(player, name, mode, index)
	local recharger = sPlayerSystem:GetPlayerByName(name)
	if recharger then
		local success = 0
		local userid = recharger:GetUserId()
		if mode == "LevelFund" or mode == "等级基金" then
			success = 1
			if RechargeConfig.LevelFund_Mode == "player" then
				recharger:SetInt("Recharge_System_LevelFund_TotalState", 2)
			else
				sDBVarSystem:SetInt("Recharge_System_LevelFund_TotalState_"..userid, 2, 2)
			end
		elseif mode == "MonthCard" or mode == "月卡" then
			success = 1
			local nowDay = sLuaApp:DaySinceEpoch(0)
			local monthcarddate = recharger:GetInt("Recharge_System_MonthCard_"..index)
			--sLuaApp:LuaDbg("3333333333333")
			if monthcarddate > nowDay then
				recharger:SetInt("Recharge_System_MonthCard_"..index, monthcarddate + 30)
			else
				recharger:SetInt("Recharge_System_MonthCard_"..index, nowDay + 30)
			end
		elseif mode == "FirstIngot" or mode == "双倍首充" then
			success = 1
			local tb_recharge = RechargeConfig.RechargeFunction_Config[index]
			if tb_recharge then
				--if math.floor(ingot/RMBtoIngot) == tb_recharge['Amount'] then
					if sDBVarSystem:GetInt("Recharge_System_IsPlayerRecharged_" .. index .. "_" ..userid) ~= 1 then
						--sLuaApp:LuaDbg("未首充用户")
						sDBVarSystem:SetInt("Recharge_System_IsPlayerRecharged_" .. index .. "_" ..userid,1,2)
						Lua_tools.AddMoney(recharger,1,tb_recharge['BonusOnce'],"system","RechargePresenter","第"..index.."档首充")
					else
						--sLuaApp:LuaDbg("已首充用户")
						Lua_tools.AddMoney(recharger,1,tb_recharge['BonusNor'],"system","RechargePresenter","第"..index.."档普通赠送")
					end
					
					--送元宝
					if SendGoldIngot then
						SendGoldIngot.main(recharger,tb_recharge['Amount'])
					end
				--end
				--if tb_recharge.SeverGift == 1 then
				--	sLuaTimerSystem:AddTimerEx(player, 10000, 1, "RedundantRedEnvelope:start",tb_recharge.Amount.."-"..lualib:Name(player))
				--end
				
			end
		elseif mode == "FirstRecharge" or mode == "激活首充" then
			success = 1
			recharger:SetInt("GotFirstRecharge", 1)
		elseif mode == "RechargeValue" or mode == "充值额度" then
			success = 1
			local AllRMB = sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid) + index
			sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_TotalIngot_"..userid, AllRMB, 4)
			sDBVarSystem:SetString("Recharge_System_LastRechargeTime_" .. userid, sLuaApp:DateTime2Str(sLuaApp:GetTimes()), 0)
			
			for k,v in ipairs(RechargeConfig.RechargeOfAcc_Config) do
				if AllRMB >= v.Target and sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid) == 0 then
					sDBVarSystem:SetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid, 1, 2)
				end
				--sLuaApp:LuaDbg("Target = " .. v.Target .. " AllRMB = " .. AllRMB .. " State_"..k.." = "..sDBVarSystem:GetInt("Recharge_System_RechargeOfAcc_State_"..k.."_"..userid))
			end
			RechargeSystem.GetData(player, 0, "RechargeOfAcc")
		end
		if success == 1 then
			return "激活成功"
		else
			return "不存在的激活方案 " .. mode
		end
	else
		sDBVarSystem:SetString("RechargeSystem_Replenish_" .. name, ""..mode.."-"..index, 2)
		return "激活成功，等待玩家上线验证"
	end
end

local UseIngotType = {
	['祈福帖购买'] = "SummonLottety",
	['商城购买扣元宝'] = "MallBuy",
	['金元宝兑换为金币'] = "MoneyExchange",
	['金元宝兑换为绑定元宝'] = "MoneyExchange",
	['金元宝兑换为银币'] = "MoneyExchange",
	['金元宝兑换金币'] = "MoneyExchange",
	['脚本兑换'] = "MoneyExchange",
	['自定义货币兑换'] = "CustomExchange",
	['购买限时折扣'] = "Discount",
	['元宝一键购买'] = "OneKeyBuy",
	['扩展槽位：(null)'] = "BagExpansion",
	['其他'] = "Else",
}

function RechargeSystem.GetAllUseData(player)
	local str = "所有玩家在游戏中消费了"..sDBVarSystem:GetInt("SYSTEM_DATA_AllIngotUse").."元宝，"
	local Used = {}
	for k,v in pairs(UseIngotType) do
		if not Used[v] then
			str = str .. "其中"..v.."行为消耗了"..sDBVarSystem:GetInt("SYSTEM_DATA_IngotUse_"..v).."元宝，"
		end
		Used[v] = 1
	end
	sLuaApp:NotifyTipsMsg(player, str)
end


function RechargeSystem.on_player_useingot(player, ingot, desc, target, detail)
	--sLuaApp:LuaDbg("玩家 " .. player:GetName() .. " 在"..desc.."中消费了"..ingot.."元宝")
	sDBVarSystem:SetInt("SYSTEM_DATA_AllIngotUse", sDBVarSystem:GetInt("SYSTEM_DATA_AllIngotUse")+ingot,4)
	local str_desc = UseIngotType[desc]
	if str_desc then
		sLuaApp:NotifyTipsMsg(player, "在"..str_desc.."中消费了"..ingot.."元宝")
		sDBVarSystem:SetInt("SYSTEM_DATA_IngotUse_"..str_desc, sDBVarSystem:GetInt("SYSTEM_DATA_IngotUse_"..str_desc)+ingot,4)
	else
		sDBVarSystem:SetInt("SYSTEM_DATA_IngotUse_Else", sDBVarSystem:GetInt("SYSTEM_DATA_IngotUse_Else")+ingot,4)
	end
	if Lua_tools.IngotDescStati(desc) == false then
		return
	end
	if Lua_tools.IngotDescStati(target) == false then
		return
	end
	local NowDay = sLuaApp:DaySinceEpoch(0)
	local NowTime = sLuaApp:DateTime2Str(sLuaApp:GetTimes())
	local UserID = player:GetUserId()		--获取玩家USERID

	--当幸运转盘开启时
	local LuckyWheel_Switch = RechargeConfig.LuckyWheel_Switch
	if sDBVarSystem:GetInt("Recharge_System_IsLuckyWheelActing") == 1 and LuckyWheel_Switch == "on" then
		local index = math.ceil(sDBVarSystem:GetInt("RechargeSystem_LuckyWheel_ActingState")/2)
		local LuckyWheel_Config = RechargeConfig['LuckyWheel_Config_' .. index] or RechargeConfig.LuckyWheel_Config
		if LuckyWheel_Config then
			--sLuaApp:LuaDbg("111111111111111111111")
			local ConsumeToCounts = LuckyWheel_Config['ConsumeToTimes']
			if ConsumeToCounts then
				--sLuaApp:LuaDbg("222222222222222222222")
				local Consumed = player:GetInt("Recharge_System_LuckyWheel_ConsumeProgress")
				local Consumed_add = Consumed + ingot
				--if Consumed_add >= LuckyWheel_Config['ConsumeToTimes'] then
					player:SetInt("Recharge_System_LuckyWheel_Counts", player:GetInt("Recharge_System_LuckyWheel_Counts") + math.floor(Consumed_add/ConsumeToCounts))
					player:SetInt("Recharge_System_LuckyWheel_ConsumeProgress", Consumed_add%ConsumeToCounts)
					RechargeSystem.GetData(player, 0, "LuckyWheel")
					--sLuaApp:NotifyTipsMsg(player, "NowConsumed = " .. Consumed_add)
				--end
			end
		end
	end
	--当每日消费活动开启时
	local ConsumIngotOfDay_Switch = RechargeConfig.ConsumIngotOfDay_Switch
	if sDBVarSystem:GetInt("Recharge_System_IsConsumIngotOfDayActing") == 1 and ConsumIngotOfDay_Switch == "on" then
		local index = math.ceil(sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfDay_ActingState")/2)
		local ConsumIngotOfDay_Mode = RechargeConfig.ConsumIngotOfDay_Mode
		local ConsumIngotOfDay_Config = RechargeConfig['ConsumIngotOfDay_Config_' .. index] or RechargeConfig.ConsumIngotOfDay_Config
		if ConsumIngotOfDay_Mode == "player" then
			if player:GetInt("Recharge_System_LastConsumeDay_Ingot") ~= NowDay then
				player:SetInt("Recharge_System_LastConsumeDay_Ingot", NowDay)
				player:SetInt("Recharge_System_ConsumIngotOfDay_Value", ingot)
				for k,v in ipairs(ConsumIngotOfDay_Config) do
					player:SetInt("Recharge_System_ConsumIngotOfDay_State_"..k, ingot >= v.Target and 1 or 0)
				end
			else
				local now_ingot = ingot + player:GetInt("Recharge_System_ConsumIngotOfDay_Value")
				player:SetInt("Recharge_System_ConsumIngotOfDay_Value", now_ingot)
				for k,v in ipairs(ConsumIngotOfDay_Config) do
					if player:GetInt("Recharge_System_ConsumIngotOfDay_State_"..k) == 0 and now_ingot >= v.Target then
						player:SetInt("Recharge_System_ConsumIngotOfDay_State_"..k, 1)
					end
				end
			end
		else
			if sDBVarSystem:GetInt("Recharge_System_LastConsumeDay_Ingot_" .. UserID) ~= NowDay then
				sDBVarSystem:SetInt("Recharge_System_LastConsumeDay_Ingot_" .. UserID, NowDay, 2)
				sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfDay_Value_" .. UserID, ingot, 4)
				for k,v in ipairs(ConsumIngotOfDay_Config) do
					sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfDay_State_"..k.."_"..UserID, ingot >= v.Target and 1 or 0, 2)
				end
			else
				local now_ingot = ingot + sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfDay_Value_" .. UserID)
				sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfDay_Value_" .. UserID, now_ingot, 4)
				for k,v in ipairs(ConsumIngotOfDay_Config) do
					if sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfDay_State_"..k.."_"..UserID) == 0 and now_ingot >= v.Target then
						sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfDay_State_"..k.."_"..UserID, 1, 2)
					end
				end
			end
		end
		RechargeSystem.GetData(player, 0, "ConsumIngotOfDay")
	end
	--当累积消费活动开启时
	local ConsumIngotOfAcc_Switch = RechargeConfig.ConsumIngotOfAcc_Switch
	if sDBVarSystem:GetInt("Recharge_System_IsConsumIngotOfAccActing") == 1 and ConsumIngotOfAcc_Switch == "on" then
		local index = math.ceil(sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")/2)
		local ConsumIngotOfAcc_Mode = RechargeConfig.ConsumIngotOfAcc_Mode
		local ConsumIngotOfAcc_Time = RechargeConfig.ConsumIngotOfAcc_Time
		local ConsumIngotOfAcc_Config = RechargeConfig['ConsumIngotOfAcc_Config_' .. index] or RechargeConfig.ConsumIngotOfAcc_Config
		if ConsumIngotOfAcc_Mode == "player" then
			local LastConsumeTime = player:GetString("Recharge_System_LastConsumeTime_Ingot")
			local StartTime = (ConsumIngotOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")] or ConsumIngotOfAcc_Time[1])
			if StartTime == "" then
				StartTime = "2019-01-01 00:00:00"
			end
			local TimeDiff = sLuaApp:Str2DateTime(LastConsumeTime) - sLuaApp:Str2DateTime(StartTime)
			if type(TimeDiff) ~= "number" then
				TimeDiff = -1
			end
			player:SetString("Recharge_System_LastConsumeTime_Ingot", NowTime)
			--sLuaApp:LuaDbg("存储消费元宝时间 " .. NowTime)
			if TimeDiff < 0 then
				player:SetInt("Recharge_System_ConsumIngotOfAcc_TotalCon", ingot)
				for k,v in ipairs(ConsumIngotOfAcc_Config) do
					player:SetInt("Recharge_System_ConsumIngotOfAcc_State_"..k, ingot >= v.Target and 1 or 0)
				end
			else
				local now_ingot = player:GetInt("Recharge_System_ConsumIngotOfAcc_TotalCon") + ingot 
				player:SetInt("Recharge_System_ConsumIngotOfAcc_TotalCon", now_ingot)
				for k,v in ipairs(ConsumIngotOfAcc_Config) do
					if player:GetInt("Recharge_System_ConsumIngotOfAcc_State_"..k) == 0 and now_ingot >= v.Target then
						player:SetInt("Recharge_System_ConsumIngotOfAcc_State_"..k, 1)
					end
				end
			end
		else
			local LastConsumeTime = sDBVarSystem:GetString("Recharge_System_LastConsumeTime_Ingot_" .. UserID)
			local StartTime = (ConsumIngotOfAcc_Time[sDBVarSystem:GetInt("RechargeSystem_ConsumIngotOfAcc_ActingState")] or ConsumIngotOfAcc_Time[1])
			if StartTime == "" then
				StartTime = "2019-01-01 00:00:00"
			end
			local TimeDiff = sLuaApp:Str2DateTime(LastConsumeTime) - sLuaApp:Str2DateTime(StartTime)
			if type(TimeDiff) ~= "number" then
				TimeDiff = -1
			end
			sDBVarSystem:SetSting("Recharge_System_LastConsumeTime_Ingot_" .. UserID, NowTime, 0)
			if TimeDiff < 0 then				
				sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfAcc_TotalCon_" .. UserID, ingot, 4)
				for k,v in ipairs(ConsumIngotOfAcc_Config) do
					sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfAcc_State_"..k.."_"..UserID, now_ingot >= v.Target and 1 or 0, 2)
				end
			else
				local now_ingot = sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfAcc_Value_" .. UserID) + ingot 
				sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfAcc_TotalCon_" .. UserID, now_ingot, 4)
				for k,v in ipairs(ConsumIngotOfAcc_Config) do
					if sDBVarSystem:GetInt("Recharge_System_ConsumIngotOfAcc_State_"..k.."_"..UserID) == 0 and now_ingot >= v.Target then
						sDBVarSystem:SetInt("Recharge_System_ConsumIngotOfAcc_State_"..k.."_"..UserID, 1, 2)
					end
				end
			end
		end
		RechargeSystem.GetData(player, 0, "ConsumIngotOfAcc")
	end
	sLuaApp:LuaDbg("UseIngot = " .. desc .. "  target = " .. target .. "   detail = " .. target)
end


--RechargeSystem.LuckyWheel_Initialization()
