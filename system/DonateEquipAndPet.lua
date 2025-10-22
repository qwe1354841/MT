--捐献&功勋商店
DonateEquipAndPet = {}

DonateEquipAndPet.EquipConfig = {Types = 1, item_Type = 1, grade = {2,3,4,5}}	--可捐献装备
DonateEquipAndPet.PetConfig = {Types = 6, pet_Type = {2,3,4,5,6,7,8,9}}			--可捐献宠物

--可配置捐献的特殊道具，并设置捐献获得的宠物功勋或装备功勋
DonateEquipAndPet.SpecialDonateList = {
	--["10级白阔刀"] = {itemType = "Equip", DonatePrice = 20000},
	--["50级橙阔刀"] = {itemType = "Equip", DonatePrice = 20000},
	--["10级白重剑"] = {itemType = "Equip", DonatePrice = 22000},
	--["10级白绣伞"] = {itemType = "Equip", DonatePrice = 25000},
	--["无根草"] = {itemType = "Pet", DonatePrice = 38000},
	--["小绵羊"] = {itemType = "Pet", DonatePrice = 47000},
	--["蟹将军"] = {itemType = "Pet", DonatePrice = 99999},
}

DonateEquipAndPet.Equip_Sell_Formula =  "level == 0 and (Grade == 5 and math.floor(BuyGoldBind/1000)+1250 or level*level*level*Grade*0.002+5) or level*level*level*Grade*0.002+5"		--装备捐献价格的公式
DonateEquipAndPet.Pet_Sell_Formula = "(Type > 3 and ((Type == 4 or Type == 5) and math.pow(190-Type*20,3) or math.pow(30+Type*15,3)) or math.pow(carrylevel,3))*Type*0.002+5"	--宠物捐献价格的公式

DonateEquipAndPet.equipEnhanceLevel = 4;      --高品质装备强化等级
DonateEquipAndPet.petStar_HighQuality = 2;                --高品质宠物星级
DonateEquipAndPet.petSkillCount_HighQuality = 3;          --高品质宠物技能数量

DonateEquipAndPet.NPCID = 20200

--@newinter DonateEquipAndPet.GetTypeData(player)
function DonateEquipAndPet.GetTypeData(player)
	--sLuaApp:LuaDbg("玩家登录发送GetTypeData")
	local result = {}
	result.EquipConfig = DonateEquipAndPet.EquipConfig		--可捐献装备
	result.PetConfig = DonateEquipAndPet.PetConfig			--可捐献宠物
	result.Equip_Sell_Formula = DonateEquipAndPet.Equip_Sell_Formula	--装备捐献价格的公式
	result.Pet_Sell_Formula = DonateEquipAndPet.Pet_Sell_Formula		--宠物捐献价格的公式
	result.equipEnhanceLevel = DonateEquipAndPet.equipEnhanceLevel		--高品质装备强化等级
	result.petStar_HighQuality = DonateEquipAndPet.petStar_HighQuality	--高品质宠物星级
	result.petSkillCount_HighQuality = DonateEquipAndPet.petSkillCount_HighQuality	--高品质宠物技能数量
	result.SpecialDonateList = DonateEquipAndPet.SpecialDonateList
	local str = [[
		if UIDefine then
			UIDefine.DonateEquipAndPetData = ]]..Lua_tools.serialize(result)..[[
		end
	]]
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	--local petCon = player:GetPetContainer(1)
	--for k, v in pairs(petCon:GetPetList()) do
	--	sLuaApp:LuaDbg("v:"..v:GetType())
	--end
	return ""
end

