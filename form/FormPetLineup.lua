--宠物阵容表单
FormPetLineup = {}

function FormPetLineup.GetData(player)
  if not MainUISwitch.CheckOpenLevel(player,"宠物","阵容") then
    return ""
  end
    if PetLineup then
		PetLineup.GetData(player)
    end
    return ""
end

function FormPetLineup.UpLineup(player, pet_guid, pos)
  if not MainUISwitch.CheckOpenLevel(player,"宠物","阵容") then
    return ""
  end
    if PetLineup then
		PetLineup.UpLineup(player, pet_guid, pos)
    end
    return ""
end

function FormPetLineup.DownLineup(player, pet_guid)
  if not MainUISwitch.CheckOpenLevel(player,"宠物","阵容") then
    return ""
  end
    if PetLineup then
		PetLineup.DownLineup(player, pet_guid)
    end
    return ""
end

function FormPetLineup.SwapLineup(player, pos_1, pos_2)
  if not MainUISwitch.CheckOpenLevel(player,"宠物","阵容") then
    return ""
  end
    if PetLineup then
		PetLineup.SwapLineup(player, pos_1, pos_2)
    end
    return ""
end