--特技特效表单
FormEquipSpecialEffect = {}

function FormEquipSpecialEffect.artificeStunt(player,equip_guid,skillID,item_guid)
	if EquipSpecialEffect then
		EquipSpecialEffect.artifice(player,equip_guid,skillID,"Stunt",item_guid)
	end
	return ""
end

function FormEquipSpecialEffect.artificeSpecialEffect(player,equip_guid,skillID,item_guid)
	if EquipSpecialEffect then
		EquipSpecialEffect.artifice(player,equip_guid,skillID,"SpecialEffect",item_guid)
	end
	return ""
end

function FormEquipSpecialEffect.extractSpecialEffect(player,equip_guid,type)

	if EquipSpecialEffect then
		EquipSpecialEffect.extract(player,equip_guid,"SpecialEffect",type)
	end
	return ""	
end

function FormEquipSpecialEffect.extractStunt(player,equip_guid,type)
	if EquipSpecialEffect then
		EquipSpecialEffect.extract(player,equip_guid,"Stunt",type)
	end
	return ""
end

function FormEquipSpecialEffect.getData(player,edition,mod)
	if EquipSpecialEffect then
		 EquipSpecialEffect.get_data(player,edition,mod)
	end
	return ""
end

function FormEquipSpecialEffect.getAllData(player,edition)
	sLuaApp:LuaDbg("FormEquipSpecialEffect.getAllData")
	if EquipSpecialEffect then
		 EquipSpecialEffect.get_all_data(player,edition)
	end
	return ""
end