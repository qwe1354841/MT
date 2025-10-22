--装备相关表单

FormRecharge = {}

function FormRecharge.GetData(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.GetData(player, 0, param)
	end
	return ""
end

function FormRecharge.GetConfig(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.GetConfig(player, param)
	end
	return ""
end

function FormRecharge.SetRechargeType(player, types, index, value, strs)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.SetRechargeType(player, types, index, value, strs)
	end
	return ""
end

function FormRecharge.LevelFund_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.LevelFund_Receive(player, param)
	end
	return ""
end

function FormRecharge.ConsumIngotOfDay_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.ConsumIngotOfDay_Receive(player, param)
	end
	return ""
end

function FormRecharge.ConsumIngotOfAcc_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.ConsumIngotOfAcc_Receive(player, param)
	end
	return ""
end

function FormRecharge.BuyOfDay_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.BuyOfDay_Receive(player, param)
	end
	return ""
end

function FormRecharge.RMBShopOfOnce_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.RMBShopOfOnce_Receive(player, param)
	end
	return ""
end

function FormRecharge.RechargeOfDay_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.RechargeOfDay_Receive(player, param)
	end
	return ""
end

function FormRecharge.RechargeOfAcc_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.RechargeOfAcc_Receive(player, param)
	end
	return ""
end

function FormRecharge.RechargeOfCon_Receive(player)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.RechargeOfCon_Receive(player)
	end
	return ""
end

function FormRecharge.LuckyWheel_Start(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.LuckyWheel_Start(player, param)
	end
	return ""
end

function FormRecharge.LuckyWheel_Receive(player)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.LuckyWheel_Receive(player)
	end
	return ""
end

function FormRecharge.LuckyWheel_Start_Tenth(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.LuckyWheel_Start_Tenth(player, param)
	end
	return ""
end

function FormRecharge.LuckyWheel_Receive_Tenth(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.LuckyWheel_Receive_Tenth(player)
	end
	return ""
end

function FormRecharge.MonthCard_Receive(player, param)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.MonthCard_Receive(player, param)
	end
	return ""
end

function FormRecharge.ChainPackOfDay_Buy(player)
	if not MainUISwitch.CheckOpenLevel(player,"超值") then
        return ""
    end
	if RechargeSystem then
		RechargeSystem.ChainPackOfDay_Buy(player)
	end
	return ""
end

function FormRecharge.GMRecharge(player, name, gold)
	if name == "" or gold == "" then
		return "无效操作"
	end
	gold = tonumber(gold)
	if gold >= 1000000000 then
		return "每次最多充值到账1000000000元宝哦"
	end
	local user = sPlayerSystem:GetPlayerByName(name)
	if user then
		Lua_tools.AddMoney(user, 1, gold, "GM_RECHARGE", "发放者账号ID = "..player:GetUserName().." 发放者 NAME = " .. player:GetName(), "接收方账号ID = "..user:GetUserName().." 接收方NAME = " .. user:GetName())
		sLuaApp:NotifyTipsMsg(player, "充值成功！")
	end
	return ""
end

function FormRecharge.GetRechargeInfByUserID(player)
	if not player then
		return ""
	end
	if RechargeSystem then
		RechargeSystem.GetRechargeInfByUserID(player)
	end
	return ""
end

function FormRecharge.DelRechargeInfByOrder(player,order)
	if not player then
		return ""
	end
	if not order then
		return ""
	end
	if RechargeSystem then
		RechargeSystem.DelRechargeInfByOrder(player,order)
	end
	return ""
end

function FormRecharge.RechargeOfCon_Pay(player)
	if not player then
		return ""
	end
	if RechargeSystem then
		RechargeSystem.RechargeOfCon_Pay(player)
	end
	return ""
end