--宠物装备修理
PetEquipRepair = {}

-- 装备后才会消耗耐久，装备后绑定， 不会出现 是否使用非绑修理材料 的情况 
--装备创建时可能耐久度不满，需要判断此情况 

--设置装备耐久度  
function PetEquipRepair.CreateSetDurable(item)
	if not PetEquipRepairConfig then
		sLuaApp:LuaErr("缺少 PetEquipRepairConfig")
		return
	end
	local item_keyname = item:GetKeyName()
	local durable_num = 0
	local durable_config = PetEquipRepairConfig.DurableMaxEx[item_keyname]
	if durable_config then
		durable_num = PetEquipRepair.RewardConfigToNmber(item, durable_config)
	else
		durable_num	= PetEquipRepair.RewardConfigToNmber(item, PetEquipRepairConfig.DurableMax)
	end
	item:SetInt("EquipDurableMax", durable_num)
	item:SetInt("EquipDurableVal", durable_num)
	--sLuaApp:LuaErr("durable_num"..durable_num)
end

--扣除上阵宠物装备耐久度 --typ == 1 固定数值 --typ  == 2 最大耐久度万分比 向上取整
function PetEquipRepair.TakeOffLineupDurable(player, typ, num)
	if not typ or not num or num <= 0 then return end
	local fight_pet_list = Lua_tools.GetFightPets(player, true)
	local all_item_list = {}
	for _,pet in ipairs(fight_pet_list) do
		local equip_con = pet:GetEquipContainer()
		for i = 0 ,3 do
			local item = equip_con:GetItemBySite(i)
			if item then
				table.insert(all_item_list, item)
			end
		end
	end
	
	if typ == 1 then
		for _,v in ipairs(all_item_list) do
			PetEquipRepair.TakeOffDurable(v, num)
		end
	elseif typ == 2 then
		for _,v in ipairs(all_item_list) do
			local durable_max = v:GetInt("EquipDurableMax")
			local cut_num = math.ceil(num / 10000 * durable_max)
			PetEquipRepair.TakeOffDurable(v, cut_num)
		end
	end
end

--扣除装备耐久度
function PetEquipRepair.TakeOffDurable(item, num)
	local cut_num = 1
	if num then
		cut_num = num
	end
	local durable_val = item:GetInt("EquipDurableVal") - cut_num
	if durable_val < 0 then
		durable_val = 0
	end
	item:SetInt("EquipDurableVal", durable_val)
	if durable_val == 0 then
		item:SetEnabled(false)
		local owner = item:GetItemContainer():GetOwner()
		local owner_type = owner:GetType()
		if owner_type == GUID_PLAYER then
			sLuaApp:NotifyTipsMsg(owner, "宠物装备"..item:GetName().."已损坏，请及时修理！")
		elseif owner_type == GUID_PET then
			owner:RecalcAttr()
			sLuaApp:NotifyTipsMsg(owner:GetOwner(), "宠物装备"..item:GetName().."已损坏，请及时修理！")
		else
			sLuaApp:LuaErr("PetEquipRepair  owner_type 错误 "..owner_type)
		end
	end
end


