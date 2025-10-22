--装备修理表单
FormRepair = {}
function FormRepair.repair_equip(player,equip_guid,mod)
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","修理") then
        return ""
    end
	local equip =  sItemSystem:GetItemByGUID(equip_guid)
	if RepairSystem then
		RepairSystem.repairEquip(player,equip,mod)
	end
    return ""
end

function FormRepair.repair_all_equip(player,mod)
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","修理") then
        return ""
    end
	if RepairSystem then
		RepairSystem.repairAll(player,mod)
	end
    return ""
end