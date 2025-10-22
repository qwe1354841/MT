--装备修理
RepairSystem = {}
--修理单个装备，mod0普通修理，mod1使用必定成功道具，无特殊需求客户端传0
function RepairSystem.repairEquip(player,equip,mod)
	--sLuaApp:LuaErr("RepairSystem.repairEquip")
	local money = RepairSystem.getEquipRepairMoney(equip)
	if money < 0 then
		sLuaApp:NotifyTipsMsg(player, "配置错误，修理系数不存在")
		sLuaApp:LuaErr("RepairSystem.repairEquip is err , money < 0")
		return
	end
	if money == 0 then
		sLuaApp:NotifyTipsMsg(player, "该装备目前不需要修理")
		return
	end
	if not Lua_tools.IsMoneyEnough(player, RepairConfig.MoneyType, money) then
		if MoneyChange then
			local f_name = [[RepairSystem.repairEquip(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),sItemSystem:GetItemByGUID (]]..equip:GetGUID()..[[),tonumber(]]..mod..[[))]]
			MoneyChange.LackMoney(player, RepairConfig.MoneyType, money, f_name)
		else
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(RepairConfig.MoneyType).."不足，无法进行修理")
		end
		return
	end
	local item_list = {}
	if equip:GetString("RepairItemList") ~= "" then
		item_list = assert(load("return " .. equip:GetString("RepairItemList")))()
		if mod == 0 then
			if not Lua_tools.IsItemEnough(player, item_list['ItemList']) then
				sLuaApp:NotifyTipsMsg(player, "道具不足，无法修理！")
				--这里可以添加一键购买
				return
			end
		elseif mod == 1 then
			if not Lua_tools.IsItemEnough(player, item_list['ItemList']) then
				sLuaApp:NotifyTipsMsg(player, "道具不足，无法修理！")
				--这里可以添加一键购买
				return
			end
			if not Lua_tools.IsItemEnough(player, item_list['SucceedItem']) then
				sLuaApp:NotifyTipsMsg(player, "道具不足，无法修理！")
				--这里可以添加一键购买
				return
			end
		end
	end
	--修理失败
	if mod == 0 then
		local Rate = RepairConfig.Rate
		if Rate < 10000 then
			local FailMax = equip:GetInt("FailMax")
			if FailMax ~= 0 then
				local FailNow = equip:GetInt("FailNow")
				if FailMax == FailNow then
					sLuaApp:NotifyTipsMsg(player, "已经达到修理失败次数上限，请使用必定成功方法修理！")
					return
				end
			end
			if sLuaApp:RandInteger(1,10000) > Rate then
				if RepairSystem.subItemAndMoney(player,equip,mod) then
					if FailMax ~= 0 then
						equip:SetInt("FailNow",(equip:GetInt("FailNow")+1))
					end
					sLuaApp:NotifyTipsMsg(player, "你好惨呀，修理失败！")
				end
				return 
			end
		end
	end
	
	--修理成功
	if RepairSystem.subItemAndMoney(player,equip,mod) then
		RepairSystem.setDurableNow(equip,2,0)
		sLuaApp:NotifyTipsMsg(player, "修理成功！")
	end
end

