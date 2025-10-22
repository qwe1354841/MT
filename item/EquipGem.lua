--装备宝石（合成，镶嵌，拆除）
EquipGem = {}

-- 最大槽位数量
EquipGem.MaxGemNum = 3

--宝石最高等级(需要和宝石配置GemStone.SiteConfig以及宝石合成消耗公式EquipGem.FormualComposeConfig相对应)
EquipGem.MaxGemLevel = 15

-- 宝石类型
EquipGem.GemIdxConfig = {
	[1] = 5001,	-- 1级开锋石  1级攻击石
	[2] = 5101,	-- 1级幻灵石  1级魔攻石
	[3] = 5201, -- 1级金刚石  1级物抗石
	[4] = 5301, -- 1级舍利石  1级生命石
	[5] = 5401, -- 1级雷影石  1级速度石
	[6] = 5501, -- 1级镇魂石  1级封印石
	[7] = 5601, -- 1级玲珑石  1级魔抗石
	[8] = 5701, -- 1级烈光石  1级暴击石
}

EquipGem.GemIdxConfig_T = {
	[5001] = {MoneyType = 5, MoneyVal = 10000},	-- 1级开锋石  1级攻击石
	[5101] = {MoneyType = 5, MoneyVal = 10000},
	[5201] = {MoneyType = 5, MoneyVal = 10000},
	[5301] = {MoneyType = 5, MoneyVal = 10000},
	[5401] = {MoneyType = 5, MoneyVal = 10000},
	[5501] = {MoneyType = 5, MoneyVal = 10000},
	[5601] = {MoneyType = 5, MoneyVal = 10000},
	[5701] = {MoneyType = 5, MoneyVal = 10000},
}

--宝石等级对应消耗
EquipGem.ConsumeOfLv = {
	--[1] = {ItemNumber = 1, MoneyType = 5, MoneyVal = 0, Rate = 10000},
	[2] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 100, Rate = 10000},
	[3] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 200, Rate = 10000},
	[4] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 400, Rate = 10000},
	[5] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 800, Rate = 10000},
	[6] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 1600, Rate = 10000},
	[7] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 3200, Rate = 10000},
	[8] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 6400, Rate = 10000},
	[9] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 12800, Rate = 10000},
	[10] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 25600, Rate = 10000},
	[11] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 25600, Rate = 10000},
	[12] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 25600, Rate = 10000},
	[13] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 25600, Rate = 10000},
	[14] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 25600, Rate = 10000},
	[15] = {ItemNumber = 3, MoneyType = 5, MoneyVal = 25600, Rate = 10000},
}

--EquipGem.Version = "21.0423" 

-- 宝石可合成列表	参数为下级宝石
EquipGem.CanFormualComposeConfig ={
--攻击石
	[5002] = 5001,
	[5003] = 5002,
	[5004] = 5003,
	[5005] = 5004,
	[5006] = 5005,
	[5007] = 5006,
	[5008] = 5007,
	[5009] = 5008,
	[5010] = 5009,
	[5011] = 5010,
	[5012] = 5011,
	[5013] = 5012,
	[5014] = 5013,
	[5015] = 5014,
--魔攻石          
	[5102] = 5101,
	[5103] = 5102,
	[5104] = 5103,
	[5105] = 5104,
	[5106] = 5105,
	[5107] = 5106,
	[5108] = 5107,
	[5109] = 5108,
	[5110] = 5109,
	[5111] = 5110,
	[5112] = 5111,
	[5113] = 5112,
	[5114] = 5113,
	[5115] = 5114,
--物抗石          
	[5202] = 5201,
	[5203] = 5202,
	[5204] = 5203,
	[5205] = 5204,
	[5206] = 5205,
	[5207] = 5206,
	[5208] = 5207,
	[5209] = 5208,
	[5210] = 5209,
	[5211] = 5210,
	[5212] = 5211,
	[5213] = 5212,
	[5214] = 5213,
	[5215] = 5214,
--生命石          
	[5302] = 5301,
	[5303] = 5302,
	[5304] = 5303,
	[5305] = 5304,
	[5306] = 5305,
	[5307] = 5306,
	[5308] = 5307,
	[5309] = 5308,
	[5310] = 5309,
	[5311] = 5310,
	[5312] = 5311,
	[5313] = 5312,
	[5314] = 5313,
	[5315] = 5314,
--速度石          
	[5402] = 5401,
	[5403] = 5402,
	[5404] = 5403,
	[5405] = 5404,
	[5406] = 5405,
	[5407] = 5406,
	[5408] = 5407,
	[5409] = 5408,
	[5410] = 5409,
	[5411] = 5410,
	[5412] = 5411,
	[5413] = 5412,
	[5414] = 5413,
	[5415] = 5414,
--封印石          
	[5502] = 5501,
	[5503] = 5502,
	[5504] = 5503,
	[5505] = 5504,
	[5506] = 5505,
	[5507] = 5506,
	[5508] = 5507,
	[5509] = 5508,
	[5510] = 5509,
	[5511] = 5510,
	[5512] = 5511,
	[5513] = 5512,
	[5514] = 5513,
	[5515] = 5514,
--魔抗石          
	[5602] = 5601,
	[5603] = 5602,
	[5604] = 5603,
	[5605] = 5604,
	[5606] = 5605,
	[5607] = 5606,
	[5608] = 5607,
	[5609] = 5608,
	[5610] = 5609,
	[5611] = 5610,
	[5612] = 5611,
	[5613] = 5612,
	[5614] = 5613,
	[5615] = 5614,
--暴击石          
	[5702] = 5701,
	[5703] = 5702,
	[5704] = 5703,
	[5705] = 5704,
	[5706] = 5705,
	[5707] = 5706,
	[5708] = 5707,
	[5709] = 5708,
	[5710] = 5709,
	[5711] = 5710,
	[5712] = 5711,
	[5713] = 5712,
	[5714] = 5713,
	[5715] = 5714,
}

-- 快捷合成映射
EquipGem.QuickCompoundMappings = {}
-- 单等级宝石所需最下级宝石数量
EquipGem.gemNumByLv = {}
-- 宝石合成消耗公式
EquipGem.FormualComposeConfig = {}

--创建宝石消耗公式，快捷合成映射以及单等级宝石所需最下级宝石数量的动态表
function EquipGem.Initialization()
	for k,v in pairs(EquipGem.CanFormualComposeConfig) do
		local gemData = ItemConfig.GetById(k)
		local cosumeData = EquipGem.ConsumeOfLv[gemData.Itemlevel]
		EquipGem.FormualComposeConfig[k] = {Item = v, ItemNumber = cosumeData.ItemNumber, MoneyType = cosumeData.MoneyType, MoneyVal = cosumeData.MoneyVal, Rate = cosumeData.Rate}
	end
	EquipGem.gemNumByLv[1] = 1
	for k, v in pairs(EquipGem.FormualComposeConfig) do
		local gemData = ItemConfig.GetById(k)
		EquipGem.gemNumByLv[gemData.Itemlevel] = v.ItemNumber
	end

	EquipGem.QuickCompoundMappings[1] = 1
	for i = 2, EquipGem.MaxGemLevel do 
		local lastLevel = i - 1
		if EquipGem.gemNumByLv[i] then
			EquipGem.QuickCompoundMappings[i] = EquipGem.QuickCompoundMappings[lastLevel] * EquipGem.gemNumByLv[i]
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(EquipGem.FormualComposeConfig))
	--sLuaApp:LuaDbg(Lua_tools.serialize(EquipGem.gemNumByLv))
	--sLuaApp:LuaDbg(Lua_tools.serialize(EquipGem.QuickCompoundMappings))
