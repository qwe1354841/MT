-- 宝石配置
GemStone={}

-- 装备位置
-- EQUIP_SITE_WEAPON   =   0   -- 武器		攻击魔攻封印暴击
-- EQUIP_SITE_HAT      =   1   -- 帽子		攻击魔攻物抗魔抗
-- EQUIP_SITE_CLOTH    =   2   -- 衣服		物抗生命魔抗
-- EQUIP_SITE_BELT     =   3   -- 腰带		物抗生命魔抗
-- EQUIP_SITE_SHOES    =   4   -- 鞋子		物抗速度魔抗
-- EQUIP_SITE_WRIST    =   5   -- 护腕		物抗生命魔抗
-- EQUIP_SITE_RING     =   6   -- 戒指		攻击魔攻速度
-- EQUIP_SITE_NECKLACE =   7   -- 项链		物抗速度魔抗
-- EQUIP_SITE_HANGINGS =   8   -- 挂坠		生命速度封印

-- 宝石位置配置（未配置的宝石没有属性）
GemStone.SiteConfig = {
--攻击石
	[5001] = {0, 1, 6},
	[5002] = {0, 1, 6},
	[5003] = {0, 1, 6},
	[5004] = {0, 1, 6},
	[5005] = {0, 1, 6},
	[5006] = {0, 1, 6},
	[5007] = {0, 1, 6},
	[5008] = {0, 1, 6},
	[5009] = {0, 1, 6},
	[5010] = {0, 1, 6},
	[5011] = {0, 1, 6},
	[5012] = {0, 1, 6},
	[5013] = {0, 1, 6},
	[5014] = {0, 1, 6},
	[5015] = {0, 1, 6},
--魔攻石    
	[5101] = {0, 1, 6},
	[5102] = {0, 1, 6},
	[5103] = {0, 1, 6},
	[5104] = {0, 1, 6},
	[5105] = {0, 1, 6},
	[5106] = {0, 1, 6},
	[5107] = {0, 1, 6},
	[5108] = {0, 1, 6},
	[5109] = {0, 1, 6},
	[5110] = {0, 1, 6},
	[5111] = {0, 1, 6},
	[5112] = {0, 1, 6},
	[5113] = {0, 1, 6},
	[5114] = {0, 1, 6},
	[5115] = {0, 1, 6},
--物抗石                                    
	[5201] = {1, 2, 3, 4, 5, 7},
	[5202] = {1, 2, 3, 4, 5, 7},
	[5203] = {1, 2, 3, 4, 5, 7},
	[5204] = {1, 2, 3, 4, 5, 7},
	[5205] = {1, 2, 3, 4, 5, 7},
	[5206] = {1, 2, 3, 4, 5, 7},
	[5207] = {1, 2, 3, 4, 5, 7},
	[5208] = {1, 2, 3, 4, 5, 7},
	[5209] = {1, 2, 3, 4, 5, 7},
	[5210] = {1, 2, 3, 4, 5, 7},
	[5211] = {1, 2, 3, 4, 5, 7},
	[5212] = {1, 2, 3, 4, 5, 7},
	[5213] = {1, 2, 3, 4, 5, 7},
	[5214] = {1, 2, 3, 4, 5, 7},
	[5215] = {1, 2, 3, 4, 5, 7},
--生命石                                   
	[5301] = {2, 3, 5, 8},
	[5302] = {2, 3, 5, 8},
	[5303] = {2, 3, 5, 8},
	[5304] = {2, 3, 5, 8},
	[5305] = {2, 3, 5, 8},
	[5306] = {2, 3, 5, 8},
	[5307] = {2, 3, 5, 8},
	[5308] = {2, 3, 5, 8},
	[5309] = {2, 3, 5, 8},
	[5310] = {2, 3, 5, 8},
	[5311] = {2, 3, 5, 8},
	[5312] = {2, 3, 5, 8},
	[5313] = {2, 3, 5, 8},
	[5314] = {2, 3, 5, 8},
	[5315] = {2, 3, 5, 8},
--速度石                                    
	[5401] = {6, 4, 7, 8},
	[5402] = {6, 4, 7, 8},
	[5403] = {6, 4, 7, 8},
	[5404] = {6, 4, 7, 8},
	[5405] = {6, 4, 7, 8},
	[5406] = {6, 4, 7, 8},
	[5407] = {6, 4, 7, 8},
	[5408] = {6, 4, 7, 8},
	[5409] = {6, 4, 7, 8},
	[5410] = {6, 4, 7, 8},
	[5411] = {6, 4, 7, 8},
	[5412] = {6, 4, 7, 8},
	[5413] = {6, 4, 7, 8},
	[5414] = {6, 4, 7, 8},
	[5415] = {6, 4, 7, 8},
--封印石                                   
	[5501] = {0, 8},
	[5502] = {0, 8},
	[5503] = {0, 8},
	[5504] = {0, 8},
	[5505] = {0, 8},
	[5506] = {0, 8},
	[5507] = {0, 8},
	[5508] = {0, 8},
	[5509] = {0, 8},
	[5510] = {0, 8},
	[5511] = {0, 8},
	[5512] = {0, 8},
	[5513] = {0, 8},
	[5514] = {0, 8},
	[5515] = {0, 8},
--魔抗石                                   
	[5601] = {1, 2, 3, 4, 5, 7},
	[5602] = {1, 2, 3, 4, 5, 7},
	[5603] = {1, 2, 3, 4, 5, 7},
	[5604] = {1, 2, 3, 4, 5, 7},
	[5605] = {1, 2, 3, 4, 5, 7},
	[5606] = {1, 2, 3, 4, 5, 7},
	[5607] = {1, 2, 3, 4, 5, 7},
	[5608] = {1, 2, 3, 4, 5, 7},
	[5609] = {1, 2, 3, 4, 5, 7},
	[5610] = {1, 2, 3, 4, 5, 7},
	[5611] = {1, 2, 3, 4, 5, 7},
	[5612] = {1, 2, 3, 4, 5, 7},
	[5613] = {1, 2, 3, 4, 5, 7},
	[5614] = {1, 2, 3, 4, 5, 7},
	[5615] = {1, 2, 3, 4, 5, 7},
--暴击石                                   
	[5701] = {0},
	[5702] = {0},
	[5703] = {0},
	[5704] = {0},
	[5705] = {0},
	[5706] = {0},
	[5707] = {0},
	[5708] = {0},
	[5709] = {0},
	[5710] = {0},
	[5711] = {0},
	[5712] = {0},
	[5713] = {0},
	[5714] = {0},
	[5715] = {0},									   
}