--全部修理 只支持银币，且必定成功，否则无法使用！mod=0身上装备 mod=1背包装备
function RepairSystem.repairAll(player,mod)
	--sLuaApp:LuaErr("RepairSystem.repairAll")
	local ITEM_CONTAINER = 0 
	if mod == 0 then
		ITEM_CONTAINER = ITEM_CONTAINER_EQUIP
	elseif mod == 1 then
		ITEM_CONTAINER = ITEM_CONTAINER_BAG
	end
	local ItemContainer = player:GetItemContainer(ITEM_CONTAINER)
	local equit_tb = ItemContainer:GetItemList()
	local money_all = 0
	local str = ""
	for k,v in pairs(equit_tb) do
		if v:GetString("RepairItemList") == "" then
			local money = RepairSystem.getEquipRepairMoney(v)
			if money >= 0 then
				money_all = money_all + money
			else
				sLuaApp:NotifyTipsMsg(player, "修理所有装备出错，某个装备系数不存在")
				return
			end	
		end
	end
	if money_all == 0 then
		sLuaApp:NotifyTipsMsg(player, "当前装备都不需要修理！")
		return
	end
	if not Lua_tools.IsMoneyEnough(player, RepairConfig.MoneyType, money_all) then
		if MoneyChange then
			local f_name = [[RepairSystem.repairAll(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),tonumber(]]..mod..[[))]]
			MoneyChange.LackMoney(player, RepairConfig.MoneyType, money_all, f_name)
		else
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(RepairConfig.MoneyType).."不足，无法进行修理")
		end
		return
	end
	if not Lua_tools.SubMoney(player, RepairConfig.MoneyType, money_all, "repair", "moneytype = "..RepairConfig.MoneyType, "v = "..money_all) then
		sLuaApp:NotifyTipsMsg(player, "修理出错，钱")	
		return false
	end
	for k,v in pairs(equit_tb) do
		if v:GetString("RepairItemList") == "" then
			RepairSystem.setDurableNow(v,2,0)
		else
			str = "部分道具需要使用道具，请单独修理！"
		end
	end
	sLuaApp:NotifyTipsMsg(player, "修理成功！"..str)
end

function RepairSystem.subItemAndMoney(player,equip,mod)
	if equip:GetString("RepairItemList") ~= "" then
		item_list = assert(load("return " .. equip:GetString("RepairItemList")))()
		if mod == 0 then
			if not Lua_tools.SubItem(player, item_list['ItemList'], "repair", "mod0", "ItemList") then
				sLuaApp:NotifyTipsMsg(player, "修理出错，需要道具，mod0")
				return false
			end
		elseif mod == 1 then
			if not Lua_tools.SubItem(player, item_list['ItemList'], "repair", "mod1", "ItemList") then
				sLuaApp:NotifyTipsMsg(player, "修理出错，需要道具，普通道具，mod1")
				return false
			end
			if not Lua_tools.SubItem(player, item_list['SucceedItem'], "repair", "mod1", "SucceedItem") then
				sLuaApp:NotifyTipsMsg(player, "修理出错，需要道具，成功道具，mod1")
				return false
			end
		end
	end
	local money = RepairSystem.getEquipRepairMoney(equip)
	if not Lua_tools.SubMoney(player, RepairConfig.MoneyType, money, "repair", "moneytype = "..RepairConfig.MoneyType, "v = "..money) then
		sLuaApp:NotifyTipsMsg(player, "修理出错，钱")	
		return false
	end
	
	return true
end

function RepairSystem.on_login(player)
	local str = [[
			UIDefine.Repair_MoneyType = ]]..RepairConfig.MoneyType..[[
			UIDefine.Repair_Rate = ]]..RepairConfig.Rate..[[
		]]
	sLuaApp:ShowForm(player,"脚本表单", str)	
end

function RepairSystem.createEquip(equip)
	--sLuaApp:LuaErr("RepairSystem.createEquip")
	RepairSystem.setDurableMax(equip)
	RepairSystem.setDurableNow(equip,0,0)
	RepairSystem.setFailMax(equip)
	RepairSystem.setFailNow(equip,0)
	RepairSystem.setRepairItemList(equip)
	RepairSystem.setRepairCoefficient(equip)
end

function RepairSystem.changeEquipLevel(equip)
	local equip_level = math.floor((RepairSystem.getEquipLevel(equip))/10)*10
	if equip_level == 0 then 
		equip_level = 1
	end
	return equip_level
end

