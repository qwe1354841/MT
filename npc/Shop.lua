--商店脚本 by shodow_yong
Shop = {}

--商店配置 
--下表中NPC_KeyName 对应npc表的KeyName字段
--下表中Shop_KeyName 对应shop表的KeyName字段
--同一个NPC最多配置5个商店shop1~shop5

Shop.ShopNum_Max = 5
Shop.Shop_Config = {
	--['NPC_KeyName'] = {
	--	['Shop1'] = "Shop_KeyName",
	--	['Shop2'] = "Shop_KeyName",
	--	['Shop3'] = "Shop_KeyName",
	--	['Shop4'] = "Shop_KeyName",
	--	['Shop5'] = "Shop_KeyName",
	--},
	["傲来村-武器商店"] = {
		['Shop1'] = '傲来村武器店',
	},
	["傲来村-药品商店"] = {
		['Shop1'] = '傲来村药店',
	},
	["傲来村-装备商店"] = {
		['Shop1'] = '傲来村防具店',
	},
	["傲来村-饰品商店"] = {
		['Shop1'] = '傲来村饰品店',
	},
	["傲来村-杂货商店"] = {
		['Shop1'] = '傲来村杂货店',
	},
	["长安城-装备商店"] = {
		['Shop1'] = '长安城防具店',
	},
	["长安城-武器商店"] = {
		['Shop1'] = '长安城武器店',
	},
	["长安城-饰品商店"] = {
		['Shop1'] = '长安城饰品店',
	},
	["长安城-杂货商店"] = {
		['Shop1'] = '长安城杂货店',
	},
	["长安城-药品商店"] = {
		['Shop1'] = '长安城药店',
	},
	["长安城-强化师"] = {
		['Shop1'] = '长安城打造师',
	},
	["长安城-打造师"] = {
		['Shop1'] = '长安城打造师',
	},
	["长安城-制药师"] = {
		['Shop1'] = '长安城烹饪店',
	},
	["长安城-领取-虎大王"] = {
		['Shop1'] = '劫镖商店',
	},
	["猪八戒（未成圣）-切磋-实例"] = {
		['Shop1'] = '长安城烹饪店',
	},
	["商业-金角大王"] = {
		['Shop1'] = '傀儡师',
	},
	["西梁女国-武器商店"] = {
		['Shop1'] = '西梁女国武器店',
	},
	["西梁女国-装备商店"] = {
		['Shop1'] = '西梁女国防具店',
	},
	["西梁女国-饰品商店"] = {
		['Shop1'] = '西梁女国饰品店',
	},
	["西梁女国-杂货商店"] = {
		['Shop1'] = '西梁女国杂货店',
	},
	["西梁女国-药品商店"] = {
		['Shop1'] = '西梁女国药店',
	},
	["傲来村-宠物商店"] = {
		['Shop1'] = '傲来村宠物店',
	},
	["长安城-宠物商店"] = {
		['Shop1'] = '长安城宠物店',
	},
	["西梁女国-宠物商店"] = {
		['Shop1'] = '西梁女国宠物店',
	},
	["帮派地图-阁主"] = {
		['Shop1'] = '帮派商店',
	},
}

function Shop.Option(npc, player, shop_id)
    shop_id = tonumber(shop_id);
	if shop_id == 513 then
		local guild = sGuildSystem:GetGuildByPlayer(player)
		sNpcSystem:OpenShopLevel(npc, player, shop_id, 0 , guild:GetPharmacyLevel())
	else
		sNpcSystem:OpenShop(npc, player, shop_id);
	end
    return ""
end

function Shop.Custom(npc, player, param)
    return ShopNPCPlus.CustomFunc(npc, player, param) or ""
end

function Shop.main(npc, player)
	local npc_keyname = npc:GetKeyName()
	if not npc_keyname then
		return "0"
	end
	if not Shop.Shop_Config[''..npc_keyname] then
		return "0"
	end
	
	if npc_keyname == "帮派地图-阁主" then
		local guild = sGuildSystem:GetGuildByPlayer(player)
		if not guild then
			sLuaApp:LuaDbg("Shop.main guild is nil")
			return "0"
		end
		if guild:GetPharmacyLevel() < 1 then
			return "0"
		end
	end
	
	local shop_name = "" 
	local shop_id  = ""
	for i = 1,Shop.ShopNum_Max,1 do
		local shop_KeyName = Shop.Shop_Config[''..npc_keyname]['Shop'..i]
		if shop_KeyName then
			local tb_shop = ShopConfig.GetByKeyName(shop_KeyName)
			if not tb_shop then
				sLuaApp:LuaDbg("get table shop bykeyname is nil , keyname = "..shop_KeyName)
				return "0"
			end
			shop_name = tb_shop['Name']
			shop_id = tb_shop['ShopId']
			if shop_name and shop_id then
				player:AddNpcOption(npc, 0 , shop_name, "Option", shop_id);
			else	
				sLuaApp:LuaDbg("shop_name or shop_id is nil , shop_KeyName = "..shop_KeyName)
			end
		end
	end
	local PlusFun = ShopNPCPlus.Function_Config[npc_keyname]
	if PlusFun then
		if type(PlusFun) == "string" then
			player:AddNpcOption(npc, 0 , PlusFun, "Custom", PlusFun);
		elseif type(PlusFun) == "table" then
			for k,v in ipairs(PlusFun) do
				if type(v) == "string" then
					player:AddNpcOption(npc, 0 , v, "Custom", v);
				end
			end
		end
	end
    return "0";
end