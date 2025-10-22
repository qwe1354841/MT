--武器转换表单
FormEquipChange = {}

function FormEquipChange.GetData(player, is_open_wnd)
    if EquipChange then
		EquipChange.GetData(player, "Weapon", tonumber(is_open_wnd) == 1 and true or false, false)
    end
    return ""
end

function FormEquipChange.GetChangeData(player, item_keyname)
    if EquipChange then
		EquipChange.GetChangeData(player, item_keyname, "Weapon") --只有武器
    end
    return ""
end

function FormEquipChange.Start(player, old_item_guid, new_item_keyname)
    if EquipChange then
		EquipChange.Start(player, old_item_guid, new_item_keyname, 0, "Weapon") --只有武器
    end
    return ""
end