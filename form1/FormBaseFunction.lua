--栏位解锁表单
FormBaseFunction={}


function FormBaseFunction.UnlockBagField(player)
	local itemKey = "解锁背包栏位"
	local itemData = ItemConfig.GetByKeyName(itemKey)
	local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>解锁1排背包栏位？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "FormConfirm.TryUseItemByIdAndOneKeyBuy('"..player:GetGUID().."',"..itemData.Id..")")
					sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function FormBaseFunction.UnlockDepotField(player)
	local itemKey = "解锁仓库栏位"
	local itemData = ItemConfig.GetByKeyName(itemKey)
	local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>解锁1页仓库栏位？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "FormConfirm.TryUseItemByIdAndOneKeyBuy('"..player:GetGUID().."',"..itemData.Id..")")
					sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function FormBaseFunction.UnlockPetDepotField(player)
	local itemKey = "解锁宠物仓库栏位"
	local itemData = ItemConfig.GetByKeyName(itemKey)
	local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>解锁1个宠物仓库栏位？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "FormConfirm.TryUseItemByIdAndOneKeyBuy('"..player:GetGUID().."',"..itemData.Id..")")
					sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function FormBaseFunction.BindGoldSave(player, val)
	if Lua_tools.SubMoney(player,5,val,"player", "存钱", ""..val) then
		player:AddWarehouseGold(val,"player", "存钱", ""..val)
	else
		return "金额不足！"
	end
	return ""
end

function FormBaseFunction.BindGoldDraw(player, val)
	if player:SubWarehouseGold(val,"player", "取钱", ""..val) then
		player:AddBindGold(val,"player", "取钱", ""..val)
	else
		return "金额不足！"
	end
	return ""
end