--获取功勋商店配置
--@newinter DonateEquipAndPet.GetExploitShopData(player, version)
function DonateEquipAndPet.GetExploitShopData(player)
	local WeekDay = sLuaApp:WeekDay(0)
	if not DonateEquipAndPet.Structure or WeekDay ~= sVarSystem:GetWeekInt("DonateEquipAndPet_NowDaysByWeek") then
		DonateEquipAndPet.Initialization()
	end
	local player_guid = tostring(player:GetGUID())
	if not Data.DonateShopLimit then
		Data.DonateShopLimit = {}
	end
	if player:GetDayInt("DonateShopLimit") == 0 then
		Data.DonateShopLimit[player_guid] = {}
	end
	if not Data.DonateShopLimit[player_guid] then
		Data.DonateShopLimit[player_guid] = {}
	end
	local allBuyCnt = Lua_tools.serialize(Data.DonateShopLimit[player_guid])

	local str = [[
		if DonateShopUI then
			DonateShopUI.Donate_Structure = ]] .. DonateEquipAndPet.Structure .. [[
			DonateShopUI.Donate_ShopList = ]] .. DonateEquipAndPet.ShopList .. [[
			DonateShopUI.GetGoodsType()
		end	
	]]
	--sLuaApp:LuaDbg("===================发送数据")
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	local str = [[
		if DonateShopUI then
			DonateShopUI.allBuyCnt = ]]..allBuyCnt..[[
			DonateShopUI.RefreshGoodsScroll()
			DonateShopUI.RefreshUI()
		end
	]]
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--捐献单个装备
function DonateEquipAndPet.DonateOnceItem(player, item_guid, item_price)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if item == nil then
		return ""
	end
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:LuaErr("道具不属于该玩家"..player:GetName())
		return
	end

	local itemData = ItemConfig.GetById(item:GetId())
	local isSpecial = false
	if DonateEquipAndPet.SpecialDonateList then
		--sLuaApp:LuaDbg("特殊道具表存在")
		if DonateEquipAndPet.SpecialDonateList[itemData.KeyName] then
			isSpecial = true
		end
	end
	
	if itemData.Type ~= DonateEquipAndPet.EquipConfig["Types"] then
		sLuaApp:NotifyTipsMsg(player, "捐献的道具不是装备,无法捐献")
		return ""
	end
	local serve_data = 0
	if not isSpecial then
		serve_data = DonateEquipAndPet.GetEquipValue(itemData)
	else
		serve_data = DonateEquipAndPet.SpecialDonateList[itemData.KeyName]["DonatePrice"]
	end
	--player:SetInt("PetExploit", player:GetInt("PetExploit") + item_price)
	if not EquipGem.MaxGemNum then
		return ""
	end

	if not EquipGem.RemoveAllGem(player, item_guid) then
		return ""
	end

	if sItemSystem:ConsumeItem(item, 1, "捐献系统", "捐献系统捐献物资", "捐献系统捐献物资扣除道具") ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "捐献装备出错")
		return ""
	end

	--sLuaApp:LuaDbg("serve_data:"..serve_data)
	if tonumber(serve_data) == tonumber(item_price) then
		player:SetInt("EquipExploit", player:GetInt("EquipExploit") + serve_data)
		--sLuaApp:LuaDbg("EquipExploit:"..player:GetInt("EquipExploit"))
		sLuaApp:ShowForm(player, "脚本表单", "DonateUI.Refresh()")
		DonateEquipAndPet.GetEquipExploit(player)
	else
		sLuaApp:LuaErr("服务端计算数据与客户端发送数据不符")
		return ""
	end
	sLuaApp:NotifyTipsMsg(player, "捐献成功")
	return ""
end


