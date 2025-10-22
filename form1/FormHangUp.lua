--挂机界面领双相关Form
FormHangUp = {}

function FormHangUp.get_data(player)
	if not MainUISwitch.CheckOpenLevel(player,"挂机") then
		return ""
	end
	if HangUp then 
		HangUp.get_data(player)
	end
	return ""
end

function FormHangUp.FreezeDoubleExp(player)
	if not MainUISwitch.CheckOpenLevel(player,"挂机") then
		return ""
	end
	if HangUp then 
		HangUp.FreezeDoubleExp(player)
		HangUp.get_data(player)
	end
	return ""
end

function FormHangUp.DrawDoubleExp(player)
	if not MainUISwitch.CheckOpenLevel(player,"挂机") then
		return ""
	end
	if HangUp then 
		HangUp.DrawDoubleExp(player)
		HangUp.get_data(player)
	end
	return ""
end

function FormHangUp.OneKeyBy(player)
	if not MainUISwitch.CheckOpenLevel(player,"挂机") then
		return ""
	end
	if DoubleExp then 
		DoubleExp.Buy(player)
	end
	return ""
end