--神兽图鉴碎片物品
GodAnimalItem = {}

-- 创建物品
function GodAnimalItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function GodAnimalItem.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function GodAnimalItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	if not GodAnimalConfig or not GodAnimalConfig.UseItem or not GodAnimalConfig.Main then
		sLuaApp:LuaErr(" GodAnimalItem.on_pre_use_item GodAnimalConfig缺少配置 ")
		return false
	end
	
	local item_id = item:GetId()
	local item_keyname = item:GetKeyName()
	local has_point = player:GetInt("GodAnimalItem_"..item_id)
	local use_item_tb = GodAnimalConfig.UseItem[item_keyname]
	if not use_item_tb then
		sLuaApp:LuaErr("GodAnimalItem.on_pre_use_item GodAnimalConfig.UseItem缺少"..item_keyname )
		return false
	end
	local animal_name = use_item_tb["AnimalName"]
	if not animal_name then
		sLuaApp:LuaErr("GodAnimalItem.on_pre_use_item GodAnimalConfig.UseItem缺少AnimalName" )
		return false
	end
	local level = player:GetInt("GodAnimalLevel_"..animal_name)
	if level > 0 then
		for i = 1,level do 
			has_point = has_point + GodAnimalConfig.Main[animal_name]["Level_"..i]["UpItemNum"]
		end
	end
	local max_point = GodAnimalConfig.UseItem[item_keyname]["MaxNum"]
	--sLuaApp:LuaErr("has_point"..has_point.." max_point"..max_point)
	if has_point >= max_point then
		sLuaApp:NotifyTipsMsg(player, item:GetName().."点数已达需求上限！")
		return false
	end
	if has_point + count > max_point then
		sItemSystem:ConsumeItemWithPriority(player, item_id, max_point - has_point, true, "system", "神兽信物物品","获得神兽点数")
		GodAnimalItem.on_use_item(player,item,max_point - has_point)
		return false
	end
	return true
end

-- 使用物品
function GodAnimalItem.on_use_item(player,item,count)
	sLuaApp:LuaErr("GodAnimalItem.on_use_item"..count)
    if item == nil then
        return
    end
	local item_id = item:GetId()

	player:SetInt("GodAnimalItem_"..item_id, player:GetInt("GodAnimalItem_"..item_id) + count)
	sLuaApp:NotifyTipsMsg(player, "获得"..count.."点"..item:GetName().."点数")
	if player:GetInt("GodAnimalAutoLevelUp") == 1 then
		local animal_name = GodAnimalConfig.UseItem[item:GetKeyName()]["AnimalName"]
		local now_level = player:GetInt("GodAnimalLevel_"..animal_name)
		GodAnimalItem.AutoLevelUp(player, animal_name, item_id)
		local next_level = player:GetInt("GodAnimalLevel_"..animal_name)
		if now_level < next_level then
			GodAnimal.GetLevelUpShow(player, animal_name, now_level, next_level)
		end
	end
end

function GodAnimalItem.AutoLevelUp(player, animal_name, item_id)
	local level = player:GetInt("GodAnimalLevel_"..animal_name)
	if not GodAnimalConfig.Main[animal_name]["Level_"..level+1] then
		return
	end
	local now_point = player:GetInt("GodAnimalItem_"..item_id)
	local need_item_num = GodAnimalConfig.Main[animal_name]["Level_"..level+1]["UpItemNum"]
	if now_point >= need_item_num then
		GodAnimal.LevelUp(player, animal_name, true)
		return GodAnimalItem.AutoLevelUp(player, animal_name, item_id)
	end
	return
end