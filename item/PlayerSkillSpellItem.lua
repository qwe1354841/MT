PlayerSkillSpellItem = {}

-- 创建物品
function PlayerSkillSpellItem.on_item_create(item)
    if item == nil then
        return
    end
    local item_id = item:GetId()
    -- local item_row = sItemSystem:ItemDataRow(item_id)
    sLuaApp:LuaDbg("item_id: " .. item_id)
end

-- 创建物品
function PlayerSkillSpellItem.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品
function PlayerSkillSpellItem.on_use_item(player, item, count)
    if item == nil then
        return
    end
end

function PlayerSkillSpellItem.on_pre_use_item(player,item,count)
	 if item == nil then
        return false
    end
	if not PlayerSkillSpell then
		return false
	end
	if PlayerSkillSpell.Use_Item(player,item) == 0 then
		return false
	end
    return true
end