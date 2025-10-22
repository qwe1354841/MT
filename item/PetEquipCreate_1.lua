--宠物装备创建 物理装备
-- 根据挂的脚本名来区分 物理装备 or 法术装备 --Subtype2 不能修改 --贺振坤的建议
PetEquipCreate_1 = {}


function PetEquipCreate_1.on_item_create(item)
	local item_keyname = item:GetKeyName()
	if PetEquipCreate and PetEquipCreate.AttrList then
		if PetEquipCreate.AttrList[item_keyname] then
			PetEquipCreate.ItemCreate(item, item_keyname)
			return
		end
	end

	local itemData = ItemConfig.GetByKeyName(item_keyname)
	local sub_type_1 = itemData.Subtype
	local sub_type_2 = itemData.Subtype2
	local types = ""
	if itemData.Type ~= 1 then
		sLuaApp:LuaErr(" PetEquipCreate_1 该物品不是装备")
		return
	end
	if sub_type_1 ~= 7 then
		sLuaApp:LuaErr(" PetEquipCreate_1 该物品不是宠物装备")
		return
	end
	if sub_type_2 == 1 then
		types = "宠物项圈"
	elseif sub_type_2 == 2 then
		types = "宠物物防衣服"
	elseif sub_type_2 == 3 then
		types = "宠物物攻护符"
	elseif sub_type_2 == 4 then
		types = "宠物饰品"
	end
	if types == "" then
		return
	end
	PetEquipCreate.ItemCreate(item, types)
end