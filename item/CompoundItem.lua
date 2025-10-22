-- 道具合成
CompoundItem = {}

-- 合成类型
CompoundItem.config = {}

-- 合成配置
CompoundItem.ItemList = { 
	["大雁塔信物"] = {"大雁塔碎片1", 1, "大雁塔碎片2", 1, "大雁塔碎片3", 1, "大雁塔碎片4", 1, "大雁塔碎片5", 1, "大雁塔碎片6", 1, "大雁塔碎片7", 1},
	["藏宝图"] = {"藏宝图碎片1", 1, "藏宝图碎片2", 1, "藏宝图碎片3", 1, "藏宝图碎片4", 1, "藏宝图碎片5", 1},
	["高级藏宝图"] = {"高级藏宝图碎片1", 1, "高级藏宝图碎片2", 1, "高级藏宝图碎片3", 1, "高级藏宝图碎片4", 1, "高级藏宝图碎片5", 1},
}

local consume_num = 1

-- 创建物品
function CompoundItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function CompoundItem.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function CompoundItem.on_pre_use_item(player,item,count)
	if item == nil then
		return false
	end
	
	--生成合成类型的表 CompoundItem.config.
	CompoundItem.CreatConfig()
	local keyname = item:GetKeyName()
  	local BagFreeNum = Lua_tools.GetBagFree(player)
	
  	if BagFreeNum > 0 then 
		if CompoundItem.config and CompoundItem.ItemList then
			local key = CompoundItem.config[keyname]
			local item_list = CompoundItem.ItemList[key]
      		if count > 1 then
				sLuaApp:NotifyTipsMsg(player,"该物品无法批量使用！")
				return false
			else
          		if Lua_tools.IsItemEnough(player, item_list) then
					local keyname = item:GetKeyName()
					local key = CompoundItem.config[keyname]
					local item_list = CompoundItem.ItemList[key]
					if Lua_tools.SubItem(player, item_list, "system", "道具合成销毁道具", "") ~= false then
						local finalItem_list = {}
						table.insert(finalItem_list, key)
						table.insert(finalItem_list, 1)
						if Lua_tools.AddItem(player, finalItem_list, "system", "道具合成给予道具", "") then
							sLuaApp:NotifyTipsMsg(player, "合成道具成功！")
						else
							sLuaApp:NotifyTipsMsg(player, "合成道具失败！")
						end
					else
						sLuaApp:NotifyTipsMsg(player, "合成材料不足！")
					end
						return false
				else
					sLuaApp:NotifyTipsMsg(player, "您的合成道具不足，请集齐道具再进行合成")
					return false
				end	
          	end
		else
			sLuaApp:NotifyTipsMsg(player,"没有加载到合成配置")
			return false
		end
    else
    	sLuaApp:NotifyTipsMsg(player,"您的背包空间不足！")
		return false
    end
end

-- 使用物品
function CompoundItem.on_use_item(player, item, count)
	if item == nil then
		return
	end
end

-- 生成合成类型表
function CompoundItem.CreatConfig()
	for k, v in pairs(CompoundItem.ItemList) do
		for m, n in pairs(v) do
			if type(n) == "string" then
				CompoundItem.config[n] = k
			end
		end
	end
end
