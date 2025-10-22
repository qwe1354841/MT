--神兽图鉴表单
FormGodAnimal = {}

function FormGodAnimal.GetData(player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['GodAnimal'] ~= "on" then
			return ""
		end
	end
	if GodAnimal then
		GodAnimal.GetData(player)
	end
	return ""
end

function FormGodAnimal.GetDetails(player, animal_name)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['GodAnimal'] ~= "on" then
			return ""
		end
	end
	if GodAnimal then
		GodAnimal.GetDetails(player, animal_name, 0)
	end
	return ""
end

function FormGodAnimal.SetAutoLevelUp(player, is_auto)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['GodAnimal'] ~= "on" then
			return ""
		end
	end
	if GodAnimal then
		GodAnimal.SetAutoLevelUp(player, is_auto)
	end
	return ""
end

function FormGodAnimal.LevelUp(player, animal_name)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['GodAnimal'] ~= "on" then
			return ""
		end
	end
	if GodAnimal then
		GodAnimal.LevelUp(player, animal_name, false)
	end
	return ""
end