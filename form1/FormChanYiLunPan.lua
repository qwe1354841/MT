--禅意大富翁表单
FormChanYiLunPan = {}

function FormChanYiLunPan.GetData(player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['ChanYiDaFuWeng'] ~= "on" then
			return ""
		end
	end
	if ChanYiLunPan then
		ChanYiLunPan.GetData(player)
	end
	return ""
end

function FormChanYiLunPan.Roll(player, dice_name)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['ChanYiDaFuWeng'] ~= "on" then
			return ""
		end
	end
	if ChanYiLunPan then
		ChanYiLunPan.Roll(player, 1, dice_name, 1)
	end
	return ""
end