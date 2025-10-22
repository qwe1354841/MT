--宠物飞升
FormPetFlyUp = {}

function FormPetFlyUp.GetData(player, pet_guid)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['PetFlyUp'] ~= "on" then
			return ""
		end
	end
	if PetFlyUp then
		PetFlyUp.GetData(player, pet_guid)
	end
	return ""
end

function FormPetFlyUp.FlyLevelUp(player, pet_guid, index)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['PetFlyUp'] ~= "on" then
			return ""
		end
	end
	if PetFlyUp then
		PetFlyUp.FlyLevelUp(player, pet_guid, index)
	end
	return ""
end

function FormPetFlyUp.GetGrade(player)
	if PetFlyUp then
		PetFlyUp.GetGrade(player)
	end
	return ""
end