function RepairSystem.setRepairCoefficient(equip)
	local Coefficient = 0
	local equip_level = RepairSystem.changeEquipLevel(equip)
	if RepairConfig.Coefficient[equip_level] then
		Coefficient = RepairConfig.Coefficient[equip_level]
	end 
	equip:SetInt("Coefficient",Coefficient)
end

function RepairSystem.getEquipRepairMoney(equip)
	local money = -1
	local equip_level = RepairSystem.changeEquipLevel(equip)
	local DurableNow = equip:GetInt("DurableNow")
	local DurableMax = equip:GetInt("DurableMax")
	if not RepairConfig.Coefficient[equip_level] then
		return money
	end
	money = (DurableMax - DurableNow)*RepairConfig.Coefficient[equip_level]
	return money
end

function RepairSystem.getEquipData(equip)
	return ItemConfig.GetByKeyName(equip:GetKeyName())
end

function RepairSystem.getEquipId(equip)
	return RepairSystem.getEquipData(equip).Id
end

function RepairSystem.getEquipGrade(equip)
	return RepairSystem.getEquipData(equip).Grade
end

function RepairSystem.getEquipLevel(equip)
	return RepairSystem.getEquipData(equip).Level
end

function RepairSystem.getDurableMax(equip)
	if RepairConfig.NoDurable[RepairSystem.getEquipId(equip)] then
		return 0
	end
	local equip_data = ItemConfig.GetByKeyName(equip:GetKeyName())
	--[（装备等级/10）取整]*10+100+品质*50
	local DurableMin = math.floor((RepairSystem.getEquipGrade(equip))/10)*10+100+(RepairSystem.getEquipGrade(equip))*50
	local DurableMax = DurableMin + 100
	return sLuaApp:RandInteger(DurableMin,DurableMax)
end

function RepairSystem.setDurableMax(equip)
	local DurableMax = RepairSystem.getDurableMax(equip)
	equip:SetInt("DurableMax",DurableMax)
end
--mod 0初始化，1按照PVE消耗1点，2修理成功,3万分比消耗(PVE消耗概率),4万分比消耗(PVP消耗概率),5数值消耗(PVE消耗概率),6数值消耗(PVP消耗概率)
function RepairSystem.setDurableNow(equip,mod,num)
	local type = -1
	if equip:GetInt("DurableMax") == 0 then
		return type
	end
	 
	local DurableNow = equip:GetInt("DurableNow")
	local DurableLose = 0 
	if mod == 0 or mod == 2 then
		DurableNow = equip:GetInt("DurableMax")
	end
	if mod == 1 then
		if DurableNow <= 0 then
			return type
		end
		if sLuaApp:RandInteger(1,10000) <= RepairConfig.CutProbability then
			DurableLose = RepairConfig.DurableNum
		end
	end
	if mod == 3 then
		if DurableNow <= 0 then
			return type
		end
		if num > 10000 then
			num = 10000
		end
		if num < 0 then
			return type
		end
		if sLuaApp:RandInteger(1,10000) <= RepairConfig.CutProbability then
			DurableLose = math.ceil(equip:GetInt("DurableMax")*num/10000)
		end
	end
	if mod == 4 then
		if DurableNow <= 0 then
			return type
		end 
		if num > 10000 then
			num = 10000
		end
		if num < 0 then
			return type
		end
		if sLuaApp:RandInteger(1,10000) <= RepairConfig.CutProbability_PVP then
			DurableLose = math.ceil(equip:GetInt("DurableMax")*num/10000)
		end
	end
	if mod == 5 then
		if DurableNow <= 0 then
			return type
		end
		if num < 0 then
			return type
		end
		if sLuaApp:RandInteger(1,10000) <= RepairConfig.CutProbability then
			DurableLose = math.ceil(num)
		end
	end
	if mod == 6 then
		if DurableNow <= 0 then
			return type
		end
		if num < 0 then
			return type
		end
		if sLuaApp:RandInteger(1,10000) <= RepairConfig.CutProbability_PVP then
			DurableLose = math.ceil(num)
		end
	end
	DurableNow = DurableNow - DurableLose
	type = 3
	if DurableNow <= 0 then
		DurableNow = 0
		--耐久为0时设置装备不生效,重计算
		local guid = equip:GetOwnerGUID()
		if guid ~= "" then
			local player = sPlayerSystem:GetPlayerByGUID(guid)
			if player then
				equip:SetEnabled(false)
				player:RecalcAttr()
				type = 1
			end
		end
	end
	equip:SetInt("DurableNow",DurableNow)
	if mod == 2 then
		local guid = equip:GetOwnerGUID()
		if guid ~= "" then
			local player = sPlayerSystem:GetPlayerByGUID(guid)
			if player then
				equip:SetEnabled(true)
				player:RecalcAttr()
				type = 2
			end
		end
	end
	return type
