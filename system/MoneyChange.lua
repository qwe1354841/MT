--货币转换
MoneyChange = {}

MoneyChange.Config = {
	["MoneyVal_5"] = {
		--第一个配置作为默认转换配置
		{
			["ChangeFrom"] = 1, -- 从1号货币兑换到5号货币
			["ChangeRatio"] = 50,
		},
		-- {
			-- ["ChangeFrom"] = 2,
			-- ["ChangeRatio"] = 500,
		-- },
		-- {
			-- ["ChangeFrom"] = 4,
			-- ["ChangeRatio"] = 10,
		-- },
	},
	-- ["MoneyVal_4"] = {
		-- --第一个配置作为默认转换配置
		-- {
			-- ["ChangeFrom"] = 1,
			-- ["ChangeRatio"] = 500,
		-- },
		-- {
			-- ["ChangeFrom"] = 2,
			-- ["ChangeRatio"] = 200,
		-- },
		
	-- },
	["MoneyVal_2"] = {
		--第一个配置作为默认转换配置
		{
			["ChangeFrom"] = 1,
			["ChangeRatio"] = 1,
		},
		
	},
	
}

function MoneyChange.GetData(player, from_type, to_type)
	if not from_type or not to_type then return end
	from_type = tonumber(from_type)
	to_type = tonumber(to_type)
	if to_type == 1 then
		MoneyChange.ConfirmOpenRecharge(player, 1)
	elseif MoneyChange.Config["MoneyVal_"..to_type] then
		for _,v in ipairs(MoneyChange.Config["MoneyVal_"..to_type]) do
			if v["ChangeFrom"] == from_type then
				local str = [[
					if ExchangeUI then
						ExchangeUI.Rate = ]].. v["ChangeRatio"] ..[[
						ExchangeUI.Refresh()
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
				break
			end
		end
	end
end

function MoneyChange.ExchangeMoney(player, change_num, from_type, to_type)
	if not change_num or not MoneyChange.Config["MoneyVal_"..to_type] then return end
	change_num = math.floor(tonumber(change_num))
	from_type = tonumber(from_type)
	to_type = tonumber(to_type)
	if change_num <= 0 then return end
	local exchange_config = {}
	for _,v in ipairs(MoneyChange.Config["MoneyVal_"..to_type]) do
		if v["ChangeFrom"] == from_type then
			exchange_config = v
		end
	end
	if not next(exchange_config) then return end
	--local exchange_config = MoneyChange.Config["MoneyVal_"..change_type]
	if not Lua_tools.IsMoneyEnough(player, exchange_config["ChangeFrom"], change_num) then
		if MoneyChange.LackMoney then
			local f_name = [[MoneyChange.ExchangeMoney(player,]]..change_num..[[,]]..from_type..[[,]]..to_type..[[)]]
			MoneyChange.LackMoney(player, exchange_config["ChangeFrom"], change_num, f_name)
			sLuaApp:ShowForm(player, "脚本表单", [[if ExchangeUI then GUI.DestroyWnd("ExchangeUI") end]])
		else
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(exchange_config["ChangeFrom"]).."不足")
		end
		return
	end
	if Lua_tools.SubMoney(player, exchange_config["ChangeFrom"], change_num, "system", "货币兑换", from_type.."转"..to_type) then
		if Lua_tools.AddMoney(player, tonumber(to_type), change_num * exchange_config["ChangeRatio"], "system", "货币兑换", from_type.."转"..to_type) then
			sLuaApp:NotifyTipsMsg(player, "兑换成功！")
			sLuaApp:ShowForm(player, "脚本表单", [[if ExchangeUI then GUI.DestroyWnd("ExchangeUI") end]])
		end
	end
end

function MoneyChange.ConfirmOpenRecharge(player, typ)
	local msg = "是否前往充值？"
	if typ == 2 then
		msg = "您的金元宝不足，" .. msg
	end
	local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "MoneyChange.OpenRecharge("..player:GetGUID()..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end
function MoneyChange.OpenRecharge(player_guid)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local str = [[
		GetWay.Def[1].jump("MallUI", "充值")
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--每个脚本判断钱不够时 进入
function MoneyChange.LackMoney(player, money_type, money_val, f_name)
	--sLuaApp:LuaErr(f_name)
	if tonumber(money_type) == 1 then
		MoneyChange.ConfirmOpenRecharge(player, 2)
		return
	end
	if not money_val or not MoneyChange.Config["MoneyVal_"..money_type] then return end
	money_val = math.floor(tonumber(money_val))
	local lack_num = money_val - player:GetAttr(Lua_tools.GetMoneyAttrs(money_type))
	if lack_num <= 0 then return end
	local exchange_config = MoneyChange.Config["MoneyVal_"..money_type][1]
	if not exchange_config or not next(exchange_config) then
		sLuaApp:LuaErr("缺少配置  MoneyChange.Config.MoneyVal_"..money_type)
		return 
	end
	
	local need_change_num = math.ceil(lack_num / exchange_config["ChangeRatio"])
	
	local str = [[GlobalUtils.ShowServerBoxMessage("您的]]..Lua_tools.GetMoneyName(money_type)..[[不足，还差]]..lack_num..[[，]]
	str = str .. [[是否消耗]]..need_change_num..Lua_tools.GetMoneyName(exchange_config["ChangeFrom"])..[[补充不足？")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "MoneyChange.UseOtherMoney("..player:GetGUID()..","..money_type..","..lack_num..",'"..f_name.."')")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function MoneyChange.UseOtherMoney(player_guid, money_type, lack_num, f_name)
	--sLuaApp:LuaErr("UseOtherMoney")
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)

	local exchange_config = MoneyChange.Config["MoneyVal_"..money_type][1]
	if not exchange_config or not next(exchange_config) then
		sLuaApp:LuaErr("缺少配置  MoneyChange.Config.MoneyVal_"..money_type)
		return 
	end
	
	local need_change_num = math.ceil(lack_num / exchange_config["ChangeRatio"])
	--sLuaApp:LuaErr("need_change_num"..need_change_num)
	local change_from_type = exchange_config["ChangeFrom"]
	if not Lua_tools.IsMoneyEnough(player, change_from_type, need_change_num) then
		if change_from_type == 1 then
			MoneyChange.ConfirmOpenRecharge(player, 2)
		else
			local lack_need_change_num = need_change_num - player:GetAttr(Lua_tools.GetMoneyAttrs(change_from_type))
			--sLuaApp:LuaErr("lack_need_change_num"..lack_need_change_num)
			MoneyChange.LackMoney(player, change_from_type, lack_need_change_num, f_name)
		end
		return
	end
	
	Lua_tools.SubMoney(player, change_from_type, need_change_num, "system", "货币兑换", f_name)
	
	local add_num = need_change_num * exchange_config["ChangeRatio"]
	if Lua_tools.AddMoney(player, money_type, add_num, "system", "货币兑换", f_name) then
		sLuaApp:NotifyTipsMsg(player,"获得"..add_num..Lua_tools.GetMoneyName(money_type))
	else
		sLuaApp:LuaErr("MoneyChange.UseOtherMoney player"..player:GetName().." AddMoney失败")
	end
	--sLuaApp:LuaErr(f_name)
	assert(load("local player = sPlayerSystem:GetPlayerByGUID('"..player_guid.."') return "..f_name))()
end