end
EquipGem.Initialization()

-- 宝石自定义变量
-- GemValue 宝石价值

-- 装备自定义变量
-- ITEM_GemNum装备开孔
-- ITEM_GemId_1 孔1镶嵌宝石ID

function EquipGem.GetStoneData(player)
	local str = [[
			if EquipGemInlayUI then
				EquipGemInlayUI.MaxGemLevel = ]]..EquipGem.MaxGemLevel..[[
				EquipGemInlayUI.ComposeMapping = ]]..Lua_tools.serialize(EquipGem.CanFormualComposeConfig)..[[
				EquipGemInlayUI.GetConfig(]] .. Lua_tools.serialize(GemStone.EquipSiteConfig) .. [[)
			end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

-- 获取宝石合成公式
function EquipGem.GetComposeData(player)
	sLuaApp:LuaDbg("GetComposeData")
	--if Version ~= EquipGem.Version then
	local str = [[
		if EquipGemMergeUI then	
			EquipGemMergeUI.ComposeData = ]]..EquipGem.ComposeData..[[
			EquipGemMergeUI.GetConfig(]]..EquipGem.ComposeData..[[,]] 
			.. Lua_tools.serialize(GemStone.SiteConfig) .. [[
			)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

-- 快捷购买
function EquipGem.BuyGem(player, gem_idx)
	if player == nil then
		return false
	end
	sLuaApp:LuaDbg(" EquipGem.BuyGem(player, gem_idx)"..gem_idx)
	local gem_id = EquipGem.GemIdxConfig[gem_idx]
	if gem_id == nil then
		sLuaApp:NotifyTipsMsgEx(player, "找不到指定类型的宝石")
		return false
	end

	local row = ItemConfig.GetById(gem_id)
	if row == nil then
		sLuaApp:NotifyTipsMsgEx(player, "找不到指定宝石")
		return false
	end

	if Lua_tools.GetGemBagFree(player) == 0 then
		sLuaApp:NotifyTipsMsgEx(player, "宝石包裹已满，请清理再试")
		return false
	end
	sLuaApp:LuaDbg("调用OneKeyBuy  keyname:"..row.KeyName)
	return OneKeyBuy.Main(player, {row.KeyName, 1})
end

--itemMode 记录是从哪个口子进入的快捷合成页面
--itemMode = 1就是从装备镶嵌的宝石中点击升级进入
--itemMode = 0就是从右边宝石列表点击按钮进入

-- 快捷合成
function EquipGem.QuickCompound(player, Gem_Type, gem_id, targetgem_id, itemMode)
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return false
	end
	
	local gem_id = tonumber(gem_id)
	local targetgem_id = tonumber(targetgem_id)
	
	local gemData = ItemConfig.GetById(gem_id)
	if gemData.Subtype2 ~= Gem_Type then
		sLuaApp:NotifyTipsMsg(player, "宝石类型与合成类型不符")
		return ""
	end
	
	if targetgem_id <= gem_id then
		sLuaApp:NotifyTipsMsg(player, "合成宝石有误")
		return ""
	end
	
	local player_guid = tostring(player:GetGUID())
	local itemCon
	if BagClassify.Mode and BagClassify.Mode == 1 then
		itemCon = player:GetItemContainer(ITEM_CONTAINER_BAG)
	else
		itemCon = player:GetItemContainer(ITEM_CONTAINER_GEM_BAG)
	end
	local gemList = itemCon:GetItemList()
	local ComposeGemList = {}
	for k, v in ipairs(gemList) do
		local gemData = ItemConfig.GetById(v:GetId())
		if gemData.Type == 3 and gemData.Subtype == 9 then
			if gemData.Subtype2 == Gem_Type then
				--if EquipGem.CanFormualComposeConfig[gemData.Id] then
				local row = EquipGem.FormualComposeConfig[gemData.Id]
				if ComposeGemList[gemData.Id] == nil then
					ComposeGemList[gemData.Itemlevel] = {}
					local conversion = 1
					if gemData.Itemlevel ~= 1 then
						conversion = EquipGem.QuickCompoundMappings[gemData.Itemlevel] --row.ItemNumber ^ (gemData.Itemlevel-1)
					end
					ComposeGemList[gemData.Itemlevel] = {gem = v, bind_num = sItemSystem:GetItemAmount(player, v:GetId(), 2),notbind_num = sItemSystem:GetItemAmount(player, v:GetId(), 1), conversion = conversion}
				end
				--end
			end
		end
	end
	local FinalComposeGemList = {}
	for k, v in pairs(ComposeGemList) do
		if ComposeGemList[k]["gem"]:GetId() <= gem_id then
			FinalComposeGemList[k] = ComposeGemList[k]
		end
	end
	EquipGem.result[player_guid] = EquipGem.GetQuickComposeConsume(player, FinalComposeGemList, gem_id, targetgem_id, itemMode)
	if EquipGem.result[player_guid] == nil or EquipGem.result[player_guid] == "" then
		return ""
	end
	EquipGem.result[player_guid]["consumeNum"]["cur"] = gem_id
	EquipGem.result[player_guid]["consumeNum"]["tar"] = targetgem_id
	EquipGem.resgemList[player_guid] = {}
	for k, v in pairs(EquipGem.result[player_guid]["gem_list"]) do
		if itemMode == 0 then
			if v[1]:GetId() == gem_id then
				if tonumber(v[2] - 1) ~= 0 then
					table.insert(EquipGem.resgemList[player_guid], {gemId = v[1]:GetId(), gemNum = tonumber(v[2]-1), gemSelNum = tonumber(v[2]-1)})
				end
			else
				table.insert(EquipGem.resgemList[player_guid], {gemId = v[1]:GetId(), gemNum = tonumber(v[2]), gemSelNum = tonumber(v[2])})
			end
		else
			if type(v[1]) ~= "number" then
				if v[1]:GetId() == gem_id and (tonumber(v[2])-1) ~= 0 and EquipGem.result[player_guid]["Enough"] ~= 1 then
					table.insert(EquipGem.resgemList[player_guid], {gemId = v[1]:GetId(), gemNum = tonumber(v[2])-1, gemSelNum = tonumber(v[2])-1})
				else
					table.insert(EquipGem.resgemList[player_guid], {gemId = v[1]:GetId(), gemNum = tonumber(v[2]), gemSelNum = tonumber(v[2])})
				end
			end
		end
	end
	
	local str = [[
		if EquipGemInlayUI then
			EquipGemInlayUI['QuickCompoundConsum'] = ]]..Lua_tools.serialize(EquipGem.result[player_guid]["consumeNum"])..[[
			EquipGemInlayUI['QuickCompoundGemList'] = ]]..Lua_tools.serialize(EquipGem.resgemList[player_guid])..[[
			EquipGemInlayUI.OnEquipGemUpgradeClick_S()
			EquipGemInlayUI.QuickMerge_Refresh()
		end
	]]
	--sLuaApp:LuaDbg(Lua_tools.serialize(EquipGem.resgemList[player_guid]))
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--获取宝石快捷合成消耗
function EquipGem.GetQuickComposeConsume(player, gem_list, gem_id, targetgem_id, itemMode)
	local maxLevel = ItemConfig.GetById(gem_id).Itemlevel
	sLuaApp:LuaDbg("targetgem_id:"..targetgem_id.."   type =" ..type(targetgem_id))
	if not EquipGem.FormualComposeConfig[targetgem_id] then
		sLuaApp:NotifyTipsMsg(player, "该宝石无法继续向上合成")
		sLuaApp:LuaDbg("未找到该宝石的合成映射")
		return ""
	end
	local gemData = ItemConfig.GetById(targetgem_id)
	if gemData.Type == 3 and gemData.Subtype == 9 then
		local targetLevel = ItemConfig.GetById(targetgem_id).Itemlevel or #EquipGem.QuickCompoundMappings + 1
		if targetLevel > #EquipGem.QuickCompoundMappings or targetLevel == nil then
			local resultEx = {MoneyType = EquipGem.FormualComposeConfig[5002].MoneyType, MoneyVal = 100, cur = gem_id, tar = targetgem_id}
			local str = [[
				if EquipGemInlayUI then
					EquipGemInlayUI['QuickCompoundConsum'] = ]]..Lua_tools.serialize(resultEx)..[[
					EquipGemInlayUI['QuickCompoundGemList'] = {}
					EquipGemInlayUI.QuickMerge_Refresh()
				end
			]]
			--sLuaApp:LuaDbg(str)
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		end

		local selectData = {}
		local now_conversion = 0
		for k, v in pairs(gem_list) do
			now_conversion = now_conversion + v.conversion*(v.bind_num+v.notbind_num)
		end
		
		if itemMode == 1 then
			now_conversion = now_conversion + EquipGem.QuickCompoundMappings[ItemConfig.GetById(gem_id).Itemlevel]
		end
		
		local composeData  = gem_list[maxLevel]
		local row  = EquipGem.FormualComposeConfig[targetgem_id]
		local rowData = ItemConfig.GetById(targetgem_id)
		local target_conversion = EquipGem.QuickCompoundMappings[rowData.Itemlevel]
		local basic_price = ExchangeConfig.GetById(EquipGem.GemIdxConfig[rowData.Subtype2]).Buy
		selectData["gem_list"] = {}
		--如果当前背包中的宝石数量小于等于所需宝石数量，就把所有宝石丢进去
		if now_conversion <= target_conversion then
			selectData["consumeNum"] = {MoneyType = row.MoneyType, MoneyVal = (target_conversion - now_conversion) * basic_price + row.MoneyVal}
			for k, v in pairs(gem_list) do
				--sLuaApp:LuaDbg("k="..k.."  type="..type(k))
				--sLuaApp:LuaDbg("maxLevel="..maxLevel.."  type="..type(maxLevel))
				if k == maxLevel then
					if itemMode == 0 then
						--sLuaApp:LuaDbg("从右侧进入")
						if (v.bind_num + v.notbind_num - 1) ~= 0 then
							table.insert(selectData["gem_list"], {v.gem, (v.bind_num + v.notbind_num)})
						end
					else
						--sLuaApp:LuaDbg("从升级进入")
						table.insert(selectData["gem_list"], {v.gem, (v.bind_num + v.notbind_num)})
					end
				else
					table.insert(selectData["gem_list"], {v.gem, (v.bind_num + v.notbind_num)})
				end
			end
			selectData["Enough"] = 1
		else
			--如果当前背包中的宝石数量大于所需宝石数量
			selectData["consumeNum"] = {MoneyType = row.MoneyType, MoneyVal = row.MoneyVal}
			--目标宝石所需当前宝石的数量
			local residue = EquipGem.QuickCompoundMappings[rowData.Itemlevel]/EquipGem.QuickCompoundMappings[maxLevel]
			EquipGem.test(maxLevel,gem_id, gem_list, row, rowData, residue, itemMode, selectData)
			if itemMode == 1 then
				if selectData["gem_list"][maxLevel] then
					if selectData["gem_list"][maxLevel][2] - 1 == 0 then
						table.remove(selectData["gem_list"], maxLevel)
					end
				end
			end
		end
		return selectData
	else
		sLuaApp:NotifyTipsMsg(player, "目标道具不是宝石，目标道具id为:"..targetgem_id)
		return ""
	end
end

--计算所需宝石类型以及数量
function EquipGem.test(i, gem_id, gem_list, row, rowData, residue, itemMode, selectData)
	if itemMode == 1 and  i == ItemConfig.GetById(gem_id).Itemlevel and not gem_list[i] then
		gem_list[i] = {gem = gem_id, bind_num = 0, notbind_num = 0}
	end
	local nowresidu = 0
	if i ~= 0 then
		if gem_list[i] then
			if itemMode == 1 and i == ItemConfig.GetById(gem_id).Itemlevel then
				nowresidu = (gem_list[i]["bind_num"] + gem_list[i]["notbind_num"]) + 1
			else
				nowresidu = (gem_list[i]["bind_num"] + gem_list[i]["notbind_num"])
			end
			if nowresidu >= residue then
				table.insert(selectData["gem_list"], {gem_list[i].gem, residue})
				return
			else
				table.insert(selectData["gem_list"], {gem_list[i].gem, nowresidu})
				if i >= 1 then
					local nowtarget =  (residue - nowresidu) * EquipGem.QuickCompoundMappings[i]
					i = i - 1
					local res = nowtarget/EquipGem.QuickCompoundMappings[i]
					--sLuaApp:LuaDbg("res1:"..res)
					EquipGem.test(i, gem_id, gem_list, row, rowData, res, itemMode, selectData)
				end
			end
		else
			local nowtarget = (residue - nowresidu) * EquipGem.QuickCompoundMappings[i]
			local res = nowtarget
			if i >= 1 then
				i = i - 1
				if i == 0 then
					return
				else
					res = (res/EquipGem.QuickCompoundMappings[i])
				end
				--sLuaApp:LuaDbg("res2:"..res)
				EquipGem.test(i, gem_id, gem_list, row, rowData, res, itemMode, selectData)
			end
		end
	end
end

--快捷合成减少宝石
function EquipGem.SubGemNum(player, gem_guid)
	local player_guid = tostring(player:GetGUID())
	if EquipGem.resgemList[player_guid] then
		local gem = sItemSystem:GetItemByGUID(gem_guid)
		local gem_id = gem:GetId()
		local addConsume = 0
		local basic_price = ExchangeConfig.GetById(EquipGem.GemIdxConfig[ItemConfig.GetById(gem_id).Subtype2]).Buy
		for k, v in pairs(EquipGem.resgemList[player_guid]) do
			if v.gemId == gem_id then
				v.gemSelNum = v.gemSelNum - 1
				if v.gemSelNum == 0 then
					table.remove(EquipGem.resgemList[player_guid], k)
				end
				local gemData = ItemConfig.GetById(gem_id)
				if EquipGem.QuickCompoundMappings[gemData.Itemlevel] then
					addConsume = EquipGem.QuickCompoundMappings[gemData.Itemlevel] * basic_price
				end
				break
			end
		end
		--sLuaApp:LuaDbg("addConsume"..addConsume)
		EquipGem.result[player_guid]["consumeNum"]["MoneyVal"] = EquipGem.result[player_guid]["consumeNum"]["MoneyVal"] + addConsume
		local str = [[
			if EquipGemInlayUI then
				EquipGemInlayUI['QuickCompoundConsum'] = ]]..Lua_tools.serialize(EquipGem.result[player_guid]["consumeNum"])..[[
				EquipGemInlayUI['QuickCompoundGemList'] = ]]..Lua_tools.serialize(EquipGem.resgemList[player_guid])..[[
				EquipGemInlayUI.QuickMerge_Refresh()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		--sLuaApp:LuaDbg(str)
	else
		sLuaApp:LuaDbg("没有找到result数据")
		return ""
	end
end

--快捷合成消耗宝石
function EquipGem.ConsumeQuickCompound(player, item_guid, slot, gem_id, targetgem_id)
	if not EquipGem.FormualComposeConfig[targetgem_id] then
		sLuaApp:LuaDbg("未找到宝石的合成公式")
		return ""
	end
	local player_guid = tostring(player:GetGUID())
	if EquipGem.resgemList[player_guid] then
		if EquipGem.result[player_guid] then	
			local result = EquipGem.result[player_guid]
			if not result["consumeNum"] then
				sLuaApp:LuaDbg("没有找到 result consumeNum 数据")
				return
			end
			if result["consumeNum"].MoneyType and result["consumeNum"].MoneyVal then
				if Lua_tools.IsMoneyEnough(player, result["consumeNum"].MoneyType, result["consumeNum"].MoneyVal) == false then
					if MoneyChange then
						local f_name = [[EquipGem.ConsumeQuickCompound(player,]]..item_guid..[[,]]..slot..[[,]]..gem_id..[[,]]..targetgem_id..[[)]]
						MoneyChange.LackMoney(player, result["consumeNum"].MoneyType, result["consumeNum"].MoneyVal, f_name)
						return ""
					end
				end
				if Lua_tools.SubMoney(player, result["consumeNum"].MoneyType, result["consumeNum"].MoneyVal, "装备系统", "宝石快捷合成", "宝石合成消耗货币") == false then
					sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(result["consumeNum"].MoneyType).."不足，不能合成")
				end
			else
				sLuaApp:LuaErr("没有找到result中的consumeNum数据")
				return ""
			end
		else
			sLuaApp:LuaDbg("没有找到result数据")
			return ""
		end
		slot = tonumber(slot)
		if slot ~= 0 then
			local item = sItemSystem:GetItemByGUID(item_guid)
			if item == nil then
				sLuaApp:LuaDbg("找不到装备")
				return false
			end
			local gem_id = item:GetInt("ITEM_GemId_" .. slot)
			if gem_id ~= 0 then
				for k, v in pairs(EquipGem.resgemList[player_guid]) do
					if v.gemId == gem_id then
						sLuaApp:LuaDbg("该宝石为镶嵌中的宝石")
						if sItemSystem:ConsumeItemWithId(player, v.gemId, (v.gemSelNum), 3, "装备系统", "宝石快捷合成", "宝石合成消耗宝石") ~= 0 then
							sLuaApp:NotifyTipsMsg(player, "快捷合成失败")
							return ""
						end
					else
						if sItemSystem:ConsumeItemWithId(player, v.gemId, (v.gemSelNum), 3, "装备系统", "宝石快捷合成", "宝石合成消耗宝石") ~= 0 then
							sLuaApp:NotifyTipsMsg(player, "快捷合成失败")
							return ""
						end
					end
				end
			end
			
			--sLuaApp:LuaDbg("targetgem_id:"..targetgem_id.."  type:"..type(targetgem_id))
			local gemEx = sItemSystem:AddItemEx(player, targetgem_id, 1, false, "装备系统", "宝石合成", "合成成功给予道具")
			--sLuaApp:LuaDbg(type(gemEx))
			if gemEx == nil then
				sLuaApp:NotifyTipsMsgEx(player, "宝石合成失败")
				return false
			else
				item:SetInt("ITEM_GemId_" .. slot, 0)
				item:SetDynAttrsByMark(EquipAttrClassify["EquipGemSlot_" .. slot], 0)
				if not EquipGem.EmbedGem(player, item_guid, slot, gemEx[1]:GetGUID()) then
					sLuaApp:LuaDbg("镶嵌失败")
					return ""
				end
			end
		else
			if sItemSystem:ConsumeItemWithId(player, gem_id, 1, 3, "装备系统", "宝石快捷合成", "宝石合成消耗宝石") ~= 0 then
				sLuaApp:NotifyTipsMsg(player, "快捷合成消耗道具失败")
				return ""
			end
			for k, v in pairs(EquipGem.resgemList[player_guid]) do
				--sLuaApp:LuaDbg("k:"..k.."  vid:"..v.gemId.."  vNum:"..v.gemSelNum)
				
				if sItemSystem:ConsumeItemWithId(player, v.gemId, v.gemSelNum, 3, "装备系统", "宝石快捷合成", "宝石合成消耗宝石") ~= 0 then
					sLuaApp:NotifyTipsMsg(player, "快捷合成消耗道具失败")
					return ""
				end
			end
			if sItemSystem:AddItemEx(player, targetgem_id, 1, false, "装备系统", "宝石合成", "合成成功给予道具") == nil then
				sLuaApp:NotifyTipsMsgEx(player, "宝石合成失败")
				return ""
			end
		end
		sLuaApp:LuaDbg("道具扣除成功")
		local str = [[
			if EquipGemInlayUI then
				EquipGemInlayUI.MergeSuccessfully()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		EquipGem.result[player_guid] = {}
		EquipGem.resgemList[player_guid] = {}
		return ""
	else
		sLuaApp:LuaDbg("没有找到resgemList数据")
		return ""
	end
end

-- 宝石拆除
function EquipGem.RemoveGem(player, item_guid, slot, tips)
	if player == nil then
		return false
	end
	
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return ""
	end
	--sLuaApp:LuaDbg(item_guid)
	item_guid = tonumber(item_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if item == nil then
		sLuaApp:LuaDbg("找不到装备")
		return false
	end

	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsgEx(player, "无效装备")
		return false
	end
	
	--local gem_num = item:GetInt("ITEM_GemNum")
	if slot < 1 then
		sLuaApp:LuaDbg("无效槽位")
		return false
	end

	local gem_id = item:GetInt("ITEM_GemId_" .. slot)
	local gem_attrs = item:GetDynAttrsByMark(EquipAttrClassify["EquipGemSlot_" .. slot])
	if gem_id == 0 then
		sLuaApp:NotifyTipsMsgEx(player, "没有镶嵌宝石，无法拆除！")
		return false
	end

	--sLuaApp:LuaDbg("GemAttrs: " .. Lua_tools.serialize(gem_attrs))
	if Lua_tools.GetGemBagFree(player) == 0 then
		sLuaApp:NotifyTipsMsgEx(player, "宝石包裹已满，请清理再试")
		return false
	end

	local gem = sItemSystem:CreateItem(gem_id, 1, true)
	if gem == nil then
		sLuaApp:NotifyTipsMsgEx(player, "创建宝石失败")
		return false
	end

	gem:SetDynAttrsByTable(EquipAttrClassify['GemAttr'], gem_attrs)
	--local code = sItemSystem:MergeItem(player, gem, "装备系统", "宝石拆除", "")
	--if code ~= 0 then
	--	return false
	--end
	Lua_tools.AddItem(player, {gem:GetKeyName(), 1, gem:IsBound() and 1 or 0}, "装备系统", "宝石拆除", "")
	
	item:SetInt("ITEM_GemId_" .. slot, 0)
	item:SetDynAttrsByMark(EquipAttrClassify["EquipGemSlot_" .. slot], 0)
	
	if item:GetItemContainerType() ~= ITEM_CONTAINER_BAG then
		player:RecalcAttr()
	end

	if tips then
		local str = [[
			if EquipGemInlayUI then
				EquipGemInlayUI.RemoveSuccess()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
	if AttributeEnhance then
		AttributeEnhance.Equip_Strengthen_level(player)
	end
	if Achievement then
		Achievement.Equip_Achievement(player)
	end
	return true
end

-- 检测是否能够拆除全部宝石
function EquipGem.CheckRemoveAllGem(player, item_guid)
	if player == nil then
		return false
	end
	
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return false
	end
	
	item_guid = tonumber(item_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	
	if item == nil then
		sLuaApp:LuaDbg("找不到装备")
		return false
	end

	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsgEx(player, "无效装备")
		return false
	end
	
	if not EquipGem.MaxGemNum or EquipGem.MaxGemNum < 1 then
		sLuaApp:LuaErr("EquipGem.MaxGemNum 数据错误")
		return false
	end
	local count = 0
	local gemList = {}
	for i = 1, EquipGem.MaxGemNum do
		local gem_id = item:GetInt("ITEM_GemId_" .. i)
		if gem_id ~= 0 then
			if not gemList[tostring(gem_id)] then
				gemList[tostring(gem_id)] = 1
			else
				gemList[tostring(gem_id)] = gemList[tostring(gem_id)] + 1
			end
		end
	end
	for k,v in pairs(gemList) do
		count = count + 1
	end
	--sLuaApp:LuaDbg(count)
	if Lua_tools.GetGemBagFree(player) < count then
		sLuaApp:NotifyTipsMsgEx(player, "宝石包裹空间不足，请清理再试")
		return false
	end
	return true
end

-- 拆除装备上的全部宝石
-- @newinter EquipGem.RemoveAllGem(player, 360676340529561968)
function EquipGem.RemoveAllGem(player, item_guid)
	if not EquipGem.CheckRemoveAllGem(player, item_guid) then
		return false
	end
	
	local item = sItemSystem:GetItemByGUID(item_guid)
	local slotList = {}
	for i = 1, EquipGem.MaxGemNum do
		local gem_id = item:GetInt("ITEM_GemId_" .. i)
		if gem_id ~= 0 then
			table.insert(slotList, i)
		end
	end
	sLuaApp:LuaDbg("删除宝石")
	sLuaApp:LuaDbg("slotList："..Lua_tools.serialize(slotList))
	for _, v in ipairs(slotList) do
		local ret = EquipGem.RemoveGem(player, item_guid, v)
		if not ret then
			return false
		end
	end
	
	if AttributeEnhance then
		AttributeEnhance.Equip_Strengthen_level(player)
	end
	if Achievement then
		Achievement.Equip_Achievement(player)
	end
	return true
end

--返回装备的装备位置
function EquipGem.CheckEquipSite(player, itemData)
	if itemData.Subtype == EQUIP_WEAPON then
		site = EQUIP_SITE_WEAPON
	elseif itemData.Subtype == EQUIP_ARMOR then
		if itemData.Subtype2 == ARMOR_HAT then
			--sLuaApp:LuaDbg("帽子")
			site = EQUIP_SITE_HAT
		elseif itemData.Subtype2 == ARMOR_CLOTH then
			--sLuaApp:LuaDbg("衣服")
			site = EQUIP_SITE_CLOTH
		elseif itemData.Subtype2 == ARMOR_BELT then
			--sLuaApp:LuaDbg("腰带")
			site = EQUIP_SITE_BELT
		elseif itemData.Subtype2 == ARMOR_PENDANT then
			--sLuaApp:LuaDbg("挂坠")
			site = EQUIP_SITE_HANGINGS
		end
	elseif itemData.Subtype == EQUIP_ACCESSORIES then
		if itemData.Subtype2 == ACCESSORIES_RING then
			--sLuaApp:LuaDbg("戒指")
			site = EQUIP_SITE_RING
		elseif itemData.Subtype2 == ACCESSORIES_NECKLACE then
			--sLuaApp:LuaDbg("项链")
			site = EQUIP_SITE_NECKLACE
		elseif itemData.Subtype2 == ACCESSORIES_WRIST then
			--sLuaApp:LuaDbg("护腕")
			site = EQUIP_SITE_WRIST
		elseif itemData.Subtype2 == ACCESSORIES_SHOES then
			--sLuaApp:LuaDbg("鞋子")
			site = EQUIP_SITE_SHOES
		end
	end
	return site
end

--检查宝石位置是否正确
function EquipGem.CheckGetSite(player, gem_id, site)
	local success = false
	if not GemStone.SiteConfig[gem_id] then
		sLuaApp:LuaErr("宝石"..gem_id.."未配置在GemStone.SiteConfig中")
		return 
	end
	for k,v in pairs(GemStone.SiteConfig[gem_id]) do
		if site == v then
			success = true
		end
	end
	return success
end

--测试强行装备宝石
--@newinter EquipGem.GemTest(player)
--function EquipGem.GemTest(player)
--	local GemContainer = player:GetItemContainer(ITEM_CONTAINER_GEM_BAG)
--	local EquipContainer = player:GetItemContainer(ITEM_CONTAINER_EQUIP)
--	local BagContainer = player:GetItemContainer(ITEM_CONTAINER_BAG)
--	local gem = GemContainer:GetItemBySite(0)
--	local item = BagContainer:GetItemBySite(0)
--	sLuaApp:LuaDbg(gem:GetKeyName())
--	sLuaApp:LuaDbg(item:GetKeyName())
--	EquipGem.EmbedGem(player, item:GetGUID(), 1, gem:GetGUID())
--end

--检测玩家装备上的宝石是否正确
function EquipGem.Login(player)
	--if player:GetType() ~= GUID_PLAYER then return end
	local BagContainer = player:GetItemContainer(ITEM_CONTAINER_BAG)
	local EquipContainer = player:GetItemContainer(ITEM_CONTAINER_EQUIP)
	local BagItemList = BagContainer:GetItemList()
	local EquipItemList = EquipContainer:GetItemList()
	local tips = false
	for k, v in pairs(BagItemList) do
		local itemData = ItemConfig.GetById(v:GetId())
		if itemData.Type == 1 then
			local site = EquipGem.CheckEquipSite(player, itemData)
			for i = 1, EquipGem.MaxGemNum do 	
				local gem_id = v:GetInt("ITEM_GemId_" .. i)
				if gem_id ~= 0 then
					local gemData = ItemConfig.GetById(gem_id)
					if gemData.Type == 3 and gemData.Subtype == 9 then
						if not EquipGem.CheckGetSite(player, gem_id, site) then
							EquipGem.RemoveAllGem(player, v:GetGUID())
							tips = true
						end
					end
				end
			end
		end
	end
	for k, v in pairs(EquipItemList) do
		local itemData = ItemConfig.GetById(v:GetId())
		if itemData.Type == 1 then
			local site = EquipGem.CheckEquipSite(player, itemData)
			for i = 1, EquipGem.MaxGemNum do 	
				local gem_id = v:GetInt("ITEM_GemId_" .. i)
				if gem_id ~= 0 then
					local gemData = ItemConfig.GetById(gem_id)
					if gemData.Type == 3 and gemData.Subtype == 9 then
						if not EquipGem.CheckGetSite(player, gem_id, site) then
							EquipGem.RemoveAllGem(player, v:GetGUID())
							tips = true
						end
					end
				end
			end
		end
	end
	if tips then
		sLuaApp:NotifyTipsMsg(player, "您的装备中有宝石镶嵌的位置出现错误，请重新安装。")
	end
end

-- 宝石镶嵌
function EquipGem.EmbedGem(player, item_guid, slot, gem_guid)
	if player == nil then
		return false
	end
	
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return ""
	end

	local item = sItemSystem:GetItemByGUID(item_guid)
	if item == nil then
		sLuaApp:LuaDbg("找不到装备")
		return false
	end

	local gem = sItemSystem:GetItemByGUID(gem_guid)
	if gem == nil then
		sLuaApp:LuaDbg("找不到宝石")
		return false
	end

	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:LuaDbg("目标不是装备主人")
		return false
	end

	if gem:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:LuaDbg("宝石不是玩家的")
		return false
	end

	--local gem_num = item:GetInt("ITEM_GemNum")
	if slot < 1 then
		sLuaApp:LuaDbg("无效槽位")
		return false
	end
	
	if not item:IsBound() then
		local str = [[GlobalUtils.ShowServerBoxMessage("镶嵌宝石会使您的装备和宝石都变为绑定，是否继续？")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "EquipGem.SetBountItem(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..item_guid..", "..slot..", "..gem_guid..")")
		sLuaApp:ShowForm(player, "脚本表单", str)
		return 
	end

	local gem_id = item:GetInt("ITEM_GemId_" .. slot)
	if gem_id ~= 0 then
		local ret = EquipGem.RemoveGem(player, item_guid, slot, false)
		if not ret then
			return false
		end
	end
	
	local gem_id = gem:GetId()

	local itemData = ItemConfig.GetById(item:GetId())
	if not itemData then
		return false
	end
	local site = EquipGem.CheckEquipSite(player, itemData)
	local gemData = ItemConfig.GetById(gem_id)
	if gemData.Type == 3 and gemData.Subtype == 9 then
		--if player:GetType() == GUID_PLAYER then
			if not EquipGem.CheckGetSite(player, gem_id, site) then
				sLuaApp:NotifyTipsMsg(player, "该装备无法镶嵌此宝石！")
				return false
			end
		--end
	end

	local gem_attrs = gem:GetDynAttrsByMark(EquipAttrClassify['GemAttr']) 
	local code = sItemSystem:ConsumeItem(gem, 1, "装备系统", "宝石镶嵌", "")
	if code ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "宝石镶嵌失败")
		return false
	end

	--sLuaApp:LuaDbg("GemAttrs: " .. Lua_tools.serialize(gem_attrs))
	
	item:SetInt("ITEM_GemId_" .. slot, gem_id)
	item:SetDynAttrsByTable(EquipAttrClassify["EquipGemSlot_" .. slot], gem_attrs)
	local test = item:GetDynAttrsByMark(EquipAttrClassify["EquipGemSlot_" .. slot])
	
	--sLuaApp:LuaDbg("itemGemAttrs: " .. Lua_tools.serialize(test))
	
	if item:GetItemContainerType() ~= ITEM_CONTAINER_BAG then
		player:RecalcAttr()
	end
	local str = [[
		if EquipGemInlayUI then
			EquipGemInlayUI.InlaySuccess()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)

	if AttributeEnhance then
		AttributeEnhance.Equip_Strengthen_level(player)
	end
	if Achievement then
		Achievement.Equip_Achievement(player)
	end
	return true
end

function EquipGem.SetBountItem(player, item_guid, slot, gem_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if not item:IsBound() then
		item:SetBound()
	end
	EquipGem.EmbedGem(player, item_guid, slot, gem_guid)
end

-- 宝石合成
function EquipGem.ComposeGem(player, gem_id, bindMode)
	if player == nil then
		return false
	end
	bindMode = tonumber(bindMode)
	--sLuaApp:LuaDbg("bindMode"..bindMode)
	local row = EquipGem.FormualComposeConfig[gem_id]
	local GemNum = sItemSystem:GetItemAmount(player, row.Item, 3)

	if row == nil then
		sLuaApp:NotifyTipsMsgEx(player, "系统错误：找不到合成公式")
		return false
	end
	if GemNum < row.ItemNumber then
		sLuaApp:NotifyTipsMsgEx(player, "您的宝石数量不足，无法合成")
		return false
	end
	
	if Lua_tools.IsMoneyEnough(player, row.MoneyType, row.MoneyVal) == false then
		if MoneyChange then
			local f_name = [[EquipGem.ComposeGem(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..gem_id..[[,]]..bindMode..[[)]]
			MoneyChange.LackMoney(player, row.MoneyType, row.MoneyVal, f_name)
			return ""
		end
	end
	
	local is_bind = true
	if bindMode == 1 then
		is_bind = false
	end
	-- is_bind = true  未勾选优先使用非绑定，即优先扣除绑定材料
	-- is_bind = false 勾选优先使用非绑定， 即优先扣除非绑定材料
	
	if Lua_tools.GetGemBagFree(player) == 0 then
		sLuaApp:NotifyTipsMsgEx(player, "宝石包裹已满，请清理再试")
		return false
	end
	
	--sLuaApp:LuaDbg("is_bind:"..tostring(is_bind))
	local give_bind = true
	--给予宝石的绑定状态，true为绑定，false为非绑
	if is_bind == false then
		sLuaApp:LuaDbg("优先使用非绑定道具")
		if sItemSystem:GetItemAmount(player, row.Item, 1) >= row.ItemNumber then
			sLuaApp:LuaDbg("非绑定道具大于合成所需道具，给予非绑宝石")
			give_bind = false
			sItemSystem:ConsumeItemWithPriority(player, row.Item, row.ItemNumber, false,"装备系统", "宝石合成", "合成宝石消耗材料") 
		else
			local str = [[GlobalUtils.ShowServerBoxMessage("使用绑定宝石进行合成时，产出的宝石也将是绑定状态，是否合成？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "EquipGem.ContinueA(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..gem_id..")")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return false
		end
	else
		if sItemSystem:GetItemAmount(player, row.Item, 2) > 0 then
			local str = [[GlobalUtils.ShowServerBoxMessage("使用绑定宝石进行合成时，产出的宝石也将是绑定状态，是否合成？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "EquipGem.ContinueB(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..gem_id..")")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return false
		else
			sLuaApp:LuaDbg("无绑定道具，给予非绑宝石")
			give_bind = false
			sItemSystem:ConsumeItemWithPriority(player, row.Item, row.ItemNumber, false,"装备系统", "宝石合成", "合成宝石消耗材料") 
		end
	end
	
	if Lua_tools.SubMoney(player, row.MoneyType, row.MoneyVal, "装备系统", "宝石合成", "宝石合成消耗货币") == false then
		sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(row.MoneyType).."不足，不能合成")
		return ""
	end
	
	local Rate = sLuaApp:RandInteger(0, 10000)
	if Rate < row.Rate then
		if sItemSystem:AddItemEx(player, gem_id, 1, give_bind, "装备系统", "宝石合成", "合成成功给予道具") == nil then
			sLuaApp:NotifyTipsMsgEx(player, "宝石合成失败")
			return false
		else
			local str = [[
				if EquipGemMergeUI then
					EquipGemMergeUI.MergeSuccess()
				end	
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	else
		sLuaApp:NotifyTipsMsgEx(player, "合成失败")
		return false
	end
	return true
end

function EquipGem.ContinueA(player, gem_id)
	local row = EquipGem.FormualComposeConfig[gem_id]
	if Lua_tools.SubMoney(player, row.MoneyType, row.MoneyVal, "装备系统", "宝石合成", "宝石合成消耗货币") == false then
		sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(row.MoneyType).."不足，不能合成")
		return ""
	end
	sItemSystem:ConsumeItemWithPriority(player, row.Item, row.ItemNumber, false,"装备系统", "宝石合成", "合成宝石消耗材料")
	
	local Rate = sLuaApp:RandInteger(0, 10000)
	if Rate < row.Rate then
		if sItemSystem:AddItemEx(player, gem_id, 1, true, "装备系统", "宝石合成", "合成成功给予道具") == nil then
			sLuaApp:NotifyTipsMsgEx(player, "宝石合成失败")
			return false
		else
			local str = [[
				if EquipGemMergeUI then
					EquipGemMergeUI.MergeSuccess()
				end	
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
	return true
end

function EquipGem.ContinueB(player, gem_id)
	local row = EquipGem.FormualComposeConfig[gem_id]
	if Lua_tools.SubMoney(player, row.MoneyType, row.MoneyVal, "装备系统", "宝石合成", "宝石合成消耗货币") == false then
		sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(row.MoneyType).."不足，不能合成")
		return ""
	end
	sItemSystem:ConsumeItemWithPriority(player, row.Item, row.ItemNumber, true,"装备系统", "宝石合成", "合成宝石消耗材料")
	local Rate = sLuaApp:RandInteger(0, 10000)
	if Rate < row.Rate then
		if sItemSystem:AddItemEx(player, gem_id, 1, true, "装备系统", "宝石合成", "合成成功给予道具") == nil then
			sLuaApp:NotifyTipsMsgEx(player, "宝石合成失败")
			return false
		else
			local str = [[
				if EquipGemMergeUI then
					EquipGemMergeUI.MergeSuccess()
				end	
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
	return true
end

--全部合成
function EquipGem.ComposeGemAll(player, gem_id, bindMode)
	if player == nil then
		return false
	end
	--sLuaApp:LuaDbg("ComposeGemAll_gem_id"..gem_id)
	--bindMode = tonumber(bindMode)
	--sLuaApp:LuaDbg("bindMode:"..bindMode)
	local row = EquipGem.FormualComposeConfig[gem_id]
	if row == nil then
		sLuaApp:NotifyTipsMsgEx(player, "系统错误：找不到合成公式")
		return false
	end

	if row.Item == 0 or row.ItemNumber == 0 then 
		sLuaApp:NotifyTipsMsgEx(player, "找不到合成材料")
		return false
	end
	
	local allNum = sItemSystem:GetItemAmount(player, row.Item, 3)
	if allNum < row.ItemNumber then
		sLuaApp:NotifyTipsMsgEx(player, "材料不足，无法合成")
		return false
	end
	local is_bind = true
	if bindMode == 1 then
		is_bind = false
	end
	
	local targetNum = math.floor(allNum/row.ItemNumber)
	local consumeNum = targetNum * row.MoneyVal
	
	if Lua_tools.IsMoneyEnough(player, row.MoneyType, consumeNum) == false then
		if MoneyChange then
			local f_name = [[EquipGem.ComposeGemAll(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..gem_id..[[,]]..bindMode..[[)]]
			MoneyChange.LackMoney(player, row.MoneyType, consumeNum, f_name)
			return ""
		end
	end
	
	--sLuaApp:LuaDbg("targetNum  "..targetNum)
	--sLuaApp:LuaDbg("consumeNum  "..consumeNum)
	--..", "..gem_id..
	local str = [[
		if EquipGemMergeUI then
			EquipGemMergeUI.OnMergeBtnClick_All_S(]]..targetNum..", "..consumeNum..[[)  
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipGem.GiveAllGem(player, gem_id, targetNum, consumeNum, bindMode)
	--if gem_id and targetNum and consumeNum and bindMode then
	--sLuaApp:LuaDbg("gem_id"..gem_id)
	--sLuaApp:LuaDbg("targetNum"..targetNum)
	--sLuaApp:LuaDbg("consumeNum"..consumeNum)
	--sLuaApp:LuaDbg("bindMode"..bindMode)
	local row =  EquipGem.FormualComposeConfig[gem_id]
	if sItemSystem:GetItemAmount(player, row.Item, 3) < row.ItemNumber then
		sLuaApp:NotifyTipsMsg(player, "您的宝石数量不足，无法合成")
		return ""
	end
	if sItemSystem:GetItemAmount(player, row.Item, 3) < targetNum * row.ItemNumber then
		sLuaApp:NotifyTipsMsg(player, "您的宝石数量不足以合成"..targetNum.."个"..ItemConfig.GetById(gem_id).Name)
		return ""
	end
	
	local gemStackMax = ItemConfig.GetById(gem_id).StackMax
	if Lua_tools.GetGemBagFree(player) < math.ceil(targetNum/gemStackMax) then
		sLuaApp:NotifyTipsMsgEx(player, "宝石包裹空间不足，请清理再试")
		return false
	end
	local notbindGemNum = sItemSystem:GetItemAmount(player, row.Item, 1)
	local bindGemNum = sItemSystem:GetItemAmount(player, row.Item, 2)
	--sLuaApp:LuaDbg("bindGemNum"..bindGemNum)
	--sLuaApp:LuaDbg("notbindGemNum"..notbindGemNum)
	
	-- is_bind = true  未勾选优先使用非绑定，即优先扣除绑定材料
	-- is_bind = false 勾选优先使用非绑定， 即优先扣除非绑定材料
	
	local is_bind = true
	if bindMode == 1 then
		is_bind = false
	end
	
	local bindtargetNum = 0
	local notbindtargetNum = 0
	if is_bind == true then
		local residue_bindGemNum = bindGemNum%row.ItemNumber
		--sLuaApp:LuaDbg("residue_bindGemNum:"..residue_bindGemNum)
		if residue_bindGemNum > 0 then
			bindtargetNum = (bindGemNum - residue_bindGemNum)/row.ItemNumber + 1
			notbindtargetNum = math.floor((notbindGemNum + residue_bindGemNum)/row.ItemNumber) - 1
			if notbindtargetNum < 0 then
				bindtargetNum = bindtargetNum - 1
				notbindtargetNum = 0
			end
			--sLuaApp:LuaDbg("notbindtargetNum_1:"..notbindtargetNum)
			--sLuaApp:LuaDbg("notbindtargetNum_2:"..targetNum - bindtargetNum)	
		else
			bindtargetNum = bindGemNum/row.ItemNumber
			notbindtargetNum = targetNum - bindtargetNum
		end
	elseif is_bind == false then
		local residue_bindGemNum = notbindGemNum%row.ItemNumber
		notbindtargetNum = (notbindGemNum - residue_bindGemNum)/row.ItemNumber
		bindtargetNum = targetNum - notbindtargetNum
	end
	sLuaApp:LuaDbg("bindtargetNum"..bindtargetNum.."  notbindtargetNum"..notbindtargetNum)
	local count_bind = 0
	local count_notbind = 0
	
	if bindtargetNum > 0 then
		for i = 1, bindtargetNum do
			local rate = sLuaApp:RandInteger(0, 10000)
			if rate < row.Rate then
				count_bind = count_bind + 1
			end
		end
	end
	
	if notbindtargetNum > 0 then
		for i = 1, notbindtargetNum do
			local rate = sLuaApp:RandInteger(0, 10000)
			if rate < row.Rate then
				count_notbind = count_notbind + 1
			end
		end
	end
	sLuaApp:LuaDbg("count_bind"..count_bind.."   count_notbind"..count_notbind)
	if count_bind > 0 then
		local str = [[GlobalUtils.ShowServerBoxMessage("使用绑定宝石进行合成时，产出的宝石也将是绑定状态，是否合成？")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "EquipGem.ContinueAll(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..gem_id..", "..targetNum..", "..consumeNum..", "..count_bind..", "..count_notbind..", "..bindMode..")")
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		EquipGem.ContinueAll(player, gem_id, targetNum, consumeNum, count_bind, count_notbind, bindMode)
	end
	return ""
end

function EquipGem.ContinueAll(player, gem_id, targetNum, consumeNum, count_bind, count_notbind, bindMode)
	local is_bind = true
	if bindMode == 1 then
		is_bind = false
	end
	local row =  EquipGem.FormualComposeConfig[gem_id]
	if Lua_tools.SubMoney(player, row.MoneyType, consumeNum, "装备系统", "宝石合成", "宝石合成消耗货币") == false then
		sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(row.MoneyType).."不足，不能合成")
		return ""
	end
	--sLuaApp:LuaDbg("targetNum"..targetNum)
	sItemSystem:ConsumeItemWithPriority(player, row.Item, (targetNum * row.ItemNumber), is_bind,"装备系统", "宝石合成", "合成宝石消耗材料")
	
	if count_bind > 0 then
		if sItemSystem:AddItemEx(player, gem_id, count_bind, true, "装备系统", "宝石合成", "合成成功给予道具") == nil then
			sLuaApp:NotifyTipsMsg(player, "合成失败")
			return false
		end
	end
	if count_notbind > 0 then
		if sItemSystem:AddItemEx(player, gem_id, count_notbind, false, "装备系统", "宝石合成", "合成成功给予道具") == nil then
			sLuaApp:NotifyTipsMsg(player, "合成失败")
			return false
		end
	end
	local str = [[
		if EquipGemMergeUI then
			EquipGemMergeUI.MergeSuccess()
		end	
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipGem.CheckRedPoint(player)
	--local ItemContainer_TB = {1,3,5}			--1指背包  3指宝石背包  5指装备中
	local Gem_ItemList = Lua_tools.GetGemList(player)
	local CanInlay = false
	if Gem_ItemList and #Gem_ItemList > 0 then
		local Bag_ItemContainer = player:GetItemContainer(1)
		local Bag_ItemList = Bag_ItemContainer:GetItemList() 
		for k,v in pairs(Bag_ItemList) do
			local Id = v:GetId()
			local itemData = ItemConfig.GetById(Id)
			if itemData.Type == 1 and itemData.Subtype ~= 4 and itemData.Subtype ~= 7 then
				CanInlay = EquipGem.CheckCanInlay_RedPoint(player, v, Gem_ItemList)
			end
		end	
		local Equip_ItemContainer = player:GetItemContainer(5)
		local Equip_ItemList = Equip_ItemContainer:GetItemList()
		for k,v in pairs(Equip_ItemList) do
			local Id = v:GetId()
			local itemData = ItemConfig.GetById(Id)
			if itemData.Type == 1 and itemData.Subtype ~= 4 and itemData.Subtype ~= 7 then
				CanInlay = EquipGem.CheckCanInlay_RedPoint(player, v, Gem_ItemList)
			end
		end
	end
	CanInlay = tostring(CanInlay)
	local TB = {}
	if GemStone then
		if GemStone.SiteConfig then
			TB.GemConfig = GemStone.SiteConfig
		end
	end
	TB["WhetherRedPoint"] = CanInlay
	if EquipGem.FormualComposeConfig then
		TB["FormualComposeConfig"] = EquipGem.FormualComposeConfig
	end
	return TB
end

function EquipGem.CheckCanInlay_RedPoint(player, item, Gem_ItemList)
	local HighestLevel = 1
	for k, v in pairs(Gem_ItemList) do
		local gem_id = v:GetId()
		local gemDB = ItemConfig.GetById(gem_id)
		local GemLevel = tonumber(gemDB.Itemlevel)
		if GemLevel > HighestLevel then
			HighestLevel = GemLevel
		end
	end
	for i = 1, EquipGem.MaxGemNum do 	
		local gem_id = item:GetInt("ITEM_GemId_"..i)
		if gem_id == 0 then
			return true
		end
		local gemDB = ItemConfig.GetById(gem_id)
		if gemDB then
			local GemLevel = tonumber(gemDB.Itemlevel)
			if GemLevel < HighestLevel then
				return true
			end
		end
	end
	return false
end

--设置宝石使用的mark
function EquipGem.SetMarks()
	local marks_tb = {}
	for i = 1,EquipGem.MaxGemNum do
		table.insert(marks_tb, EquipAttrClassify['EquipGemSlot_'..i])
	end
	sItemSystem:SetGemMarks(marks_tb)
end

--数据初始化
function EquipGem.InitializationEx()
	EquipGem.ComposeData = Lua_tools.serialize(EquipGem.FormualComposeConfig)
	EquipGem.result = {}
	EquipGem.resgemList = {}
end
EquipGem.InitializationEx()