function PetEquipRepair.GetData(player)
	local str = [[
			if PetEquipRepairUI then ]]
	str = str ..PetEquipArtifice.GetData(player)
	str = str..[[
				PetEquipRepairUI.PetEquipRepair_GradeCoefficient =]].. Lua_tools.serialize(PetEquipRepairConfig.RepairGradeCoefficient)..[[
				PetEquipRepairUI.PetEquipRepair_Consume =]].. Lua_tools.serialize(PetEquipRepairConfig.RepairConsume)..[[
				PetEquipRepairUI.PetEquipRepair_ConsumeEx =]].. Lua_tools.serialize(PetEquipRepairConfig.RepairConsumeEx)..[[			
			PetEquipRepairUI.RefreshServerData()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaDbg("str"..str)
end

--单个修理装备  -- mod == 1 勾选 优先使用非绑材料 else 未勾选
function PetEquipRepair.RepairOnce(player, item_guid, mod)
	if not item_guid then return end
	local item = sItemSystem:GetItemByGUID(item_guid)
	if not item then return end
	if not PetEquipRepair.CheckItemOwner(player, item) then
		sLuaApp:LuaErr("PetEquipRepair "..item_guid.."不属于"..player:GetName())
		return
	end
	
	local lack_durable = PetEquipRepair.LackDurable(item) -- 损失的耐久值
	if lack_durable <= 0 then
		sLuaApp:NotifyTipsMsg(player, "该宠物装备无需修理！")
		return
	end
	
	local consume_config = PetEquipRepair.GetConsumeConfig(item)
	
	local consume_tb = {}--扣除时用
	-- 判断钱
	local consume_money_type = consume_config["MoneyType"]
	local consume_money_val_coef = consume_config["MoneyValCoef"]
	local consume_money_val = 0
	if consume_money_type and consume_money_val_coef and consume_money_val_coef ~= 0 then
		consume_money_val = PetEquipRepair.RewardConfigToNmber(item, consume_money_val_coef) * lack_durable
		if not Lua_tools.IsMoneyEnough(player, consume_money_type, consume_money_val) then
			if MoneyChange then
				local f_name = [[PetEquipRepair.RepairOnce(player,]]..item_guid..[[,]]..mod..[[)]]
				MoneyChange.LackMoney(player, consume_money_type, consume_money_val, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consume_money_type).."不足！")
			end
			return
		end
		consume_tb["Money"] = {}
		consume_tb["Money"][consume_money_type] = consume_money_val
	end
	
	-- 判断物品
	local consume_item = consume_config["Item"]
	if consume_item and next(consume_item) then
		if not Lua_tools.IsItemEnough(player, consume_item) then
			sLuaApp:NotifyTipsMsg(player, "您的修理材料不足！")
			if OneKeyBuy then
				local defect_list = Lua_tools.GetDefectList(player, consume_item)
				OneKeyBuy.Main(player, defect_list)
			end
			return
		end
		consume_tb["Item"] = consume_item
		-- 判断绑定
		local is_item_bind = item:IsBound()
		if not is_item_bind then			
			if mod == 1 then
				for k,v in ipairs(consume_item) do
					if type(v) == "string" then
						local consume_item_unbind_num = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(v), 1)
						if consume_item_unbind_num < consume_item[k+1] then
							local str = [[GlobalUtils.ShowServerBoxMessage("消耗绑定材料修理装备，将导致装备绑定，是否继续？")]]
							local set_str = "PetEquipRepair.TakeOffConsume(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),{sItemSystem:GetItemByGUID("..item_guid..")},assert(load(return "..Lua_tools.serialize(consume_tb).."))(),"..mod..",true)"
							player:SetString("SYSTEM_ConfirmBox_Function", set_str)
							sLuaApp:ShowForm(player, "脚本表单", str)
							return
						end		
					end
				end
			else
				for k,v in ipairs(consume_item) do
					if type(v) == "string" then
						local consume_item_bind_num = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(v), 2)
						if consume_item_bind_num >= 1 then
							local str = [[GlobalUtils.ShowServerBoxMessage("消耗绑定材料修理装备，将导致装备绑定，是否继续？")]]
							local set_str = "PetEquipRepair.TakeOffConsume(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),{sItemSystem:GetItemByGUID("..item_guid..")},assert(load([[return "..Lua_tools.serialize(consume_tb).."]]))(),"..mod..",true)"
							player:SetString("SYSTEM_ConfirmBox_Function", set_str)
							sLuaApp:ShowForm(player, "脚本表单", str)
							return
						end
					end
				end
			end	
		end
	end
	PetEquipRepair.TakeOffConsume(player, {item}, consume_tb, mod, false)
	
	local str = [[
		if PetEquipRepairUI then
			PetEquipRepairUI.RefreshOnRepairClick()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--检查装备主人
function PetEquipRepair.CheckItemOwner(player, item)
	local owner = item:GetItemContainer():GetOwner()
	local owner_type = owner:GetType()
	if owner_type == GUID_PLAYER then
		if player == owner then
			return true
		end
	elseif owner_type == GUID_PET then
		if owner:GetOwner() == player then
			return true
		end
	else
		sLuaApp:LuaErr("PetEquipRepair  owner_type 错误 "..owner_type)
	end
	return false
end
--扣除消耗 加满耐久
function PetEquipRepair.TakeOffConsume(player, item_tb, consume_tb, mod, set_item_bind)
	local money_tb = consume_tb["Money"]
	if money_tb and next(money_tb) then
		for k,v in pairs(money_tb) do
			local consume_money_type = k
			local consume_money_val = v
			if consume_money_type and consume_money_val then
				if not Lua_tools.SubMoney(player, consume_money_type, consume_money_val, "system", "宠物装备修理", "修理消耗") then
					sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consume_money_type).."不足")
					return
				end
			end
		end
	end
	
	local consume_item = consume_tb["Item"]
	if consume_item and next(consume_item) then
		for k,v in ipairs(consume_item) do
			if type(v) == "string" then
				if sItemSystem:ConsumeItemWithPriority(player, sItemSystem:GetItemIdByKeyname(v), consume_item[k+1], mod ~= 1, "system", "宠物装备修理", "修理消耗")["code"] ~= 0 then
					sLuaApp:LuaErr("PetEquipRepair.TakeOffConsume   ConsumeItemWithPriority失败")
					return
				end
			end
		end
	end
	
	for _,v in ipairs(item_tb) do
		if set_item_bind then
			v:SetBound()
		end
		PetEquipRepair.Repair(v)
	end
	sLuaApp:NotifyTipsMsg(player,"修理成功！")
