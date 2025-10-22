--限时折扣功能
DiscountSystem = {}

function DiscountSystem.on_level_up(player, level)
	if not DiscountSystem.ConfigIndex then
		sLuaApp:LuaWrn("DiscountSystem.ConfigIndex 不存在！")
		return
	end
	if FunctionSwitch.AllFuncitonConfig.Discount ~= "on" then
		return
	end
	local rein = player:GetAttr(ROLE_ATTR_REINCARNATION)
	DiscountSystem.Discount_Start(player, DiscountSystem.ConfigIndex["1_"..rein.."_"..level])
end

function DiscountSystem.on_get_pet(player, pet)
	if not DiscountSystem.ConfigIndex then
		sLuaApp:LuaWrn("DiscountSystem.ConfigIndex 不存在！")
		return
	end
	if FunctionSwitch.AllFuncitonConfig.Discount ~= "on" then
		return
	end
	local petCon_1 = player:GetPetContainer(1)
	local petCon_2 = player:GetPetContainer(2)
	DiscountSystem.Discount_Start(player, DiscountSystem.ConfigIndex["3_"..(petCon_1:GetPetCount()+petCon_2:GetPetCount())])
	
	DiscountSystem.Discount_Start(player, DiscountSystem.ConfigIndex["2_"..pet:GetId()])
	DiscountSystem.Discount_Start(player, DiscountSystem.ConfigIndex["2_"..pet:GetKeyName()])
end

