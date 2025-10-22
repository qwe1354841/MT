FormPetEgg = {}

--孵化宠物, item1_guid为宠物蛋guid, item2_guid为孵化液guid
function FormPetEgg.HatchPet(player, item1_guid, item2_guid)
	sLuaApp:LuaDbg("item1_guid:"..item1_guid)
	sLuaApp:LuaDbg("item2_guid:"..item2_guid)
	if PetEgg then
		PetEgg.HatchPet(player, item1_guid, item2_guid)
		return ""
	end
	return ""
end