end

function RepairSystem.setFailNow(equip,mod)
	local FailNow = equip:GetInt("FailNow")
	if mod == 0 then
		FailNow = 0
	end
	if mod == 1 then
		FailNow = FailNow + 1
	end
	if FailNow > equip:GetInt("FailMax") then
		return
	end
	equip:SetInt("FailNow",FailNow)
end

function RepairSystem.setFailMax(equip)
	local FailMax = RepairSystem.getFailMax(equip)
	equip:SetInt("FailMax",FailMax)
end

function RepairSystem.getFailMax(equip)
	local equip_data = ItemConfig.GetByKeyName(equip:GetKeyName())
	local FailMax = 0 
	if RepairConfig.FailMax[equip_data.Id] then
		FailMax = RepairConfig.FailMax[equip_data.Id]
	end
	return FailMax
end

function RepairSystem.setRepairItemList(equip)
	local equip_data = ItemConfig.GetByKeyName(equip:GetKeyName())
	if RepairConfig.Item[equip_data.Id] then
		equip:SetString("RepairItemList",tostring(Lua_tools.serialize(RepairConfig.Item[equip_data.Id])))
	end
end

function RepairSystem.SubEquipDurable(player)
	local ItemContainer = player:GetItemContainer(5)
	local equit_tb = ItemContainer:GetItemList()
	local type = 0
	for k,v in pairs(equit_tb) do
		local a = RepairSystem.setDurableNow(v,1,0)
		if a == 1 then
			type = 1
		end
	end
	if type == 1 then
		sLuaApp:NotifyTipsMsg(player, "有装备已损坏，请尽快修理")
	end
end

function RepairSystem.SubEquipDurableEx(player,num,fight_type)
	if num < 0 then
		return false
	end	
	if fight_type == 0 then
		fight_type = 5
	elseif fight_type == 1 then
		fight_type = 6
	else
		return false
	end
	local type = 0
	local ItemContainer = player:GetItemContainer(5)
	local equit_tb = ItemContainer:GetItemList()
	for k,v in pairs(equit_tb) do
		local a = RepairSystem.setDurableNow(v,fight_type,num)
		if a == 1 then
			type = 1
		end
	end
	if type == 1 then
		sLuaApp:NotifyTipsMsg(player, "有装备已损坏，请尽快修理")
	end
	return true
end

function RepairSystem.SubEquipDurable_ByProportion(player,num,fight_type)
	if num > 10000 then
		num = 10000
	end
	if num < 0 then
		return false
	end
	if fight_type == 0 then
		fight_type = 3
	elseif fight_type == 1 then
		fight_type = 4
	else
		return false
	end
	local type = 0
	local ItemContainer = player:GetItemContainer(5)
	local equit_tb = ItemContainer:GetItemList()
	for k,v in pairs(equit_tb) do
		local a = RepairSystem.setDurableNow(v,fight_type,num)
		if a == 1 then
			type = 1
		end
	end
	if type == 1 then
		sLuaApp:NotifyTipsMsg(player, "有装备已损坏，请尽快修理")
	end
	return true
end