end

--修理全部 -- 修理所有宠物装备中的装备 
function PetEquipRepair.RepairAll(player, check_mod)
	local pet_con = player:GetPetContainer(PET_CONTAINER_PANEL)
	local pet_list = pet_con:GetPetList()
	
	local all_item_list = {}
	for _,v in ipairs(pet_list) do
		local equip_con = v:GetEquipContainer()
		for i = 0 ,3 do
			local item = equip_con:GetItemBySite(i)
			if item then
				table.insert(all_item_list, item)
			end
		end
	end
	local need_repair_item_tb = {}
	local consume_tb = {} --扣除时用
	consume_tb["Money"] = {}
	consume_tb["Item"] = {}
	for k,v in ipairs(all_item_list) do
		local lack_durable = PetEquipRepair.LackDurable(v) -- 损失的耐久值
		if lack_durable > 0 then
			local consume_config = PetEquipRepair.GetConsumeConfig(v)
			
			local consume_item = consume_config["Item"]
			if consume_item and next(consume_item) then
				for i,j in ipairs(consume_item) do
					if type(j) == "string" then
						local need_insert = true
						for a,b in ipairs(consume_tb["Item"]) do
							if b == j then
								consume_tb["Item"][a+1] = consume_tb["Item"][a+1] + consume_item[i+1]
								need_insert = false
								break
							end
						end
						if need_insert then
							table.insert(consume_tb["Item"],j)
							table.insert(consume_tb["Item"],consume_item[i+1])
						end
					end
				end
			else
				local consume_money_type = consume_config["MoneyType"]
				local consume_money_val_coef = consume_config["MoneyValCoef"]
				local consume_money_val = 0
				if consume_money_type and consume_money_val_coef and consume_money_val_coef ~= 0 then
					consume_money_val = PetEquipRepair.RewardConfigToNmber(v, consume_money_val_coef) * lack_durable
					if not consume_tb["Money"][consume_money_type] then
						consume_tb["Money"][consume_money_type] = consume_money_val
					else
						consume_tb["Money"][consume_money_type] = consume_tb["Money"][consume_money_type] + consume_money_val 
					end
				end
			
				table.insert(need_repair_item_tb, v)
			end
		end
	end
	
	local consum_item_str = ""
	for _,v in ipairs(consume_tb["Item"]) do
		if type(v) == "string" then
			local consume_item_data = ItemConfig.GetByKeyName(v)
			if not consume_item_data then
				sLuaApp:LuaErr("ItemConfig 不存在 "..v)
				return
			end
			consum_item_str = consum_item_str .. "【"..consume_item_data.Name .."】"
		end
	end
	consume_tb["Item"] = {}--周师傅需求  全部修理去掉 需要物品的修理	
	
	--sLuaApp:LuaErr("All  consume_tb  "..Lua_tools.serialize(consume_tb))
	-- if not next(consume_tb["Money"]) and not next(consume_tb["Item"]) then
		-- sLuaApp:NotifyTipsMsg(player, "所有宠物装备均已修理完成！")
		-- return
	-- end
	if not next(need_repair_item_tb) then
		if consum_item_str == "" then
			sLuaApp:NotifyTipsMsg(player, "所有宠物装备均已修理完成！")
			return
		else
			sLuaApp:NotifyTipsMsg(player, "所有宠物装备均已修理完成！消耗"..consum_item_str.."修复的装备请自行修理！")
			return
		end
	end
	
	for k,v in pairs(consume_tb["Money"]) do
		if not Lua_tools.IsMoneyEnough(player, k, v) then
			if MoneyChange then
				local f_name = [[PetEquipRepair.RepairAll(player,]]..check_mod..[[)]]
				MoneyChange.LackMoney(player, k, v, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(k).."不足！")
			end
			return
		end
	end
	--周师傅需求  全部修理去掉 需要物品的修理
	-- if next(consume_tb["Item"]) then
		-- if not Lua_tools.IsItemEnough(player, consume_tb["Item"]) then
			-- sLuaApp:NotifyTipsMsg(player, "您的修理材料不足！")
			-- if OneKeyBuy then
				-- local defect_list = Lua_tools.GetDefectList(player, consume_tb["Item"])
				-- OneKeyBuy.Main(player, defect_list)
			-- end
			-- return
		-- end
	-- end
	
	if not check_mod or check_mod ~= 1 then
		local consume_str = "修理全部装备需要"
		if next(consume_tb["Money"]) then
			for k,v in pairs(consume_tb["Money"]) do
				consume_str = consume_str .. v.. Lua_tools.GetMoneyName(k).."，"
			end
		end		
		-- if next(consume_tb["Item"]) then
			-- for k,v in ipairs(consume_tb["Item"]) do
				-- if type(v) == "string" then
					-- local consume_item_data = ItemConfig.GetByKeyName(v)
					-- if not consume_item_data then
						-- sLuaApp:LuaErr("ItemConfig 不存在 "..v)
						-- return
					-- end
					-- consume_str = consume_str .. consume_item_data.Name .. "*" .. consume_tb["Item"][k+1].."，"
				-- end
			-- end
		-- end
		consume_str = consume_str .. "是否进行修理？"
		if consum_item_str ~= "" then
			consume_str = consume_str .. "消耗"..consum_item_str.."修复的装备请自行修理！"
		end
		
		local str = [[GlobalUtils.ShowServerBoxMessage("]]..consume_str..[[")]]
		local set_str = [[PetEquipRepair.RepairAll(sPlayerSystem:GetPlayerByGUID(]].. player:GetGUID() ..[[),1)]]
		player:SetString("SYSTEM_ConfirmBox_Function", set_str)
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	PetEquipRepair.TakeOffConsume(player, need_repair_item_tb, consume_tb, 2, false)
	local str = [[
		if PetEquipRepairUI then
			PetEquipRepairUI.RefreshOnRepairClick()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--加满
function PetEquipRepair.Repair(item)
	item:SetInt("EquipDurableVal", item:GetInt("EquipDurableMax"))
	if not item:IsEnabled() then
		item:SetEnabled(true)
		local owner = item:GetItemContainer():GetOwner()
		local owner_type = owner:GetType()
		if owner_type == GUID_PET then
			owner:RecalcAttr()
		end
	end
end

--损失的耐久值
function PetEquipRepair.LackDurable(item)
	local durable_val = item:GetInt("EquipDurableVal")
	local durable_max = item:GetInt("EquipDurableMax")
	if durable_val <= durable_max then
		return durable_max - durable_val
	end
	sLuaApp:LuaErr("PetEquipRepair.LackDurable 耐久值错误")
	return 0
end

function PetEquipRepair.GetConsumeConfig(item)
	local item_keyname = item:GetKeyName()
	local consume_config = PetEquipRepairConfig.RepairConsumeEx[item_keyname]
	if not consume_config then
		local item_data = ItemConfig.GetByKeyName(item:GetKeyName())
		if not item_data then
			sLuaApp:LuaErr("ItemConfig 不存在"..item:GetKeyName())
			return
		end
		local item_level = item_data.Level
		consume_config = PetEquipRepairConfig.RepairConsume["Level_"..item_level]
		if not consume_config then
			sLuaApp:LuaErr("PetEquipRepairConfig.RepairConsume 缺少 Level_"..item_level)
		end
	end
	return consume_config
end


--配置转数字
function PetEquipRepair.RewardConfigToNmber(item, add_num)
	local res_num = 0
	local item_data = ItemConfig.GetByKeyName(item:GetKeyName())
	if not item_data then
		sLuaApp:LuaErr("ItemConfig 不存在"..item:GetKeyName())
		return res_num
	end
	local item_grade = item_data.Grade
	local item_gradeCoef = PetEquipRepairConfig.RepairGradeCoefficient[item_grade] or 1
	local str_factor = [[
		local Level =]]..item_data.Level..[[
		local Grade =]]..item_grade..[[
		local GradeCoef =]]..item_gradeCoef..[[
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

function PetEquipRepair.smtd(player)
	local item_con = player:GetItemContainer(ITEM_CONTAINER_BAG)
	local item = item_con:GetItemBySite(0)
	sLuaApp:LuaErr("val = "..item:GetInt("EquipDurableVal"))
	sLuaApp:LuaErr("max = "..item:GetInt("EquipDurableMax"))

end