function DiscountSystem.on_get_guard(player, guard)
	if not DiscountSystem.ConfigIndex then
		sLuaApp:LuaWrn("DiscountSystem.ConfigIndex 不存在！")
		return
	end
	if FunctionSwitch.AllFuncitonConfig.Discount ~= "on" then
		return
	end
	
	local con = player:GetGuardContainer()
	
	DiscountSystem.Discount_Start(player, DiscountSystem.ConfigIndex["5_"..(#con:GetGuards())])
	
	DiscountSystem.Discount_Start(player, DiscountSystem.ConfigIndex["4_"..guard:GetId()])
	DiscountSystem.Discount_Start(player, DiscountSystem.ConfigIndex["4_"..guard:GetKeyName()])
end

function DiscountSystem.on_login(player)
	if FunctionSwitch.AllFuncitonConfig.Discount ~= "on" then
		return
	end
	sLuaApp:LuaDbg("DiscountSystem.on_login")
	DiscountSystem.GetConfig(player)
end

--获得配置
function DiscountSystem.GetConfig(player)
	if not DiscountConfig then
		return
	end
	if FunctionSwitch.AllFuncitonConfig.Discount ~= "on" then
		return
	end
	
	sLuaApp:LuaDbg("DiscountSystem.GetConfig")
	
	local NowTime = sLuaApp:SecondSinceEpoch(0)
	
	local tb_Config = {}
	
	for k,v in ipairs(DiscountConfig) do
		local state = player:GetInt("DiscountDATA_" .. v.UniqueMarker)
		--sLuaApp:LuaDbg("state ==================== " .. state)
		if state == 1 or state == 2 then
			local StartTime = player:GetInt("DiscountDATA_StartTime_" .. v.UniqueMarker)
			if StartTime + v.DiscountTime_2 < NowTime then
				player:SetInt("DiscountDATA_" .. v.UniqueMarker, 3)
			else
				tb_Config[k] = v
			end
		end
	end
	--sLuaApp:LuaDbg('DISCOUNT_CONFIG = ' .. Lua_tools.serialize(tb_Config))
	DiscountSystem.GetData(player, [[DISCOUNT_CONFIG = ]] .. Lua_tools.serialize(tb_Config))
	--local str = [[DISCOUNT_CONFIG = ]] .. Lua_tools.serialize(tb_Config)
	--..[[
	--if GlobalProcessing then
	--	GlobalProcessing.Discount_DataLoading()
	--end
	--]]
	--sLuaApp:LuaDbg("====================================== GetConfig ======================================")
	--sLuaApp:ShowForm(player, "脚本表单", str);
end

--获得数据
function DiscountSystem.GetData(player, str)
	if not DiscountConfig then
		return
	end
	if FunctionSwitch.AllFuncitonConfig.Discount ~= "on" then
		return
	end
	
	local NowTime = sLuaApp:SecondSinceEpoch(0)
	
	local tb_Config = {}
	
	str = (str or "") ..[[
	if GlobalProcessing then
		GlobalProcessing.DiscountData = {}
	]]
	for k,v in ipairs(DiscountConfig) do
		local state = player:GetInt("DiscountDATA_" .. v.UniqueMarker)
		if state == 1 or state == 2 then
			local StartTime = player:GetInt("DiscountDATA_StartTime_" .. v.UniqueMarker)
			if StartTime + v.DiscountTime_2 < NowTime then
				player:SetInt("DiscountDATA_" .. v.UniqueMarker, 3)
				str = str .. [[GlobalProcessing.DiscountData]].."['"..k..[[_Overdue]].."']"..[[ = 1
				]]
			else
				str = str .. [[GlobalProcessing.DiscountData]].."['"..k..[[_StartTime]].."']"..[[ = ]]..StartTime..[[
				]]
				table.insert(tb_Config, v)
			end
		elseif state == 3 then
			str = str .. [[GlobalProcessing.DiscountData]].."['"..k..[[_Overdue]].."']"..[[ = 1
				]]
		end
	end
	
	str = str .. [[
		GlobalProcessing.Discount_DataLoading()
	end
	if WelDiscountUI then
		WelDiscountUI.DescountDataRefresh()
	end
	]]
	--sLuaApp:LuaDbg("====================================== GetData ======================================" .. str)
	sLuaApp:ShowForm(player, "脚本表单", str);
end

--开始折扣
function DiscountSystem.Discount_Start(player, index)
	local tb_Config = DiscountConfig[index]
	sLuaApp:LuaDbg("Discount_Start")
	if not tb_Config then
		--sLuaApp:LuaWrn("DiscountConfig["..index.."] 不存在！")
		return
	end
	
	local NowTime = sLuaApp:SecondSinceEpoch(0)
	local uni = tb_Config.UniqueMarker
	sLuaApp:LuaDbg("Discount_Start uni = " ..uni)
	if player:GetInt("DiscountDATA_" .. uni) == 0 then
		player:SetInt("DiscountDATA_StartTime_" .. uni, NowTime)
		if tb_Config.DiscountTime_1 > 0 then
			player:SetInt("DiscountDATA_" .. uni, 1)
		elseif tb_Config.DiscountTime_2 > 0 then
			player:SetInt("DiscountDATA_" .. uni, 2)
		else
			player:SetInt("DiscountDATA_" .. uni, 3)
			return
		end
		local str = [[if DISCOUNT_CONFIG then
			DISCOUNT_CONFIG]].."["..index.."] = "..Lua_tools.serialize(tb_Config)..[[
		end
		GUI.OpenWnd('DiscountWnd',]]..index..[[)
		if GlobalProcessing then
			GlobalProcessing.Discount_DataLoading()
		end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str);
		--sLuaApp:LuaDbg("====================================== Discount_Start ======================================")
	end
end

function DiscountSystem.Purchase(player, index)
	if not DiscountConfig then
		sLuaApp:NotifyTipsMsg(player, "DISCOUNT_CONFIG配置缺失")
		return
	end
	if FunctionSwitch.AllFuncitonConfig.Discount ~= "on" then
		return
	end
	sLuaApp:LuaDbg(" index = " .. index)
	index = tonumber(index)
	local tb_Config = DiscountConfig[index]
	if tb_Config then
		
		--sLuaApp:LuaDbg("index ========= ".. tb_Config.UniqueMarker .. " MoneyVal = " .. tb_Config.MoneyVal * tb_Config['Discounter_'..player:GetInt("DiscountDATA_"..tb_Config.UniqueMarker)])
		if player:GetInt("DiscountDATA_" .. tb_Config.UniqueMarker) == 0 or player:GetInt("DiscountDATA_" .. tb_Config.UniqueMarker) == 3 then
			return
		end
		local NowTime = sLuaApp:SecondSinceEpoch(0)
		local StartTime = player:GetInt("DiscountDATA_StartTime_" .. tb_Config.UniqueMarker)
		local state = 2
		if StartTime + tb_Config.DiscountTime_1 > NowTime then
			state = 1
		end
		local need_money_val = math.floor(tb_Config.MoneyVal * tb_Config['Discounter_'..state])
		if Lua_tools.SubMoney(player, tb_Config.MoneyType, need_money_val, "system", "Discount", "Purchase_"..index) then
			player:SetInt("DiscountDATA_" .. tb_Config.UniqueMarker,3)
			--sLuaApp:LuaDbg("玩家尝试购买 " .. tb_Config.UniqueMarker)
			if Lua_tools.GiveGoods(player, tb_Config, "system", "Discount", "Purchase_"..index) then
				sLuaApp:NotifyTipsMsg(player, "购买成功！")
			end
			--sLuaApp:LuaDbg("玩家购买成功 " .. tb_Config.UniqueMarker)
			DiscountSystem.GetData(player)
			--关闭界面
			sLuaApp:ShowForm(player, "脚本表单", "if DiscountWnd then DiscountWnd.CloseWnd() end");
		else
			--兑换货币
			if MoneyChange then
				local f_name = [[DiscountSystem.Purchase(player,]]..index..[[)]]
				MoneyChange.LackMoney(player, tb_Config.MoneyType, need_money_val, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "你的"..Lua_tools.GetMoneyName(tb_Config.MoneyType).."不足！")
			end		
		end
	end
end

--初始化数据
function DiscountSystem.Initialization()
	if not Data.DiscountConfig then
		Data.DiscountConfig = {}
	end
	if not DiscountConfig then
		require("player/DiscountConfig")
	end
	--DiscountConfigEx = {}
	DiscountSystem.ConfigIndex = {}
	if DiscountConfig then
		for k,v in ipairs(DiscountConfig) do
			if Data then
				Data.DiscountConfig["DiscountSTR_"..v.UniqueMarker] = Lua_tools.serialize(v)
			end
			if v.TriggerType then
				if v.TriggerParam then
					if type(v.TriggerParam) == "table" then
						local str = ""
						for a,b in ipairs(v.TriggerParam) do
							str = str .. "_" .. b
						end
						--DiscountConfigEx[""..v.TriggerType..str] = v
						DiscountSystem.ConfigIndex[""..v.TriggerType..str] = k
					else
						--DiscountConfigEx[""..v.TriggerType..str] = v
						DiscountSystem.ConfigIndex[""..v.TriggerType.."_"..v.TriggerParam] = k
					end
				end
			end
			if v.PetList then
				sLuaApp:LuaDbg('录入宠物' .. v.PetList[1])
				Lua_tools.RegisterPets(v.PetList)
			end
		end
	end
	--sLuaApp:LuaDbg("DiscountSystem.ConfigIndex = " .. Lua_tools.serialize(DiscountSystem.ConfigIndex))
end