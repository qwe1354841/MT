--结婚表单
FormMarry = {}

function FormMarry.PickupItem(player, item_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if item then
		if item:GetKeyName() == "充值游街红包" then
			if SendGoldIngot then
				SendGoldIngot.PickupItem(player, item)
			end
		else
			if Marry then
				Marry.PickupItem(player, item_guid)
			end
		end
	end
	
	return ""
end


function FormMarry.StopPickupItem(player)
	if player:GetInt("SendGoldIngot_OpenGiftTimer") ~= 0 then
		if SendGoldIngot then
			SendGoldIngot.StopPickupItem(player)
		end
	else
		if Marry then
			Marry.StopPickupItem(player)
		end
	end
	
	return ""
end