GemStone.EquipSiteConfig  = {}
function GemStone.Initialization()
	--sLuaApp:LuaDbg("GemStone.Initialization")
	for k,v in pairs(GemStone.SiteConfig) do
		local row = ItemConfig.GetById(k)
		if row ~= nil then
			for a, b in ipairs(v) do
				if GemStone.EquipSiteConfig[b] == nil then
					GemStone.EquipSiteConfig[b] = {}
				end
				GemStone.EquipSiteConfig[b][row.Subtype2] = true
			end
		end
	end
end
GemStone.Initialization()

-- 创建物品
function GemStone.on_item_create(item)
	--sLuaApp:LuaDbg("GemStone.on_item_create123456")
    if item == nil then
        return
	end
	local item_id = item:GetId()
	--sLuaApp:LuaDbg("item_id"..item_id)
	local row = GemStone.SiteConfig[item_id]
	if row == nil then
		return
	end
	local mark = EquipAttrClassify['GemAttr']
	--sLuaApp:LuaDbg("mark:"..mark)
	local itemData = ItemConfig.GetById(item_id)
	--sLuaApp:LuaDbg("itemData.Type:"..itemData.Type.."   itemData.Subtype:"..itemData.Subtype)
	if itemData.Type == 3 and itemData.Subtype == 9 then
		local itemAttData = ItemAttConfig.GetById(item_id)
		if itemAttData then
			local itemAttDataList = {}
			for i = 1, 5 do
				if itemAttData["Att"..i] and itemAttData["Att"..i] ~= 0 then
					itemAttDataList["Att"..i] = true
				end
			end
			--sLuaApp:LuaDbg(Lua_tools.serialize(itemAttDataList))
			for k, v in pairs(itemAttDataList) do
				local att = sLuaApp:RandInteger(itemAttData[k.."Min"], itemAttData[k.."Max"])
				item:SetDynAttr(mark, itemAttData[k], att)
				--sLuaApp:LuaDbg("Attr1: " .. item:GetDynAttr(mark, itemAttData.Att1))
			end
			
			--if itemAttData.Att1 ~= 0 then
			--	local Att1 = sLuaApp:RandInteger(itemAttData.Att1Min, itemAttData.Att1Max)
			--	item:SetDynAttr(mark, itemAttData.Att1, Att1)
			--	--sLuaApp:LuaDbg("Attr1: " .. item:GetDynAttr(mark, itemAttData.Att1))
			--end
			--if itemAttData.Att2 ~= 0 then
			--	local Att2 = sLuaApp:RandInteger(itemAttData.Att2Min, itemAttData.Att2Max)
			--	item:SetDynAttr(mark, itemAttData.Att2, Att2)
			--	--sLuaApp:LuaDbg("Attr2: " .. item:GetDynAttr(mark, itemAttData.Att2))
			--end
		else
			sLuaApp:LuaDbg("itemAttData不存在")
		end
	end
	--local mark = EquipAttrClassify['GemAttr']
	--item:SetDynAttr(mark, AttrConfig.GetByKeyName(a.attr).Id, math.floor(a.value * value / 100))
end

-- 销毁物品
function GemStone.on_item_destroy(item)
end

-- 使用物品前
function GemStone.on_pre_use_item(player,item,count)
	return false
end

-- 使用物品
function GemStone.on_use_item(player, item, count)
end