--捐献单个宠物
function DonateEquipAndPet.DonateOncePet(player, pet_guid, pet_price)
	--sLuaApp:LuaDbg("捐献宠物")
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet == nil then
		return ""
	end
	if pet:GetOwner() ~= player then
		sLuaApp:LuaErr("宠物不属于该玩家"..player:GetName())
		return
	end
	
	if pet:GetType() ~= DonateEquipAndPet.PetConfig["Types"] then
		sLuaApp:NotifyTipsMsg(player, "捐献的道具不是宠物,无法捐献")
		return ""
	end
	
	--判断上阵
	if pet:IsLineup() then
		sLuaApp:NotifyTipsMsg(player, "您的宠物已上阵，请下阵后捐献")
		return ""
	end
	
	--判断锁定
	if pet:IsLocked() then
		sLuaApp:NotifyTipsMsg(player, "宠物已锁定，无法捐献！")
		return ""
	end
	
	local isSpecial = false
	
	if not PetSystem.ReturnPetEquip(player, {pet}) then
		return ""
	end
	
	local petname = pet:GetKeyName()
	local petData = PetConfig.GetByKeyName(petname)
	if DonateEquipAndPet.SpecialDonateList then
		--sLuaApp:LuaDbg("特殊道具表存在")
		if DonateEquipAndPet.SpecialDonateList[petname] then
			isSpecial = true
		end
	end
	
	local serve_data = 0
	if not isSpecial then
		serve_data = DonateEquipAndPet.GetPetValue(petData)
	else
		serve_data = DonateEquipAndPet.SpecialDonateList[petname]["DonatePrice"]
	end
	
	if sPetSystem:DestroyPet(pet,  "捐献系统", "捐献系统捐献物资", "捐献系统捐献物资扣除宠物") ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "捐献宠物出错")
		return ""
	end

	--sLuaApp:LuaDbg("serve_data:"..serve_data)
	if tonumber(serve_data) == tonumber(pet_price) then
		player:SetInt("PetExploit", player:GetInt("PetExploit") + serve_data)
		--sLuaApp:LuaDbg("PetExploit:"..player:GetInt("PetExploit"))
		sLuaApp:ShowForm(player, "脚本表单", "DonateUI.Refresh()")
		DonateEquipAndPet.GetPetExploit(player)
	else
		sLuaApp:LuaErr("服务端计算数据与客户端发送数据不符")
		return ""
	end
	sLuaApp:NotifyTipsMsg(player, "捐献成功")
	return ""
end

--捐献多个装备
function DonateEquipAndPet.DonateItems(player, item_list, item_all_price)
	local item_list = sLuaApp:StrSplit(item_list, "-")
	local serve_data = 0
	local desitemlist = {}
	--sLuaApp:LuaDbg("EquipExploit_1:"..player:GetInt("EquipExploit"))
	for k, v in pairs(item_list) do
		local item = sItemSystem:GetItemByGUID(v)
		if item == nil then
			return ""
		end
		if item:GetOwnerGUID() ~= player:GetGUID() then
			sLuaApp:LuaErr("道具不属于该玩家"..player:GetName())
			return
		end

		local itemData = ItemConfig.GetById(item:GetId())
		local isSpecial = false
		if DonateEquipAndPet.SpecialDonateList then
			if DonateEquipAndPet.SpecialDonateList[itemData.KeyName] then
				isSpecial = true
			end
		end
		if not EquipGem.RemoveAllGem(player, v) then
			return ""
		end
		
		if itemData.Type ~= DonateEquipAndPet.EquipConfig["Types"] then
			sLuaApp:NotifyTipsMsg(player, "捐献的道具不是装备,无法捐献")
			return ""
		end
		
		--player:SetInt("PetExploit", player:GetInt("PetExploit") + item_price)
		if not isSpecial then
			serve_data = serve_data + DonateEquipAndPet.GetEquipValue(itemData)
		else
			serve_data = serve_data + DonateEquipAndPet.SpecialDonateList[itemData.KeyName]["DonatePrice"]
		end
		
		table.insert(desitemlist, item)
	end
	for k, v in ipairs(desitemlist) do
		if sItemSystem:ConsumeItem(v, 1, "捐献系统", "捐献系统捐献物资", "捐献系统捐献物资扣除道具") ~= 0 then
			sLuaApp:NotifyTipsMsg(player, "捐献装备出错")
			return ""
		end
	end
	
	--sLuaApp:LuaDbg("serve_data:"..serve_data)
	if tonumber(serve_data) == tonumber(item_all_price) then
		player:SetInt("EquipExploit", player:GetInt("EquipExploit") + serve_data)
		--sLuaApp:LuaDbg("EquipExploit_2:"..player:GetInt("EquipExploit"))
		sLuaApp:ShowForm(player, "脚本表单", "DonateUI.Refresh()")
		DonateEquipAndPet.GetEquipExploit(player)
	else
		sLuaApp:LuaErr("服务端计算数据与客户端发送数据不符")
		return ""
	end
	sLuaApp:NotifyTipsMsg(player, "捐献成功")
	return ""
