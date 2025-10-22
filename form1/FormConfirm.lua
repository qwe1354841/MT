--确认框表单
FormConfirm = {}

function FormConfirm.Main(player)
	sLuaApp:LuaDbg("FormConfirmGet!")
	--EquipBuild.Initialization(0)
	
	local arg = player:GetString("SYSTEM_ConfirmBox_Function")
	if arg ~= "" then
		player:SetString("SYSTEM_ConfirmBox_Function", "")
		assert(load(arg))()
		sLuaApp:LuaDbg("arg == " .. arg)
	else
		sLuaApp:LuaDbg("arg is nil!")
	end
	return ""
end

function FormConfirm.Cancel(player)
	sLuaApp:LuaDbg("FormConfirm Cancel Get!")
	--EquipBuild.Initialization(0)
	
	local arg = player:GetString("SYSTEM_ConfirmBox_Function_Cancel")
	if arg ~= "" then
		player:SetString("SYSTEM_ConfirmBox_Function_Cancel", "")
		assert(load(arg))()
		sLuaApp:LuaDbg("Cancel arg == " .. arg)
	else
		sLuaApp:LuaDbg("Cancel arg is nil!")
	end
	return ""
end

function FormConfirm.TryUseItemById(player_guid, itemId)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local item = sItemSystem:GetItemList(player, itemId, 3)[1]
	if not item then
		sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetById(itemId).Name)
		return
	end
	sItemSystem:UseItem(player,item)
end

function FormConfirm.TryUseItemByIdAndOneKeyBuy(player_guid,itemId)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local item = sItemSystem:GetItemList(player, itemId, 3)[1]
	local itemKey = ItemConfig.GetById(itemId).KeyName
	if not item then
		sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetById(itemId).Name)
		OneKeyBuy.Main(player,{itemKey,1})
		return ""
	end
	sItemSystem:UseItem(player,item)
	player:SetString("SYSTEM_ConfirmBox_Function", "")
end