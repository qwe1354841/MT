--交易行相关表单

FormAuction = {}

function FormAuction.GetConfig(player)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
    AuctionSystem.GetConfig(player)
    return ""
end

function FormAuction.GetData(player, Page, Data_type, Sub_type, Tiny_type, Money_type, Level, Job, Gender, Word)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
    return AuctionSystem.GetAuctionData(player, Page, Data_type, Sub_type, Tiny_type, Money_type, Level, Job, Gender, Word)
end

function FormAuction.GetGoodCount(player, coin_type, index)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.GetGoodCount(player, coin_type, index)
end

function FormAuction.GetPetData(player, Page, Types_1, Types_2, Types_3, Money_type, Word)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.GetAuctionPetData(player, Page, Types_1, Types_2, Types_3, Money_type, Word)
end

function FormAuction.GetMySellList(player)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.GetMySellList(player)
end

function FormAuction.SetCollection(player, guid)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.SetCollection(player, guid)
end

function FormAuction.RemoveCollection(player, guid)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.RemoveCollection(player, guid)
end

function FormAuction.GetCollection(player)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.GetCollection(player)
end

function FormAuction.Withdraw(player,good_guid)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	local user_id = player:GetUserId()
	if player:GetInt("SystemOnSpeedErr") == 1 or sDBVarSystem:GetInt("SystemOnSpeedErr_"..user_id) == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "有过加速行为，无法交易")
		return
	end
	return AuctionSystem.Withdraw(player,good_guid)
end

function FormAuction.TakeOut(player, good_guid)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.TakeOut(player, good_guid)
end

function FormAuction.SellAgain(player, good_guid, money_type, money_value, types)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.SellAgain(player, good_guid, money_type, money_value, types)
end

function FormAuction.StartSellItem(player, item_guid, num, money_type, money_value, time_type, SpecialBuyer)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	local user_id = player:GetUserId()
	if player:GetInt("SystemOnSpeedErr") == 1 or sDBVarSystem:GetInt("SystemOnSpeedErr_"..user_id) == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "有过加速行为，无法交易")
		return
	end
	return AuctionSystem.StartSellItem(player, item_guid, num, money_type, money_value, time_type, SpecialBuyer)
end

function FormAuction.StartSellPet(player, pet_guid, money_type, money_value, time_type, SpecialBuyer)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.StartSellPet(player, pet_guid, money_type, money_value, time_type, SpecialBuyer)
end

function FormAuction.Aucting(player, good_guid, num, Password)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.Aucting(player, good_guid, num, Password)
end

function FormAuction.QuetyCoin(player, money_type)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.QuetyCoin(player, money_type)
end

function FormAuction.QueryRecords(player)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.QueryRecords(player)
end

function FormAuction.TakeOffCoin(player, money_type)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.TakeOffCoin(player, money_type)
end

function FormAuction.UnlockField(player, types)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	return AuctionSystem.UnlockField(player, types)
end

function FormAuction.NotifyDetail(player, item_guid)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","交易") then
		return ""
	end
	AuctionSystem.NotifyDetail(player, item_guid)
	return ""
end