end

--捐献多个宠物
function DonateEquipAndPet.DonatePets(player, pet_list, pet_all_price)
	local pet_list = sLuaApp:StrSplit(pet_list, "-")
	local serve_data = 0
	--sLuaApp:LuaDbg("PetExploit_1:"..player:GetInt("PetExploit"))
	local despetlist = {}
	for k, v in pairs(pet_list) do
		local pet = sPetSystem:GetPetByGUID(v)
		if pet == nil then
			return ""
		end
		if pet:GetOwner() ~= player then
			sLuaApp:LuaErr("宠物不属于该玩家"..player:GetName())
			return
		end

		local petData = PetConfig.GetById(pet:GetId())
		
		--判断上阵
		if pet:IsLineup() then
			sLuaApp:NotifyTipsMsg(player, "您的宠物"..petData.Name.."已上阵，请下阵后捐献")
			return ""
		end
		
		--判断锁定
		if pet:IsLocked() then
			sLuaApp:NotifyTipsMsg(player, "宠物已锁定，无法捐献！")
			return ""
		end
		
		if not PetSystem.ReturnPetEquip(player, {pet}) then
			player:SetInt("PetExploit", player:GetInt("PetExploit") + serve_data)
			sLuaApp:ShowForm(player, "脚本表单", "DonateUI.Refresh()")
			DonateEquipAndPet.GetPetExploit(player)
			return ""
		end
		local isSpecial = false
		local petname = pet:GetKeyName()
		--sLuaApp:LuaDbg("petname:"..petname)
		if DonateEquipAndPet.SpecialDonateList then
			sLuaApp:LuaDbg("特殊道具表存在")
			if DonateEquipAndPet.SpecialDonateList[petname] then
				isSpecial = true
			end
		end
		
		if not isSpecial then
			serve_data = serve_data + DonateEquipAndPet.GetPetValue(petData)
		else
			serve_data = serve_data + DonateEquipAndPet.SpecialDonateList[petname]["DonatePrice"] 
		end
		if pet:GetType() ~= DonateEquipAndPet.PetConfig["Types"] then
			sLuaApp:NotifyTipsMsg(player, "捐献的道具不是宠物,无法捐献")
			return ""
		end
		table.insert(despetlist, pet)
	end
	
	for k,v in ipairs(despetlist) do
		if sPetSystem:DestroyPet(v,  "捐献系统", "捐献系统捐献物资", "捐献系统捐献物资扣除宠物") ~= 0 then
			sLuaApp:NotifyTipsMsg(player, "捐献宠物出错")			
			return ""
		end
	end
	--sLuaApp:LuaDbg("serve_data:"..serve_data)
	if tonumber(serve_data) == tonumber(pet_all_price) then
		player:SetInt("PetExploit", player:GetInt("PetExploit") + serve_data)
		--sLuaApp:LuaDbg("PetExploit_2:"..player:GetInt("PetExploit"))
		sLuaApp:ShowForm(player, "脚本表单", "DonateUI.Refresh()")
		DonateEquipAndPet.GetPetExploit(player)
	else
		sLuaApp:LuaErr("服务端计算数据与客户端发送数据不符")
		return ""
	end
	sLuaApp:NotifyTipsMsg(player, "捐献成功")
	return ""
end

