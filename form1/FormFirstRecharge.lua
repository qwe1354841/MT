--首充表单
FormFirstRecharge = {}
--打开界面
function FormFirstRecharge.GetData(player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['FirstRecharge'] ~= "on" then
			return ""
		end
	end
	if not MainUISwitch.CheckOpenLevel(player,"首充") then
		return ""
	end
	if FirstRecharge then
		FirstRecharge.GetData(player)
	end
	return ""
end

--给奖励
function FormFirstRecharge.GiveReward(player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['FirstRecharge'] ~= "on" then
			return ""
		end
	end
	if not MainUISwitch.CheckOpenLevel(player,"首充") then
		return ""
	end
	if FirstRecharge then
		FirstRecharge.GiveReward(player)
	end
	return ""
end