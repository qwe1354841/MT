--NPC寻路系统
require("npc/Shop")
require("system/Lua_tools")
NpcPathfinding = {}

function NpcPathfinding.GetData(player)
	if not NpcPathfinding.shopList_Str then
		NpcPathfinding.shopList_Str = Lua_tools.serialize(NpcPathfinding.ShopList)
	end
	
	if not NpcPathfinding.itemList_Str then
		NpcPathfinding.itemList_Str = Lua_tools.serialize(NpcPathfinding.itemList)
	end
	
	if not NpcPathfinding.petList_Str then
		NpcPathfinding.petList_Str = Lua_tools.serialize(NpcPathfinding.petList)
	end
	
	local form = [[
		if UIDefine then
			UIDefine.ShopTrack = ]]..NpcPathfinding.shopList_Str..[[
			UIDefine.ItemShopTrack = ]]..NpcPathfinding.itemList_Str..[[
			UIDefine.PetShopTrack = ]]..NpcPathfinding.petList_Str..[[
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form)
end

function NpcPathfinding.Intialization()
    NpcPathfinding.itemList = {}
	NpcPathfinding.petList = {}
	NpcPathfinding.ShopList = {}
	if not Shop then
		require("npc/Shop")
	end
	if Shop.Shop_Config then
		for k,v in pairs(Shop.Shop_Config) do
			for a,b in pairs(v) do
				local ShopData = ShopConfig.GetByKeyName(b)
				local ShopNpc = NpcConfig.GetByKeyName(k)
				if ShopData and ShopNpc then
					NpcPathfinding.ShopList[ShopData.ShopId] = ShopNpc.Id
				else
					sLuaApp:LuaDbg("NPC:"..k.."的商店 " .. b.. "配置不存在，错误位置Shop.lua")
				end
			end
		end
	end
	local tb_ShopItem = ShopItemConfig.GetTableData()
	--sLuaApp:LuaDbg(Lua_tools.serialize(tb_ShopItem))
	for k,v in pairs(tb_ShopItem) do	
		if type(v) == "table" then
			local ItemKeyName = v.ItemKeyName
			--if not NpcPathfindingKeyList[ItemKeyName] then
				local ShopId = tonumber(v.ShopId)
				local ShopData = ShopConfig.GetByShopId(ShopId)
				local ShopType = ShopData.Type
				--sLuaApp:LuaDbg(ItemKeyName .. " = " .. ShopId .. "," ..ShopType .. "," ..ShopType)
				if NpcPathfinding.ShopList[ShopId] then
					if v.NotSell == 1 then
						--sLuaApp:LuaDbg(ItemKeyName .. " = " .. ShopType)
						if ShopType == 1 then
							local itemData = ItemConfig.GetByKeyName(ItemKeyName)
							
							if itemData then
								NpcPathfinding.itemList[itemData.Id] = ShopId
							else
								sLuaApp:LuaDbg("编号:"..ShopId.."的商店 " .. ItemKeyName.. " 配置不存在，错误位置shop_item.xml")
							end
						elseif ShopType == 0 then 
							local petData = PetConfig.GetByKeyName(ItemKeyName)
							if petData then
								NpcPathfinding.petList[petData.Id] = ShopId
							else
								sLuaApp:LuaDbg("编号:"..ShopId.."的商店 " .. ItemKeyName.. " 配置不存在，错误位置shop_item.xml")
							end
						end
					end
				end
			--end
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(NpcPathfindingKeyList))
	--sLuaApp:LuaDbg(Lua_tools.serialize(NpcPathfinding.itemList))
	--sLuaApp:LuaDbg(Lua_tools.serialize(NpcPathfinding.petList))
	--sLuaApp:LuaDbg(Lua_tools.serialize(NpcPathfinding.ShopList))
end

NpcPathfinding.Intialization()