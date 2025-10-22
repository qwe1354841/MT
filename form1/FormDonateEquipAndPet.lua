FormDonateEquipAndPet = {}

--获取装备功勋
function FormDonateEquipAndPet.GetEquipExploit(player)
	if DonateEquipAndPet then
		DonateEquipAndPet.GetEquipExploit(player)
	end
	return ""
end

--获取宠物功勋
function FormDonateEquipAndPet.GetPetExploit(player)
	if DonateEquipAndPet then
		DonateEquipAndPet.GetPetExploit(player)
	end
	return ""
end

--获取捐献商店配置
function FormDonateEquipAndPet.GetExploitShopData(player)
	if DonateEquipAndPet then
		DonateEquipAndPet.GetExploitShopData(player)
	end	
	return ""
end

--捐献单个装备
function FormDonateEquipAndPet.DonateOnceItem(player, item_guid, item_price)
	if DonateEquipAndPet then
		DonateEquipAndPet.DonateOnceItem(player, item_guid, item_price)
	end
	return ""
end

--捐献单个宠物
function FormDonateEquipAndPet.DonateOncePet(player, pet_guid, pet_price)
	sLuaApp:LuaDbg("pet_guid:"..pet_guid)
	sLuaApp:LuaDbg("pet_price:"..pet_price)
	if DonateEquipAndPet then
		DonateEquipAndPet.DonateOncePet(player, pet_guid, pet_price)
	end
	return ""
end

--捐献多个装备
function FormDonateEquipAndPet.DonateItems(player, item_list, item_all_price)
	if DonateEquipAndPet then
		DonateEquipAndPet.DonateItems(player, item_list, item_all_price)
	end
	return ""
end	

--捐献多个宠物
function FormDonateEquipAndPet.DonatePets(player, pet_list, pet_all_price)
	if DonateEquipAndPet then
		DonateEquipAndPet.DonatePets(player, pet_list, pet_all_price)
	end
	return ""
end

--捐献商店购买
function FormDonateEquipAndPet.DonateShopPurchase(player, item_id, item_num, item_price, buy_name)
	if DonateEquipAndPet then
		DonateEquipAndPet.DonateShopPurchase(player, item_id, item_num, item_price, buy_name)
	end
	return ""
end

--寻路跳转
function FormDonateEquipAndPet.MoveToNpc(player)
	if DonateEquipAndPet then
		DonateEquipAndPet.MoveToNpc(player)
	end
	return ""
end



