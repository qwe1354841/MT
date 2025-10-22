FormNpcOpenShop = {}

function FormNpcOpenShop.OpenShopByNPC(player,item_id,npc_guid,shop_id)
	if player and item_id and npc_guid and shop_id then
		item_id = tonumber(item_id)
		npc_guid = tostring(npc_guid)
		shop_id = tonumber(shop_id)
	
		local npc = sNpcSystem:GetNpcByGUID(npc_guid)
		
		if npc then
			local npc_x = sMapSystem:GetPosX(npc) 
			local npc_y = sMapSystem:GetPosY(npc) 
			local player_x = sMapSystem:GetPosX(player) 
			local player_y = sMapSystem:GetPosY(player) 
			
			if (math.pow((npc_x - player_x), 2) + math.pow((npc_y - player_y), 2)) <= 100 then		
				sNpcSystem:OpenShopEx(npc, player, shop_id, item_id);
			else
				sLuaApp:LuaDbg("player and npc  >100 ")
			end
		else
			sLuaApp:LuaDbg("FormNpcOpenShop.OpenShopByNPC : npc is nil")
		end
	else
		sLuaApp:LuaDbg("FormNpcOpenShop.OpenShopByNPC : player or item_id or npc_guid or shop_id is nil")
	end
	return ""
end
