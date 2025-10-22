--宠物合成表单
FormPetMix = {}
function FormPetMix.GetData(player)
  	if not MainUISwitch.CheckOpenLevel(player,"宠物","合成") then
  	  return ""
  	end
    if PetMix then
		PetMix.GetData(player)
    end
    return ""
end

function FormPetMix.StartMix(player, major_pet_guid, minor_pet_guid, juju_keyname, is_juju_bind)
  	if not MainUISwitch.CheckOpenLevel(player,"宠物","合成") then
  	  return ""
  	end
    if PetMix then
		PetMix.StartMix(player, major_pet_guid, minor_pet_guid, juju_keyname, is_juju_bind,0)
    end
    return ""
end