--获取装备功勋
--@newinter DonateEquipAndPet.GetEquipExploit(player)
function DonateEquipAndPet.GetEquipExploit(player)
	--sLuaApp:LuaDbg("EquipExploit:"..player:GetInt("EquipExploit"))
	--sLuaApp:NotifyTipsMsg(player, "当前装备功勋："..player:GetInt("EquipExploit"))
	local str = [[
		if DonateShopUI then
			DonateShopUI.EquipExploit = ]]..player:GetInt("EquipExploit")..[[
			DonateShopUI.RefreshUI()
		end
	]]
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--获取宠物功勋
--@newinter DonateEquipAndPet.GetPetExploit(player)
function DonateEquipAndPet.GetPetExploit(player)
	--sLuaApp:LuaDbg("PetExploit:"..player:GetInt("PetExploit"))
	--sLuaApp:NotifyTipsMsg(player, "当前宠物功勋："..player:GetInt("PetExploit"))
	local str = [[
		if DonateShopUI then
			DonateShopUI.PetExploit = ]]..player:GetInt("PetExploit")..[[
			DonateShopUI.RefreshUI()
		end
	]]
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--功勋商店购买
--@newinter DonateEquipAndPet.DonateShopPurchase(player, 31520, 1, 132, "123")
--@newinter DonateEquipAndPet.DonateShopPurchase(player, 12332, 1, 132, "123")
function DonateEquipAndPet.DonateShopPurchase(player, item_id, item_num, item_price, buy_name)
	--传入的数字不正确
	if type(item_num) ~= "number" then return end
	if tonumber(item_num) <= 0 then return end
	--传入的道具buy_name类型不存在
	if not DonateConfig.IntConfig[buy_name] then return end
	if tonumber(item_num) > 0 then
		item_num = math.floor(tonumber(item_num))
	end
	local itemData = ItemConfig.GetById(item_id)
	local item_list = {itemData.KeyName, item_num}
	local player_guid = tostring(player:GetGUID())
	local item_id = tostring(item_id)
	local ConfigItemName = 'KeyName_'..itemData.KeyName
	--传入的道具id不在配置中
	if not DonateConfig.DonateShopConfig[ConfigItemName] then return end
	--判断限购
	if Data.DonateShopLimit then
		if Data.DonateShopLimit[player_guid] then
			--sLuaApp:LuaDbg("判定限购")
			if Data.DonateShopLimit[player_guid][item_id] then
				--sLuaApp:LuaDbg("已购买过")
				if tonumber(Data.DonateShopLimit[player_guid][item_id]) == DonateConfig.DonateShopConfig[ConfigItemName]["Number"] then
					sLuaApp:NotifyTipsMsg(player, "该道具当天已达到限购数量，无法继续购买")
					return ""
				end
				if tonumber(Data.DonateShopLimit[player_guid][item_id]) + item_num >  DonateConfig.DonateShopConfig[ConfigItemName]["Number"] then
					local final_count = DonateConfig.DonateShopConfig[ConfigItemName]["Number"] - tonumber(Data.DonateShopLimit[player_guid][item_id])
					local str = [[GlobalUtils.ShowServerBoxMessage("该次购买仅可购买]]..final_count..[[个，购买之后]]..itemData.Name..[[将达到限购数量，是否继续购买？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "DonateEquipAndPet.DonateShopPurchase(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..item_id..", "..final_count..", "..item_price..", '"..buy_name.."')")
					sLuaApp:ShowForm(player, "脚本表单", str)
					return ""
				end
			else
				--sLuaApp:LuaDbg("尚未购买")
				--sLuaApp:LuaDbg("item_num："..item_num)
				--sLuaApp:LuaDbg("number：".. DonateConfig.DonateShopConfig[ConfigItemName]["Number"])
				if item_num > DonateConfig.DonateShopConfig[ConfigItemName]["Number"] then
					local final_count = DonateConfig.DonateShopConfig[ConfigItemName]["Number"]
					local str = [[GlobalUtils.ShowServerBoxMessage("该次购买仅可购买]]..final_count..[[个，购买之后]]..itemData.Name..[[将达到限购数量，是否继续购买？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "DonateEquipAndPet.DonateShopPurchase(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..item_id..", "..final_count..", "..item_price..", '"..buy_name.."')")
					sLuaApp:ShowForm(player, "脚本表单", str)
					return ""
				end
			end
		end
	end
	
	--扣除对应功勋
	for k,v in pairs(DonateConfig.IntConfig) do
		if buy_name == k then
			local Exploit = player:GetInt(v)
			--sLuaApp:LuaDbg(ConfigItemName)
			if DonateConfig.DonateShopConfig[ConfigItemName] then
				local all_price =  DonateConfig.DonateShopConfig[ConfigItemName]["Buy"] * item_num
				if Exploit < all_price then
					sLuaApp:NotifyTipsMsg(player, "您的"..k.."不足")
					return ""
				else
					player:SetInt(v, player:GetInt(v) - all_price)
				end
			else
				sLuaApp:LuaErr("捐献商店配置表中无此道具")
				return ""
			end
		end
	end
	--给予道具
	if Lua_tools then
		Lua_tools.AddItem(player, item_list, "兑换商店", "兑换商店装备功勋购买", "兑换商店装备功勋购买给予道具")
	end
	--记录限购
	if player:GetDayInt("DonateShopLimit") == 0 then
		--sLuaApp:LuaDbg("player_guid:"..player_guid)
		if Data.DonateShopLimit then	
			Data.DonateShopLimit[player_guid] = {}
			Data.DonateShopLimit[player_guid][item_id] = item_num
			player:SetDayInt("DonateShopLimit", 1)
		else
			Data.DonateShopLimit = {}
			Data.DonateShopLimit[player_guid] = {}
			Data.DonateShopLimit[player_guid][item_id] = item_num
			player:SetDayInt("DonateShopLimit", 1)
		end
	else
		if Data.DonateShopLimit then
			--sLuaApp:LuaDbg("player_guid:"..player_guid)
			if Data.DonateShopLimit[player_guid] then
				if Data.DonateShopLimit[player_guid][item_id] ~= nil then
					--sLuaApp:LuaDbg("有值，叠加")
					Data.DonateShopLimit[player_guid][item_id] = Data.DonateShopLimit[player_guid][item_id] + item_num
				else
					--sLuaApp:LuaDbg("没值，创建")
					Data.DonateShopLimit[player_guid][item_id] = item_num
				end
			else
				Data.DonateShopLimit[player_guid] = {}
				Data.DonateShopLimit[player_guid][item_id] = item_num
			end
		else
			sLuaApp:LuaDbg("Data.DonateShopLimit没值")
			return ""
		end
	end
	if Data.DonateShopLimit and next(Data.DonateShopLimit) ~= nil then
		if Data.DonateShopLimit[player_guid] and next(Data.DonateShopLimit[player_guid]) then
			local str = [[
				if DonateShopUI then
					DonateShopUI.allBuyCnt = ]]..Lua_tools.serialize(Data.DonateShopLimit[player_guid])..[[
					DonateShopUI.EquipExploit = ]]..player:GetInt("EquipExploit")..[[
					DonateShopUI.PetExploit = ]]..player:GetInt("PetExploit")..[[
					DonateShopUI.RefreshUI()
					DonateShopUI.RefreshGoodsScroll()
				end
			]]
			--sLuaApp:LuaDbg(str)
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		else
			local str = [[
				if DonateShopUI then
					DonateShopUI.EquipExploit = ]]..player:GetInt("EquipExploit")..[[
					DonateShopUI.PetExploit = ]]..player:GetInt("PetExploit")..[[
					DonateShopUI.RefreshUI()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		end
	else
		local str = [[
			if DonateShopUI then
				DonateShopUI.EquipExploit = ]]..player:GetInt("EquipExploit")..[[
				DonateShopUI.PetExploit = ]]..player:GetInt("PetExploit")..[[
				DonateShopUI.RefreshUI()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return ""
	end
	return ""
end

-- 获取装备价值
function DonateEquipAndPet.GetEquipValue(ItemData)
    local cost = 0
    if DonateEquipAndPet.Equip_Sell_Formula and ItemData then
        local level = ItemData.Level
        local Grade = ItemData.Grade
        local BuyGoldBind = ItemData.BuyGoldBind
        local str = [[
        level = ]]..level..[[
        Grade = ]]..Grade..[[
        BuyGoldBind = ]]..BuyGoldBind..[[
        ]]
        cost = assert(load(str.."return "..DonateEquipAndPet.Equip_Sell_Formula))()
        if cost then
            cost = math.floor(cost)
            if  cost < 0 then
                cost = 0
            end
        else
            test("价格公式解析错误。")
        end
        --        test("捐献装备价格: "..cost)
    else
        test("Donate_Equip_Sell_Formula is nil")
    end
    return cost
end

-- 获取宠物价值
function DonateEquipAndPet.GetPetValue(petData)
    local cost = 0
    if DonateEquipAndPet.Pet_Sell_Formula and petData then
        local Type = petData.Type
        local carrylevel = petData.CarryLevel
        local str =[[
        carrylevel = ]] .. carrylevel .. [[
        Type = ]]..Type..[[
        ]]
        cost = assert(load(str.."return "..DonateEquipAndPet.Pet_Sell_Formula))()
        if cost then
            cost = math.floor(cost)
            if  cost < 0 then
                cost = 0
            end
        else
            test("价格公式解析错误。")
        end
        --        test("捐献装备价格: "..cost)
    else
        test("Pet_Sell_Formula is nil")
    end
    return cost
end

--@newinter DonateEquipAndPet.MoveToNpc(player)
function DonateEquipAndPet.MoveToNpc(player)
	sLuaApp:LuaDbg("DonateEquipAndPet.MoveToNpc")
	local NPCID = DonateEquipAndPet.NPCID
	sLuaApp:LuaDbg("NPCID"..NPCID)
	Lua_tools.MoveToNpc(player, NPCID)
	return ""
end

--捐献功勋商店初始化
function DonateEquipAndPet.Initialization()
	--sLuaApp:LuaDbg("捐献系统初始化")
	local WeekDay = sLuaApp:WeekDay(0)
	sVarSystem:SetWeekInt("DonateEquipAndPet_NowDaysByWeek", WeekDay)
	if not DonateConfig then
		sLuaApp:LuaDbg("没有DonateTable")
		return ""
	end
	if DonateConfig.DonateShopConfig then
		DonateEquipAndPet.Structure = {}
		DonateEquipAndPet.ShopList = {}
		ItemNumSurplus = {}
		for k,v in pairs(DonateConfig.DonateShopConfig) do
			local week = sLuaApp:StrSplit(v.SellDate,",")
			if #week > 0 then 
				for a,b in ipairs(week) do
					if tonumber(b) == 0 or WeekDay == tonumber(b) then
						if v.Number > 0 then 
							if not DonateEquipAndPet.Structure["Path_"..v.Type] then
								DonateEquipAndPet.Structure["Path_"..v.Type] = v.TypeName
							end
							if not DonateEquipAndPet.Structure["Path_"..v.Type.."_"..v.SubType] then
								DonateEquipAndPet.Structure["Path_"..v.Type.."_"..v.SubType] = v.SubTypeName
							end
							if not DonateEquipAndPet.ShopList["Path_"..v.Type..'_'..v.SubType] then
								DonateEquipAndPet.ShopList["Path_"..v.Type..'_'..v.SubType] = {}
							end
							DonateEquipAndPet.ShopList["Path_"..v.Type..'_'..v.SubType][k] = {KeyName = v.KeyName, Buy = v.Buy , BuyName = v.BuyName, Number = v.Number }
							ItemNumSurplus[k] = v.Number
							break;
						end
					end
				end
			end
		end
	end
	DonateEquipAndPet.Structure = Lua_tools.serialize(DonateEquipAndPet.Structure)
	DonateEquipAndPet.ShopList = Lua_tools.serialize(DonateEquipAndPet.ShopList)
end

DonateEquipAndPet.Initialization()


