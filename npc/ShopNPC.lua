--商店脚本 by shodow_yong
ShopNPC = {}

function ShopNPC.main(npc, player)
	local str = "0"
	if Shop then
		str = Shop.main(npc, player)
	end
	return str 
end

function ShopNPC.Option(npc, player, shop_id)
	if Shop then
		Shop.Option(npc, player, shop_id)
	end
	return ""
end