--藏宝图相关表单
FormTreasureMap = {}

function FormTreasureMap.move_end(player,item_guid)
	if TreasureMap then
		TreasureMap.move_end(player,item_guid)
	end
	return ""
end

function FormTreasureMap.use_TreasureMap(player,item_guid)
	if TreasureMap then
		local item = sItemSystem:GetItemByGUID(item_guid)
		if item then
			local timer_guid = sLuaTimerSystem:AddTimerEx(player,3000,1,"TreasureMap.main", ""..item_guid) 
			if timer_guid ~= "" then
				player:SetString("TreasureMap_TimerGuid",timer_guid)
			else
				sLuaApp:LuaDbg("TreasureMap.main AddTimerEx is fail")
			end
		end
	end
	return ""
end

function FormTreasureMap.stop_use_TreasureMap(player,item_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if item then
		local timer_guid = player:GetString("TreasureMap_TimerGuid")
		if sLuaTimerSystem:HasTimer(timer_guid) then
			sLuaTimerSystem:DisableTimer(timer_guid) 
		end
	end
	return	""
end